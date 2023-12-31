DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_categorias` $$
CREATE PROCEDURE `sp_crear_categorias`(
    IN p_nombre VARCHAR(255)
)
BEGIN
    DECLARE categoria_count INT;
    DECLARE mensaje_exito VARCHAR(255);
    
    SELECT COUNT(*) INTO categoria_count
    FROM `categorias`
    WHERE `nombre` = p_nombre;

    IF categoria_count = 0 THEN
        INSERT INTO `categorias` (`nombre`)
        VALUES (p_nombre);

        SET mensaje_exito = 'Categoría creada con éxito';
        SELECT mensaje_exito AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La categoría ya existe';
    END IF;
END$$
DELIMITER ;
