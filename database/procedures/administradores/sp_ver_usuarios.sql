DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_usuarios` $$
CREATE PROCEDURE `sp_ver_usuarios`()
BEGIN
    IF (SELECT COUNT(*) FROM `usuario`) > 0 THEN
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
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron usuarios';
    END IF;
END$$
DELIMITER ;
