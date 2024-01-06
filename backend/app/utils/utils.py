import jwt
from datetime import datetime, timedelta
from fastapi import HTTPException

# Clave secreta y algoritmo para codificar/descodificar JWT
SECRET_KEY = "tu-cupon-secreto"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30  # Tiempo de expiración del token en minutos

def create_access_token(data: dict):
    # Crea un nuevo token con tiempo de expiración
    to_encode = data.copy()
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt

def get_current_user(token: str):
    # Valida y decodifica el token proporcionado
    credentials_exception = HTTPException(
        status_code=401,
        detail="Token inválido",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        # Decodifica el token y extrae la información del usuario
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
    except jwt.ExpiredSignatureError:
        raise credentials_exception
    except jwt.JWTError:
        raise credentials_exception
    return username
