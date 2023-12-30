DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_autenticar_usuario` $$
CREATE PROCEDURE `sp_autenticar_usuario`(
	IN p_correo VARCHAR(20),
    IN p_contraseña VARCHAR(64)
)
BEGIN
	DECLARE hashedPassword VARCHAR(64);
    SET hashedPassword = SHA2(p_contraseña, 256);
	SELECT usuario_id FROM usuario
    WHERE correo= p_correo AND contraseña = hashedPassword;
END$$
DELIMITER ;
