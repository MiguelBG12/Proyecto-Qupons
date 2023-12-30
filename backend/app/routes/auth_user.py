from fastapi import APIRouter, HTTPException, Depends
from fastapi.security import OAuth2PasswordRequestForm
from datetime import timedelta
from ..security.auth_user import ACCESS_TOKEN_EXPIRE_MINUTES, create_access_token, verify_token_access, oauth2_scheme, get_current_user
from ..models.user import UserDataToken
from ..config.db_conexion import data_conexion

router = APIRouter()

@router.post("/token", response_model=UserDataToken, tags=["authentication"])
async def login_for_access_token(
    form_data: OAuth2PasswordRequestForm = Depends()
):
    # Llamar al procedimiento almacenado para autenticar al usuario
    result = data_conexion.ejecutar_procedure("sp_autenticar_usuario", [form_data.username, form_data.password])

    # Verificar si el procedimiento almacenado devolvió resultados
    if result['result'] and len(result['result'][0]) > 0:
        # Obtener datos del usuario autenticado
        user_data = result['result'][0][0]

        # Crear el token de acceso
        access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
        access_token = create_access_token(
            data={
                "id": user_data['usuario_id'],
                "nombres_completos": user_data['nombres_completos'],
                "correo": user_data['correo'],
                "contraseña": user_data['contraseña'],
            },
            expires_delta=access_token_expires
        )

        return {"access_token": access_token, "token_type": "bearer"}
    else:
        raise HTTPException(
            status_code=401,
            detail="Nombre de usuario o contraseña incorrectos",
            headers={"WWW-Authenticate": "Bearer"},
        )

@router.get("/users/me/", response_model=UserDataToken, tags=["authentication"])
async def read_users_me(
    current_user: UserDataToken = Depends(get_current_user)
):
    """
    Get the information of the currently authenticated user.
    """
    return current_user

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
