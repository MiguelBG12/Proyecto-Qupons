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

        SET mensaje_exito = 'categoria creada con exito';
        SELECT mensaje_exito AS `mensaje_exito`;
    ELSE
        SET mensaje_exito = 'Ya existe esta categoria';
        SELECT mensaje_exito AS `mensaje_exito`;
    END IF;
END $$

DELIMITER ;

