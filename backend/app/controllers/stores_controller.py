from app.config.db_conexion import data_conexion
from app.models.store import StoreUpdateRequest
from app.models.coupon import CuponCreateRequest, CuponUpdateRequest
from datetime import datetime

async def actualizar_tienda(store_request: StoreUpdateRequest):
    params = [
        store_request.cliente_tienda_id,
        store_request.direccion,
        store_request.correo,
        store_request.nombre_contacto,
        store_request.contrasenna,
        store_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_tienda', params)
    return result

async def crear_cupon(cupon_request: CuponCreateRequest):
    formatted_fecha_inicio = datetime.strptime(cupon_request.fecha_inicio, '%Y-%m-%d').strftime('%Y-%m-%d')
    formatted_fecha_vencimiento = datetime.strptime(cupon_request.fecha_vencimiento, '%Y-%m-%d').strftime('%Y-%m-%d')
    params = [
        cupon_request.titulo,
        cupon_request.descripcion,
        formatted_fecha_inicio,
        formatted_fecha_vencimiento,
        cupon_request.precioOG,
        cupon_request.precioNew,
        cupon_request.disenno_oferta_foto,
        cupon_request.cliente_tienda_id,
        cupon_request.categorias_id
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_cupon', params)
    return result

async def actualizar_cupon_tienda(cupon_request: CuponUpdateRequest):
    formatted_fecha_inicio = datetime.strptime(cupon_request.fecha_inicio, '%Y-%m-%d').strftime('%Y-%m-%d')
    formatted_fecha_vencimiento = datetime.strptime(cupon_request.fecha_vencimiento, '%Y-%m-%d').strftime('%Y-%m-%d')
    params = [
        cupon_request.cupones_id,
        cupon_request.titulo,
        cupon_request.descripcion,
        formatted_fecha_inicio,
        formatted_fecha_vencimiento,
        cupon_request.precioOG,
        cupon_request.precioNew,
        cupon_request.disenno_oferta_foto,
        cupon_request.cliente_tienda_id,
        cupon_request.categorias_id
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_cupon', params)
    return result

async def borrar_cupon_tienda(cupones_id: int):
    params = [cupones_id]
    result = data_conexion.ejecutar_procedure('sp_borrar_cupontienda', params)
    return result

async def ver_cupones_en_tienda():
    result = data_conexion.ejecutar_procedure('sp_ver_cupones', [])
    return result

async def ver_perfil_tienda(cliente_tienda_id: int):
    params = [cliente_tienda_id]
    result = data_conexion.ejecutar_procedure('sp_verperfil_tienda', params)
    return result
