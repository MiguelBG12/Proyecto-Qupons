from fastapi import APIRouter, Request
from app.models.administrator import AdminUpdateRequest
from app.models.category import CategoriasCreateRequest
from app.controllers.admin_controller import AdminCreateRequest
from jose import jwt
from app.utils.utils import create_access_token, get_current_user, SECRET_KEY, ALGORITHM
from app.controllers.admin_controller import (
    crear_admin,
    actualizar_admin, 
    borrar_admin,
    borrar_cliente,
    borrar_cupon,
    borrar_usuario,
    ver_administradores,
    ver_clientes,
    ver_usuarios,
    ver_cupones,
    create_categoria,
    borrar_categoria,
    ver_categorias,
    ver_perfil_administrador,
)

router = APIRouter()

@router.post("/Registrar_admin")
async def route_crear_admin(admin_data: AdminCreateRequest):
    return await crear_admin(admin_data)

@router.put("/actualizar_admin")
async def route_actualizar_admin(admin_data: AdminUpdateRequest, request: Request):
    token = request.headers.get("Authorization", "").replace("Bearer ", "").strip()
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    admin_id: int = payload.get("administrador_id")

    admin_data.admin_id = admin_id
    return await actualizar_admin(admin_data)

@router.post("/crear_categoria")
async def route_create_categoria(categorias_data: CategoriasCreateRequest):
    return await create_categoria(categorias_data)

@router.delete("/borrar_categorias/{categorias_id}")
async def route_borrar_categoria(categorias_id: int):
    return await borrar_categoria(categorias_id)

@router.delete("/borrar_admin/{admin_id}")
async def route_borrar_admin(admin_id: int):
    return await borrar_admin(admin_id)

@router.delete("/borrar_cliente/{cliente_tienda_id}")
async def route_borrar_cliente(cliente_tienda_id: int):
    return await borrar_cliente(cliente_tienda_id)

@router.delete("/borrar_cupon/{cupon_id}")
async def route_borrar_cupon(cupones_id: int):
    return await borrar_cupon(cupones_id)

@router.delete("/borrar_usuario/{user_id}")
async def route_borrar_usuario(usuario_id: int):
    return await borrar_usuario(usuario_id)

@router.get("/ver_administradores")
async def route_ver_administradores():
    return await ver_administradores()

@router.get("/ver_categorias")
async def route_ver_categorias():
    return await ver_categorias()

@router.get("/ver_clientes")
async def route_ver_clientes():
    return await ver_clientes()

@router.get("/ver_usuarios")
async def route_ver_usuarios():
    return await ver_usuarios()

@router.get("/ver_cupones")
async def route_ver_cupones():
    return await ver_cupones()

@router.get("/ver_perfil_administrador")
async def route_ver_perfil_administrador(request: Request):
    token = request.headers.get("Authorization", "").replace("Bearer ", "").strip()
    payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    admin_id: int = payload.get("administrador_id")
    return await ver_perfil_administrador(admin_id)
