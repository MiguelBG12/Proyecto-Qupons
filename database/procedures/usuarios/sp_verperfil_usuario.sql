DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_verperfil_usuario` $$

CREATE PROCEDURE `sp_verperfil_usuario`(
    IN p_correo VARCHAR(20),
    IN p_contraseña VARCHAR(64)

)
BEGIN
	DECLARE usuario_id INT;
    DECLARE usuario_count INT;

    SELECT COUNT(*), MAX(usuario_id) INTO usuario_count, usuario_id
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;

    IF usuario_count = 1 THEN
        SELECT * FROM `usuario` WHERE `correo` = p_correo;
    ELSE
        SELECT 'Credenciales incorrectas' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
