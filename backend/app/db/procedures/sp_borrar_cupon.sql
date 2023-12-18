DELIMITER $$
CREATE PROCEDURE `sp_borrar_cupon`(
	IN p_cupones_id INT
)
BEGIN
	DELETE FROM `cupones`
    WHERE `cupones_id` = p_cupones_id;
END$$
DELIMITER ;
