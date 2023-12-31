DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_cupontienda` $$
CREATE PROCEDURE `sp_borrar_cupontienda`(
    IN p_cupones_id INT,
    IN p_cliente_tienda_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM `cupones` WHERE `cupones_id` = p_cupones_id AND `cliente_tienda_id` = p_cliente_tienda_id) THEN
        DELETE FROM `cupones` WHERE `cupones_id` = p_cupones_id;
        SELECT 'El cupón ha sido eliminado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El cupón con el ID proporcionado no existe o no está vinculado al cliente_tienda';
    END IF;
END$$
DELIMITER ;
