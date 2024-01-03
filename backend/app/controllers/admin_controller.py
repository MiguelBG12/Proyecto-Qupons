from typing import List
from app.config.db_conexion import data_conexion
from app.models.administrator import AdminCreateRequest, AdminUpdateRequest
from app.models.category import CategoriasCreateRequest

async def crear_admin(admin_request: AdminCreateRequest):
    params = [
        admin_request.nombre,
        admin_request.cargo,
        admin_request.correo,
        admin_request.contrasenna
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_admin', params)
    return result
        
async def actualizar_admin(admin_request: AdminUpdateRequest):
    params = [
        admin_request.admin_id,
        admin_request.nombre,
        admin_request.nuevo_cargo,
        admin_request.nuevo_correo,
        admin_request.nueva_contrasenna
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_admin', params)
    return result

async def create_categoria(categorias_request:CategoriasCreateRequest):
    params = [
        categorias_request.nombre,
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_categorias', params)
    return result

async def borrar_categoria(categorias_id: int):
    params = [categorias_id]
    result = data_conexion.ejecutar_procedure('sp_eliminar_categoria', params)
    return result

async def ver_categorias():
    result = data_conexion.ejecutar_procedure('sp_ver_categorias', [])
    return result

async def borrar_admin(admin_id: int):
    params = [admin_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_admin', params)
    return result

async def borrar_cliente(cliente_tienda_id: int):
    params = [cliente_tienda_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_cliente', params)
    return result

async def borrar_cupon(cupones_id: int):
    params = [cupones_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_cupon', params)
    return result

async def borrar_usuario(usuario_id: int):
    params = [usuario_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_usuario', params)
    return result

async def ver_administradores():
    result = data_conexion.ejecutar_procedure('sp_ver_administradores', [])
    return result

async def ver_clientes():
    result = data_conexion.ejecutar_procedure('sp_ver_clientes', [])
    return result

async def ver_usuarios():
    result = data_conexion.ejecutar_procedure('sp_ver_usuarios', [])
    return result

async def ver_cupones():
    result = data_conexion.ejecutar_procedure('sp_ver_cupones', [])
    return result
