DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_verperfil_tienda` $$
CREATE PROCEDURE `sp_verperfil_tienda`(
    IN p_cliente_tienda_id INT
)
BEGIN
    IF (SELECT COUNT(*) FROM `cliente_tienda` WHERE `cliente_tienda_id` = p_cliente_tienda_id) > 0 THEN
        SELECT * FROM `cliente_tienda` WHERE `cliente_tienda_id` = p_cliente_tienda_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontró el cliente_tienda';
    END IF;
END$$
DELIMITER ;
