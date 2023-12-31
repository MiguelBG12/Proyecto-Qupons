from jose import jwt
from jose.exceptions import JWTError
from datetime import datetime, timedelta
from fastapi import FastAPI, Depends, HTTPException, status, Request
from app.routes.admin import router as admin_router
from app.routes import admin
from app.routes import users
from app.routes import stores
from app.utils import create_access_token, get_current_user, SECRET_KEY, ALGORITHM, ACCESS_TOKEN_EXPIRE_MINUTES
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm 
from app.config.db_conexion import data_conexion
from fastapi.middleware.cors import CORSMiddleware

origins = [
    "http://localhost:5173",
]

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_origins=origins,
    allow_methods=["*"],
    allow_headers=["*"]
)

result = data_conexion.ejecutar_procedure('sp_ver_administradores', [])
print(result)

# Ruta del perfil del administrador
app.include_router(admin.router, prefix="/admin", tags=["Admin"])

# Ruta del perfil de la tienda
app.include_router(users.router, prefix="/user", tags=["User"])

# Ruta del perfil del usuario
app.include_router(stores.router, prefix= "/store", tags=["Store"])



# Ruta protegida que requiere autenticación
@app.get("/protected")
async def protected_route(current_user: str = Depends(get_current_user)):
    return {"message": f"Hello, {current_user}"}


@app.post("/token")
def login(form_data: OAuth2PasswordRequestForm = Depends ()):
    if form_data.username != "username" or form_data.password != "password":
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Credenciales incorrectas",
            headers={"WWW-Authenticate": "Bearer"}
        )

    access_token = create_access_token(data={"sub": form_data.username})
    return {"access_token": access_token, "token_type": "bearer"}

# Middleware para validar el token en las rutas del administrador
async def admin_token_validation(request: Request, call_next):
    if request.url.path.startswith("/admin"):
        token = request.headers.get("Authorization", "").replace("Bearer ", "").strip()

        if not token:
            print("Token no proporcionado")
            return await call_next(request)  # Permitir que la solicitud continúe sin decodificar el token

        try:
            print("Contenido del token antes de decodificación:", token)
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username: str = payload.get("sub")
            if username != "admin_username":
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

    response = await call_next(request)
    return response



app.middleware("http")(admin_token_validation)

# Ruta del perfil del administrador
@app.get("/admin/profile", tags=["Admin"])
async def get_admin_profile(current_user: str = Depends(get_current_user)):
    admin_profile = {"username": current_user, "email": "admin@example.com"}
    return admin_profile

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)