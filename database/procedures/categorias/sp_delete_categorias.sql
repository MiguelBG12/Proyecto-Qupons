DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_eliminar_categoria` $$

CREATE PROCEDURE `sp_eliminar_categoria`(
    IN p_categorias_id INT
)
BEGIN
    DECLARE categoria_count INT;

    SELECT COUNT(*) INTO categoria_count
    FROM `categorias`
    WHERE `categorias_id` = p_categorias_id;

    IF categoria_count > 0 THEN
        DELETE FROM `categorias`
        WHERE `categorias_id` = p_categorias_id;

        SELECT 'Categoría eliminada con éxito' AS `mensaje_exito`;
    ELSE
        SELECT 'No existe la categoría especificada' AS `mensaje_exito`;
    END IF;
END $$

DELIMITER ;
