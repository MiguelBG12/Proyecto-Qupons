DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_admin` $$
CREATE PROCEDURE `sp_actualizar_admin`(
    IN p_administrador_id INT,
    IN p_nombre VARCHAR(255),
    IN p_nuevo_cargo VARCHAR(255),
    IN p_nuevo_correo VARCHAR(255),
    IN p_nueva_contrasenna VARCHAR(255)
)
BEGIN
    DECLARE admin_count INT;

    SELECT COUNT(*) INTO admin_count
    FROM `administradores`
    WHERE `administrador_id` = p_administrador_id;

    IF admin_count = 1 THEN

        IF p_nombre IS NOT NULL THEN
            UPDATE `administradores` SET `nombre` = p_nombre WHERE `administrador_id` = p_administrador_id;
        END IF;

        IF p_nuevo_cargo IS NOT NULL THEN
            UPDATE `administradores` SET `cargo` = p_nuevo_cargo WHERE `administrador_id` = p_administrador_id;
        END IF;

        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `administradores` SET `correo` = p_nuevo_correo WHERE `administrador_id` = p_administrador_id;
        END IF;

        IF p_nueva_contrasenna IS NOT NULL THEN
            UPDATE `administradores` SET `contrasenna` = SHA2(p_nueva_contrasenna, 255) WHERE `administrador_id` = p_administrador_id;
        END IF;

        SELECT 'Administrador actualizado con éxito' AS `mensaje_exito`;

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El administrador no existe';

    END IF;
END$$
DELIMITER ;
