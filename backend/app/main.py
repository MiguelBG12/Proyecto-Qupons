from fastapi import FastAPI, Depends, HTTPException
from app.routes import admin
from app.routes import users
from app.routes import stores
from fastapi.security import OAuth2AuthorizationCodeBearer, OAuth2PasswordRequestForm
from app.config.db_conexion import data_conexion
#from app.routes import auth_user
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
#app.include_router(auth_user.router, prefix="/user", tags=["User"])

# Ruta del perfil del usuario
app.include_router(stores.router, prefix= "/store", tags=["Store"])

@app.post("/token")
def login(form_data: OAuth2PasswordRequestForm = Depends ()):
    Admin = result.get(form_data.username)
    if not Admin:
        raise HTTPException(status_code=400, detail="Usuario no valido")
    if not form_data.password == admin["contraseña"]:
        raise HTTPException(status_code=400, detail="Contraseña no valida")
    return {
        "access_token": "tomate",
        "token_type": "bearer"
    }

if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)

