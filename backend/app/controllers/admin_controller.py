from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.config.db_conexion import data_conexion
from app.models.administrator import AdminCreateRequest, AdminUpdateRequest
from app.models.category import CategoriasCreateRequest
router = APIRouter()

@router.post("/crear_admin")
async def crear_admin(admin_request: AdminCreateRequest):
    params = [
        admin_request.nombre,
        admin_request.cargo,
        admin_request.correo,
        admin_request.contraseña
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_admin', params)
        
@router.put("/actualizar_admin")
async def actualizar_admin(admin_request: AdminUpdateRequest):
    params = [
        admin_request.admin_id,
        admin_request.nombre,
        admin_request.nuevo_cargo,
        admin_request.nuevo_correo,
        admin_request.nueva_contraseña
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_admin', params)

@router.post("/crear_categoria")
async def create_categoria(categorias_request:CategoriasCreateRequest):
    params = [
        categorias_request.nombre,
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_categorias', params)
    return result

@router.delete("/borrar_categoria/{categorias_id}")
async def borrar_categoria(categorias_id: int):
    params = [categorias_id]
    result = data_conexion.ejecutar_procedure('sp_eliminar_categoria', params)

@router.get("/ver_categorias", response_model=List[dict])
async def ver_categorias():
    result = data_conexion.ejecutar_procedure('sp_ver_categorias', [])
    return result

@router.delete("/borrar_admin/{admin_id}")
async def borrar_admin(admin_id: int):
    params = [admin_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_admin', params)

@router.delete("/borrar_cliente/{cliente_tienda_id}")
async def borrar_cliente(cliente_tienda_id: int):
    params = [cliente_tienda_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_cliente', params)

@router.delete("/borrar_cupon/{cupones_id}")
async def borrar_cupon(cupones_id: int):
    params = [cupones_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_cupon', params)

@router.delete("/borrar_usuario/{usuario_id}")
async def borrar_usuario(usuario_id: int):
    params = [usuario_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_usuario', params)

@router.get("/ver_administradores", response_model=List[dict])
async def ver_administradores():
    result = data_conexion.ejecutar_procedure('sp_ver_administradores', [])
    return result

@router.get("/ver_clientes", response_model=List[dict])
async def ver_clientes():
    result = data_conexion.ejecutar_procedure('sp_ver_clientes', [])
    return result

@router.get("/ver_usuarios", response_model=List[dict])
async def ver_usuarios():
    result = data_conexion.ejecutar_procedure('sp_ver_usuarios', [])
    return result

@router.get("/ver_cupones", response_model=List[dict])
async def ver_cupones():
    result = data_conexion.ejecutar_procedure('sp_ver_cupones', [])
    return result

@router.post("/login_admin")
async def login_admin(admin_request: AdminCreateRequest):
    params = [
        admin_request.nombre,
        admin_request.contraseña
    ]
    result = data_conexion.ejecutar_procedure('sp_login_administrador', params)
