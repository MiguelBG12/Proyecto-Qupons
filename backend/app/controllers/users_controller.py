from app.config.db_conexion import data_conexion
from datetime import datetime
from app.models.user import UserCreateRequest, UserUpdateRequest

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
        user_request.contrasenna,
        user_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_usuario', params)
    return result

async def actualizar_user(user_request: UserUpdateRequest):
    params = [
        user_request.usuario_id,
        user_request.direccion,
        user_request.departamento,
        user_request.correo,
        user_request.contrasenna,
        user_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_usuario', params)
    return result

async def verperfil_usuario(usuario_id: int):
    params = [usuario_id]
    result = data_conexion.ejecutar_procedure('sp_verperfil_usuario', params)
    return result

async def ver_cupones_adquiridos():
    result = data_conexion.ejecutar_procedure('sp_ver_cupones_adquiridos', [])
    return result