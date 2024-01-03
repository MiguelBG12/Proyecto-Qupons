DELIMITER $$

DROP PROCEDURE IF EXISTS sp_autenticacion_administrador $$
CREATE PROCEDURE `sp_autenticacion_administrador`(
    IN p_correo VARCHAR(45),
    IN p_contraseña VARCHAR(64),
    OUT p_administrador_id INT
)
BEGIN
    DECLARE v_administrador_id INT;

    -- Buscar el administrador por correo y contraseña
    SELECT administrador_id INTO v_administrador_id
    FROM administradores
    WHERE correo = p_correo AND contraseña = p_contraseña;

    -- Verificar si se encontró un administrador
    IF v_administrador_id IS NOT NULL THEN
        -- Devolver el administrador_id si las credenciales son válidas
        SET p_administrador_id = v_administrador_id;
    ELSE
        -- Generar un error de señal si las credenciales no son válidas
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Credenciales incorrectas';
    END IF;
END$$
DELIMITER ;
