DELIMITER $$
CREATE PROCEDURE `sp_crear_admin`(
  IN p_nombre VARCHAR(60),
  IN p_cargo VARCHAR(30),
  IN p_correo VARCHAR(45),
  IN p_contraseña VARCHAR(20)
)
BEGIN
  DECLARE user_count INT;
  SELECT COUNT(*) INTO user_count
  FROM `administradores`
  WHERE `correo` = p_correo;

  IF user_count > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Este administrador ya existe';
  ELSE
    INSERT INTO `administradores` (`nombre`, `cargo`, `correo`, `contraseña`)
    VALUES (p_nombre, p_cargo, p_correo, p_contraseña);
    SELECT 'El administrador se creo exitosamente' AS result;
  END IF;
END$$
DELIMITER ;
