DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_usuario`$$
CREATE PROCEDURE `sp_crear_usuario`(
    IN p_nombres_completos VARCHAR(60),
    IN p_dni INT,
    IN p_genero VARCHAR(20),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(100),
    IN p_departamento VARCHAR(30),
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256),
    IN p_telefono INT
)
BEGIN
    DECLARE usuario_count INT;
    DECLARE hashedPassword VARCHAR(256);
    
    SET hashedPassword = SHA2(p_contrasenna, 256);

    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `correo` = p_correo;

    IF usuario_count = 0 THEN
        INSERT INTO `usuario` (`nombres_completos`, `dni`, `genero`, `fecha_nacimiento`, `direccion`, `departamento`, `correo`, `contrasenna`, `telefono`)
        VALUES (p_nombres_completos, p_dni, p_genero, p_fecha_nacimiento, p_direccion, p_departamento, p_correo, hashedPassword, p_telefono);
        SELECT 'Usuario creado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El Usuario ya existe';
    END IF;
END$$
DELIMITER ;
