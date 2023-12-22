DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_usuarios` $$

CREATE PROCEDURE `sp_ver_usuarios`()
BEGIN
	SELECT
    `usuario_id`,
    `nombres_completos`,
    `dni`,
    `genero`,
    `fecha_nacimiento`,
    `direccion`,
    `departamento`,
    `correo`,
    `telefono`
  FROM
    `usuario`;
END$$
DELIMITER ;
