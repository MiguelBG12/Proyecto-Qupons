DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_categorias` $$

CREATE PROCEDURE `sp_ver_categorias`()
BEGIN
	SELECT
	`categorias_id`,
    `nombre`,
    `Descripcion`
    FROM
		`categorias`;
END$$
DELIMITER ;
