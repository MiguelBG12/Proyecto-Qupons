DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_admin` $$
CREATE PROCEDURE `sp_actualizar_admin`(
    IN p_administrador_id INT,
    IN p_nombre VARCHAR(60),
    IN p_nuevo_cargo VARCHAR(30),
    IN p_nuevo_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256),
    IN p_nueva_contrasenna VARCHAR(256)
)
BEGIN
    DECLARE admin_count INT;

    SELECT COUNT(*) INTO admin_count
    FROM `administradores`
    WHERE `administrador_id` = p_administrador_id;

    IF admin_count = 1 THEN

        IF p_nombre IS NOT NULL THEN
            UPDATE `administradores` SET `nombre` = p_nombre WHERE `administrador_id` = p_administrador_id;
        END IF;

        IF p_nuevo_cargo IS NOT NULL THEN
            UPDATE `administradores` SET `cargo` = p_nuevo_cargo WHERE `administrador_id` = p_administrador_id;
        END IF;

        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `administradores` SET `correo` = p_nuevo_correo WHERE `administrador_id` = p_administrador_id;
        END IF;

        IF p_nueva_contrasenna IS NOT NULL THEN
            UPDATE `administradores` SET `contrasenna` = SHA2(p_nueva_contrasenna, 256) WHERE `administrador_id` = p_administrador_id;
        END IF;

        SELECT 'Administrador actualizado con éxito' AS `mensaje_exito`;

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El administrador no existe';

    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_admin` $$

CREATE PROCEDURE `sp_borrar_admin`(
    IN p_administrador_id INT
)
BEGIN
    DECLARE admin_count INT;

    SELECT COUNT(*) INTO admin_count
    FROM `administradores`
    WHERE `administrador_id` = p_administrador_id;

    IF admin_count > 0 THEN
        DELETE FROM `administradores`
        WHERE `administrador_id` = p_administrador_id;
        SELECT 'El administrador fue borrado exitosamente' AS result;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El administrador con el ID proporcionado no existe';
    END IF;
END$$

DELIMITER ;

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

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_cupon` $$

CREATE PROCEDURE `sp_borrar_cupon`(
    IN p_cupones_id INT
)
BEGIN
    DECLARE cupon_count INT;

    SELECT COUNT(*) INTO cupon_count
    FROM `cupones`
    WHERE `cupones_id` = p_cupones_id;

    IF cupon_count > 0 THEN
        DELETE FROM `cupones`
        WHERE `cupones_id` = p_cupones_id;
        SELECT 'El cupón fue borrado exitosamente' AS result;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cupón con el ID proporcionado no existe';
    END IF;
END$$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_usuario` $$

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

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_admin` $$
CREATE PROCEDURE `sp_crear_admin`(
    IN p_nombre VARCHAR(60),
    IN p_cargo VARCHAR(30),
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256)
)
BEGIN
    DECLARE admin_count INT;
    DECLARE hashedPassword VARCHAR(256);
    
    SET hashedPassword = SHA2(p_contrasenna, 256);

    SELECT COUNT(*) INTO admin_count
    FROM administradores
    WHERE correo = p_correo;

    IF admin_count = 0 THEN
        INSERT INTO administradores (nombre, cargo, correo, contrasenna)
        VALUES (p_nombre, p_cargo, p_correo, hashedPassword);
        SELECT 'Administrador creado con éxito' AS mensaje_exito;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un administrador con este correo';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_login_administrador` $$
CREATE PROCEDURE `sp_login_administrador`(
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(256);
    
    SELECT contrasenna INTO hashedPasswordDB FROM administradores WHERE correo = p_correo;
    
    IF hashedPasswordDB IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Administrador o contraseña incorrectos';
    ELSE
        IF hashedPasswordDB = SHA2(p_contrasenna, 256) THEN
            SELECT `administrador_id`,`nombre`,`cargo`,`correo`,`contrasenna`, 1 AS `rol_id` FROM administradores WHERE correo = p_correo;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Administrador o contraseña incorrectos';
        END IF;
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_obtener_admins` $$
CREATE PROCEDURE `sp_obtener_admins`(
    IN p_admin_id INT,
    IN p_correo VARCHAR(45)
)
BEGIN
    IF p_admin_id IS NOT NULL THEN
        SELECT *
        FROM administradores
        WHERE id = p_admin_id;
    ELSEIF p_correo IS NOT NULL THEN
        SELECT *
        FROM administradores
        WHERE correo = p_correo;
    ELSE
        SELECT *
        FROM administradores;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_administradores` $$
CREATE PROCEDURE `sp_ver_administradores`()
BEGIN
    DECLARE admin_count INT;

    SELECT COUNT(*) INTO admin_count FROM `administradores`;

    IF admin_count > 0 THEN
        SELECT
            `administrador_id`,
            `nombre`,
            `cargo`,
            `correo`
        FROM
            `administradores`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron administradores';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_clientes` $$
CREATE PROCEDURE `sp_ver_clientes`()
BEGIN
    DECLARE clientes_count INT;

    SELECT COUNT(*) INTO clientes_count FROM `cliente_tienda`;

    IF clientes_count > 0 THEN
        SELECT
            `cliente_tienda_id`,
            `nombre_empresa`,
            `ruc`,
            `razon_social`,
            `direccion`,
            `correo`,
            `logo_tienda`,
            `nombre_contacto`,
            `telefono`
        FROM
            `cliente_tienda`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron clientes';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupones` $$
CREATE PROCEDURE `sp_ver_cupones`()
BEGIN
    IF (SELECT COUNT(*) FROM `cupones`) > 0 THEN
        SELECT
            `cupones_id`,
            `titulo`,
            `descripcion`,
            `fecha_inicio`,
            `fecha_vencimiento`,
            `precio_normal`,
            `precio_oferta`,
            `disenno_oferta_foto`,
            `cliente_tienda_id`,
            `categorias_id`
        FROM 
            `cupones`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron cupones';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_usuarios` $$
CREATE PROCEDURE `sp_ver_usuarios`()
BEGIN
    IF (SELECT COUNT(*) FROM `usuario`) > 0 THEN
        SELECT
            `usuario_id`,
            `nombres_completos`,
            `dni`,
            `genero`,
            `fecha_nacimiento`,
            `direccion`,
            `departamento`,
            `correo`,
            `telefono`
        FROM
            `usuario`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron usuarios';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_verperfil_administrador` $$
CREATE PROCEDURE `sp_verperfil_administrador`(
    IN p_administrador_id INT
)
BEGIN
    IF (SELECT COUNT(*) FROM `administradores` WHERE `administrador_id` = p_administrador_id) > 0 THEN
        SELECT
            `administrador_id`,
            `nombre`,
            `cargo`,
            `correo`
        FROM
            `administradores`
        WHERE
            `administrador_id` = p_administrador_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontró el administrador';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_categorias` $$
CREATE PROCEDURE `sp_crear_categorias`(
    IN p_nombre VARCHAR(100)
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

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_eliminar_categoria` $$
CREATE PROCEDURE `sp_eliminar_categoria`(
    IN p_categorias_id INT
)
BEGIN
    DECLARE categoria_count INT;
    SELECT COUNT(*) INTO categoria_count
    FROM `categorias`
    WHERE `categorias_id` = p_categorias_id;

    IF categoria_count > 0 THEN
        DELETE FROM `categorias`
        WHERE `categorias_id` = p_categorias_id;
        SELECT 'Categoría eliminada con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No existe la categoría especificada';
    END IF;
END$$
DELIMITER ;

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

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_actualizar_cupon` $$
CREATE PROCEDURE `sp_actualizar_cupon`(
    IN p_cupones_id INT,
    IN p_titulo VARCHAR(100),
    IN p_descripcion VARCHAR(255),
    IN p_fecha_inicio DATE,
    IN p_fecha_vencimiento DATE,
    IN p_precio_normal FLOAT,
    IN p_precio_oferta FLOAT,
    IN p_disenno_oferta_foto LONGBLOB,
    IN p_cliente_tienda_id INT,
    IN p_categorias_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM `cupones` WHERE `cupones_id` = p_cupones_id AND `cliente_tienda_id` = p_cliente_tienda_id) THEN
        IF p_titulo IS NOT NULL THEN
            UPDATE `cupones` SET `titulo` = p_titulo WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_descripcion IS NOT NULL THEN
            UPDATE `cupones` SET `descripcion` = p_descripcion WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_fecha_inicio IS NOT NULL THEN
            UPDATE `cupones` SET `fecha_inicio` = p_fecha_inicio WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_fecha_vencimiento IS NOT NULL THEN
            UPDATE `cupones` SET `fecha_vencimiento` = p_fecha_vencimiento WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_precio_normal IS NOT NULL THEN
            UPDATE `cupones` SET `precio_normal` = p_precio_normal WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_precio_oferta IS NOT NULL THEN
            UPDATE `cupones` SET `precio_oferta` = p_precio_oferta WHERE `cupones_id` = p_cupones_id;
        END IF;
        IF p_disenno_oferta_foto IS NOT NULL THEN
            UPDATE `cupones` SET `diseno_oferta_foto` = p_disenno_oferta_foto WHERE `cupones_id` = p_cupones_id;
        END IF;
        SELECT 'El cupón ha sido actualizado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El cupón no está vinculado al cliente_tienda';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_tienda` $$
CREATE PROCEDURE `sp_actualizar_tienda`(
    IN p_tienda_id INT,
    IN p_direccion VARCHAR(100),
    IN p_nombre_contacto VARCHAR(100),
    IN p_nuevo_correo VARCHAR(45),
    IN p_nueva_contrasenna VARCHAR(256),
    IN p_telefono INT
)
BEGIN
    DECLARE tienda_count INT;
    SELECT COUNT(*) INTO tienda_count
    FROM `cliente_tienda`
    WHERE `cliente_tienda_id` = p_tienda_id;

    IF tienda_count = 1 THEN
        IF p_direccion IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `direccion` = p_direccion WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;
        IF p_nombre_contacto IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `nombre_contacto` = p_nombre_contacto WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;
        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `correo` = p_nuevo_correo WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;
        IF p_nueva_contrasenna IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `contrasenna` = SHA2(p_nueva_contrasenna, 256) WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;
        IF p_telefono IS NOT NULL THEN
            UPDATE `cliente_tienda` SET `telefono` = p_telefono WHERE `cliente_tienda_id` = p_tienda_id;
        END IF;

        SELECT 'La tienda ha sido actualizada con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Las credenciales de la tienda son incorrectas o la tienda no existe';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_cupontienda` $$
CREATE PROCEDURE `sp_borrar_cupontienda`(
    IN p_cupones_id INT,
    IN p_cliente_tienda_id INT
)
BEGIN
    IF EXISTS (SELECT 1 FROM `cupones` WHERE `cupones_id` = p_cupones_id AND `cliente_tienda_id` = p_cliente_tienda_id) THEN
        DELETE FROM `cupones` WHERE `cupones_id` = p_cupones_id;
        SELECT 'El cupón ha sido eliminado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El cupón con el ID proporcionado no existe o no está vinculado al cliente_tienda';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_cupon` $$
CREATE PROCEDURE `sp_crear_cupon`(
    IN p_titulo VARCHAR(100),
    IN p_descripcion VARCHAR(255),
    IN p_fecha_inicio DATE,
    IN p_fecha_vencimiento DATE,
    IN p_precio_normal FLOAT,
    IN p_precio_oferta FLOAT,
    IN p_disenno_oferta_foto LONGBLOB,
    IN p_cliente_tienda_id INT,
    IN p_categorias_id INT
)
BEGIN
    DECLARE tienda_count INT;
    SELECT COUNT(*) INTO tienda_count
    FROM `cliente_tienda`
    WHERE `cliente_tienda_id` = p_cliente_tienda_id;
    IF tienda_count > 0 THEN
        INSERT INTO `cupones` (
            `titulo`,
            `descripcion`,
            `fecha_inicio`,
            `fecha_vencimiento`,
            `precio_normal`,
            `precio_oferta`,
            `disenno_oferta_foto`,
            `cliente_tienda_id`,
            `categorias_id`
        ) VALUES (
            p_titulo,
            p_descripcion,
            p_fecha_inicio,
            p_fecha_vencimiento,
            p_precio_normal,
            p_precio_oferta,
            p_disenno_oferta_foto,
            p_cliente_tienda_id,
            p_categorias_id
        );
        SELECT 'Cupón creado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pudo crear el cupón';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_tienda`$$
CREATE PROCEDURE `sp_crear_tienda`(
    IN p_nombre_empresa VARCHAR(100),
    IN p_ruc VARCHAR(11),
    IN p_razon_social VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_correo VARCHAR(45),
    IN p_nombre_contacto VARCHAR(100),
    IN p_logo_tienda LONGBLOB,
    IN p_contrasenna VARCHAR(256),
    IN p_telefono INT
)
BEGIN
    DECLARE tienda_count INT;
    DECLARE hashedPassword VARCHAR(256);

    SET hashedPassword = SHA2(p_contrasenna, 256);

    SELECT COUNT(*) INTO tienda_count
    FROM `cliente_tienda`
    WHERE `nombre_empresa` = p_nombre_empresa;

    IF tienda_count = 0 THEN
        INSERT INTO `cliente_tienda` (`nombre_empresa`, `ruc`, `razon_social`, `direccion`, `correo`, `nombre_contacto`, `logo_tienda`, `contrasenna`, `telefono`)
        VALUES (p_nombre_empresa, p_ruc, p_razon_social, p_direccion, p_correo, p_nombre_contacto, p_logo_tienda, hashedPassword, p_telefono);
        SELECT 'Tienda creada con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La tienda ya existe';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_login_tienda` $$
CREATE PROCEDURE `sp_login_tienda`(
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(256);

    SELECT contrasenna INTO hashedPasswordDB FROM cliente_tienda WHERE correo = p_correo;
    IF hashedPasswordDB IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Tienda o contraseña incorrectos';
    ELSE
        IF hashedPasswordDB = SHA2(p_contrasenna, 256) THEN
            SELECT `cliente_tienda_id`,`nombre_empresa`,`ruc`, `razon_social`, `direccion`, `correo`, `nombre_contacto`, `logo_tienda`, `contrasenna`, `telefono`, 2 AS `rol_id` FROM cliente_tienda WHERE correo = p_correo;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Tienda o contraseña incorrectos';
		END IF;
	END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupontienda` $$
CREATE PROCEDURE `sp_ver_cupontienda`(
    IN p_cliente_tienda_id INT
)
BEGIN
    DECLARE cupon_count INT;

    SELECT COUNT(*) INTO cupon_count
    FROM `cupones`
    WHERE `cliente_tienda_id` = p_cliente_tienda_id;

    IF cupon_count > 0 THEN
        SELECT
            `cupones_id`,
            `titulo`,
            `descripcion`,
            `fecha_inicio`,
            `fecha_vencimiento`,
            `precio_normal`,
            `precio_oferta`,
            `disenno_oferta_foto`,
            `cliente_tienda_id`,
            `categorias_id`
        FROM `cupones`
        WHERE `cliente_tienda_id` = p_cliente_tienda_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontraron cupones para el cliente_tienda proporcionado';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
 
DROP PROCEDURE IF EXISTS `sp_actualizar_usuario` $$
CREATE PROCEDURE `sp_actualizar_usuario`(
    IN p_usuario_id INT,
    IN p_nombres_completos VARCHAR(60),
    IN p_dni INT,
    IN p_genero VARCHAR(20),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(100),
    IN p_departamento VARCHAR(30),
    IN p_nuevo_correo VARCHAR(45),
    IN p_nueva_contrasenna VARCHAR(256),
    IN p_telefono INT
)
BEGIN
    DECLARE usuario_count INT;
    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;

    IF usuario_count = 1 THEN
		IF p_nombres_completos IS NOT NULL THEN
            UPDATE `usuario` SET `nombres_completos` = p_nombres_completos WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_dni IS NOT NULL THEN
            UPDATE `usuario` SET `dni` = p_dni WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_genero IS NOT NULL THEN
            UPDATE `usuario` SET `genero` = p_genero WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_fecha_nacimiento IS NOT NULL THEN
            UPDATE `usuario` SET `fecha_nacimiento` = p_fecha_nacimiento WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_direccion IS NOT NULL THEN
            UPDATE `usuario` SET `direccion` = p_direccion WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_departamento IS NOT NULL THEN
            UPDATE `usuario` SET `departamento` = p_departamento WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_nuevo_correo IS NOT NULL THEN
            UPDATE `usuario` SET `correo` = p_nuevo_correo WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_nueva_contrasenna IS NOT NULL THEN
            UPDATE `usuario` SET `contrasenna` = SHA2(p_nueva_contrasenna, 256) WHERE `usuario_id` = p_usuario_id;
        END IF;
        IF p_telefono IS NOT NULL THEN
            UPDATE `usuario` SET `telefono` = p_telefono WHERE `usuario_id` = p_usuario_id;
        END IF;

        SELECT 'El usuario ha sido actualizado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El usuario no existe';
    END IF;
END
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_adquirir_cupon` $$
CREATE PROCEDURE `sp_adquirir_cupon`(
    IN p_usuario_id INT,
    IN p_cupones_id INT
)
BEGIN
    DECLARE usuario_count INT;
    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;
    IF usuario_count > 0 THEN
        INSERT INTO cupon_comprado (
            usuario_id,
            cupones_id
        ) VALUES (
            p_usuario_id,
            p_cupones_id
        );
        SELECT 'Cupón adquirido con éxito.' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se pudo comprar el cupón';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_crear_usuario`$$
CREATE PROCEDURE `sp_crear_usuario`(
    IN p_nombres_completos VARCHAR(60),
    IN p_dni INT,
    IN p_genero VARCHAR(20),
    IN p_fecha_nacimiento DATE,
    IN p_direccion VARCHAR(100),
    IN p_departamento VARCHAR(30),
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256),
    IN p_telefono INT
)
BEGIN
    DECLARE usuario_count INT;
    DECLARE hashedPassword VARCHAR(256);
    
    SET hashedPassword = SHA2(p_contrasenna, 256);

    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `correo` = p_correo;

    IF usuario_count = 0 THEN
        INSERT INTO `usuario` (`nombres_completos`, `dni`, `genero`, `fecha_nacimiento`, `direccion`, `departamento`, `correo`, `contrasenna`, `telefono`)
        VALUES (p_nombres_completos, p_dni, p_genero, p_fecha_nacimiento, p_direccion, p_departamento, p_correo, hashedPassword, p_telefono);
        SELECT 'Usuario creado con éxito' AS `mensaje_exito`;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El Usuario ya existe';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_login_usuario` $$
CREATE PROCEDURE `sp_login_usuario`(
    IN p_correo VARCHAR(45),
    IN p_contrasenna VARCHAR(256)
)
BEGIN
    DECLARE hashedPasswordDB VARCHAR(256);
    
    SELECT contrasenna INTO hashedPasswordDB FROM usuario WHERE correo = p_correo;
    IF hashedPasswordDB IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Usuario o contraseña incorrectos';
    ELSE
        IF hashedPasswordDB = SHA2(p_contrasenna, 256) THEN
            SELECT `usuario_id`,`nombres_completos`, `dni`, `genero`, `fecha_nacimiento`, `direccion`, `departamento`, `correo`, `contrasenna`, `telefono`, 3 AS `rol_id` FROM usuario WHERE correo = p_correo;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Tienda o contraseña incorrectos';
        END IF;
      END IF;  
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_ver_cupones_adquiridos`$$
CREATE PROCEDURE `sp_ver_cupones_adquiridos`(
    IN p_usuario_id INT
)
BEGIN
    DECLARE usuario_count INT;
    SELECT COUNT(*) INTO usuario_count
    FROM `usuario`
    WHERE `usuario_id` = p_usuario_id;

    IF usuario_count = 1 THEN
        IF (SELECT COUNT(*) FROM `cupon_comprado` WHERE `usuario_id` = p_usuario_id) > 0 THEN
            SELECT
                cc.`usuario_id`,
                cc.`cupones_id`,
                c.`titulo`,
                c.`descripcion`,
                c.`fecha_inicio`,
                c.`fecha_vencimiento`,
                c.`precio_normal`,
                c.`precio_oferta`,
                c.`disenno_oferta_foto`,
                c.`cliente_tienda_id`,
                c.`categorias_id`
            FROM 
                `cupon_comprado` cc
            JOIN
                `cupones` c ON cc.`cupones_id` = c.`cupones_id`
            WHERE 
                cc.`usuario_id` = p_usuario_id;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario no ha adquirido cupones';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El usuario no existe';
    END IF;
END$$
DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_verperfil_usuario`$$
CREATE PROCEDURE `sp_verperfil_usuario`(
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

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_verperfil_tienda` $$
CREATE PROCEDURE `sp_verperfil_tienda`(
    IN p_cliente_tienda_id INT
)
BEGIN
    IF (SELECT COUNT(*) FROM `cliente_tienda` WHERE `cliente_tienda_id` = p_cliente_tienda_id) > 0 THEN
        SELECT * FROM `cliente_tienda` WHERE `cliente_tienda_id` = p_cliente_tienda_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontró el cliente_tienda';
    END IF;
END$$
DELIMITER ;