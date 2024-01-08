DELIMITER $$
 
DROP PROCEDURE IF EXISTS `sp_actualizar_usuario` $$
CREATE PROCEDURE `sp_actualizar_usuario`(
    IN p_usuario_id INT,
    IN p_nombres_completos VARCHAR(60),
    IN p_dni INT,
    IN p_genero VARCHAR(20),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(100),
    IN p_departamento VARCHAR(30),
    IN p_nuevo_correo VARCHAR(45),
    IN p_nueva_contrasenna VARCHAR(256),
    IN p_telefono INT
)
BEGIN
    DECLARE usuario_count INT;
    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;

    IF usuario_count = 1 THEN
		IF p_nombres_completos IS NOT NULL THEN
            UPDATE `usuario` SET `nombres_completos` = p_nombres_completos WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_dni IS NOT NULL THEN
            UPDATE `usuario` SET `dni` = p_dni WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_genero IS NOT NULL THEN
            UPDATE `usuario` SET `genero` = p_genero WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_fecha_nacimiento IS NOT NULL THEN
            UPDATE `usuario` SET `fecha_nacimiento` = p_fecha_nacimiento WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_direccion IS NOT NULL THEN
            UPDATE `usuario` SET `direccion` = p_direccion WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_departamento IS NOT NULL THEN
            UPDATE `usuario` SET `departamento` = p_departamento WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `usuario` SET `correo` = p_nuevo_correo WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_nueva_contrasenna IS NOT NULL THEN
            UPDATE `usuario` SET `contrasenna` = SHA2(p_nueva_contrasenna, 256) WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_telefono IS NOT NULL THEN
            UPDATE `usuario` SET `telefono` = p_telefono WHERE `usuario_id` = p_usuario_id;
        END IF;

        SELECT 'El usuario ha sido actualizado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El usuario no existe';
    END IF;
END
DELIMITER ;
