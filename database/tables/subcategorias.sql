/*DROP TABLE IF EXISTS `subcategorias` ;*/

CREATE TABLE `subcategorias` (
  `subcategorias_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `categorias_id` INT NOT NULL,
  PRIMARY KEY (`subcategorias_id`),
  INDEX `fk_SUBCATEGORIAS_CATEGORIAS1_idx` (`categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_SUBCATEGORIAS_CATEGORIAS1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `db_webcuponera`.`CATEGORIAS` (`categorias_id`)
);

/*INSERT INTO subcategorias(nombre, categorias_id) VALUES ('estetica', 2)*/
