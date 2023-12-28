from fastapi import FastAPI
from app.routes import admin
from app.routes import users
from app.routes import stores
from app.routes import categories
app = FastAPI()

# Ruta del perfil del administrador
app.include_router(admin.router, prefix="/admin", tags=["Admin"])

# Ruta del perfil de la tienda
app.include_router(users.router, prefix="/user", tags=["User"])

# Ruta del perfil del usuario
app.include_router(stores.router, prefix= "/store", tags=["Store"])

# app.include_router(categories.router, prefix= "/category", tags=["Category"])


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)

