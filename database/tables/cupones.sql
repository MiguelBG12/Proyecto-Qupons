DROP TABLE IF EXISTS `cupones` ;

CREATE TABLE `cupones` (
  `cupones_id` INT NOT NULL AUTO_INCREMENT, 
  `titulo` VARCHAR(60) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `precio_normal` FLOAT NOT NULL,
  `precio_oferta` FLOAT NOT NULL,
  `disenno_oferta_foto` VARCHAR(100) NOT NULL,
  `cliente_tienda_id` INT NOT NULL,
  `categorias_id` INT NOT NULL,
  PRIMARY KEY (`cupones_id`),
  INDEX `fk_CUPONES_CLIENTE-TIENDA1_idx` (`cliente_tienda_id` ASC) VISIBLE,
  INDEX `fk_CUPONES_CATEGORIAS1_idx` (`categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUPONES_CLIENTE-TIENDA1`
    FOREIGN KEY (`cliente_tienda_id`)
    REFERENCES `db_webcuponera`.`cliente_tienda` (`cliente_tienda_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUPONES_CATEGORIAS1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `db_webcuponera`.`categorias` (`categorias_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);