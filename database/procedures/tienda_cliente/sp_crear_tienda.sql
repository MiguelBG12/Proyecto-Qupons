DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_tienda` $$
CREATE PROCEDURE `sp_crear_tienda`(
	IN p_nombre_empresa VARCHAR(45),
    iN p_ruc VARCHAR(11),
    IN p_razon_social VARCHAR(45),
    IN p_direccion VARCHAR(60),
    IN p_correo VARCHAR(30),
    IN p_nombre_contacto VARCHAR(60),
    IN p_contraseña VARCHAR(255),
    IN p_telefono INT
)
BEGIN
	DECLARE tienda_count INT;
    DECLARE hashedPassword VARCHAR(255);
    
    SET hashedPassword = SHA2(p_contraseña, 256);

    SELECT COUNT(*) INTO tienda_count
    FROM `cliente_tienda`
    WHERE `nombre_empresa` = p_nombre_empresa;

    IF tienda_count = 0 THEN
        INSERT INTO `cliente_tienda` (`nombre_empresa`, `ruc`, `razon_social`, `direccion`, `correo`, `nombre_contacto`, `contraseña`, `telefono`)
        VALUES (p_nombre_empresa, p_ruc, p_razon_social, p_direccion, p_correo, p_nombre_contacto, hashedPassword, p_telefono);
    ELSE
		SELECT 'La tienda ya existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
