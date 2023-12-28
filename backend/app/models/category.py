from pydantic import BaseModel

class CategoriasCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre: str
    descripcion: str