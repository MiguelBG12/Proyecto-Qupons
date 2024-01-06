DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_clientes` $$
CREATE PROCEDURE `sp_ver_clientes`()
BEGIN
    DECLARE clientes_count INT;

    SELECT COUNT(*) INTO clientes_count FROM `cliente_tienda`;

    IF clientes_count > 0 THEN
        SELECT
            `cliente_tienda_id`,
            `nombre_empresa`,
            `ruc`,
            `razon_social`,
            `direccion`,
            `correo`,
            `nombre_contacto`,
            `logo_tienda`,
            `telefono`
        FROM
            `cliente_tienda`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron clientes';
    END IF;
END$$
DELIMITER ;
