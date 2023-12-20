DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_admin` $$

CREATE PROCEDURE `sp_crear_admin`(
    IN p_nombre VARCHAR(60),
    IN p_cargo VARCHAR(30),
    IN p_correo VARCHAR(45),
    IN p_contraseña VARCHAR(20)
)
BEGIN
    DECLARE duplicate_key CONDITION FOR SQLSTATE '23000';
    DECLARE EXIT HANDLER FOR duplicate_key
        SELECT 'El administrador ya existe' AS `mensaje_error`;

    DECLARE admin_id INT;
    
    -- Intentar insertar el nuevo administrador
    INSERT INTO `administradores` (`nombre`, `cargo`, `correo`, `contraseña`)
    VALUES (p_nombre, p_cargo, p_correo, p_contraseña);
    
    -- Obtener el ID del administrador insertado (si se ha insertado)
    SET admin_id = LAST_INSERT_ID();
    
    SELECT admin_id; -- Opcional: devolver el ID del nuevo administrador si se requiere
END$$

DELIMITER ;
