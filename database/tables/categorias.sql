/*DROP TABLE IF EXISTS `categorias` ;*/

CREATE TABLE `categorias` (
  `categorias_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`categorias_id`));
  
/*INSERT INTO categorias(nombre, descripcion) VALUES ('belleza', 'encuentra todas los productos a mejor precio')
INSERT INTO categorias(nombre) VALUES ('diversion')*/
