from fastapi import FastAPI
from db.crud_admin import Administrador

app = FastAPI()

#Crear una instancia de la clase Administrador
admin_instance = Administrador()

# Rutas para operaciones relacionadas con usuarios
@app.get("/users")
def get_users():
    usuarios = admin_instance.ver_usuarios()
    return {"Listado de usuarios": usuarios}

@app.post("/users/")
def create_user():
    # Lógica para crear un usuario
    return {"message": "Usuario creado"}

# Rutas para operaciones relacionadas con cupones
@app.get("/coupons/")
def get_coupons():
    # Lógica para obtener cupones
    return {"message": "Listado de cupones"}

@app.post("/coupons/")
def create_coupon():
    # Lógica para crear un cupón
    return {"message": "Cupón creado"}

# Añadir rutas y lógica relacionada con la aplicación

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
