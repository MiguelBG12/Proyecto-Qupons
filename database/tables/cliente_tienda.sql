/*DROP TABLE IF EXISTS `cliente_tienda` ;*/

CREATE TABLE `cliente_tienda` (
  `cliente_tienda_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(45) NOT NULL,
  `ruc` VARCHAR(11) NOT NULL,
  `razon_social` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NULL,
  `correo` VARCHAR(30) NOT NULL,
  `nombre_contacto` VARCHAR(60) NOT NULL,
  `contraseña` VARCHAR(20) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`cliente_tienda_id`));
/*INSERT INTO cliente_tienda(nombre_empresa, ruc, razon_social, direccion, correo, nombre_contacto, contraseña, telefono) VALUES ('Tayloy', 00254756, 'venta materiales', 'Av Colina verde', 'tayloy@gmail.com', 'Perez', 'jndnduo67dhih', 577496)*/
