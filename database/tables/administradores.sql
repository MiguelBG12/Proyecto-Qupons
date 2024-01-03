DROP TABLE IF EXISTS `administradores` ;

CREATE TABLE `administradores` (
  `administrador_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `cargo` VARCHAR(30) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contrasenna` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`administrador_id`));
  