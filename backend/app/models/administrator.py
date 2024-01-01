from pydantic import BaseModel
from typing import Optional

class AdminCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre: str
    cargo: str
    correo: str
    contraseña: str

class AdminUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    admin_id: int
    nombre: Optional[str] = None
    nuevo_cargo: Optional[str] = None
    nuevo_correo: Optional[str] = None
    nueva_contraseña: Optional[str] = None

class AdminLoginRequest(BaseModel):
    correo: str
    contraseña: str