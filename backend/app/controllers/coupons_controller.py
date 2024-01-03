from fastapi import APIRouter, HTTPException
from app.config.db_conexion import data_conexion
from app.models.coupon import CuponCreateRequest, CuponUpdateRequest
from datetime import datetime

# Importar aquí modelos, lógica de negocios, o servicios necesarios

router = APIRouter()


"""
# Endpoint para crear cupones
@router.get("/crear_cupon")
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
        cupon_request.diseño_oferta_foto,
        cupon_request.cliente_tienda_id,
        cupon_request.categorias_id
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_cupon', params)
    return result


"""
