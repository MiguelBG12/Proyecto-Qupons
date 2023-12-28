from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.config.db_conexion import data_conexion
from datetime import datetime
router = APIRouter()

class StoreCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre_empresa: str
    ruc: str
    razon_social: str
    direccion: str
    correo: str
    nombre_contacto: str
    contraseña: str
    telefono: int

class StoreUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre_empresa: str
    ruc: str
    razon_social: str
    direccion: str
    correo: str
    nombre_contacto: str
    contraseña: str
    telefono: int

class CuponCreateRequest(BaseModel):
    # Define la estructura de la creacion de cupones
    titulo: str
    descripcion: str
    fecha_inicio: str
    fecha_vencimiento: str
    precioOG: float
    precioNew: float
    porcentaje_descuento: float
    diseño_oferta_foto: str
    terminos_condiciones: str
    cliente_tienda_id: int
    categorias_id: int

class CuponUpdateRequest(BaseModel):
    # Define la estructura de la creacion de cupones
    titulo: str
    descripcion: str
    fecha_inicio: str
    fecha_vencimiento: str
    precioOG: float
    precioNew: float
    porcentaje_descuento: float
    diseño_oferta_foto: str
    terminos_condiciones: str
    cliente_tienda_id: int
    categorias_id: int


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

@router.post("/actualizar_store")
async def actualizar_store(store_request: StoreUpdateRequest):
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
    result = data_conexion.ejecutar_procedure('sp_actualizar_admin', params)
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

@router.delete("/borrar_cupontienda/{cupones_id}")
async def borrar_cupontienda(cupones_id: int):
    params = [cupones_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_cupontienda', params)
    return result

@router.get("/ver_cupontienda/{tienda_id}")
async def ver_cupontienda(tienda_id: int):
    params = [tienda_id]
    result = data_conexion.ejecutar_procedure('sp_ver_cupontienda', params)
    return result

@router.get("/ver_perfiltienda/{p_correo}/{p_contraseña}")
async def ver_perfiltienda(p_correo: str, p_contraseña: str):
    params = [p_correo, p_contraseña]
    result = data_conexion.ejecutar_procedure('sp_verperfil_tienda', params)
    return result
