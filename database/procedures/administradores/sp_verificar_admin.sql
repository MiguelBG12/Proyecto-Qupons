DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_verificar_admin`$$
CREATE PROCEDURE `sp_verificar_admin`(
    IN p_correo VARCHAR(255)
)
BEGIN
    SELECT `id`, `contraseña`
    FROM `administradores`
    WHERE `correo` = p_correo;
END$$
DELIMITER ;
