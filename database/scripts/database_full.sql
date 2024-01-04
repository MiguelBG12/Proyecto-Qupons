
CREATE SCHEMA IF NOT EXISTS `db_webcuponera` ;

USE `db_webcuponera` ;
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

DROP TABLE IF EXISTS `cliente_tienda`;

CREATE TABLE `cliente_tienda` (
  `cliente_tienda_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(255) NOT NULL,
  `ruc` VARCHAR(255) NOT NULL,
  `razon_social` VARCHAR(255) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `correo` VARCHAR(255) NOT NULL,
  `nombre_contacto` VARCHAR(255) NOT NULL,
  `logo_tienda` VARCHAR(255) NOT NULL,
  `contrasenna` VARCHAR(255) NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`cliente_tienda_id`));

DROP TABLE IF EXISTS `categorias` ;

CREATE TABLE `categorias` (
  `categorias_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`categorias_id`));
  
DROP TABLE IF EXISTS `cupones` ;

CREATE TABLE `cupones` (
  `cupones_id` INT NOT NULL AUTO_INCREMENT, 
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `precio_normal` FLOAT NOT NULL,
  `precio_oferta` FLOAT NOT NULL,
  `disenno_oferta_foto` VARCHAR(255) NOT NULL,
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
    
DROP TABLE IF EXISTS `cupon_comprado` ;

CREATE TABLE `cupon_comprado` (
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

DROP TABLE IF EXISTS `administradores` ;

CREATE TABLE `administradores` (
  `administrador_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `cargo` VARCHAR(255) NOT NULL,
  `correo` VARCHAR(255) NOT NULL,
  `contrasenna` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`administrador_id`));
 