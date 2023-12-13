# Aquí se importarían las bibliotecas necesarias para la conexión a tu base de datos SQL

# Como ejemplo que usamos una biblioteca como pymssql para la conexión
import pymssql

# Configuración de la conexión a la base de datos
class Database:
    def __init__(self):
        # Configura la conexión a tu base de datos
        self.connection = pymssql.connect(
            server='tu_servidor',
            user='tu_usuario',
            password='tu_contraseña',
            database='tu_base_de_datos'
        )
    
    def execute_stored_procedure(self, procedure_name, *args):
        # Ejecuta un procedimiento almacenado con argumentos
        with self.connection.cursor() as cursor:
            cursor.execute(f"EXEC {procedure_name} %s", args)
            self.connection.commit()

    def query_stored_procedure(self, procedure_name, *args):
        # Ejecuta un procedimiento almacenado que devuelve resultados
        with self.connection.cursor(as_dict=True) as cursor:
            cursor.execute(f"EXEC {procedure_name} %s", args)
            return cursor.fetchall()
