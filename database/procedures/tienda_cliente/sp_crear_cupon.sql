DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_cupon` $$
CREATE PROCEDURE `sp_crear_cupon`(
    IN p_titulo VARCHAR(255),
    IN p_descripcion VARCHAR(255),
    IN p_fecha_inicio DATE,
    IN p_fecha_vencimiento DATE,
    IN p_precio_normal FLOAT,
    IN p_precio_oferta FLOAT,
    IN p_disenno_oferta_foto VARCHAR(255),
    IN p_cliente_tienda_id INT,
    IN p_categorias_id INT
)
BEGIN
    DECLARE tienda_count INT;
    SELECT COUNT(*) INTO tienda_count
    FROM `cliente_tienda`
    WHERE `cliente_tienda_id` = p_cliente_tienda_id;
    IF tienda_count > 0 THEN
        INSERT INTO `cupones` (
            `titulo`,
            `descripcion`,
            `fecha_inicio`,
            `fecha_vencimiento`,
            `precio_normal`,
            `precio_oferta`,
            `disenno_oferta_foto`,
            `cliente_tienda_id`,
            `categorias_id`
        ) VALUES (
            p_titulo,
            p_descripcion,
            p_fecha_inicio,
            p_fecha_vencimiento,
            p_precio_normal,
            p_precio_oferta,
            p_disenno_oferta_foto,
            p_cliente_tienda_id,
            p_categorias_id
        );
        SELECT 'Cupón creado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pudo crear el cupón';
    END IF;
END$$
DELIMITER ;
