DROP TABLE IF EXISTS `cliente_tienda`;

CREATE TABLE `cliente_tienda` (
  `cliente_tienda_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(255) NOT NULL,
  `ruc` VARCHAR(255) NOT NULL,
  `razon_social` VARCHAR(255) NOT NULL,
  `direccion` VARCHAR(255) NULL,
  `correo` VARCHAR(255) NOT NULL,
  `nombre_contacto` VARCHAR(255) NOT NULL,
  `logo_tienda` VARCHAR(255) NOT NULL,
  `contrasenna` VARCHAR(255) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`cliente_tienda_id`));
  