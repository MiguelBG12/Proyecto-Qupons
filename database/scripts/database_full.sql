
CREATE SCHEMA IF NOT EXISTS `db_webcuponera` ;

USE `db_webcuponera` ;
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
  `contraseña` VARCHAR(64) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`usuario_id`)
  );

DROP TABLE IF EXISTS `cliente_tienda`;

CREATE TABLE `cliente_tienda` (
  `cliente_tienda_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(45) NOT NULL,
  `ruc` VARCHAR(11) NOT NULL,
  `razon_social` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NULL,
  `correo` VARCHAR(45) NOT NULL,
  `nombre_contacto` VARCHAR(60) NOT NULL,
  `logo_tienda` VARCHAR(100) NOT NULL,
  `contraseña` VARCHAR(64) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`cliente_tienda_id`));

DROP TABLE IF EXISTS `categorias` ;

CREATE TABLE `categorias` (
  `categorias_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`categorias_id`));
  
DROP TABLE IF EXISTS `cupones` ;

CREATE TABLE `cupones` (
  `cupones_id` INT NOT NULL AUTO_INCREMENT, 
  `titulo` VARCHAR(60) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `precio_normal` FLOAT NOT NULL,
  `precio_oferta` FLOAT NOT NULL,
  `porcentaje_descuento` FLOAT NOT NULL,
  `stock` INT NOT NULL,
  `diseño_oferta_foto` VARCHAR(100) NOT NULL,
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
    
DROP TABLE IF EXISTS `cupon_comprado` ;

CREATE TABLE `cupon_comprado` (
    `fecha_compra` DATE NOT NULL,
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

DROP TABLE IF EXISTS `administradores` ;

CREATE TABLE `administradores` (
  `administrador_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `cargo` VARCHAR(30) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`administrador_id`));
 