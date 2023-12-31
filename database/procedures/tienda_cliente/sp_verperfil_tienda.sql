DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_verperfil_tienda` $$
CREATE PROCEDURE `sp_verperfil_tienda`(
    IN p_ruc VARCHAR(11),
    IN p_nombre_empresa VARCHAR(45)
)
BEGIN
    DECLARE cliente_count INT;
    DECLARE cliente_id INT;

    SELECT COUNT(*), MAX(`cliente_tienda_id`) INTO cliente_count, cliente_id
    FROM `cliente_tienda`
    WHERE `ruc` = p_ruc AND `nombre_empresa` = p_nombre_empresa;

    IF cliente_count = 1 THEN
        SELECT * FROM `cliente_tienda` WHERE `cliente_tienda_id` = cliente_id;
    ELSE
        SELECT 'Credenciales incorrectas' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
