DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_autenticar_usuario` $$
CREATE PROCEDURE `sp_autenticar_usuario`(
	IN p_correo VARCHAR(20),
    IN p_contraseña VARCHAR(64)
)
BEGIN
	SELECT usuario_id, nombre FROM usuario
    WHERE correo= p_correo AND contraseña = p_contraseña;
END$$
DELIMITER ;