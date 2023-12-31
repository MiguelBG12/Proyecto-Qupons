DELIMITER $$

DROP PROCEDURE IF EXISTS sp_crear_admin $$
CREATE PROCEDURE sp_crear_admin(
    IN p_nombre VARCHAR(60),
    IN p_cargo VARCHAR(30),
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256)
)
BEGIN
    DECLARE admin_count INT;
    DECLARE hashedPassword VARCHAR(256);
    
    SET hashedPassword = SHA2(p_contrasenna, 256);

    SELECT COUNT(*) INTO admin_count
    FROM administradores
    WHERE correo = p_correo;

    IF admin_count = 0 THEN
        INSERT INTO administradores (nombre, cargo, correo, contrasenna)
        VALUES (p_nombre, p_cargo, p_correo, hashedPassword);
        SELECT 'Administrador creado con éxito' AS mensaje_exito;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un administrador con este correo';
    END IF;
END$$
DELIMITER ;