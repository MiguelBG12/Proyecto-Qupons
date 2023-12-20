/*DROP TABLE IF EXISTS `cupon_comprado` ;*/

CREATE TABLE `cupon_comprado` (
    `fecha_compra` DATE NOT NULL,
    `codigo_venta` INT NOT NULL,
    `cantidad_comprada` INT NOT NULL,
    `estado_cupon` ENUM('canjeado', 'no canjeado', 'vencido') NOT NULL,
    `usuario_id` INT NOT NULL,
    `cupones_id` INT NOT NULL,
    PRIMARY KEY (`usuario_id`, `cupones_id`),
    INDEX `fk_CUPON_COMPRADO_USUARIO_idx` (`usuario_id` ASC),
    INDEX `fk_CUPON_COMPRADO_CUPONES1_idx` (`cupones_id` ASC),
    CONSTRAINT `fk_CUPON_COMPRADO_USUARIO`
        FOREIGN KEY (`usuario_id`)
        REFERENCES `db_webcuponera`.`usuario` (`usuario_id`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_CUPON_COMPRADO_CUPONES1`
        FOREIGN KEY (`cupones_id`)
        REFERENCES `db_webcuponera`.`cupones` (`cupones_id`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);

/*INSERT INTO cupon_comprado(fecha_compra, codigo_venta, cantidad_comprada, estado_cupon, usuario_id, cupones_id) VALUES ('2023-12-11', '202345754', '2', 'canjeado', '1', '1')*/
