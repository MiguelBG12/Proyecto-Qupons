from pydantic import BaseModel

# Esquema para la entrada de un usuario
class UserCreate(BaseModel):
    username: str
    email: str
    password: str

# Esquema para la salida de un usuario
class User(BaseModel):
    id: int
    username: str
    email: str
