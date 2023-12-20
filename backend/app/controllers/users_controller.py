from fastapi import APIRouter, Depends, HTTPException
import pymysql

router = APIRouter()

class Database:
    def __init__(self):
        # Configuración de la conexión a la base de datos
        self.connection = pymysql.connect(
            host='tu_host',
            user='tu_usuario',
            password='tu_contraseña',
            database='tu_base_de_datos'
        )

    def execute_procedure(self, procedure_name, args):
        try:
            with self.connection.cursor() as cursor:
                cursor.callproc(procedure_name, args)
                result = cursor.fetchone()
                return result[0] if result else None
        except pymysql.Error as e:
            print(f"Error al ejecutar el procedimiento almacenado: {e}")
            return None

@router.post("/crear_administrador")
async def crear_administrador(nombre: str, cargo: str, correo: str, contraseña: str):
    db = Database()
    admin_id = db.execute_procedure('sp_crear_admin', (nombre, cargo, correo, contraseña))
    if admin_id:
        return {"message": "Administrador creado exitosamente", "admin_id": admin_id}
    else:
        raise HTTPException(status_code=500, detail="Error al crear administrador")
