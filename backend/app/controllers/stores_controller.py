from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.config.db_conexion import data_conexion
from app.models.store import StoreCreateRequest, StoreUpdateRequest
from app.models.coupon import CuponCreateRequest, CuponUpdateRequest
from datetime import datetime

router = APIRouter()

@router.post("/crear_tienda")
async def crear_tienda(store_request: StoreCreateRequest):
    #hashed_password = hashlib.sha256(store_request.contraseña.encode()).hexdigest()
    params = [
        store_request.nombre_empresa,
        store_request.ruc,
        store_request.razon_social,
        store_request.direccion,
        store_request.correo,
        store_request.logo_tienda,
        store_request.nombre_contacto,
        store_request.contrasenna,
        store_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_tienda', params)
    return result

@router.put("/actualizar_tienda")
async def actualizar_tienda(store_request: StoreUpdateRequest):
    #hashed_password = hashlib.sha256(store_request.contraseña.encode()).hexdigest()
    params = [
        store_request.cliente_tienda_id,
        store_request.direccion,
        store_request.correo,
        store_request.nombre_contacto,
        store_request.contrasenna,
        store_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_tienda', params)
    return result

@router.post("/crear_cupon_tienda")
async def crear_cupon(cupon_request: CuponCreateRequest):
    formatted_fecha_inicio = datetime.strptime(cupon_request.fecha_inicio, '%Y-%m-%d').strftime('%Y-%m-%d')
    formatted_fecha_vencimiento = datetime.strptime(cupon_request.fecha_vencimiento, '%Y-%m-%d').strftime('%Y-%m-%d')
    params = [
        cupon_request.titulo,
        cupon_request.descripcion,
        formatted_fecha_inicio,
        formatted_fecha_vencimiento,
        cupon_request.precioOG,
        cupon_request.precioNew,
        cupon_request.disenno_oferta_foto,
        cupon_request.cliente_tienda_id,
        cupon_request.categorias_id
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_cupon', params)
    return result

@router.post("/actualizar_cupon_tienda")
async def actualizar_cupon_tienda(cupon_request: CuponUpdateRequest):
    formatted_fecha_inicio = datetime.strptime(cupon_request.fecha_inicio, '%Y-%m-%d').strftime('%Y-%m-%d')
    formatted_fecha_vencimiento = datetime.strptime(cupon_request.fecha_vencimiento, '%Y-%m-%d').strftime('%Y-%m-%d')
    params = [
        cupon_request.cupones_id,
        cupon_request.titulo,
        cupon_request.descripcion,
        formatted_fecha_inicio,
        formatted_fecha_vencimiento,
        cupon_request.precioOG,
        cupon_request.precioNew,
        cupon_request.disenno_oferta_foto,
        cupon_request.cliente_tienda_id,
        cupon_request.categorias_id
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_cupon', params)
    return result

@router.delete("/borrar_cupon_tienda/{cupones_id}")
async def borrar_cupon_tienda(cupones_id: int):
    params = [cupones_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_cupontienda', params)
    return result

@router.get("/ver_cupones_en_tienda")
async def ver_cupones_en_tienda():
    result = data_conexion.ejecutar_procedure('sp_ver_cupones', [])
    return result

@router.get("/ver_perfil_tienda/{cliente_tienda_id}")
async def ver_perfil_tienda(cliente_tienda_id: int):
    params = [cliente_tienda_id]
    result = data_conexion.ejecutar_procedure('sp_verperfil_tienda', params)
    return result
