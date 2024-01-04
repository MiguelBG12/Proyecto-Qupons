DELIMITER $$
DROP PROCEDURE IF EXISTS `p_verificar_usuario`$$
CREATE PROCEDURE `sp_verificar_usuario`(
    IN p_correo VARCHAR(256)
)
BEGIN
    SELECT `id`, `contraseña`
    FROM `usuario`
    WHERE `correo` = p_correo;
END$$
DELIMITER ;
