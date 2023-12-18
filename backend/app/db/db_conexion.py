"Proyecto-Qupons/backend/app/db/db_conexion.py"
import mysql.connector
from mysql.connector import Error
from os import getenv
from dotenv import load_dotenv

# Cargar las variables de entorno desde el archivo .env
load_dotenv()

class DataConexion:
    def conector(self):
        """
        Método para crear y retornar una conexión a la base de datos.

        - Utiliza variables de entorno para obtener información de conexión.
        - Devuelve un objeto de conexión.
        """
        try: 
            conexion = mysql.connector.connect(
                host=getenv("DB_HOST"),
                user=getenv("DB_USUARIO"),
                password=getenv("DB_CONTRASENA"),
                database=getenv("DB_NOMBRE")
            )
            print("Conexión exitosa!")
            return conexion
        except mysql.connector.Error as Error:
            print("Error de conexion a la base de datos: {}".format(Error))


    def EjecutaProcedureSelect(self, procedure_name, params=[]):
        """
        Método para ejecutar un procedimiento almacenado que devuelve resultados.

        - procedure_name: Nombre del procedimiento almacenado a ejecutar.
        - params: Lista de parámetros para el procedimiento almacenado.

        Retorna un diccionario con los resultados y los parámetros utilizados. Adecuado para realizar SELECT
        """
        results = []
        args = params
        cnn = self.conector()
        try:
            cursor = cnn.cursor(dictionary=True)
            cursor.callproc(procedure_name, params)
            
            # Recorremos los resultados del procedimiento almacenado
            for result in cursor.stored_results():
                results.append(result.fetchall())
            
            cnn.commit()
            cursor.close()
        except Error as e:
            print(e)
        finally:
            if cnn.is_connected():
                cnn.close()
        return {'results': results, 'params': args}
    
    def EjecutaProcedure(self, procedureName, params):
        """
        Método para ejecutar un procedimiento almacenado que devuelve resultados.

        - procedure_name: Nombre del procedimiento almacenado a ejecutar.
        - params: Lista de parámetros para el procedimiento almacenado.

        Adecuado para realizar INSERT, DELETE
        """
        args = params
        try:
            cnn = self.conector()
            cursor = cnn.cursor()
            args = cursor.callproc(procedureName, params)
            cnn.commit()
            cursor.close()
        except Error as e:
            print(e)
        finally:
            if (cnn and cnn.is_connected()):
                cnn.close()
        return { 'params': args }

"""# Crear una instancia de la clase DataAccess
data_acceder = DataConexion()

# Ejemplo de ejecución de procedimiento almacenado con resultados
select_result = data_acceder.EjecutaProcedure('sp_ver_usuarios', [])
print("Resultados del procedimiento con resultados:", select_result)"""
