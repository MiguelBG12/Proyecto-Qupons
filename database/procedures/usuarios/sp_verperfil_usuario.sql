DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_verperfil_usuario`(
    IN p_usuario_id INT
)
BEGIN
    DECLARE usuario_count INT;

    SELECT COUNT(*)
    INTO usuario_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;

    IF usuario_count = 1 THEN
        SELECT * FROM `usuario` WHERE `usuario_id` = p_usuario_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Credenciales incorrectas';
    END IF;
END$$
DELIMITER ;
