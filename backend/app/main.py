from fastapi import FastAPI
from app.routes import admin
from app.routes import users
from app.routes import stores
from app.routes import auth_user
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

# Ruta del perfil del administrador
app.include_router(admin.router, prefix="/admin", tags=["Admin"])

# Ruta del perfil de la tienda
app.include_router(users.router, prefix="/user", tags=["User"])
app.include_router(auth_user.router, prefix="/user", tags=["User"])

# Ruta del perfil del usuario
app.include_router(stores.router, prefix= "/store", tags=["Store"])


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)

