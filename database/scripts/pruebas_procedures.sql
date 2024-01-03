CALL sp_crear_admin('Carlos Ramirez', 'Administrador', 'carlos@gmail.com', 'carlos123');
CALL sp_crear_admin('Mariafe Rios', 'manager', 'mariafe@gmail.com', 'mariafe123');
CALL sp_crear_admin('Juan Pérez', 'Administrador', 'juan@gmail.com', 'juan123');
CALL sp_crear_admin('Ana López', 'Supervisor', 'ana@gmail.com', 'ana123');

CALL sp_login_administrador('carlos@gmail.com', 'carlos123');
CALL sp_actualizar_admin(1, NULL, 'Subjefe', 'carlosr@gmail.com', 'carlos1234');
CALL sp_actualizar_admin(2, 'Camila', 'jefe', 'camila@gmail.com', 'camila123');
CALL sp_borrar_admin(1);
CALL sp_ver_administradores();

CALL sp_crear_tienda('Tayloy', '12345678901', 'Tayloy SAC', 'Av Los Rosales', 'tayloya@gmail.com', 'Laura Marin', './asset/logotienda.jpg', 'tayloy123', 914775544);
CALL sp_crear_tienda('Compras Rapidas', '98765432101', 'Compras Rápidas SRL', 'Calle Comercial', 'tiendaA@gmail.com', 'Andrés Pérez', './assets/tiendaA.jpg', 'tiendaA123', 912345678);
CALL sp_crear_tienda('Moda Express', '56789012301', 'Moda Express EIRL', 'Avenida de la Moda', 'modaexpress@gmail.com', 'María Gómez', './assets/modaexpress.jpg', 'moda123', 945678901);
CALL sp_crear_tienda('ElectroTech', '01234567890', 'ElectroTech SAC', 'Calle de la Tecnología', 'electrotech@gmail.com', 'Luis Ramírez', './assets/electrotech.jpg', 'tech123', 987654321);
CALL sp_crear_tienda('ModaStyle', '11223344556', 'ModaStyle Fashion SRL', 'Avenida de la Moda', 'modastyle@gmail.com', 'Ana Rodríguez', './assets/modastyle.jpg', 'style456', 987612345);

CALL sp_login_tienda('tayloya@gmail.com', 'tayloy123');
CALL sp_actualizar_tienda(2, 'Av tingo maria 224', NULL, 'comprasrapidas@gmail.com', 'compra123', NULL);
CALL sp_actualizar_tienda(3, 'Characarilla 123', 'Marco Bueno', 'comprasrapidasv@gmail.com', 'compra1234', 960762233);
CALL sp_borrar_cliente(4);
CALL sp_ver_clientes();

CALL sp_crear_categorias('Belleza');
CALL sp_crear_categorias('Gastromia');
CALL sp_crear_categorias('Entretenimiento');
CALL sp_crear_categorias('viajes');
CALL sp_eliminar_categoria(4);
CALL sp_ver_categorias();

CALL sp_crear_cupon('Descuento Especial en utiles escolares', 'Aproveche los dscto este año escolar', '2024-01-01', '2024-02-01', 50.0, 30.0, 'oferta.jpg', 1, 3);
CALL sp_crear_cupon('Oferta de Belleza', 'Descuento en productos de belleza y cuidado personal', '2024-03-01', '2024-03-31', 70.0, 50.0, 'belleza.jpg', 3, 1);
CALL sp_crear_cupon('Noche de Cine con Descuento', 'Disfruta de una noche de cine con descuento en entradas', '2024-04-01', '2024-04-30', 25.0, 15.0, 'cine_descuento.jpg', 2, 3);
CALL sp_crear_cupon('Descuento en Ropa de Moda', 'Renueva tu armario con descuentos en ropa de moda', '2024-05-01', '2024-05-31', 60.0, 40.0, 'moda_descuento.jpg', 1, 2);
CALL sp_crear_cupon('Oferta de Restaurant', 'Disfruta de un descuento especial en tu restaurante favorito', '2024-06-01', '2024-06-30', 35.0, 20.0, 'restaurante_oferta.jpg', 1, 2);

CALL sp_actualizar_cupon('2', NULL, 'Descuento en productos de belleza y cuidado personal y mas', '2024-05-01', '2024-05-31', 90.0, 60.0, NULL, 3, NULL);

CALL sp_borrar_cupon(3);
CALL sp_borrar_cupontienda(5, 1);
CALL sp_ver_cupones();

CALL sp_crear_usuario('Ana López', 23456789, 'Femenino', '1992-08-20', 'Avenida Principal 456', 'Lima', 'ana@gmail.com', 'ana456', 987654322);
CALL sp_crear_usuario('Pedro González', 34567890, 'Masculino', '1985-03-10', 'Calle Secundaria 789', 'Lima', 'pedro@gmail.com', 'pedro789', 987654323);
CALL sp_crear_usuario('María Rodríguez', 45678901, 'Femenino', '1998-12-05', 'Avenida Principal 789', 'Lima', 'maria@gmail.com', 'maria987', 987654324);
CALL sp_crear_usuario('Javier Torres', 56789012, 'Masculino', '1980-06-25', 'Calle Secundaria 123', 'Lima', 'javier@gmail.com', 'javier123', 987654325);
CALL sp_crear_usuario('Carla Sánchez', 67890124, 'Femenino', '1995-09-15', 'Avenida Principal 567', 'Lima', 'carla@gmail.com', 'carla567', 987654326);

CALL sp_actualizar_usuario('1', 'Avenida Principal 357', 'Callao', 'analopez@gmail.com', 'ana4577', NULL);
CALL sp_login_usuario('analopez@gmail.com', 'ana4577');
CALL sp_adquirir_cupon(1, 1);
CALL sp_adquirir_cupon(1, 4);
CALL sp_vercupones_adquiridos(1);
CALL sp_borrar_usuario(5);
CALL sp_ver_usuarios();

