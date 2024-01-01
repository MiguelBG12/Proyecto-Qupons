from fastapi import APIRouter
from app.controllers.users_controller import UserCreateRequest, UserUpdateRequest
from app.controllers.users_controller import (
    crear_user,
    actualizar_user,
    verperfil_usuario,
    vercupones_adquiridos,
)

router = APIRouter()

@router.post("/crear_user")
async def route_crear_user(user_data: UserCreateRequest):
    return await crear_user(user_data)

@router.put("/actualizar_user")
async def route_actualizar_user(user_data: UserUpdateRequest):
    return await actualizar_user(user_data)

@router.get("/ver_perfil_usuario/{usuario_id}")
async def route_verperfil_usuario(usuario_id: int):
    return await verperfil_usuario(usuario_id)

@router.get("/vercupones_adquiridos")
async def route_vercupones_adquiridos():
    return await vercupones_adquiridos()