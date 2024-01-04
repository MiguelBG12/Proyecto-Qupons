from fastapi import APIRouter
from app.controllers.users_controller import UserCreateRequest
from app.controllers.admin_controller import AdminCreateRequest
from app.controllers.stores_controller import StoreCreateRequest
from app.controllers.admin_controller import (crear_admin)
from app.controllers.users_controller import (crear_user)
from app.controllers.stores_controller import (crear_tienda)

router = APIRouter()

@router.post("/Registrar_user")
async def route_crear_user(user_data: UserCreateRequest):
    return await crear_user(user_data)

@router.post("/Registrar_tienda")
async def route_crear_tienda(store_data: StoreCreateRequest):
   return await crear_tienda(store_data)

@router.post("/Registrar_admin")
async def route_crear_admin(admin_data: AdminCreateRequest):
    return await crear_admin(admin_data)