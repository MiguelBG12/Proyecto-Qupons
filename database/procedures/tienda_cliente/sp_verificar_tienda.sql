DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_verificar_tienda`$$
CREATE PROCEDURE `sp_verificar_tienda`(
    IN p_correo VARCHAR(255)
)
BEGIN
    SELECT `id`, `contraseña`
    FROM `cliente_tienda`
    WHERE `correo` = p_correo;
END$$
DELIMITER ;