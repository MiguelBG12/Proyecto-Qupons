from fastapi import APIRouter, HTTPException

router = APIRouter()

# Simulación de una lista de usuarios (reemplazar con base de datos)
users_db = [
    {"id": 1, "username": "usuario1", "email": "usuario1@example.com"},
    {"id": 2, "username": "usuario2", "email": "usuario2@example.com"},
    # Otros usuarios...
]

# Obtener todos los usuarios
@router.get("/users/", tags=["users"])
async def get_users():
    return users_db

# Obtener un usuario por su ID
@router.get("/users/{user_id}", tags=["users"])
async def get_user_by_id(user_id: int):
    for user in users_db:
        if user["id"] == user_id:
            return user
    raise HTTPException(status_code=404, detail="Usuario no encontrado")

# Crear un nuevo usuario
@router.post("/users/", tags=["users"])
async def create_user(username: str, email: str):
    new_user = {"id": len(users_db) + 1, "username": username, "email": email}
    users_db.append(new_user)
    return new_user

# Actualizar los datos de un usuario por su ID
@router.put("/users/{user_id}", tags=["users"])
async def update_user(user_id: int, username: str, email: str):
    for user in users_db:
        if user["id"] == user_id:
            user["username"] = username
            user["email"] = email
            return user
    raise HTTPException(status_code=404, detail="Usuario no encontrado")

# Eliminar un usuario por su ID
@router.delete("/users/{user_id}", tags=["users"])
async def delete_user(user_id: int):
    for i, user in enumerate(users_db):
        if user["id"] == user_id:
            del users_db[i]
            return {"message": "Usuario eliminado"}
    raise HTTPException(status_code=404, detail="Usuario no encontrado")
