DELIMITER $$
CREATE PROCEDURE `sp_borrar_cliente`(
	IN p_cliente_tienda_id INT
)
BEGIN
	DELETE FROM `cliente_tienda`
    WHERE `cliente_tienda_id` = p_cliente_tienda_id;
END$$
DELIMITER ;
