DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_cupontienda` $$
CREATE PROCEDURE `sp_borrar_cupontienda`(
    IN p_cupones_id INT
)
BEGIN
    -- Verifica si el cupón con el ID proporcionado existe
    IF EXISTS (SELECT 1 FROM `cupones` WHERE `cupones_id` = p_cupones_id) THEN
        -- Elimina el cupón
        DELETE FROM `cupones` WHERE `cupones_id` = p_cupones_id;

        SELECT 'El cupón ha sido eliminado con éxito' AS `mensaje_exito`;
    ELSE
        -- El cupón no existe
        SELECT 'El cupón con el ID proporcionado no existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
