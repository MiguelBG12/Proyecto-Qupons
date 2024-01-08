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
    contrasenna: str
    telefono: int

class UserUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    usuario_id: int
    nombres_completos: Optional[str] = None
    dni: Optional[int] = None
    genero: Optional[str] = None
    fecha_nacimiento: Optional[str] = None
    direccion: Optional[str] = None
    departamento: Optional[str] = None
    correo: Optional[str] = None
    contrasenna: Optional[str] = None
    telefono: Optional[int] = None

class UserDataToken(BaseModel):
    id: int
    nombres_completos: str
    correo: str
    contrasenna: str
    exp: int 

class LoginFormData(BaseModel):
    correo: str
    contrasenna: str
