from pydantic import BaseModel

class AdminCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre: str
    cargo: str
    correo: str
    contraseña: str

class AdminUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    admin_id: int
    nombre: str
    nuevo_cargo: str
    nuevo_correo: str
    contraseña: str