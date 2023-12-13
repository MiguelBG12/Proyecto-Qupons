from pydantic import BaseModel

# Definición del modelo para usuarios
class User(BaseModel):
    id: int  # Campo para identificar al usuario (ejemplo)
    username: str  # Nombre de usuario
    email: str  # Correo electrónico del usuario
    full_name: str = None  # Nombre completo (opcional, puede ser nulo)
    disabled: bool = False  # Estado del usuario (habilitado/deshabilitado)

# Definición del modelo para cupones
class Coupon(BaseModel):
    id: int  # Identificador del cupón
    title: str  # Título/descripción del cupón
    store: str  # Tienda asociada al cupón
    discount: float  # Descuento del cupón

# Definición del modelo para tiendas
class Store(BaseModel):
    id: int  # Identificador de la tienda
    name: str  # Nombre de la tienda
    location: str  # Ubicación de la tienda

# Definición del modelo para categorías
class Category(BaseModel):
    id: int  # Identificador de la categoría
    name: str  # Nombre de la categoría
