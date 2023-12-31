from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.config.db_conexion import data_conexion
from app.models.store import StoreCreateRequest, StoreUpdateRequest
from app.models.coupon import CuponCreateRequest, CuponUpdateRequest
from datetime import datetime

router = APIRouter()

@router.post("/crear_store")
async def crear_store(store_request: StoreCreateRequest):
    hashed_password = hashlib.sha256(store_request.contraseña.encode()).hexdigest()
    params = [
        store_request.nombre_empresa,
        store_request.ruc,
        store_request.razon_social,
        store_request.direccion,
        store_request.correo,
        store_request.nombre_contacto,
        hashed_password,
        store_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_tienda', params)
    return result

@router.put("/actualizar_store")
async def actualizar_store(store_request: StoreUpdateRequest):
    hashed_password = hashlib.sha256(store_request.contraseña.encode()).hexdigest()
    params = [
        store_request.cliente_tienda_id,
        store_request.direccion,
        store_request.correo,
        store_request.nombre_contacto,
        hashed_password,
        store_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_tienda', params)
    return result

@router.post("/crear_cupon")
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
        cupon_request.porcentaje_descuento,
        cupon_request.diseño_oferta_foto,
        cupon_request.terminos_condiciones,
        cupon_request.cliente_tienda_id,
        cupon_request.categorias_id
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_cupon', params)
    return result

@router.post("/actualizar_cupon")
async def actualizar_cupon(cupon_request: CuponUpdateRequest):
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
        cupon_request.porcentaje_descuento,
        cupon_request.diseño_oferta_foto,
        cupon_request.terminos_condiciones,
        cupon_request.cliente_tienda_id,
        cupon_request.categorias_id
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_cupon', params)
    return result

@router.delete("/borrar_cupon_tienda/{cupones_id}")
async def borrar_cupontienda(cupones_id: int):
    params = [cupones_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_cupontienda', params)
    return result

@router.get("/ver_cupon_tienda/{cliente_tienda_id}")
async def ver_cupontienda(cliente_tienda_id: int):
    params = [cliente_tienda_id]
    result = data_conexion.ejecutar_procedure('sp_ver_cupontienda', params)
    return result

@router.get("/ver_perfil_tienda/{ruc}/{nombre_empresa}")
async def ver_perfiltienda(p_ruc: str, p_nombre_empresa: str):
    params = [p_ruc, p_nombre_empresa]
    result = data_conexion.ejecutar_procedure('sp_verperfil_tienda', params)
    return result
