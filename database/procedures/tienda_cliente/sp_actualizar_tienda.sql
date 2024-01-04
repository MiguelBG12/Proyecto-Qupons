DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_tienda` $$
CREATE PROCEDURE `sp_actualizar_tienda`(
    IN p_tienda_id INT,
    IN p_direccion VARCHAR(255),
    IN p_nombre_contacto VARCHAR(255),
    IN p_nuevo_correo VARCHAR(255),
    IN p_nueva_contrasenna VARCHAR(255),
    IN p_telefono INT
)
BEGIN
    DECLARE tienda_count INT;
    SELECT COUNT(*) INTO tienda_count
    FROM `cliente_tienda`
    WHERE `cliente_tienda_id` = p_tienda_id;

    IF tienda_count = 1 THEN
        IF p_direccion IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `direccion` = p_direccion WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;
        IF p_nombre_contacto IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `nombre_contacto` = p_nombre_contacto WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;
        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `correo` = p_nuevo_correo WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;
        IF p_nueva_contrasenna IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `contrasenna` = SHA2(p_nueva_contrasenna, 255) WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;
        IF p_telefono IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `telefono` = p_telefono WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;

        SELECT 'La tienda ha sido actualizada con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Las credenciales de la tienda son incorrectas o la tienda no existe';
    END IF;
END$$
DELIMITER ;
