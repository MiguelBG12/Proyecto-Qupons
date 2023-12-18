from db import DataConexion

class Administrador(DataConexion):

    def crear_nuevo_admin(self, nombre, cargo, email, contraseña):
        falta logica
        return self.EjecutaProcedure('sp_crear_admin', (nombre, cargo, email, contraseña))

    def ver_admin(self):
        return self.EjecutaProcedure('sp_ver_administradores')

    def actualizar_admin(self, id_admin, nuevo_nombre, nuevo_email, nueva_contraseña):
        # Lógica para actualizar un administrador en la base de datos
        pass

    def borrar_admin(self, id_admin):
        # Lógica para borrar un administrador de la base de datos
        pass

    def borrar_usuario(self, id_usuario):
        # Lógica para borrar un usuario de la base de datos
        pass

    def ver_usuarios(self):
        return self.EjecutaProcedure('sp_ver_usuarios')

    def ver_todos_cupones(self):
        return self.EjecutaProcedure('sp_ver_todos_cupones')

    def borrar_cupon(self, id_cupon):
        # Lógica para borrar un cupón de la base de datos
        pass

    def actualizar_cupon(self, id_cupon, nueva_tienda):
        # Lógica para actualizar un cupón en la base de datos
        pass

    def ver_clientes(self):
        return self.EjecutaProcedure('sp_ver_clientes')

    def borrar_cliente(self, id_cliente):
        # Lógica para borrar un cliente de la base de datos
        pass

# Ejemplo de uso:
admin_handler = Administrador()
resultados_usuarios = admin_handler.ver_usuarios()
resultados_clientes = admin_handler.ver_clientes()
resultado_crearadmin = admin_handler.crear_nuevo_admin("Marco", "jefe", "maco@gmail.com", "ddfdd")
print("Usuarios:", resultados_usuarios)
print("Clientes:", resultados_clientes)
print("Nuevo admin:", resultado_crearadmin)
