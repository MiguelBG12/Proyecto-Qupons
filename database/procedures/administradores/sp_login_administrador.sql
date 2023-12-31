DELIMITER $$

DROP PROCEDURE IF EXISTS sp_login_administrador $$
CREATE PROCEDURE sp_login_administrador(
    IN p_correo VARCHAR(45),
    IN p_contraseña VARCHAR(64)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(64);
    
    SELECT contraseña INTO hashedPasswordDB FROM administradores WHERE correo = p_correo;
    
    IF hashedPasswordDB IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Administrador o contraseña incorrectos';
    ELSE
        IF hashedPasswordDB = SHA2(p_contraseña, 256) THEN
            SELECT administrador_id FROM administradores WHERE correo = p_correo;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Administrador o contraseña incorrectos';
        END IF;
    END IF;
END$$
DELIMITER ;
