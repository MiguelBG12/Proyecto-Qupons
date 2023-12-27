DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_autenticar_tienda` $$
CREATE PROCEDURE `sp_autenticar_tienda`(
	IN p_correo VARCHAR(20),
    IN p_contraseña VARCHAR(64)
)
BEGIN
	SELECT cliente_tienda_id FROM cliente_tienda
    WHERE correo= p_correo AND contraseña = p_contraseña;
END$$
DELIMITER ;
