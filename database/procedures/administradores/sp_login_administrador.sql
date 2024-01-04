DELIMITER $$

DROP PROCEDURE IF EXISTS sp_login_administrador $$
CREATE PROCEDURE sp_login_administrador(
    IN p_correo VARCHAR(255),
    IN p_contrasenna VARCHAR(255)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(255);
    
    SELECT contrasenna INTO hashedPasswordDB FROM administradores WHERE correo = p_correo;
    
    IF hashedPasswordDB IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Administrador o contraseña incorrectos';
    ELSE
        IF hashedPasswordDB = SHA2(p_contrasenna, 255) THEN
            SELECT `administrador_id`,`nombre`,`cargo`,`correo`,`contrasenna`, 1 AS `rol_id` FROM administradores WHERE correo = p_correo;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Administrador o contraseña incorrectos';
        END IF;
    END IF;
END$$
DELIMITER ;
