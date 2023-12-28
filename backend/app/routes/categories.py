from fastapi import APIRouter
from app.controllers.categories_controller import CategoriasCreateRequest
from app.controllers.categories_controller import (
    create_categoria,
    borrar_categoria,
    ver_categorias
)

router = APIRouter()

@router.post("/crear_categoria")
async def route_create_categoria(categorias_data: CategoriasCreateRequest):
    return await create_categoria(categorias_data)

@router.delete("/borrar_categorias/{categorias_id}")
async def route_borrar_categoria(categorias_id: int):
    return await borrar_categoria(categorias_id)

@router.get("/ver_categorias")
async def route_ver_categorias():
    return await ver_categorias()