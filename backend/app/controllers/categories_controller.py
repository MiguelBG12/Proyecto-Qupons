from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.config.db_conexion import data_conexion

router = APIRouter()

class CategoriasCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre: str
    descripcion: str

@router.post("/crear_categoria")
async def create_categoria(categorias_request:CategoriasCreateRequest):
    params = [
        categorias_request.nombre,
        categorias_request.descripcion,
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_categorias', params)
    return result

@router.delete("/borrar_admin/{categorias_id}")
async def borrar_categoria(categorias_id: int):
    params = [categorias_id]
    result = data_conexion.ejecutar_procedure('sp_delete_categorias', params)
    return result

@router.get("/ver_categorias", response_model=List[dict])
async def ver_categorias():
    result = data_conexion.ejecutar_procedure('sp_ver_categorias', [])
    return result