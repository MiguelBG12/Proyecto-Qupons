DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupones_adquiridos`$$
CREATE PROCEDURE `sp_vercupones_adquiridos`(
    IN p_usuario_id INT
)
BEGIN
    DECLARE usuario_count INT;
    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;

    IF usuario_count = 1 THEN
        IF (SELECT COUNT(*) FROM `cupon_comprado` WHERE `usuario_id` = p_usuario_id) > 0 THEN
            SELECT
                cc.`usuario_id`,
                cc.`cupones_id`,
                c.`titulo`,
                c.`descripcion`,
                c.`fecha_inicio`,
                c.`fecha_vencimiento`,
                c.`precio_normal`,
                c.`precio_oferta`,
                c.`disenno_oferta_foto`,
                c.`cliente_tienda_id`,
                c.`categorias_id`
            FROM 
                `cupon_comprado` cc
            JOIN
                `cupones` c ON cc.`cupones_id` = c.`cupones_id`
            WHERE 
                cc.`usuario_id` = p_usuario_id;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario no ha adquirido cupones';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El usuario no existe';
    END IF;
END$$
DELIMITER ;
