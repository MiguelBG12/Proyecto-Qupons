from pydantic import BaseModel
from typing import Optional

class StoreCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre_empresa: str
    ruc: str
    razon_social: str
    direccion: str
    correo: str
    nombre_contacto: str
    contraseña: str
    telefono: int

class StoreUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    cliente_tienda_id: int
    nombre_empresa: Optional[str] = None
    #ruc: Optional[str] = None
    razon_social: Optional[str] = None
    direccion: Optional[str] = None
    correo: Optional[str] = None
    nombre_contacto: Optional[str] = None
    contraseña: Optional[str] = None
    telefono: Optional[int] = None