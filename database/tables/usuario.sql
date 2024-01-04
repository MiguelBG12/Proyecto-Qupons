DROP TABLE IF EXISTS `usuario` ;

CREATE TABLE `usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nombres_completos` VARCHAR(255) NOT NULL,
  `dni` INT NOT NULL,
  `genero` VARCHAR(255) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `departamento` VARCHAR(255) NOT NULL,
  `correo` VARCHAR(255) NOT NULL,
  `contrasenna` VARCHAR(255) NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`usuario_id`)
  );
  