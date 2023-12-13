from fastapi import APIRouter, HTTPException

router = APIRouter()

# Simulación de una lista de usuarios (reemplazar con base de datos)
users_db = [
    {"username": "usuario1", "password": "contraseña1", "role": "admin"},
    {"username": "usuario2", "password": "contraseña2", "role": "regular"},
    # Otros usuarios...
]

# Verificar credenciales de usuario
@router.post("/login/", tags=["authentication"])
async def login(username: str, password: str):
    for user in users_db:
        if user["username"] == username and user["password"] == password:
            return {"username": user["username"], "role": user["role"]}
    raise HTTPException(status_code=401, detail="Credenciales inválidas")

# Restablecer contraseña de usuario
@router.post("/reset_password/", tags=["authentication"])
async def reset_password(username: str, new_password: str):
    for user in users_db:
        if user["username"] == username:
            user["password"] = new_password
            return {"message": "Contraseña restablecida"}
    raise HTTPException(status_code=404, detail="Usuario no encontrado")
