from fastapi import APIRouter, Request
from jose import jwt
from app.models.store import StoreCreateRequest, StoreUpdateRequest
from app.models.coupon import CuponCreateRequest, CuponUpdateRequest
from app.utils.utils import create_access_token, get_current_user, SECRET_KEY, ALGORITHM
from app.controllers.stores_controller import (
    actualizar_tienda, 
    crear_cupon, 
    actualizar_cupon_tienda,
    borrar_cupon_tienda,
    ver_cupones_en_tienda,
    ver_perfil_tienda,
)

router = APIRouter()

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

# En esta parte la tienda tiene que ver todos los cupones, no solo de la misma tienda
# Necesitamos verificar que funcione
@router.get("/ver_cupones_en_tienda")
async def route_ver_perfil_tienda(store_data: StoreCreateRequest):
    return await ver_cupones_en_tienda(store_data)

@router.get("/ver_perfil_tienda")
async def route_ver_perfil_tienda(request: Request):
    token = request.headers.get("Authorization", "").replace("Bearer", "").strip()
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    cliente_tienda_id: int = payload.get("cliente_tienda_id")
    return await ver_perfil_tienda(cliente_tienda_id)