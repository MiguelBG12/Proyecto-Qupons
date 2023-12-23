from fastapi import FastAPI
from backend.app.controllers.admin_controller import Administrador

app = FastAPI()

#Crear una instancia de la clase Administrador
admin_instance = Administrador()

# Rutas para operaciones relacionadas con usuarios
@app.get("/usuarios")
def get_users():
    usuarios = admin_instance.ver_usuarios()
    return {"Listado de usuarios": usuarios}

@app.post("/users")
def create_user():
    # Lógica para crear un usuario
    return {"message": "Usuario creado"}

# Rutas para operaciones relacionadas con cupones
@app.get("/cupones")
def get_coupons():
    cupones = admin_instance.ver_todos_cupones()
    return {"Listado de cupones": cupones}

@app.post("/coupons/")
def create_coupon():
    # Lógica para crear un cupón
    return {"message": "Cupón creado"}

@app.get("/administradores")
def get_coupons():
    administradores = admin_instance.ver_admin()
    return {"Listado de administradores": administradores}

@app.post("/administradores")
def create_coupon():
    # Lógica para crear un cupón
    return {"message": "Cupón creado"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
