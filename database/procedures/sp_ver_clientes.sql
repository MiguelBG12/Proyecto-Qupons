DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_clientes` $$

CREATE PROCEDURE `sp_ver_clientes`()
BEGIN
	SELECT
	`cliente_tienda_id`,
    `nombre_empresa`,
    `ruc`,
    `razon_social`,
    `direccion`,
    `correo`,
	`nombre_contacto`,
    `telefono`
    FROM
		`cliente_tienda`;
END$$
DELIMITER ;
