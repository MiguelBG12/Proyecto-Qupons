DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_cupon` $$
CREATE PROCEDURE `sp_actualizar_cupon`(
    IN p_cupones_id INT,
    IN p_titulo VARCHAR(60),
    IN p_descripcion VARCHAR(200),
    IN p_fecha_inicio DATE,
    IN p_fecha_vencimiento DATE,
    IN p_precio_normal FLOAT,
    IN p_precio_oferta FLOAT,
    IN p_porcentaje_descuento FLOAT,
    IN p_diseno_oferta_foto VARCHAR(45),
    IN p_terminos_condiciones VARCHAR(400),
    IN p_cliente_tienda_id INT,
    IN p_categorias_id INT
)
BEGIN
    -- Verifica si el cupón con el ID proporcionado existe
    IF EXISTS (SELECT 1 FROM `cupones` WHERE `cupones_id` = p_cupones_id) THEN
        -- Actualiza los datos del cupón

        -- Actualiza el titulo si se proporciona
        IF p_titulo IS NOT NULL THEN
            UPDATE `cupones` SET `titulo` = p_titulo WHERE `cupones_id` = p_cupones_id;
        END IF;

        -- Actualiza la descripcion si se proporciona
        IF p_descripcion IS NOT NULL THEN
            UPDATE `cupones` SET `descripcion` = p_descripcion WHERE `cupones_id` = p_cupones_id;
        END IF;

        -- Actualiza la fecha de inicio si se proporciona
        IF p_fecha_inicio IS NOT NULL THEN
            UPDATE `cupones` SET `fecha_inicio` = p_fecha_inicio WHERE `cupones_id` = p_cupones_id;
        END IF;

        -- Actualiza la fecha de vencimiento si se proporciona
        IF p_fecha_vencimiento IS NOT NULL THEN
            UPDATE `cupones` SET `fecha_vencimiento` = p_fecha_vencimiento WHERE `cupones_id` = p_cupones_id;
        END IF;

        -- Repite el proceso para los demás campos...

        SELECT 'El cupón ha sido actualizado con éxito' AS `mensaje_exito`;
    ELSE
        -- El cupón no existe
        SELECT 'El cupón con el ID proporcionado no existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
