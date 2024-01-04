DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_tienda`$$
CREATE PROCEDURE `sp_crear_tienda`(
    IN p_nombre_empresa VARCHAR(255),
    IN p_ruc VARCHAR(255),
    IN p_razon_social VARCHAR(255),
    IN p_direccion VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_nombre_contacto VARCHAR(255),
    IN p_logo_tienda VARCHAR(255),
    IN p_contrasenna VARCHAR(255),
    IN p_telefono INT
)
BEGIN
    DECLARE tienda_count INT;
    DECLARE hashedPassword VARCHAR(255);

    SET hashedPassword = SHA2(p_contrasenna, 255);

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
