from fastapi import APIRouter
from app.controllers.users_controller import UserUpdateRequest
from app.controllers.users_controller import (
    actualizar_user,
    verperfil_usuario,
    ver_cupones_adquiridos,
)

router = APIRouter()

@router.put("/actualizar_user")
async def route_actualizar_user(user_data: UserUpdateRequest):
    return await actualizar_user(user_data)

@router.get("/ver_perfil_usuario/{usuario_id}")
async def route_verperfil_usuario(usuario_id: int):
    return await verperfil_usuario(usuario_id)

@router.get("/ver_cupones_adquiridos")
async def route_ver_cupones_adquiridos():
    return await ver_cupones_adquiridos()