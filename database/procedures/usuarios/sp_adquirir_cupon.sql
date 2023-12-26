DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_adquirir_cupon` $$
CREATE PROCEDURE `sp_adquirir_cupon`(
    IN p_usuario_id INT,
    IN p_cupones_id INT,
    IN p_cantidad_comprada INT
)
BEGIN
    INSERT INTO cupon_comprado (
        fecha_compra,
        cantidad_comprada,
        estado_cupon,
        usuario_id,
        cupones_id
    ) VALUES (
        CURRENT_DATE(),
        p_cantidad_comprada,
        'no canjeado',
        p_usuario_id,
        p_cupones_id
    );
END$$
DELIMITER ;