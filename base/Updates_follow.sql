--Update 1 del mes de Junio - 2022

--Insertar modulo para gestionar el permiso para poder actualizar el precio.
INSERT INTO `modulo` (`id_server`, `unique_id`, `id_modulo`, `id_menu`, `nombre`, `descripcion`, `filename`, `mostrarmenu`)
    VALUES ('', '', NULL, '5', 'Usar precio en base a porcentaje de utilidad', 'Usar precio basado en porcentaje de utilidad', 'unlock_edit_price', '0');

INSERT INTO `menu` (`id_server`, `unique_id`, `id_menu`, `nombre`, `prioridad`, `icono`, `visible`)
    VALUES ('', 'O5f05eb40b2ab31.39514407', NULL, 'Parqueo', '12', 'fa fa-car', '1');

INSERT INTO `modulo` (`id_server`, `unique_id`, `id_modulo`, `id_menu`, `nombre`, `descripcion`, `filename`, `mostrarmenu`)
    VALUES ('', '', NULL, '18', 'Admin parqueo', 'Admin parqueo', 'admin_parqueo.php', '1');


--Creacion de la tabla de precios para el parqueo.
CREATE TABLE `open_2cajas`.`parqueo_precios` (
    `id_precio_parqueo` INT NOT NULL AUTO_INCREMENT ,
    `precio_hora` DECIMAL(10,2) NOT NULL ,
    `precio_fraccion` DECIMAL(10,2) NOT NULL ,
    `deleted` DATE NULL DEFAULT NULL ,
    PRIMARY KEY (`id_precio_parqueo`)
) ENGINE = InnoDB;

INSERT INTO `parqueo_precios` (`id_precio_parqueo`, `precio_hora`, `precio_fraccion`, `deleted`)
    VALUES (NULL, '1.00', '0.25', NULL);