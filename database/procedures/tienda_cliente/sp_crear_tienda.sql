DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_tienda`$$
CREATE PROCEDURE `sp_crear_tienda`(
    IN p_nombre_empresa VARCHAR(100),
    IN p_ruc VARCHAR(11),
    IN p_razon_social VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_correo VARCHAR(45),
    IN p_nombre_contacto VARCHAR(100),
    IN p_logo_tienda LONGBLOB,
    IN p_contrasenna VARCHAR(256),
    IN p_telefono INT
)
BEGIN
    DECLARE tienda_count INT;
    DECLARE hashedPassword VARCHAR(256);

    SET hashedPassword = SHA2(p_contrasenna, 256);

    SELECT COUNT(*) INTO tienda_count
    FROM `cliente_tienda`
    WHERE `nombre_empresa` = p_nombre_empresa;

    IF tienda_count = 0 THEN
        INSERT INTO `cliente_tienda` (`nombre_empresa`, `ruc`, `razon_social`, `direccion`, `correo`, `nombre_contacto`, `logo_tienda`, `contrasenna`, `telefono`)
        VALUES (p_nombre_empresa, p_ruc, p_razon_social, p_direccion, p_correo, p_nombre_contacto, p_logo_tienda, hashedPassword, p_telefono);
        SELECT 'Tienda creada con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La tienda ya existe';
    END IF;
END$$
DELIMITER ;
