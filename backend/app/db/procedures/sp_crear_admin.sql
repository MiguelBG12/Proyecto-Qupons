DELIMITER $$
CREATE PROCEDURE `sp_crear_admin`(
IN p_nombre VARCHAR(60),
IN p_cargo VARCHAR(30),
IN p_correo VARCHAR(45),
IN p_contraseña VARCHAR(20)
)
BEGIN
	INSERT INTO `administradores` (`nombre`, `cargo`, `correo`, `contraseña`)
  VALUES (p_nombre, p_cargo, p_correo, p_contraseña);
END$$
DELIMITER ;
