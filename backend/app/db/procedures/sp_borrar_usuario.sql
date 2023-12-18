DELIMITER $$
CREATE PROCEDURE `sp_borrar_usuario`(
	IN p_usuario_id INT
)
BEGIN
	DELETE FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;
END$$
DELIMITER ;
