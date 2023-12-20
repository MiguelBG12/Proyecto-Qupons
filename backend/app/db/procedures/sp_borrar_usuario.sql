DELIMITER $$
CREATE PROCEDURE `sp_borrar_usuario`(
    IN p_usuario_id INT
)
BEGIN
    DECLARE user_count INT;

    SELECT COUNT(*) INTO user_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;

    IF user_count > 0 THEN
        DELETE FROM `usuario`
        WHERE `usuario_id` = p_usuario_id;
        SELECT 'El usuario fue borrado exitosamente' AS result;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario con el ID proporcionado no existe';
    END IF;
END$$
DELIMITER ;
