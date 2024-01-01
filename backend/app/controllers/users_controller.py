from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.config.db_conexion import data_conexion
from datetime import datetime
from app.models.user import UserCreateRequest, UserUpdateRequest
router = APIRouter()

@router.post("/crear_user")
async def crear_user(user_request: UserCreateRequest):
    formatted_fecha_nacimiento = datetime.strptime(user_request.fecha_nacimiento, '%Y-%m-%d').strftime('%Y-%m-%d')
    params = [
        user_request.nombres_completos,
        user_request.dni,
        user_request.genero,
        formatted_fecha_nacimiento,
        user_request.direccion,
        user_request.departamento,
        user_request.correo,
        user_request.contraseña,
        user_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_usuario', params)
        
@router.put("/actualizar_user")
async def actualizar_user(user_request: UserUpdateRequest):
    params = [
        user_request.usuario_id,
        user_request.direccion,
        user_request.departamento,
        user_request.correo,
        user_request.contraseña,
        user_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_usuario', params)

@router.get("/ver_perfil_usuario/{usuario_id}")
async def verperfil_usuario(usuario_id: int):
    params = [usuario_id]
    result = data_conexion.ejecutar_procedure('sp_verperfil_usuario', params)
    return result

@router.get("/vercupones_adquiridos", response_model=List[dict])
async def vercupones_adquiridos():
    result = data_conexion.ejecutar_procedure('sp_vercupones_adquiridos', [])
    return result