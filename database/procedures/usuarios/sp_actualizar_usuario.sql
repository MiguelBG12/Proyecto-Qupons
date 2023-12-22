DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_usuario` $$
CREATE PROCEDURE `sp_actualizar_usuario`(
	IN p_correo VARCHAR(20),
    IN p_contraseña VARCHAR(64),
    IN p_direccion VARCHAR(60),
    IN p_departamento VARCHAR(15),
    IN p_nuevo_correo VARCHAR(20),
    IN p_nueva_contraseña VARCHAR(64),
    IN p_telefono INT
)
BEGIN
    DECLARE usuario_count INT;

    -- Verifica si el usuario con el ID proporcionado existe
    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `correo` = p_correo AND `contraseña` = SHA2(p_contraseña, 256);

    IF usuario_count = 1 THEN
        -- Credenciales válidas, actualiza los datos del usuario
        
        -- Actualiza la direccion si se proporciona
        IF p_direccion IS NOT NULL THEN
            UPDATE `usuario` SET `direccion` = p_direccion WHERE `correo` = p_correo;
        END IF;
        
        -- Actualiza la direccion si se proporciona
        IF p_departamento IS NOT NULL THEN
            UPDATE `usuario` SET `departamento` = p_departamento WHERE `correo` = p_correo;
        END IF;
        
        -- Actualiza el correo si se proporciona
        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `usuario` SET `correo` = p_nuevo_correo WHERE `correo` = p_correo;
        END IF;
        
        -- Actualiza la contraseña si se proporciona
        IF p_nueva_contraseña IS NOT NULL THEN
            UPDATE `usuario` SET `contraseña` = SHA2(p_nueva_contraseña, 256) WHERE `correo` = p_correo;
        END IF;
        
        -- Actualiza el telefono si se proporciona
        IF p_telefono IS NOT NULL THEN
            UPDATE `usuario` SET `telefono` = p_telefono WHERE `correo` = p_correo;
        END IF;

        SELECT 'El usuario actualizado con éxito' AS `mensaje_exito`;
    ELSE
        -- Credenciales incorrectas
        SELECT 'El usuario no existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
