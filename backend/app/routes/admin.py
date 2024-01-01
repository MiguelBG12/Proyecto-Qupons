from fastapi import APIRouter
from app.models.administrator import AdminCreateRequest, AdminUpdateRequest, AdminLoginRequest
from app.models.category import CategoriasCreateRequest
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
    ver_categorias
)

router = APIRouter()

@router.post("/crear_admin")
async def route_crear_admin(admin_data: AdminCreateRequest):
    return await crear_admin(admin_data)

@router.put("/actualizar_admin")
async def route_actualizar_admin(admin_data: AdminUpdateRequest):
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
async def route_borrar_cliente(client_id: int):
    return await borrar_cliente(client_id)

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

