from pydantic import BaseModel
from typing import Optional

class UserCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombres_completos: str
    dni: int
    genero: str
    fecha_nacimiento: str
    direccion: str
    departamento: str
    correo: str
    contraseña: str
    telefono: int

class UserUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombres_completos: Optional[str] = None
    genero: Optional[str] = None
    direccion: Optional[str] = None
    departamento: Optional[str] = None
    correo: Optional[str] = None
    contraseña: Optional[str] = None
    telefono: Optional[int] = None
