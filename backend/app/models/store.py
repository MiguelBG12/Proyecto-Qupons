from pydantic import BaseModel
from typing import Optional

class StoreCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre_empresa: str
    ruc: str
    razon_social: str
    direccion: str
    correo: str
    logo_tienda: bytes
    nombre_contacto: str
    contrasenna: str
    repetircontrasenna: str
    telefono: int

class StoreUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    cliente_tienda_id: int
    direccion: Optional[str] = None
    correo: Optional[str] = None
    nombre_contacto: Optional[str] = None
    contrasenna: Optional[str] = None
    telefono: Optional[int] = None