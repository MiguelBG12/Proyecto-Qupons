DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_adquirir_cupon` $$
CREATE PROCEDURE `sp_adquirir_cupon`(
    IN p_usuario_id INT,
    IN p_cupones_id INT
)
BEGIN
    DECLARE usuario_count INT;
    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;
    IF usuario_count > 0 THEN
        INSERT INTO cupon_comprado (
            usuario_id,
            cupones_id
        ) VALUES (
            p_usuario_id,
            p_cupones_id
        );
        SELECT 'Cupón adquirido con éxito.' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pudo comprar el cupón';
    END IF;
END$$
DELIMITER ;
