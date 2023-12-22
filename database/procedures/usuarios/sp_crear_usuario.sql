DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_crear_usuario`$$

CREATE PROCEDURE `sp_crear_usuario`(
    IN p_nombres_completos VARCHAR(60),
    IN p_dni INT,
    IN p_genero VARCHAR(15),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(60),
    IN p_departamento VARCHAR(15),
    IN p_correo VARCHAR(20),
    IN p_contraseña VARCHAR(64),
    IN p_telefono INT
)
BEGIN
    DECLARE usuario_count INT;
    DECLARE hashedPassword VARCHAR(64);
    
    SET hashedPassword = SHA2(p_contraseña, 256);

    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `nombres_completos` = p_nombres_completos;

    IF usuario_count = 0 THEN
        INSERT INTO `usuario` (`nombres_completos`, `dni`, `genero`, `fecha_nacimiento`, `direccion`, `departamento`, `correo`, `contraseña`, `telefono`)
        VALUES (p_nombres_completos, p_dni, p_genero, p_fecha_nacimiento, p_direccion, p_departamento, p_correo, hashedPassword, p_telefono);
    ELSE
        SELECT 'El Usuario ya existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
