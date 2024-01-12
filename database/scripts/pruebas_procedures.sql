CALL sp_crear_admin('Carlos Ramirez', 'Administrador', 'carlos@gmail.com', 'carlos123');
CALL sp_crear_admin('Mariafe Rios', 'manager', 'mariafe@gmail.com', 'mariafe123');
CALL sp_crear_admin('Juan Pérez', 'Administrador', 'juan@gmail.com', 'juan123');
CALL sp_crear_admin('Ana López', 'Supervisor', 'ana@gmail.com', 'ana123');

CALL sp_login_administrador('carlos@gmail.com', 'carlos123');
CALL sp_actualizar_admin(1, NULL, 'Subjefe', 'carlosr@gmail.com', 'carlos1234');
CALL sp_actualizar_admin(2, 'Camila', 'jefe', 'camila@gmail.com', 'camila123');
CALL sp_borrar_admin(1);
CALL sp_ver_administradores();

CALL sp_crear_tienda('Norkys', '12345678901', 'Norkys SAC', 'Av Los Rosales 171', 'norkys@gmail.com', 'Laura Marin', './asset/logotienda.jpg', 'norkys123', 914775544);
CALL sp_crear_tienda('La Marina', '98765432101', 'La Marina SRL', 'Calle Comercial 265', 'lamarina@gmail.com', 'Andrés Pérez', './assets/tiendaA.jpg', 'lamarina123', 912345678);
CALL sp_crear_tienda('Cineplanet', '56789012301', 'cineplanet EIRL', 'surquillo 345', 'cineplanet@gmail.com', 'María Gómez', './assets/modaexpress.jpg', 'cineplanet123', 945678901);
CALL sp_crear_tienda('Mas Chic', '01234567890', 'maschic SAC', 'Calle de la camelias 113', 'maschic@gmail.com', 'Luis Ramírez', './assets/electrotech.jpg', 'maschic123', 987654321);
CALL sp_crear_tienda('Coney Park', '01234567890', 'coneypark SAC', 'Av la Marina 577', 'coney@gmail.com', 'Luis Ramírez', './assets/electrotech.jpg', 'coney123', 987654321);

CALL sp_crear_tienda('ModaStyle', '11223344556', 'ModaStyle Fashion SRL', 'Avenida de la Moda', 'modastyle@gmail.com', 'Ana Rodríguez', './assets/modastyle.jpg', 'style456', 987612345);

CALL sp_login_tienda('tayloya@gmail.com', 'tayloy123');
CALL sp_actualizar_tienda(2, 'Av tingo maria 224', NULL, 'comprasrapidas@gmail.com', 'compra123', NULL);
CALL sp_actualizar_tienda(3, 'Characarilla 123', 'Marco Bueno', 'comprasrapidasv@gmail.com', 'compra1234', 960762233);
CALL sp_borrar_cliente(4);
CALL sp_ver_clientes();

CALL sp_crear_categorias('Belleza');
CALL sp_crear_categorias('Gastromia');
CALL sp_crear_categorias('Moda');
CALL sp_crear_categorias('Entretenimiento');
CALL sp_crear_categorias('viajes');
CALL sp_eliminar_categoria(4);
CALL sp_ver_categorias();

CALL sp_crear_cupon('Norkys: Super promoción 1 pollo a la brasa', 'Paga S/ 54.90 En vez de S/. 68.00 por un Pollo a la Brasa Norkys+ Papas Fritas + Ensalada + 1 Litro de Chicha. Valido para Delivery o Retiro en Tienda', '2024-01-01', '2024-02-01', 68.00, 54.90, '/src/assets/img/promo3.jpg', 1, 1);
CALL sp_crear_cupon('La Marina: Vuelven los puntos de descuento exclusivo', 'Hasta 2x1 en productos seleccionados. Aprovecha esta oferta unica en ropa para toda la familia', '2024-03-01', '2024-03-31', 100.00, 50.00, '/src/assets/img/promo6.jpg', 2, 3);
CALL sp_crear_cupon('Noche de Cine con Descuento en Cineplanet', 'Disfruta de una noche de cine con descuento: 02 Entradas 2D + Combo (2 Bebidas Grandes y 01 Pop Corn Gigante)', '2024-04-01', '2024-04-30', 50.0, 40.0, '/src/assets/img/promo8.jpg', 3, 4);
CALL sp_crear_cupon('Mas Chic: corte de cabello para mujer a solo 20 soles', 'Por apertura en nuestra sede en Surquillo aprovecha esta super promoción única', '2024-04-01', '2024-04-30',45.00, 20.00, '/src/assets/img/promo9.jpg', 4, 1);
CALL sp_crear_cupon('Coney Park: Pirate Party llegó a Coney Park de Plaza Lima Sur', 'Aprovecha el 50% de descuento en la entrada para 2 personas, consumiendo S/25 a más en el centro comercial', '2024-02-01', '2024-02-29', 120.00, 60.00, '/src/assets/img/promo10.jpg', 5, 4);
CALL sp_crear_cupon('Norkys: LLegó la dupla perfecta', 'La dupla perfecta para este verano, llévate 1/4 + papas fritas + arroz chaufa + gaseosa personal a solo S/29.90. Promoción válida todo enero', '2024-01-01', '2024-01-30', 37.90, 29.90, '/src/assets/img/promo11.jpg', 1, 2);
CALL sp_crear_cupon('Descuento en Zapatillas de hombre y mujer', 'Renueva tu armario en pareja con descuentos en zapatillas hasta un 40% de descuento solo en La Marina', '2024-05-01', '2024-05-31', 210.00, 126.00, '/src/assets/img/promo12.jpg', 2, 3);

CALL sp_crear_cupon('Oferta de Restaurant', 'Disfruta de un descuento especial en tu restaurante favorito', '2024-06-01', '2024-06-30', 35.0, 20.0, 'restaurante_oferta.jpg', 5, 2);
CALL sp_crear_cupon('otra oferta', 'abcde', '2024-07-01', '2024-08-30', 500.0, 4200.0, 'oferta_oferta.jpg', 1, 3);


CALL sp_actualizar_cupon('2', NULL, 'Descuento en productos de belleza y cuidado personal y mas', '2024-05-01', '2024-05-31', 90.0, 60.0, NULL, 3, NULL);

CALL sp_borrar_cupon(5);
CALL sp_borrar_cupontienda(5, 1);
CALL sp_ver_cupones();

CALL sp_crear_usuario('Ana López', 23456789, 'Femenino', '1992-08-20', 'Avenida Principal 456', 'Lima', 'ana@gmail.com', 'ana123', 987654322);
CALL sp_crear_usuario('Pedro González', 34567890, 'Masculino', '1985-03-10', 'Calle Secundaria 789', 'Lima', 'pedro@gmail.com', 'pedro789', 987654323);
CALL sp_crear_usuario('María Rodríguez', 45678901, 'Femenino', '1998-12-05', 'Avenida Principal 789', 'Lima', 'maria@gmail.com', 'maria987', 987654324);
CALL sp_crear_usuario('Javier Torres', 56789012, 'Masculino', '1980-06-25', 'Calle Secundaria 123', 'Lima', 'javier@gmail.com', 'javier123', 987654325);
CALL sp_crear_usuario('Carla Sánchez', 67890124, 'Femenino', '1995-09-15', 'Avenida Principal 567', 'Lima', 'carla@gmail.com', 'carla567', 987654326);

CALL sp_actualizar_usuario('1', 'Avenida Principal 357', 'Callao', 'analopez@gmail.com', 'ana4577', NULL);
CALL sp_login_usuario('analopez@gmail.com', 'ana4577');
CALL sp_adquirir_cupon(1, 3);
CALL sp_adquirir_cupon(1, 4);
CALL sp_vercupones_adquiridos(1);
CALL sp_borrar_usuario(5);
CALL sp_ver_usuarios();

