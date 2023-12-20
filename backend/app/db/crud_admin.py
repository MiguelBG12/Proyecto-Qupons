"Proyecto-Qupons/backend/app/db/crud_admin.py"
from db_conexion import DataConexion
import mysql.connector
from mysql.connector import Error
from os import getenv

class Administrador(DataConexion):

    def crear_nuevo_admin(self, nombre, cargo, email, contraseña):
        try:
            procedure = 'sp_crear_admin'
            data = self.EjecutaProcedure(procedure, (nombre, cargo, email, contraseña))
            return data
        except Exception as e:
            return str(e)

    def ver_admin(self):
        try:
            procedure = 'sp_ver_administradores'
            data = self.EjecutaProcedureSelect(procedure)
            return data
        except Exception as e:
            print(f"Error al obtener cupones: {e}")
            return {'error': f"Error al obtener cupones: {e}"}

    def actualizar_admin(self, administrador_id, nombre, nuevo_cargo, nuevo_email, contraseña, nueva_contraseña):
        try:
            procedure = 'sp_actualizar_admin'
            data = self.EjecutaProcedure(procedure, (administrador_id, nombre, nuevo_cargo, nuevo_email, contraseña, nueva_contraseña))
            if data['nombre'] == nombre and data['contraseña'] == contraseña:
                return data
        except:
            print("error")
        
    def borrar_admin(self, administrador_id):
        try:
            procedure = 'sp_borrar_admin'
            data = self.EjecutaProcedure(procedure, (administrador_id,))
            return ("Administrador borrado con exito")
        except Exception as e:
            return str(e)

    def borrar_usuario(self, usuario_id):
        try:
            procedure = 'sp_borrar_usuario'
            data = self.EjecutaProcedure(procedure, (usuario_id,))
            return("Usuario borrado con exito")
        except Exception as e:
            return str(e)

    def ver_usuarios(self):
        try:
            procedure = 'sp_ver_usuarios'
            data = self.EjecutaProcedureSelect(procedure)
            return data
        except Exception as e:
            print(f"Error al obtener cupones: {e}")
            return {'error': f"Error al obtener cupones: {e}"}

    def ver_todos_cupones(self):
        try:
            procedure = 'sp_ver_cupones'
            data = self.EjecutaProcedureSelect(procedure)
            return data
        except Exception as e:
            print(f"Error al obtener cupones: {e}")
            return {'error': f"Error al obtener cupones: {e}"}

    def borrar_cupon(self, cupones_id):
        try:
            # Llamada al procedimiento almacenado
            procedure_name = 'sp_borrar_cupon'
            result = self.EjecutaProcedure(procedure_name, (cupones_id,))

            # Verificar el resultado del procedimiento almacenado
            if 'result' in result == 'El cupón fue borrado exitosamente':
                return "Cupón borrado con éxito"
            else:
                return "No se pudo borrar el cupón. Verifica el ID proporcionado."

        except Exception as e:
            return f"Error al intentar borrar el cupón: {str(e)}"

    def ver_clientes(self):
        try:
            procedure = 'sp_ver_clientes'
            data = self.EjecutaProcedureSelect(procedure)
            return data
        except Exception as e:
            print(f"Error al obtener cupones: {e}")
            return {'error': f"Error al obtener cupones: {e}"}

    def borrar_cliente(self, cliente_id):
        try:
            # Llamada al procedimiento almacenado
            procedure_name = 'sp_borrar_cliente'
            result = self.EjecutaProcedure(procedure_name, (cliente_id,))

            # Verificar el resultado del procedimiento almacenado
            if 'result' in result and result['result'][0] == 'Cliente eliminado exitosamente':
                return "Cliente borrado con éxito"
            else:
                return "No se pudo borrar el cliente. Verifica el ID proporcionado."

        except Exception as e:
            return f"Error al intentar borrar el cliente: {str(e)}"

# Ejemplos de uso:
admin_handler = Administrador()

"Crear administrador nuevo"
resultado_crearadmin = admin_handler.crear_nuevo_admin("Carlos", "jefe", "Carlos@gmail.com", "fsdfsd")
print("Nuevo admin:", resultado_crearadmin)
"""
"Ver todos los administradores"
resultado_ver_admin = admin_handler.ver_admin()
print(resultado_ver_admin)

"Actualizar administrador"
resultado_actualizar_admin = admin_handler.actualizar_admin(9, 'Carlos', 'subjefe', 'lucasm@gmail.com', 'jfrf', 'sjdfojsn')
print(resultado_actualizar_admin) 

"Borrar administrador"
resultado_borrar_admin = admin_handler.borrar_admin(10)
print(resultado_borrar_admin)

"Borrar usuario"
resultado_borrar_usuario = admin_handler.borrar_usuario(2)
print(resultado_borrar_usuario)

"Ver todos los usuarios"
resultados_usuarios = admin_handler.ver_usuarios()
print("Usuarios:", resultados_usuarios)

"Ver todos los cupones"
resultados_cupones = admin_handler.ver_todos_cupones()
print(resultados_cupones)

"Borrar cupon"
resultado_borrar_cupon = admin_handler.borrar_cupon(25) 
print(resultado_borrar_cupon)

"Ver todos los clientes"
resultados_clientes = admin_handler.ver_clientes()
print("Clientes:", resultados_clientes)

"Borrar cliente"
resultado_borrarcliente = admin_handler.borrar_cliente(10)
print(resultado_borrarcliente)
"""
