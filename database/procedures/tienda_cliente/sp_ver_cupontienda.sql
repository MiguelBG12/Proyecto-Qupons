DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupontienda` $$
CREATE PROCEDURE `sp_ver_cupontienda`(
    IN p_cliente_tienda_id INT
)
BEGIN
    DECLARE cupon_count INT;

    SELECT COUNT(*) INTO cupon_count
    FROM `cupones`
    WHERE `cliente_tienda_id` = p_cliente_tienda_id;

    IF cupon_count > 0 THEN
        SELECT
            `cupones_id`,
            `titulo`,
            `descripcion`,
            `fecha_inicio`,
            `fecha_vencimiento`,
            `precio_normal`,
            `precio_oferta`,
            `disenno_oferta_foto`,
            `cliente_tienda_id`,
            `categorias_id`
        FROM `cupones`
        WHERE `cliente_tienda_id` = p_cliente_tienda_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron cupones para el cliente_tienda proporcionado';
    END IF;
END$$
DELIMITER ;
