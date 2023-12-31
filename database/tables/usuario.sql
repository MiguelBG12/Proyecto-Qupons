USE `db_webcuponera` ;
/*DROP TABLE IF EXISTS `usuario` ;*/

CREATE TABLE `usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nombres_completos` VARCHAR(60) NOT NULL,
  `dni` INT NOT NULL,
  `genero` VARCHAR(15) NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `departamento` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(64) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`usuario_id`)
  );
/*INSERT INTO usuario(nombres_completos, dni, genero, fecha_nacimiento, direccion, departamento, correo, contraseña, telefono) VALUES ('Mario', 12345678, 'masculino', '1958-01-30', 'Av La gardenias 1345', 'lima', 'mario@gmail.com', 'dsjfno234', 9756123)*/
