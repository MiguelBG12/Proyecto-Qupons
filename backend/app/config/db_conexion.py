import mysql.connector
from mysql.connector import Error
from os import getenv
from dotenv import load_dotenv

# Cargar las variables de entorno desde el archivo .env
load_dotenv()

class DataConexion:
    def conectar(self):
        """
        Método para crear y retornar una conexión a la base de datos.

        - Utiliza variables de entorno para obtener información de conexión.
        - Devuelve un objeto de conexión.
        """
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
                
        except Error as e:
            print("Error de conexión a la base de datos:", e)
            return None


    def ejecutar_procedure(self, procedure_name, params=[]):
        """
        Método para ejecutar un procedimiento almacenado que devuelve resultados.

        - procedure_name: Nombre del procedimiento almacenado a ejecutar.
        - params: Lista de parámetros para el procedimiento almacenado.

        Retorna un diccionario con los resultados y los parámetros utilizados.
        """
        results = []
        args = params
        cnn = self.conectar()
        if cnn is not None:
            try:
                cursor = cnn.cursor(dictionary=True)
                cursor.callproc(procedure_name, params)
                
                # Recorremos los resultados del procedimiento almacenado
                for result in cursor.stored_results():
                    results.append(result.fetchall())
                
                cnn.commit()
            except Error as e:
                print(e)
            finally:
                if cnn and cnn.is_connected():
                    cursor.close()
                    cnn.close()
            return {'result': results, 'params': args}
        else:
            return {'result': [], 'params': args}

    def buscar_admin_por_correo(self, correo):
        cnn = self.conectar()  # Establecer conexión
        if cnn is not None: # Verificacion de conexión establecida :D
            try:
                cursor = cnn.cursor(dictionary=True) # Creacion de cursor ejecutador de consultas 3000
                query = "SELECT * FROM administradores WHERE correo = %s" # Consulta de SQL para buscar Correos de administradores ya creados
                cursor.execute(query, (correo,)) # Ejecutar consulta con los datos de los correos selecionados
                result = cursor.fetchone() # Obetener la 1° fila que coincida con lo consultado
                return result # Devolver el resultado de la consulta :D
            except Error as e:
                print(e) # Manejo de errores: mostrar cualquier error que ocurra durante la accion 
            finally:
                if cnn and cnn.is_connected():
                    cursor.close() # cerramos el cursor para liberar recursos
                    cnn.close() # cerramos la conexión a la base de datos
        return None # Si no hay ningun error con todo lo antes echo y mensionado cerramos con un None 

# Crear una instancia de la clase DataConexion
data_conexion = DataConexion()
