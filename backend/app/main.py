from fastapi import FastAPI, Depends, HTTPException, Response
from app.routes.admin import router as admin_router
from app.routes import admin
from app.routes import users
from app.routes import stores
from app.routes import registro
from app.models.administrator import AdminCreateRequest, AdminLoginRequest
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


# Endpoint para autenticar y verificar en la base de datos
@app.post("/login")
async def login_admin(admin_request: AdminLoginRequest):
    params = [
        admin_request.correo,
        admin_request.contrasenna
    ]
    admins = data_conexion.ejecutar_procedure('sp_login_administrador', params)
    user = None
    if admins is not None and 'result' in admins and admins['result']:
        user = admins['result'][0][0]

    if user is not None:
        # Agregar el encabezado CORS después de la autenticación exitosa
        response = Response(content="Usuario autenticado correctamente")
        response.headers["Access-Control-Allow-Origin"] = "http://localhost:5173"
        return response
    else:
        raise HTTPException(status_code=401, detail="Credenciales incorrectas")

# Rutas
app.include_router(registro.router, prefix="/registro", tags=["Registro"])
app.include_router(admin.router, prefix="/admin", tags=["Admin"])
app.include_router(users.router, prefix="/user", tags=["User"])
app.include_router(stores.router, prefix= "/store", tags=["Store"])

# Ejecución de la aplicación
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
