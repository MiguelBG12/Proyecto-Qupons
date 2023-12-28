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
async def route_actualizar_store(sotre_data: StoreUpdateRequest):
    return await actualizar_store(sotre_data)

@router.put("/actualizar_cupon")
async def route_actualizar_cupon(cupon_data: CuponUpdateRequest):
    return await actualizar_cupon(cupon_data)

@router.delete("/borrar_cupontienda/{cupon_id}")
async def route_borrar_cupontienda(cupones_id: int):
    return await borrar_cupontienda(cupones_id)

@router.get("/ver_cupontienda")
async def route_ver_cupontienda():
    return await ver_cupontienda()

@router.get("/ver_perfiltienda")
async def route_ver_perfiltienda():
    return await ver_perfiltienda()