DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupones` $$

CREATE PROCEDURE `sp_ver_cupones`()
BEGIN
	SELECT * FROM `cupones`;
END$$
DELIMITER ;
