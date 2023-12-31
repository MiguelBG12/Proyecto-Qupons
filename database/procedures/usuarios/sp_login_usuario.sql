DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_login_usuario` $$
CREATE PROCEDURE `sp_login_usuario`(
    IN p_correo VARCHAR(45),
    IN p_contraseña VARCHAR(64)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(64);
    
    -- Obtener la contraseña hasheada almacenada en la base de datos
    SELECT contraseña INTO hashedPasswordDB FROM usuario WHERE correo = p_correo;
    
    -- Verificar si la contraseña ingresada coincide con la almacenada en la base de datos
    IF hashedPasswordDB IS NULL OR hashedPasswordDB <> SHA2(p_contraseña, 256) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Usuario o contraseña incorrectos';
    ELSE
        -- Autenticación exitosa, devolver el usuario_id
        SELECT usuario_id FROM usuario WHERE correo = p_correo AND contraseña = hashedPasswordDB;
    END IF;
END$$
DELIMITER ;
