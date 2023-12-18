DELIMITER $$
CREATE PROCEDURE `sp_borrar_admin`(
	IN p_administrador_id INT
)
BEGIN
	DELETE FROM `administradores`
    WHERE `administrador_id` = p_administrador_id;
END$$
DELIMITER ;
