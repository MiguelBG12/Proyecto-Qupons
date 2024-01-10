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
    if isinstance(cupon_request.disenno_oferta_foto, str):
        try:
            # Convierte la representación hexadecimal de la cadena a bytes
            disenno_data = bytes.fromhex(cupon_request.disenno_oferta_foto)
        except ValueError as e:
            # Manejo de errores (puedes personalizar esto según tus necesidades)
            print(f"Error al convertir la cadena hexadecimal a bytes: {e}")
            return {'mensaje_error': 'Error en el formato de la imagen'}

    elif isinstance(cupon_request.disenno_oferta_foto, bytes):
        # Si ya tienes los datos binarios de la imagen, puedes usarlos directamente
        disenno_data = cupon_request.disenno_oferta_foto

    else:
     # Aquí puedes agregar la lógica para cargar la imagen desde un archivo
        try:
            print("Intentando cargar la imagen desde un archivo...")
            with open('ruta_de_la_imagen.jpg', 'rb') as f:
                # Lee los datos binarios de la imagen
                disenno_data = f.read()
                print("Imagen cargada exitosamente desde el archivo.")
        except FileNotFoundError:
            print("Archivo de imagen no encontrado.")
            return {'mensaje_error': 'Archivo de imagen no encontrado'}
        except Exception as e:
            print(f'Error al leer la imagen: {e}')
            return {'mensaje_error': f'Error al leer la imagen: {e}'}

    formatted_fecha_inicio = datetime.strptime(cupon_request.fecha_inicio, '%Y-%m-%d').strftime('%Y-%m-%d')
    formatted_fecha_vencimiento = datetime.strptime(cupon_request.fecha_vencimiento, '%Y-%m-%d').strftime('%Y-%m-%d')
    params = [
        cupon_request.titulo,
        cupon_request.descripcion,
        formatted_fecha_inicio,
        formatted_fecha_vencimiento,
        cupon_request.precio_normal,
        cupon_request.precio_oferta,
        disenno_data,
        cupon_request.cliente_tienda_id,
        cupon_request.categorias_id
    ]
    cupon = data_conexion.ejecutar_procedure('sp_crear_cupon', params)
    return cupon

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

async def ver_cupones_en_tienda(cliente_tienda_id: int):
    params = [cliente_tienda_id]
    result = data_conexion.ejecutar_procedure('sp_ver_cupontienda', params)
    return result

async def ver_perfil_tienda(cliente_tienda_id: int):
    params = [cliente_tienda_id]
    result = data_conexion.ejecutar_procedure('sp_verperfil_tienda', params)
    return result

async def ver_cupones():
    result = data_conexion.ejecutar_procedure('sp_ver_cupones', [])
    return result