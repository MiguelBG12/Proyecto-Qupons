from app.config.db_conexion import data_conexion
from app.models.user import UserUpdateRequest

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

async def ver_cupones_adquiridos(usuario_id: int):
    params = [usuario_id]
    result = data_conexion.ejecutar_procedure('sp_ver_cupones_adquiridos', params)
    return result

async def ver_cupones():
    result = data_conexion.ejecutar_procedure('sp_ver_cupones', [])
    return result

async def adquirir_cupon(usuario_id: int, cupon_id: int):
    params = [usuario_id, cupon_id]
    result = data_conexion.ejecutar_procedure('sp_adquirir_cupon', params)
    return result