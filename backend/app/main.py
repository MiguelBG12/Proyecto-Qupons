from jose import jwt
from fastapi import FastAPI, Depends, HTTPException, Request, Response
from app.routes import admin
from app.routes import users
from app.routes import stores
from app.routes import registro
from app.models.administrator import AdminLoginRequest
from app.utils.utils import create_access_token, get_current_user, SECRET_KEY, ALGORITHM
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
        if fecha_nacimiento:
            user["fecha_nacimiento"] = fecha_nacimiento.isoformat()

        # Generar token JWT si las credenciales son válidas
        access_token = create_access_token(data=user) #access_token = create_access_token(data={"sub": admin_request.correo})
        
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

# Obtener el perfil del administrador
async def get_admin_profile(current_user: str = Depends(get_current_user)):
    admin_profile = {"username": current_user, "email": "admin@example.com"}
    return admin_profile

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

# Rutas
app.include_router(registro.router, prefix="/registro", tags=["Registro"])
app.include_router(admin.router, prefix="/admin", tags=["Admin"])
app.include_router(users.router, prefix="/users", tags=["User"])
app.include_router(stores.router, prefix="/stores", tags=["Store"])

# Ejecución de la aplicación
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
