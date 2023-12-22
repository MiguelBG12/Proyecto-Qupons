DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_admin` $$
CREATE PROCEDURE `sp_actualizar_admin`(
    IN p_administrador_id INT,
    IN p_nombre VARCHAR(60),
    IN p_nuevo_cargo VARCHAR(30),
    IN p_nuevo_correo VARCHAR(50),
    IN p_nueva_contraseña VARCHAR(64)
)
BEGIN
    DECLARE admin_count INT;

    -- Verifica si el administrador con el ID proporcionado existe
    SELECT COUNT(*) INTO admin_count
    FROM `administradores`
    WHERE `administrador_id` = p_administrador_id;

    IF admin_count = 1 THEN
        -- El administrador existe, procede con la actualización

        -- Actualiza el nombre si se proporciona
        IF p_nombre IS NOT NULL THEN
            UPDATE `administradores` SET `nombre` = p_nombre WHERE `administrador_id` = p_administrador_id;
        END IF;

        -- Actualiza el cargo si se proporciona
        IF p_nuevo_cargo IS NOT NULL THEN
            UPDATE `administradores` SET `cargo` = p_nuevo_cargo WHERE `administrador_id` = p_administrador_id;
        END IF;

        -- Actualiza el correo si se proporciona
        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `administradores` SET `correo` = p_nuevo_correo WHERE `administrador_id` = p_administrador_id;
        END IF;

        -- Actualiza la contraseña si se proporciona
        IF p_nueva_contraseña IS NOT NULL THEN
            UPDATE `administradores` SET `contraseña` = SHA2(p_nueva_contraseña, 256) WHERE `administrador_id` = p_administrador_id;
        END IF;

        SELECT 'Administrador actualizado con éxito' AS `mensaje_exito`;

    ELSE
        -- El administrador no existe
        SELECT 'El administrador no existe' AS `mensaje_error`;

    END IF;
END$$
DELIMITER ;
