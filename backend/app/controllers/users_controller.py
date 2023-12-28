from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import hashlib
from typing import List
from app.config.db_conexion import data_conexion

router = APIRouter()

class UserCreateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombres_completos: str
    dni: int
    genero: str
    fecha_nacimiento: int
    direccion: str
    departamento: str
    correo: str
    contraseña: str
    telefono: int

class UserUpdateRequest(BaseModel):
    # Define la estructura de la solicitud para la creación de administradores
    nombres_completos: str
    dni: int
    genero: str
    fecha_nacimiento: int
    direccion: str
    departamento: str
    correo: str
    contraseña: str
    telefono: int

@router.post("/crear_user")
async def crear_user(user_request: UserCreateRequest):
    hashed_password = hashlib.sha256(user_request.contraseña.encode()).hexdigest()
    params = [
        user_request.nombres_completos,
        user_request.dni,
        user_request.genero,
        user_request.fecha_nacimiento,
        user_request.direccion,
        user_request.departamento,
        user_request.correo,
        hashed_password,
        user_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_crear_usuario', params)
        
@router.post("/actualizar_user")
async def actualizar_user(user_request: UserUpdateRequest):
    hashed_password = hashlib.sha256(user_request.contraseña.encode()).hexdigest()
    params = [
        user_request.nombres_completos,
        user_request.dni,
        user_request.genero,
        user_request.fecha_nacimiento,
        user_request.direccion,
        user_request.departamento,
        user_request.correo,
        hashed_password,
        user_request.telefono
    ]
    result = data_conexion.ejecutar_procedure('sp_actualizar_usuario', params)

@router.get("/verperfil_usuario", response_model=List[dict])
async def verperfil_usuario():
    result = data_conexion.ejecutar_procedure('sp_verperfil_usuario', [])
    return result

@router.get("/vercupones_adquiridos", response_model=List[dict])
async def vercupones_adquiridos():
    result = data_conexion.ejecutar_procedure('sp_vercupones_adquiridos', [])
    return result