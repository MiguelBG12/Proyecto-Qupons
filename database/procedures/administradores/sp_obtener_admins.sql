DELIMITER $$

DROP PROCEDURE IF EXISTS sp_obtener_admins $$
CREATE PROCEDURE sp_obtener_admins(
    IN p_admin_id INT,
    IN p_correo VARCHAR(45)
)
BEGIN
    IF p_admin_id IS NOT NULL THEN
        SELECT *
        FROM administradores
        WHERE id = p_admin_id;
    ELSEIF p_correo IS NOT NULL THEN
        SELECT *
        FROM administradores
        WHERE correo = p_correo;
    ELSE
        SELECT *
        FROM administradores;
    END IF;
END$$

DELIMITER ;
