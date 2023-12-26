DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_tienda` $$
CREATE PROCEDURE `sp_actualizar_tienda`(
    IN p_tienda_id INT,
    IN p_correo VARCHAR(30),
    IN p_contraseña VARCHAR(64),
    IN p_direccion VARCHAR(60),
    IN p_nombre_contacto VARCHAR(60),
    IN p_nuevo_correo VARCHAR(30),
    IN p_nueva_contraseña VARCHAR(64),
    IN p_telefono INT
)
BEGIN
    DECLARE tienda_count INT;

    -- Verifica si la tienda con el ID proporcionado existe
    SELECT COUNT(*) INTO tienda_count
    FROM `cliente_tienda`
    WHERE `cliente_tienda_id` = p_tienda_id;

    IF tienda_count = 1 THEN
        -- Credenciales válidas, actualiza los datos de la tienda

        -- Actualiza la direccion si se proporciona
        IF p_direccion IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `direccion` = p_direccion WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;

        -- Actualiza el nombre de contacto si se proporciona
        IF p_nombre_contacto IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `nombre_contacto` = p_nombre_contacto WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;

        -- Actualiza el correo si se proporciona
        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `correo` = p_nuevo_correo WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;

        -- Actualiza la contraseña si se proporciona
        IF p_nueva_contraseña IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `contraseña` = p_nueva_contraseña WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;

        -- Actualiza el telefono si se proporciona
        IF p_telefono IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `telefono` = p_telefono WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;

        SELECT 'La tienda ha sido actualizada con éxito' AS `mensaje_exito`;
    ELSE
        -- Credenciales incorrectas
        SELECT 'Las credenciales de la tienda son incorrectas o la tienda no existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
