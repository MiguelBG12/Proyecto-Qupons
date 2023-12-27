from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.config.db_conexion import data_conexion

router = APIRouter()

class AdminCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre: str
    cargo: str
    correo: str
    contraseña: str

class AdminUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombre: str
    nuevo_cargo: str
    nuevo_correo: str
    contraseña: str

@router.post("/crear_admin")
async def crear_admin(admin_request: AdminCreateRequest):
    hashed_password = hashlib.sha256(admin_request.contraseña.encode()).hexdigest()
    params = [
        admin_request.nombre,
        admin_request.cargo,
        admin_request.correo,
        hashed_password
    ]
    existing_admin = data_conexion.buscar_admin_por_correo(admin_request.correo)
    if existing_admin:
        raise HTTPException(status_code=400, detail="Ya existe un admin con este correo electronico")
    
    result = data_conexion.ejecutar_procedure('sp_crear_admin', params)
        
@router.post("/actualizar_admin")
async def actualizar_admin(admin_request: AdminUpdateRequest):
    hashed_password = hashlib.sha256(admin_request.contraseña.encode()).hexdigest()
    params = [
        admin_request.admin_id,
        admin_request.nombre,
        admin_request.nuevo_cargo,
        admin_request.nuevo_correo,
        hashed_password
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_admin', params)

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