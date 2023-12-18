"Proyecto-Qupons/backend/app/db/crud_admin.py"
from .db_conexion import DataConexion
import mysql.connector
from mysql.connector import Error
from os import getenv

class Administrador(DataConexion):

    def crear_nuevo_admin(self, nombre, cargo, email, contraseña):
        resultado = self.EjecutaProcedure('sp_crear_admin', (nombre, cargo, email, contraseña))
        if resultado =='mensaje_error':
            return ("El usuario ya existe")
        else:
            return ("Nuevo administrador creado con éxito")

    def ver_admin(self):
        return self.EjecutaProcedureSelect('sp_ver_administradores')

    def actualizar_admin(self, administrador_id, nuevo_cargo, nuevo_email, nueva_contraseña):
        resultado = self.EjecutaProcedure('sp_actualizar_admin', (administrador_id, nuevo_cargo, nuevo_email, nueva_contraseña))
        return resultado

    def borrar_admin(self, administrador_id):
        resultado = self.EjecutaProcedure('sp_borrar_admin', (administrador_id))
        return resultado

    def borrar_usuario(self, usuario_id):
        resultado = self.EjecutaProcedure('sp_borrar_usuario', (usuario_id))
        return resultado

    def ver_usuarios(self):
        return self.EjecutaProcedureSelect('sp_ver_usuarios')

    def ver_todos_cupones(self):
        return self.EjecutaProcedureSelect('sp_ver_cupones')

    def borrar_cupon(self, cupones_id):
        resultado = self.EjecutaProcedure('sp_borrar_cupon', (cupones_id))
        return resultado

    def ver_clientes(self):
        return self.EjecutaProcedureSelect('sp_ver_clientes')

    def borrar_cliente(self, cliente_id):
        resultado = self.EjecutaProcedure('sp_borrar_cliente', (cliente_id))
        return resultado

# Ejemplo de uso:
admin_handler = Administrador()
resultados_usuarios = admin_handler.ver_usuarios()
resultados_clientes = admin_handler.ver_clientes()
resultado_crearadmin = admin_handler.crear_nuevo_admin("Lucas", "jefe", "lucas@gmail.com", "sffsd")
print("Usuarios:", resultados_usuarios)
print("Clientes:", resultados_clientes)
print("Nuevo admin:", resultado_crearadmin)
