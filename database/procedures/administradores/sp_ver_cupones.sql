DELIMITER $$
CREATE PROCEDURE `sp_ver_cupones`()
BEGIN
	SELECT
    `cupones_id`,
    `titulo`,
    `descripcion`,
    `fecha_inicio`,
    `fecha_vencimiento`,
    `precio_normal`,
    `precio_oferta`,
    `porcentaje_descuento`,
    `diseño_oferta_foto`,
    `terminos_condiciones`,
    `cliente_tienda_id`,
    `categorias_id`
	FROM 
		`cupones`;
END$$
DELIMITER ;
