from jose import jwt
from jose.exceptions import JWTError
from datetime import datetime, timedelta
from fastapi import FastAPI, Depends, HTTPException, status, Request
from app.routes.admin import router as admin_router
from app.routes import admin
from app.routes import users
from app.routes import stores
from app.models.administrator import AdminCreateRequest, AdminLoginRequest
from app.utils import create_access_token, get_current_user, SECRET_KEY, ALGORITHM, ACCESS_TOKEN_EXPIRE_MINUTES
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm 
from app.config.db_conexion import data_conexion
from fastapi.middleware.cors import CORSMiddleware

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

# Endpoint para obtener administradores
async def obtener_admins(admin_request: AdminCreateRequest):
    result = data_conexion.ejecutar_procedure('sp_obtener_admins', [])
    return result

# Endpoint para autenticar y generar tokens de acceso
@app.post("/login")
async def login_admin(admin_request: AdminLoginRequest):
    params = [
        admin_request.correo,
        admin_request.contraseña
    ]
    result = data_conexion.ejecutar_procedure('sp_login_administrador', params)

    if result:
        # Generar token JWT si las credenciales son válidas
        access_token = create_access_token(data={"sub": admin_request.correo})
        return {"access_token": access_token, "token_type": "bearer"}
    else:
        raise HTTPException(status_code=401, detail="Credenciales incorrectas")

# Obtener el perfil del administrador
async def get_admin_profile(current_user: str = Depends(get_current_user)):
    admin_profile = {"username": current_user, "email": "admin@example.com"}
    return admin_profile

# Middleware para validar el token en las rutas del administrador
async def admin_token_validation(request: Request, call_next):
    if request.url.path.startswith("/admin"):
        token = request.headers.get("Authorization", "").replace("Bearer ", "").strip()

        if not token:
            print("Token no proporcionado")
            return await call_next(request)

        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username: str = payload.get("sub")

            # Verificar si el usuario autenticado es un administrador
            is_admin = data_conexion.verificar_credenciales(username)  # Debes implementar esta función

            if not is_admin:
                raise HTTPException(status_code=403, detail="No tienes permiso para acceder")
        except jwt.ExpiredSignatureError as e:
            print("Token expirado:", e)
            raise HTTPException(status_code=401, detail="Token expirado")
        except jwt.DecodeError as e:
            print("Error de decodificación del token:", e)
            raise HTTPException(status_code=401, detail=f"Token inválido: {str(e)}")
        except JWTError as e:
            print("Error de decodificación del token:", e)
            raise HTTPException(status_code=401, detail=f"Token inválido: {str(e)}")
        except Exception as e:
            print("Otro error al procesar el token:", e)
            raise HTTPException(status_code=401, detail=f"Error al procesar el token: {str(e)}")

    return await call_next(request)

# Rutas
app.include_router(admin.router, prefix="/admin", tags=["Admin"], dependencies=[Depends(get_current_user), Depends(admin_token_validation)])
app.include_router(users.router, prefix="/user", tags=["User"])
app.include_router(stores.router, prefix= "/store", tags=["Store"])

# Ejecución de la aplicación
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
