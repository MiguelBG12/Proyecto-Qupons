DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_verperfil_administrador` $$
CREATE PROCEDURE `sp_verperfil_administrador`(
    IN p_administrador_id INT
)
BEGIN
    IF (SELECT COUNT(*) FROM `administradores` WHERE `administrador_id` = p_administrador_id) > 0 THEN
        SELECT
            `administrador_id`,
            `nombre`,
            `cargo`,
            `correo`
        FROM
            `administradores`
        WHERE
            `administrador_id` = p_administrador_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontró el administrador';
    END IF;
END$$
DELIMITER ;
