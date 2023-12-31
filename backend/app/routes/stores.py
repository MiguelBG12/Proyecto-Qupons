from fastapi import APIRouter
from app.controllers.stores_controller import StoreCreateRequest, StoreUpdateRequest, CuponCreateRequest, CuponUpdateRequest
from app.controllers.stores_controller import (
    crear_store, 
    actualizar_store, 
    crear_cupon, 
    actualizar_cupon,
    borrar_cupontienda,
    ver_cupontienda,
    ver_perfiltienda,
)

router = APIRouter()

@router.post("/crear_store")
async def route_crear_store(store_data: StoreCreateRequest):
   return await crear_store(store_data)

@router.post("/crear_cupon")
async def route_crear_cupon(cupon_data: CuponCreateRequest):
   return await crear_cupon(cupon_data)

@router.put("/actualizar_store")
async def route_actualizar_store(store_data: StoreUpdateRequest):
    return await actualizar_store(store_data)

@router.put("/actualizar_cupon")
async def route_actualizar_cupon(cupon_data: CuponUpdateRequest):
    return await actualizar_cupon(cupon_data)

@router.delete("/borrar_cupon_tienda/{cupon_id}")
async def route_borrar_cupontienda(cupones_id: int):
    return await borrar_cupontienda(cupones_id)

@router.get("/ver_cupon_tienda/{cliente_tienda_id}")
async def route_ver_cupontienda(cliente_tienda_id: int):
    return await ver_cupontienda(cliente_tienda_id)

@router.get("/ver_perfil_tienda/{cliente_tienda_id}")
async def route_ver_perfiltienda(cliente_tienda_id: int):
    return await ver_perfiltienda(cliente_tienda_id)