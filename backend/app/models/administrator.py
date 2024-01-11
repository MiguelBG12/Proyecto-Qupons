from pydantic import BaseModel
from typing import Optional

class AdminCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre: str
    cargo: str
    correo: str
    contrasenna: str

class AdminUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    admin_id: int
    nombre: Optional[str] = None
    cargo: Optional[str] = None
    correo: Optional[str] = None
    contrasenna: Optional[str] = None
    repetirContrasenna: Optional[str] = None

class UsersLoginRequest(BaseModel):
    correo: str
    contrasenna: str
