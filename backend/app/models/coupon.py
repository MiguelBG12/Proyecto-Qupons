from pydantic import BaseModel
from typing import Optional, Union

class CuponCreateRequest(BaseModel):
    # Define la estructura de la creacion de cupones
    titulo: str
    descripcion: str
    fecha_inicio: str
    fecha_vencimiento: str
    precioOG: float
    precioNew: float
    disenno_oferta_foto: Union[str, bytes]
    cliente_tienda_id: int
    categorias_id: int

class CuponUpdateRequest(BaseModel):
    # Define la estructura de la creacion de cupones
    cupones_id: int
    titulo: Optional[str] = None
    descripcion: Optional[str] = None
    fecha_inicio: Optional[str] = None
    fecha_vencimiento: Optional[str] = None
    precioOG: Optional[float] = None
    precioNew: Optional[float] = None
    disenno_oferta_foto: Optional[str] = None
    cliente_tienda_id: Optional[int] = None
    categorias_id: Optional[int] = None
