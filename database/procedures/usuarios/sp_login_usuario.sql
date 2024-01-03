DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_login_usuario` $$
CREATE PROCEDURE `sp_login_usuario`(
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(256);
    DECLARE hashedFechaNacimientoDB VARCHAR(64);
    
    SELECT contrasenna, SHA2(fecha_nacimiento, 256) INTO hashedPasswordDB, hashedFechaNacimientoDB
    FROM usuario WHERE correo = p_correo;
    
    IF hashedPasswordDB IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Usuario o contraseña incorrectos';
    ELSE
        IF hashedPasswordDB = SHA2(p_contrasenna, 256) THEN
            SELECT `usuario_id`, `nombres_completos`, `dni`, `genero`, hashedFechaNacimientoDB AS `fecha_nacimiento_hashed`, `direccion`, `departamento`, `correo`, `contrasenna`, `telefono`, 3 AS `rol_id` 
            FROM usuario 
            WHERE correo = p_correo;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Usuario o contraseña incorrectos';
        END IF;
    END IF;
END$$
DELIMITER ;
