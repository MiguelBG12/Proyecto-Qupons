DROP TABLE IF EXISTS `administradores` ;

CREATE TABLE `administradores` (
  `administrador_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `cargo` VARCHAR(255) NOT NULL,
  `correo` VARCHAR(255) NOT NULL,
  `contrasenna` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`administrador_id`));
  