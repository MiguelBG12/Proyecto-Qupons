DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_cupon` $$

CREATE PROCEDURE `sp_borrar_cupon`(
    IN p_cupones_id INT
)
BEGIN
    DECLARE cupon_count INT;

    SELECT COUNT(*) INTO cupon_count
    FROM `cupones`
    WHERE `cupones_id` = p_cupones_id;

    IF cupon_count > 0 THEN
        DELETE FROM `cupones`
        WHERE `cupones_id` = p_cupones_id;
        SELECT 'El cupón fue borrado exitosamente' AS result;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cupón con el ID proporcionado no existe';
    END IF;
END$$

DELIMITER ;
