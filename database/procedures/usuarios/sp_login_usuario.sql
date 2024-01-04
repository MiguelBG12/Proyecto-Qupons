DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_login_usuario` $$
CREATE PROCEDURE `sp_login_usuario`(
    IN p_correo VARCHAR(255),
    IN p_contrasenna VARCHAR(255)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(255);
    DECLARE fechaNacimientoDB DATE;
    
    SELECT contrasenna, fecha_nacimiento INTO hashedPasswordDB, fechaNacimientoDB
    FROM usuario WHERE correo = p_correo;
    
    IF hashedPasswordDB IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Usuario o contraseña incorrectos';
    ELSE
        IF hashedPasswordDB = SHA2(p_contrasenna, 255) THEN
            SELECT `usuario_id`, `nombres_completos`, `dni`, `genero`, fechaNacimientoDB AS `fecha_nacimiento`, `direccion`, `departamento`, `correo`, `contrasenna`, `telefono`, 3 AS `rol_id` 
            FROM usuario 
            WHERE correo = p_correo;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Usuario o contraseña incorrectos';
        END IF;
    END IF;
END$$
DELIMITER ;
