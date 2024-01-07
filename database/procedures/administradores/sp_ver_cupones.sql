DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupones` $$
CREATE PROCEDURE `sp_ver_cupones`()
BEGIN
    IF (SELECT COUNT(*) FROM `cupones`) > 0 THEN
        SELECT
            `cupones_id`,
            `titulo`,
            `descripcion`,
            `fecha_inicio`,
            `fecha_vencimiento`,
            `precio_normal`,
            `precio_oferta`,
            `disenno_oferta_foto`
            `cliente_tienda_id`,
            `categorias_id`
        FROM 
            `cupones`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron cupones';
    END IF;
END$$
DELIMITER ;
