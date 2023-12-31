import mysql.connector
import jwt
from os import getenv
from dotenv import load_dotenv

load_dotenv()

class DbConexion:
    @staticmethod
    def conectar():
        try: 
            host = getenv("DB_HOST")
            user = getenv("DB_USUARIO")
            password = getenv("DB_CONTRASENA")
            database = getenv("DB_NOMBRE")
            
            conexion = mysql.connector.connect(
                host=host,
                user=user,
                password=password,
                database=database
            )
            
            if conexion.is_connected():
                print("Conexión exitosa!")
                return conexion
            else:
                print("No se pudo conectar a la base de datos.")
                return None
                
        except mysql.connector.Error as e:
            print("Error de conexión a la base de datos:", e)
            return None

    @staticmethod
    def verificar_credenciales(correo, contraseña):
        cnn = DbConexion.conectar()
        if cnn is not None:
            cursor = cnn.cursor(dictionary=True)
            
            # Verificación para administradores
            cursor.callproc('sp_login_administrador', (correo,))
            admin_result = cursor.fetchone()
            if admin_result and admin_result['contraseña'] == contraseña:
                return {'tipo': 'admin', 'id': admin_result['id']}  # Ejemplo, podrías retornar más datos
            
            # Verificación para tiendas
            cursor.callproc('sp_verificar_tienda', (correo,))
            tienda_result = cursor.fetchone()
            if tienda_result and tienda_result['contraseña'] == contraseña:
                return {'tipo': 'tienda', 'id': tienda_result['id']}  # Ejemplo, podrías retornar más datos
            
            # Verificación para usuarios
            cursor.callproc('sp_verificar_usuario', (correo,))
            user_result = cursor.fetchone()
            if user_result and user_result['contraseña'] == contraseña:
                return {'tipo': 'usuario', 'id': user_result['id']}  # Ejemplo, podrías retornar más datos

        return None


    @staticmethod
    def crear_token(data):
        return jwt.encode(data, 'tu_secreto', algorithm='HS256')

# Crear una instancia de la clase DbConexion
db_conexion = DbConexion()
