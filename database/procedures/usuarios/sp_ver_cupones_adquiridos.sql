DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupones_adquiridos`$$
CREATE PROCEDURE `sp_ver_cupones_adquiridos`(
    IN p_usuario_id INT
)
BEGIN
    DECLARE usuario_count INT;
    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;

    IF usuario_count = 1 THEN
        SELECT *
        FROM cupon_comprado
        WHERE usuario_id = p_usuario_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El usuario no existe';
    END IF;
END$$
DELIMITER ;
