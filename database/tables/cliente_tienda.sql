DROP TABLE IF EXISTS `cliente_tienda`;

CREATE TABLE `cliente_tienda` (
  `cliente_tienda_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(45) NOT NULL,
  `ruc` VARCHAR(11) NOT NULL,
  `razon_social` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NULL,
  `correo` VARCHAR(45) NOT NULL,
  `nombre_contacto` VARCHAR(60) NOT NULL,
  `logo_tienda` VARCHAR(100) NOT NULL,
  `contrasenna` VARCHAR(256) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`cliente_tienda_id`));
  