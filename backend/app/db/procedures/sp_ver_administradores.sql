DELIMITER $$
CREATE PROCEDURE `sp_ver_administradores`()
BEGIN
	SELECT
	`administrador_id`,
    `nombre`,
    `cargo`,
    `correo`
    FROM
		`administradores`;
END$$
DELIMITER ;
