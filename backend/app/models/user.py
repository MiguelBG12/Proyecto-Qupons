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
    usuario_id: int
    direccion: Optional[str] = None
    departamento: Optional[str] = None
    correo: Optional[str] = None
    contraseña: Optional[str] = None
    telefono: Optional[int] = None

class UserDataToken(BaseModel):
    id: int
    nombres_completos: str
    correo: str
    contraseña: str
    exp: int 

class LoginFormData(BaseModel):
    username: str
    password: str
