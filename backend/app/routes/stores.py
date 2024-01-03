from fastapi import APIRouter
from app.controllers.stores_controller import StoreCreateRequest, StoreUpdateRequest, CuponCreateRequest, CuponUpdateRequest
from app.controllers.stores_controller import (
    crear_tienda, 
    actualizar_tienda, 
    crear_cupon, 
    actualizar_cupon_tienda,
    borrar_cupon_tienda,
    ver_cupon_tienda,
    ver_perfil_tienda,
)

router = APIRouter()

@router.post("/crear_tienda")
async def route_crear_tienda(store_data: StoreCreateRequest):
   return await crear_tienda(store_data)

@router.post("/crear_cupon_tienda")
async def route_crear_cupon(cupon_data: CuponCreateRequest):
   return await crear_cupon(cupon_data)

@router.put("/actualizar_tienda")
async def route_actualizar_tienda(store_data: StoreUpdateRequest):
    return await actualizar_tienda(store_data)

@router.put("/actualizar_cupon_tienda")
async def route_actualizar_cupon(cupon_data: CuponUpdateRequest):
    return await actualizar_cupon_tienda(cupon_data)

@router.delete("/borrar_cupon_tienda/{cupon_id}")
async def route_borrar_cupontienda(cupones_id: int):
    return await borrar_cupon_tienda(cupones_id)

@router.get("/ver_cupon_tienda/{cliente_tienda_id}")
async def route_ver_cupontienda(cliente_tienda_id: int):
    return await ver_cupon_tienda(cliente_tienda_id)

@router.get("/ver_perfil_tienda/{cliente_tienda_id}")
async def route_ver_perfiltienda(cliente_tienda_id: int):
    return await ver_perfil_tienda(cliente_tienda_id)