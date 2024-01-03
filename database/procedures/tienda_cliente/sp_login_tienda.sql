DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_login_tienda` $$
CREATE PROCEDURE `sp_login_tienda`(
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(256);

    SELECT contrasenna INTO hashedPasswordDB FROM cliente_tienda WHERE correo = p_correo;
    IF hashedPasswordDB IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Tienda o contraseña incorrectos';
    ELSE
        IF hashedPasswordDB = SHA2(p_contrasenna, 256) THEN
            SELECT `cliente_tienda_id`,`nombre_empresa`,`ruc`, `razon_social`, `direccion`, `correo`, `nombre_contacto`, `logo_tienda`, `contrasenna`, `telefono`, 2 AS `rol_id` FROM cliente_tienda WHERE correo = p_correo;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Tienda o contraseña incorrectos';
        END IF;
    END IF;
END
DELIMITER ;
