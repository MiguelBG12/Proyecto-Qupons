from fastapi import APIRouter, Request
from app.controllers.users_controller import UserUpdateRequest
from jose import jwt
from app.utils.utils import create_access_token, get_current_user, SECRET_KEY, ALGORITHM
from app.controllers.users_controller import (
    actualizar_user,
    verperfil_usuario,
    ver_cupones,
    ver_cupones_adquiridos,
)

router = APIRouter()

@router.put("/actualizar_user")
async def route_actualizar_user(user_data: UserUpdateRequest):
    return await actualizar_user(user_data)

@router.get("/ver_perfil_usuario")
async def route_verperfil_usuario(request: Request):
    token = request.headers.get("Authorization", "").replace("Bearer", "").strip()
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    usuario_id = payload.get("usuario_id")
    return await verperfil_usuario(usuario_id)

@router.get("/ver_cupones_adquiridos")
async def route_ver_cupones_adquiridos():
    return await ver_cupones_adquiridos()

@router.get("/ver_cupones")
async def route_ver_cupones():
    return await ver_cupones()