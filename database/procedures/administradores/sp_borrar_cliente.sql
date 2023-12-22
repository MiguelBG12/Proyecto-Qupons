DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_cliente` $$

CREATE PROCEDURE `sp_borrar_cliente`(
    IN p_cliente_tienda_id INT
)
BEGIN
    DECLARE rows_affected INT;

    DELETE FROM `cliente_tienda`
    WHERE `cliente_tienda_id` = p_cliente_tienda_id;

    SELECT ROW_COUNT() INTO rows_affected;

    IF rows_affected > 0 THEN
        SELECT 'Cliente eliminado exitosamente' AS result;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontró ningún cliente con el ID proporcionado';
    END IF;
END$$

DELIMITER ;
