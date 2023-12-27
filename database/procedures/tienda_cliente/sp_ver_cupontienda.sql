DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupontienda` $$
CREATE PROCEDURE `sp_ver_cupontienda`(
    IN p_cupones_id INT
)
BEGIN
    -- Verifica si el cupón con el ID proporcionado existe
    IF EXISTS (SELECT 1 FROM `cupones` WHERE `cupones_id` = p_cupones_id) THEN
        -- Retorna la información del cupón
        SELECT
            `cupones_id`,
            `titulo`,
            `descripcion`,
            `fecha_inicio`,
            `fecha_vencimiento`,
            `precio_normal`,
            `precio_oferta`,
            `porcentaje_descuento`,
            `diseno_oferta_foto`,
            `terminos_condiciones`,
            `cliente_tienda_id`,
            `categorias_id`
        FROM `cupones`
        WHERE `cupones_id` = p_cupones_id;
    ELSE
        -- El cupón no existe
        SELECT 'El cupón con el ID proporcionado no existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
