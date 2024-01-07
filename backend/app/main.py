from jose import jwt
from fastapi import FastAPI, Depends, HTTPException, Request, Response
from app.routes import admin
from app.routes import users
from app.routes import stores
from datetime import datetime
from app.models.administrator import AdminLoginRequest
from app.models.user import UserCreateRequest
from app.models.store import StoreCreateRequest
from app.utils.utils import create_access_token, SECRET_KEY, ALGORITHM
from app.config.db_conexion import data_conexion
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

# Configuración de orígenes permitidos para CORS
origins = [
    "http://localhost:5173",
]

app = FastAPI()

# Middleware CORS para manejar solicitudes de diferentes orígenes
app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_origins=origins,
    allow_methods=["*"],
    allow_headers=["*"]
)

# Endpoint para autenticar y generar tokens de acceso
@app.post("/login")
async def login_admin(admin_request: AdminLoginRequest, response: Response):
    params = [
        admin_request.correo,
        admin_request.contrasenna
    ]
    admins = data_conexion.ejecutar_procedure('sp_login_administrador', params)

    stores = data_conexion.ejecutar_procedure('sp_login_tienda', params)

    users = data_conexion.ejecutar_procedure('sp_login_usuario', params)

    user = None
    if admins is not None and 'result' in admins and admins['result']:
        user = admins['result'][0][0]
        
    if stores is not None and 'result' in stores and stores['result']:
        user = stores['result'][0][0]

    if users is not None and 'result' in users and users['result']:
        user = users['result'][0][0]
        
    if user is not None:
        if user is not None:
        # Convertir la fecha de nacimiento para que se pueda visualisar de manera correcta
            fecha_nacimiento = user.get("fecha_nacimiento")
            contrasenna = user.get("contrasenna")
        if fecha_nacimiento:
            user["fecha_nacimiento"] = fecha_nacimiento.isoformat()
        if contrasenna:
            user["contrasenna"] = ""

        # Generar token JWT si las credenciales son válidas
        access_token = create_access_token(data=user) #access_token = create_access_token(data={"sub": admin_request.correo})
        print(user)
        # Establecer la cookie con el token
        response.set_cookie(
            key="access_token",
            value=access_token,
            httponly=True,
            max_age=1800  # max_age en segundos (ej. 1800 = 30 minutos)
        )
        
        return {"access_token": access_token, "token_type": "bearer"}
    
    # La respuesta CORS debe ir después de devolver el token
    response.headers["Access-Control-Allow-Origin"] = "http://localhost:5173"
    raise HTTPException(status_code=401, detail="Credenciales incorrectas")

# Middleware para validar el token en las rutas del administrador
async def admin_token_validation(request: Request, call_next):
    if request.url.path.startswith("/login") == False:
        token = request.headers.get("Authorization", "").replace("Bearer ", "").strip()
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        #username: str = payload.get("username")
        role_id: int = payload.get("rol_id")

        if request.url.path.startswith("/admin"):
            verified = (role_id == 1)
            
        elif request.url.path.startswith("/stores"):
            verified = (role_id == 2)

        elif request.url.path.startswith("/users"):
            verified = (role_id == 3)
        
        else:
            verified = False

        if verified:
            return await call_next(request)
        else:
            #print("Token no proporcionado")
            raise HTTPException(status_code=403, detail="No tienes permiso para acceder")

    return await call_next(request)

#----------------------------------------------------------------------------------------#
@app.post("/registrar-usuario")
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
    usuario = data_conexion.ejecutar_procedure('sp_crear_usuario', params)
    return usuario 

@app.post("/registrar-tienda")
async def crear_tienda(store_request: StoreCreateRequest):      
    if isinstance(store_request.logo_tienda, str):
        try:
            # Intenta convertir la representación hexadecimal de la cadena a bytes
            logo_data = bytes.fromhex(store_request.logo_tienda)
        except ValueError as e:
            # Manejo de errores (puedes personalizar esto según tus necesidades)
            print(f"Error al convertir la cadena hexadecimal a bytes: {e}")
            return {'mensaje_error': 'Error en el formato de la imagen'}
    elif isinstance(store_request.logo_tienda, bytes):
        # Si ya tienes los datos binarios de la imagen, puedes usarlos directamente
        logo_data = store_request.logo_tienda
    else:
        # Aquí puedes agregar la lógica para cargar la imagen desde un archivo
        try:
            print("Intentando cargar la imagen desde un archivo...")
            with open('ruta_de_la_imagen.jpg', 'rb') as f:
                # Lee los datos binarios de la imagen
                logo_data = f.read()
                print("Imagen cargada exitosamente desde el archivo.")
        except FileNotFoundError:
            print("Archivo de imagen no encontrado.")
            return {'mensaje_error': 'Archivo de imagen no encontrado'}
        except Exception as e:
            print(f'Error al leer la imagen: {e}')
            return {'mensaje_error': f'Error al leer la imagen: {e}'}

    params = [
        store_request.nombre_empresa,
        store_request.ruc,
        store_request.razon_social,
        store_request.direccion,
        store_request.correo,
        store_request.nombre_contacto,
        logo_data,
        store_request.contrasenna,
        store_request.telefono
    ]
    store = data_conexion.ejecutar_procedure('sp_crear_tienda', params)
    return store

#-----------------------------------------------------------------------------------------------#
# Rutas
app.include_router(admin.router, prefix="/admin", tags=["Admin"])
app.include_router(users.router, prefix="/users", tags=["User"])
app.include_router(stores.router, prefix="/stores", tags=["Store"])

# Ejecución de la aplicación
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
