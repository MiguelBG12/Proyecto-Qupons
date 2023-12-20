/*DROP TABLE IF EXISTS `cupones` ;*/

CREATE TABLE `cupones` (
  `cupones_id` INT NOT NULL AUTO_INCREMENT, 
  `titulo` VARCHAR(60) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `precio_normal` FLOAT NOT NULL,
  `precio_oferta` FLOAT NOT NULL,
  `porcentaje_descuento` FLOAT NOT NULL,
  `diseño_oferta_foto` VARCHAR(45) NOT NULL,
  `terminos_condiciones` VARCHAR(400) NOT NULL,
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
    
/*INSERT INTO cupones(titulo, descripcion, fecha_inicio, fecha_vencimiento, precio_normal, precio_oferta, porcentaje_descuento, diseño_oferta_foto, terminos_condiciones, cliente_tienda_id, categorias_id) VALUES ('Nuevo descuento escolar', 'Aprovecha este 20% de decuento en tu segunda compra de utiles escolares', '2023-12-11', '2023-12-30', 150.26, 125.6, 20, '/images/libros.png', 'Solo 1 cupon por persona sera permitido, valido de lunes a viernes', 1, 1)
INSERT INTO cupones(titulo, descripcion, fecha_inicio, fecha_vencimiento, precio_normal, precio_oferta, porcentaje_descuento, diseño_oferta_foto, terminos_condiciones, cliente_tienda_id, categorias_id) VALUES ('Alisado brasileño', 'De regalo rizado de pestañas', '2024-01-02', '2024-01-13', 120.20, 100, 15, '/images/alisado.png', 'Solo 2 cupon por persona sera permitido, valido de lunes a viernes', 1, 2)*/
