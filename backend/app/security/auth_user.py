from fastapi import HTTPException, status, Depends
from datetime import datetime, timedelta
from fastapi.security import OAuth2PasswordBearer
from jose import JWTError, jwt
from passlib.context import CryptContext
from ..config.db_conexion import data_conexion
from ..models.user import UserDataToken

oauth2_scheme = OAuth2PasswordBearer(tokenUrl='/login')

SECRET_KEY = "your-secret-key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def create_access_token(data: dict, expires_delta: timedelta):
    to_encode = data.copy()
    expire = datetime.utcnow() + expires_delta
    to_encode.update({
        "nombres_completos": data.get("nombres_completos", ""),
        "contraseña": data.get("contraseña", ""),
        "exp": expire
    })
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    print(encoded_jwt)
    return encoded_jwt

def verify_token_access(token: str, credentials_exception):
    try:
        # Decodificar el token
        payload = jwt.decode(token, SECRET_KEY, algorithms=ALGORITHM)

        # Obtener datos del token
        correo: str = payload.get("correo")
        hashedPassword: str = payload.get("contraseña")

        # Llamar al procedimiento almacenado para autenticar al usuario
        result = data_conexion.ejecutar_procedure("sp_autenticar_usuario", [correo, hashedPassword])
        print("Resultado del procedimiento almacenado:", result)

        # Verificar si el procedimiento almacenado devolvió resultados
        if result['result'] and len(result['result'][0]) > 0:
            usuario_id = result['result'][0][0]['usuario_id']
            token_data = UserDataToken(id=usuario_id)
        else:
            raise credentials_exception

    except JWTError as e:
        print(e)
        raise credentials_exception

    return token_data

def get_current_user(token: str = Depends(oauth2_scheme)):
    credentials_exception = HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,
                                          detail="Could not Validate Credentials",
                                          headers={"WWW-Authenticate": "Bearer"})

    token = verify_token_access(token, credentials_exception)

    # Llamar al procedimiento almacenado para obtener el perfil del usuario
    result = data_conexion.ejecutar_procedure("sp_verperfil_usuario", [token.id])

    # Verificar si el procedimiento almacenado devolvió resultados
    if result['result'] and len(result['result'][0]) > 0:
        user_data = result['result'][0][0]
        # Aquí puedes crear un objeto de usuario manualmente
        user = UserDataToken(**user_data)
        return user

    # Si no se encontró el usuario, lanzar una excepción
    raise credentials_exception

