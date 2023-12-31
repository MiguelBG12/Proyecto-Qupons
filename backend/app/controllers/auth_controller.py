from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.security.auth_user import db_conexion
from app.models.administrator import AdminCreateRequest

# Importar aquí modelos, lógica de negocios, o servicios necesarios

router = APIRouter()

@router.post("/verificar_admin")
async def verificar_admin(admin_request: AdminCreateRequest):
    hashed_password = hashlib.sha256(admin_request.contraseña.encode()).hexdigest()
    params = [
        admin_request.correo,
        hashed_password
    ]
    result = db_conexion.verificar_credenciales(admin_request.correo, hashed_password)
    if result:
        token = db_conexion.crear_token(result)
        return {'token': token}
    else:
        raise HTTPException(status_code=401, detail="Credenciales inválidas")
