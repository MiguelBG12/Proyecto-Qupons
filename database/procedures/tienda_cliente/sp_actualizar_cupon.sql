DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_actualizar_cupon` $$
CREATE PROCEDURE `sp_actualizar_cupon`(
    IN p_cupones_id INT,
    IN p_titulo VARCHAR(100),
    IN p_descripcion VARCHAR(255),
    IN p_fecha_inicio DATE,
    IN p_fecha_vencimiento DATE,
    IN p_precio_normal FLOAT,
    IN p_precio_oferta FLOAT,
    IN p_disenno_oferta_foto LONGBLOB,
    IN p_cliente_tienda_id INT,
    IN p_categorias_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM `cupones` WHERE `cupones_id` = p_cupones_id AND `cliente_tienda_id` = p_cliente_tienda_id) THEN
        IF p_titulo IS NOT NULL THEN
            UPDATE `cupones` SET `titulo` = p_titulo WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_descripcion IS NOT NULL THEN
            UPDATE `cupones` SET `descripcion` = p_descripcion WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_fecha_inicio IS NOT NULL THEN
            UPDATE `cupones` SET `fecha_inicio` = p_fecha_inicio WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_fecha_vencimiento IS NOT NULL THEN
            UPDATE `cupones` SET `fecha_vencimiento` = p_fecha_vencimiento WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_precio_normal IS NOT NULL THEN
            UPDATE `cupones` SET `precio_normal` = p_precio_normal WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_precio_oferta IS NOT NULL THEN
            UPDATE `cupones` SET `precio_oferta` = p_precio_oferta WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_disenno_oferta_foto IS NOT NULL THEN
            UPDATE `cupones` SET `diseno_oferta_foto` = p_disenno_oferta_foto WHERE `cupones_id` = p_cupones_id;
        END IF;
        SELECT 'El cupón ha sido actualizado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El cupón no está vinculado al cliente_tienda';
    END IF;
END$$
DELIMITER ;