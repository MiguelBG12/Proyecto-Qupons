DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_vercupones_adquiridos`$$
CREATE PROCEDURE `sp_vercupones_adquiridos`(
	IN p_usuario_id INT
)
BEGIN
	SELECT *
    FROM cupon_comprado
    WHERE usuario_id = p_usuario_id;
END$$
DELIMITER ;