DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crear_admin`(
IN p_nombre VARCHAR(60),
IN p_cargo VARCHAR(30),
IN p_correo VARCHAR(45),
IN p_contraseña VARCHAR(20)
)
BEGIN
	DECLARE admin_count INT;
    SELECT COUNT(*) INTO admin_count
    FROM `administradores`
    WHERE `nombre` = p_nombre;
    
    IF admin_count= 0 THEN
		INSERT INTO `administradores` (`nombre`, `cargo`, `correo`, `contraseña`)
		VALUES (p_nombre, p_cargo, p_correo, p_contraseña);
	ELSE
		SELECT 'El administrador ya existe' AS `mensaje_error`;
	END IF;
END$$
DELIMITER ;
