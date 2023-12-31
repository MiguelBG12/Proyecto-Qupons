DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_administradores` $$
CREATE PROCEDURE `sp_ver_administradores`()
BEGIN
    DECLARE admin_count INT;

    SELECT COUNT(*) INTO admin_count FROM `administradores`;

    IF admin_count > 0 THEN
        SELECT
            `administrador_id`,
            `nombre`,
            `cargo`,
            `correo`
        FROM
            `administradores`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron administradores';
    END IF;
END$$
DELIMITER ;
