DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_categorias` $$
CREATE PROCEDURE `sp_ver_categorias`()
BEGIN
    DECLARE categorias_count INT;
    SELECT COUNT(*) INTO categorias_count
    FROM `categorias`;
    IF categorias_count > 0 THEN
        SELECT
            `categorias_id`,
            `nombre`
        FROM
            `categorias`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No se encontraron categorías';
    END IF;
END$$
DELIMITER ;
