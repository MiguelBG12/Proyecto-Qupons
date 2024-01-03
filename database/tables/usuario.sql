DROP TABLE IF EXISTS `usuario` ;

CREATE TABLE `usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nombres_completos` VARCHAR(60) NOT NULL,
  `dni` INT NOT NULL,
  `genero` VARCHAR(15) NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `departamento` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contrasenna` VARCHAR(256) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`usuario_id`)
  );
  