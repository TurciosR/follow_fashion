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

--Agregar campo de correlativo para los que se estarán emitiendo en el parqueo
ALTER TABLE `correlativo` ADD `tik_parqueo` INT NOT NULL COMMENT 'Correlativo para los tickets emitidos en parqueo' AFTER `con`;

---------Update 2 del mes de Junio - 2022
--insertar modulo de admin_cortes_parqueo
INSERT INTO `modulo` (`id_server`, `unique_id`, `id_modulo`, `id_menu`, `nombre`, `descripcion`, `filename`, `mostrarmenu`) VALUES ('0', '', NULL, '18', 'Admin cortes parqueo', 'Admin cortes parqueo', 'admin_cortes_parqueo.php', '1'), ('0', '', NULL, '18', 'Anular parqueo', 'Anular parqueo', 'anular_parqueo', '0'), ('0', '', NULL, '18', 'Corte de parqueo', 'corte de parqueo', 'corte_parqueo.php', '1')

ALTER TABLE `parqueo` ADD `anulada` TINYINT NOT NULL AFTER `id_corte_parqueo`, ADD `id_corte_parqueo` INT NOT NULL COMMENT 'si este campo es cero, el registro se incluye en un nuevo corte ' AFTER `anulada`;
