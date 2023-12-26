DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_verperfil_tienda` $$
CREATE PROCEDURE `sp_verperfil_tienda`(
    IN p_correo VARCHAR(30),
    IN p_contraseña VARCHAR(64)
)
BEGIN
    DECLARE cliente_count INT;
    DECLARE cliente_id INT;

    SELECT COUNT(*), MAX(`cliente_tienda_id`) INTO cliente_count, cliente_id
    FROM `cliente_tienda`
    WHERE `correo` = p_correo AND `contraseña` = p_contraseña;

    IF cliente_count = 1 THEN
        SELECT * FROM `cliente_tienda` WHERE `cliente_tienda_id` = cliente_id;
    ELSE
        SELECT 'Credenciales incorrectas' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
