DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupontienda` $$
CREATE PROCEDURE `sp_ver_cupontienda`(
    IN p_cliente_tienda_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM `cupones` WHERE `cliente_tienda_id` = p_cliente_tienda_id) THEN
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
        WHERE `cliente_tienda_id` = p_cliente_tienda_id;
    ELSE
        SELECT 'La con el ID proporcionado no existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
