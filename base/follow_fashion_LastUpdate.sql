-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-06-2022 a las 15:33:50
-- Versión del servidor: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `follow_fashion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono_credito`
--

CREATE TABLE `abono_credito` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_abono_credito` int(11) NOT NULL,
  `id_credito` int(11) NOT NULL,
  `abono` float NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tipo_doc` varchar(25) NOT NULL,
  `num_doc` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `access_conf`
--

CREATE TABLE `access_conf` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_conf` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `hash` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `access_conf`
--

INSERT INTO `access_conf` (`id_server`, `unique_id`, `id_conf`, `id_sucursal`, `hash`) VALUES
(1, 'O5f05eb3ed058b1.65548931', 1, 1, 'OIQWAjLkd79ggETQkaSF3UW5x4wPRQkmfHqJsHLVY7aKPbs642CaWcON3+3OMUrKnjc6j6Qd0PvrNLwP11cGioWaHob/OFyq5fx2lBwzT8UK4iLKjzbr/6lpk9KNOKxM8TRtYmJjpaVFUKGU4EOYaW9CeFXbJNZdvrNJpIhxRFg=');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `altclitocli`
--

CREATE TABLE `altclitocli` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id` int(11) NOT NULL,
  `datax` text NOT NULL,
  `id_sucursal_origen` int(11) NOT NULL,
  `id_sucursal_destino` int(11) NOT NULL,
  `ejecutado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apertura_caja`
--

CREATE TABLE `apertura_caja` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_apertura` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `caja` int(11) NOT NULL,
  `turno_vigente` tinyint(1) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `turno` int(11) NOT NULL,
  `monto_apertura` double NOT NULL,
  `monto_ch` decimal(10,2) NOT NULL,
  `monto_ch_actual` decimal(10,2) NOT NULL,
  `tiket_inicia` int(11) NOT NULL,
  `factura_inicia` int(11) NOT NULL,
  `credito_fiscal_inicia` int(11) NOT NULL,
  `dev_inicia` int(11) NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  `monto_vendido` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `apertura_caja`
--

INSERT INTO `apertura_caja` (`id_server`, `unique_id`, `id_sucursal`, `id_apertura`, `fecha`, `hora`, `caja`, `turno_vigente`, `id_empleado`, `turno`, `monto_apertura`, `monto_ch`, `monto_ch_actual`, `tiket_inicia`, `factura_inicia`, `credito_fiscal_inicia`, `dev_inicia`, `vigente`, `monto_vendido`) VALUES
(0, 'S62b9d07c3c2a21.02648366', 1, 1, '2022-06-27', '09:45:00', 1, 0, 1, 2, 50, '0.00', '0.00', 0, 0, 0, 0, 0, 50),
(0, 'S62bc93d2de8516.92188440', 1, 2, '2022-06-29', '12:02:58', 1, 1, 1, 1, 50, '0.00', '0.00', 0, 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_banco` int(1) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`id_server`, `unique_id`, `id_sucursal`, `id_banco`, `nombre`, `logo`) VALUES
(0, 'S5f7f858950b020.10527839', 1, 1, 'banco agricola', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `serie` varchar(50) NOT NULL,
  `desde` int(11) NOT NULL,
  `hasta` int(11) NOT NULL,
  `correlativo_dispo` int(11) NOT NULL,
  `resolucion` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `activa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_server`, `unique_id`, `id_sucursal`, `id_caja`, `nombre`, `serie`, `desde`, `hasta`, `correlativo_dispo`, `resolucion`, `fecha`, `activa`) VALUES
(1, 'O5f05eb3edefc49.58616938', 1, 1, 'Caja 1', '21MS00000001', 1, 10000, 6, 'ASC-15041-039094-2021', '2021-07-02', 1),
(2, 'O5f05eb3edefc49.58616932', 1, 2, 'Caja 2', '21MS00000002', 1, 10000, 1, 'ASC-15041-039094-2021', '2021-07-02', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre_cat` varchar(30) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `id_sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_server`, `unique_id`, `id_categoria`, `nombre_cat`, `descripcion`, `id_sucursal`) VALUES
(0, 'S62b1e2e9a82d53.84586601', 1, 'PRUEBA', 'PRUEBA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_proveedor`
--

CREATE TABLE `categoria_proveedor` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_proveedor`
--

INSERT INTO `categoria_proveedor` (`id_server`, `unique_id`, `id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'O5f05eb3fcf9d50.73076700', 1, 'Consumidor', ''),
(2, 'O5f05eb3fd0ffa1.90155333', 2, 'Contribuyente', ''),
(3, 'O5f05eb3fd30de2.22710207', 3, 'Gran Contribuyente', ''),
(4, 'O5f05eb3fd507d0.02180707', 4, 'Contribuyente Exento', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheque`
--

CREATE TABLE `cheque` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cheque` int(11) NOT NULL,
  `cheque` varchar(50) DEFAULT NULL,
  `monto` float NOT NULL,
  `id_movimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `categoria` int(1) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `razon_social` varchar(250) NOT NULL,
  `direccion` text DEFAULT NULL,
  `municipio` varchar(100) DEFAULT NULL,
  `depto` varchar(100) DEFAULT NULL,
  `pais` varchar(11) DEFAULT NULL,
  `dui` varchar(15) DEFAULT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `nrc` varchar(12) DEFAULT NULL,
  `giro` varchar(40) DEFAULT NULL,
  `telefono1` varchar(12) DEFAULT NULL,
  `telefono2` varchar(12) DEFAULT NULL,
  `fax` varchar(12) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ultventa` date DEFAULT NULL,
  `acumulado` int(1) DEFAULT NULL,
  `saldo` int(1) DEFAULT NULL,
  `percibe` int(1) DEFAULT NULL,
  `retiene` int(10) DEFAULT NULL,
  `retiene10` tinyint(1) NOT NULL,
  `inactivo` tinyint(1) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `referencia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_server`, `unique_id`, `id_sucursal`, `id_cliente`, `categoria`, `nombre`, `razon_social`, `direccion`, `municipio`, `depto`, `pais`, `dui`, `nit`, `nrc`, `giro`, `telefono1`, `telefono2`, `fax`, `email`, `ultventa`, `acumulado`, `saldo`, `percibe`, `retiene`, `retiene10`, `inactivo`, `latitud`, `longitud`, `referencia`) VALUES
(0, 'S62b1e38ee7afe5.91581130', 1, 1, 1, 'MOSTRADOR', '', '', '81', '13', NULL, '', '', '', '', '', '', '', '', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `numero_doc` varchar(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `hora` time DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `alias_tipodoc` char(5) NOT NULL,
  `total_percepcion` float NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `dias_credito` int(11) NOT NULL,
  `anulada` tinyint(1) NOT NULL,
  `finalizada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra2`
--

CREATE TABLE `compra2` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `numero_doc` varchar(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `hora` time DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `alias_tipodoc` char(5) NOT NULL,
  `total_percepcion` float NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `dias_credito` int(11) NOT NULL,
  `anulada` tinyint(1) NOT NULL,
  `finalizada` tinyint(1) NOT NULL,
  `id_ubicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compra2`
--

INSERT INTO `compra2` (`id_server`, `unique_id`, `id_sucursal`, `id_compra`, `id_proveedor`, `numero_doc`, `fecha`, `iva`, `total`, `hora`, `fecha_ingreso`, `id_empleado`, `alias_tipodoc`, `total_percepcion`, `id_pedido`, `dias_credito`, `anulada`, `finalizada`, `id_ubicacion`) VALUES
(0, 'S60f88fd7f38381.64250789', 1, 1, 7, '05C70690453', '2021-07-20', '14.14', '122.89', '15:21:27', '2021-07-21', 11, 'CCF', 0, 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_configuracion` int(11) NOT NULL,
  `sms` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `hash` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_dir`
--

CREATE TABLE `config_dir` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_config_dir` int(11) NOT NULL,
  `dir_print_script` varchar(50) NOT NULL,
  `shared_printer_matrix` varchar(50) NOT NULL,
  `shared_printer_pos` varchar(50) NOT NULL,
  `shared_print_barcode` varchar(250) NOT NULL,
  `rollo_etiqueta` int(11) NOT NULL,
  `media_type` char(2) NOT NULL DEFAULT 'TD' COMMENT 'TD=Termico Directo TT=Transferencia Termica',
  `leftmarginlabel` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `config_dir`
--

INSERT INTO `config_dir` (`id_server`, `unique_id`, `id_sucursal`, `id_config_dir`, `dir_print_script`, `shared_printer_matrix`, `shared_printer_pos`, `shared_print_barcode`, `rollo_etiqueta`, `media_type`, `leftmarginlabel`) VALUES
(1, 'O5f05eb3fda9427.14226162', 1, 1, 'localhost/impresionFollow/', '//localhost/facturacion', '//localhost/ticket', '//localhost/barcode', 1, 'TD', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_pos`
--

CREATE TABLE `config_pos` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_config_pos` int(11) NOT NULL,
  `alias_tipodoc` char(4) NOT NULL,
  `header1` varchar(50) NOT NULL,
  `header2` varchar(50) NOT NULL,
  `header3` varchar(50) NOT NULL,
  `header4` varchar(50) NOT NULL,
  `header5` varchar(50) NOT NULL,
  `header6` varchar(50) NOT NULL,
  `header7` varchar(50) NOT NULL,
  `header8` varchar(50) NOT NULL,
  `header9` varchar(50) NOT NULL,
  `header10` varchar(50) NOT NULL,
  `footer1` varchar(50) NOT NULL,
  `footer2` varchar(50) NOT NULL,
  `footer3` varchar(50) NOT NULL,
  `footer4` varchar(50) NOT NULL,
  `footer5` varchar(50) NOT NULL,
  `footer6` varchar(50) NOT NULL,
  `footer7` varchar(50) NOT NULL,
  `footer8` varchar(50) NOT NULL,
  `footer9` varchar(50) NOT NULL,
  `footer10` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `config_pos`
--

INSERT INTO `config_pos` (`id_server`, `unique_id`, `id_sucursal`, `id_config_pos`, `alias_tipodoc`, `header1`, `header2`, `header3`, `header4`, `header5`, `header6`, `header7`, `header8`, `header9`, `header10`, `footer1`, `footer2`, `footer3`, `footer4`, `footer5`, `footer6`, `footer7`, `footer8`, `footer9`, `footer10`) VALUES
(1, 'O5f05eb3fdc5e43.90064528', 1, 1, 'TIK', '', '', 'VENTA DE PRODUCTOS VARIOS', '', '', '', '', '', '', '', 'GRACIAS POR SU COMPRA, VUELVA PRONTO...', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consignacion`
--

CREATE TABLE `consignacion` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_consignacion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `concepto` text NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `numero_doc` varchar(30) NOT NULL,
  `total` float NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT 0,
  `id_sucursal` int(11) NOT NULL,
  `finalizada` tinyint(1) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `saldo` float NOT NULL,
  `abono` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consignacion_detalle`
--

CREATE TABLE `consignacion_detalle` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_consignacion_detalle` int(11) NOT NULL,
  `id_consignacion` int(11) NOT NULL,
  `id_prod_serv` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `costo` float NOT NULL,
  `precio_venta` float NOT NULL,
  `subtotal` float NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `tipo_prod_serv` varchar(30) NOT NULL COMMENT 'PRODUCTO o SERVICIO',
  `id_sucursal` int(11) NOT NULL,
  `cant_facturado` float NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `presentacion` int(11) NOT NULL,
  `unidad` int(11) NOT NULL,
  `cantidad_faltante` int(11) NOT NULL,
  `saldo` float NOT NULL,
  `abono` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlcaja`
--

CREATE TABLE `controlcaja` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_corte` int(11) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_apertura` int(11) NOT NULL,
  `caja` varchar(3) DEFAULT NULL,
  `turno` int(1) DEFAULT NULL,
  `cajero` varchar(10) DEFAULT NULL,
  `fecha_corte` date NOT NULL,
  `hora_corte` time NOT NULL,
  `tiket` int(11) NOT NULL,
  `ticket_e` int(11) NOT NULL,
  `tinicio` int(5) DEFAULT NULL,
  `tfinal` int(5) DEFAULT NULL,
  `totalnot` int(2) DEFAULT NULL,
  `texento` double DEFAULT NULL,
  `tgravado` double DEFAULT NULL,
  `totalt` double DEFAULT NULL,
  `finicio` int(5) DEFAULT NULL,
  `ffinal` int(5) DEFAULT NULL,
  `totalnof` int(2) DEFAULT NULL,
  `fexento` double DEFAULT NULL,
  `fgravado` double DEFAULT NULL,
  `totalf` double DEFAULT NULL,
  `cfinicio` int(4) DEFAULT NULL,
  `cffinal` int(4) DEFAULT NULL,
  `totalnocf` int(1) DEFAULT NULL,
  `cfexento` double DEFAULT NULL,
  `cfgravado` double DEFAULT NULL,
  `totalcf` double DEFAULT NULL,
  `rinicio` int(11) NOT NULL,
  `rfinal` int(11) NOT NULL,
  `totalnor` int(11) NOT NULL,
  `rexento` double NOT NULL,
  `rgravado` double NOT NULL,
  `totalr` double NOT NULL,
  `cashinicial` double DEFAULT NULL,
  `vtacontado` double DEFAULT NULL,
  `vtaefectivo` double DEFAULT NULL,
  `vtatcredito` double DEFAULT NULL,
  `totalgral` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `cashfinal` double DEFAULT NULL,
  `diferencia` double DEFAULT NULL,
  `totalnodev` int(1) DEFAULT NULL,
  `totalnoanu` int(1) DEFAULT NULL,
  `depositos` decimal(6,2) DEFAULT NULL,
  `vales` double DEFAULT NULL,
  `tarjetas` double DEFAULT NULL,
  `depositon` int(1) DEFAULT NULL,
  `valen` int(1) DEFAULT NULL,
  `tarjetan` int(1) DEFAULT NULL,
  `ingresos` double DEFAULT NULL,
  `tcredito` int(1) DEFAULT NULL,
  `ncortex` int(1) DEFAULT NULL,
  `ncortez` int(1) DEFAULT NULL,
  `ncortezm` int(1) DEFAULT NULL,
  `cerrado` int(1) DEFAULT NULL,
  `tipo_corte` varchar(20) NOT NULL,
  `monto_ch` float NOT NULL,
  `retencion` float NOT NULL,
  `tinicio_e` int(11) NOT NULL,
  `tfinal_e` int(11) NOT NULL,
  `tdoctexe` int(11) NOT NULL,
  `tottexe` decimal(10,2) NOT NULL,
  `finicio_e` int(11) NOT NULL,
  `ffinal_e` int(11) NOT NULL,
  `tdocfexe` int(11) NOT NULL,
  `totfexe` decimal(10,2) NOT NULL,
  `cfinicio_e` int(11) NOT NULL,
  `cffinal_e` int(11) NOT NULL,
  `tdoccfexe` int(11) NOT NULL,
  `totcfexe` decimal(10,2) NOT NULL,
  `czxe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `controlcaja`
--

INSERT INTO `controlcaja` (`id_server`, `unique_id`, `id_sucursal`, `id_corte`, `fecha`, `id_empleado`, `id_apertura`, `caja`, `turno`, `cajero`, `fecha_corte`, `hora_corte`, `tiket`, `ticket_e`, `tinicio`, `tfinal`, `totalnot`, `texento`, `tgravado`, `totalt`, `finicio`, `ffinal`, `totalnof`, `fexento`, `fgravado`, `totalf`, `cfinicio`, `cffinal`, `totalnocf`, `cfexento`, `cfgravado`, `totalcf`, `rinicio`, `rfinal`, `totalnor`, `rexento`, `rgravado`, `totalr`, `cashinicial`, `vtacontado`, `vtaefectivo`, `vtatcredito`, `totalgral`, `subtotal`, `cashfinal`, `diferencia`, `totalnodev`, `totalnoanu`, `depositos`, `vales`, `tarjetas`, `depositon`, `valen`, `tarjetan`, `ingresos`, `tcredito`, `ncortex`, `ncortez`, `ncortezm`, `cerrado`, `tipo_corte`, `monto_ch`, `retencion`, `tinicio_e`, `tfinal_e`, `tdoctexe`, `tottexe`, `finicio_e`, `ffinal_e`, `tdocfexe`, `totfexe`, `cfinicio_e`, `cffinal_e`, `tdoccfexe`, `totcfexe`, `czxe`) VALUES
(0, 'S62bc93cdcf3542.77381932', 1, 1, '', 1, 1, NULL, 1, NULL, '2022-06-27', '21:00:00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, NULL, 0, NULL, 50, NULL, 50, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'C', 0, 0, 0, 0, 0, '0.00', 0, 0, 0, '0.00', 0, 0, 0, '0.00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correlativo`
--

CREATE TABLE `correlativo` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_numdoc` int(11) NOT NULL,
  `tik` int(11) NOT NULL,
  `cof` int(11) NOT NULL,
  `ccf` int(11) NOT NULL,
  `ref` int(11) NOT NULL,
  `ii` int(11) NOT NULL,
  `di` int(11) NOT NULL,
  `ai` int(11) NOT NULL,
  `ti` int(11) NOT NULL,
  `voc` int(11) NOT NULL,
  `aj` int(11) NOT NULL,
  `cot` int(11) NOT NULL,
  `tre` int(11) NOT NULL,
  `trr` int(11) NOT NULL,
  `dev` int(11) NOT NULL,
  `nc` int(11) NOT NULL,
  `pd` int(11) NOT NULL,
  `pdp` int(11) NOT NULL,
  `cof_e` int(11) NOT NULL,
  `ccf_e` int(11) NOT NULL,
  `nc_e` int(11) NOT NULL,
  `dev_e` int(11) NOT NULL,
  `con` int(11) NOT NULL,
  `tik_parqueo` int(11) NOT NULL COMMENT 'Correlativo para los tickets emitidos en parqueo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `correlativo`
--

INSERT INTO `correlativo` (`id_server`, `unique_id`, `id_sucursal`, `id_numdoc`, `tik`, `cof`, `ccf`, `ref`, `ii`, `di`, `ai`, `ti`, `voc`, `aj`, `cot`, `tre`, `trr`, `dev`, `nc`, `pd`, `pdp`, `cof_e`, `ccf_e`, `nc_e`, `dev_e`, `con`, `tik_parqueo`) VALUES
(1, 'O5f05eb400e59b6.44715651', 1, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes_parqueo`
--

CREATE TABLE `cortes_parqueo` (
  `server_id` int(11) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `id_corte_parqueo` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario quien registra el corte',
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `correlativo_inicio` varchar(20) NOT NULL,
  `correlativo_fin` varchar(20) NOT NULL,
  `efectivo_en_caja` decimal(10,2) NOT NULL COMMENT 'efectivo cobrado',
  `total_corte` decimal(10,2) NOT NULL COMMENT 'total general del corte',
  `diferencia` decimal(10,2) NOT NULL,
  `ticket_anulados` int(11) NOT NULL,
  `total_parqueados` int(11) NOT NULL COMMENT 'total de vehiculos que usaron el parqueo',
  `monto_anulado` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cotizacion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `vigencia` int(11) NOT NULL,
  `numero_doc` varchar(15) NOT NULL,
  `total` float NOT NULL,
  `impresa` tinyint(1) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_detalle`
--

CREATE TABLE `cotizacion_detalle` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `id_cotizacion` int(11) NOT NULL,
  `id_prod_serv` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` float NOT NULL,
  `subtotal` float NOT NULL,
  `tipo_prod_serv` varchar(20) NOT NULL,
  `id_presentacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_credito` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo_doc` varchar(50) NOT NULL,
  `numero_doc` varchar(50) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `dias` int(11) NOT NULL,
  `total` float NOT NULL,
  `abono` float NOT NULL,
  `saldo` float NOT NULL,
  `finalizada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_banco`
--

CREATE TABLE `cuenta_banco` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `numero_cuenta` varchar(50) NOT NULL,
  `nombre_cuenta` varchar(100) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `observaciones` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuenta_banco`
--

INSERT INTO `cuenta_banco` (`id_server`, `unique_id`, `id_sucursal`, `id_cuenta`, `numero_cuenta`, `nombre_cuenta`, `id_banco`, `observaciones`) VALUES
(0, 'S5f7f859d6e21e9.34229585', 0, 1, '87141516', 'cuenta corriente', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_pagar`
--

CREATE TABLE `cuenta_pagar` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cuenta_pagar` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `hora` time NOT NULL,
  `numero_doc` varchar(15) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `saldo_pend` float NOT NULL,
  `fecha_vence` date DEFAULT NULL,
  `comentario` varchar(10) DEFAULT NULL,
  `dias_credito` int(3) DEFAULT NULL,
  `alias_tipodoc` char(5) NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_departamento` int(11) NOT NULL COMMENT 'ID del departamento',
  `nombre_departamento` varchar(30) NOT NULL COMMENT 'Nombre del departamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Departamentos de El Salvador';

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_server`, `unique_id`, `id_departamento`, `nombre_departamento`) VALUES
(1, 'O5f05eb40135001.25680380', 1, 'Ahuachapán'),
(2, 'O5f05eb401408b5.02743458', 2, 'Santa Ana'),
(3, 'O5f05eb40161022.48856100', 3, 'Sonsonate'),
(4, 'O5f05eb40182db5.95090534', 4, 'La Libertad'),
(5, 'O5f05eb401a2e50.39463793', 5, 'Chalatenango'),
(6, 'O5f05eb401c4479.29050638', 6, 'San Salvador'),
(7, 'O5f05eb401e5fe5.36412348', 7, 'Cuscatlán'),
(8, 'O5f05eb40207836.82365702', 8, 'La Paz'),
(9, 'O5f05eb40228958.36965162', 9, 'Cabañas'),
(10, 'O5f05eb40249ce5.41146105', 10, 'San Vicente'),
(11, 'O5f05eb4026b108.61176837', 11, 'Usulután'),
(12, 'O5f05eb4028e4e6.77060759', 12, 'Morazán'),
(13, 'O5f05eb402ae8d4.99014875', 13, 'San Miguel'),
(14, 'O5f05eb402d0161.28754843', 14, 'La Unión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_apertura`
--

CREATE TABLE `detalle_apertura` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `id_apertura` int(11) NOT NULL,
  `turno` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  `caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_apertura`
--

INSERT INTO `detalle_apertura` (`id_server`, `unique_id`, `id_sucursal`, `id_detalle`, `id_apertura`, `turno`, `id_usuario`, `fecha`, `hora`, `vigente`, `caja`) VALUES
(0, 'S62b9d07c3d8460.00761010', 0, 1, 1, 1, 1, '2022-06-27', '09:45:00', 0, 1),
(0, 'S62bc93cdd19984.89307233', 0, 2, 1, 2, 0, '2022-06-27', '21:00:00', 0, 0),
(0, 'S62bc93d2df4d29.17309418', 0, 3, 2, 1, 1, '2022-06-29', '12:02:58', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_det_compra` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_server_prod` int(11) NOT NULL,
  `cantidad` decimal(10,4) DEFAULT NULL,
  `ultcosto` decimal(5,2) DEFAULT NULL,
  `exento` tinyint(1) NOT NULL,
  `subtotal` float NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra2`
--

CREATE TABLE `detalle_compra2` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_det_compra` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_server_prod` int(11) NOT NULL,
  `cantidad` decimal(10,4) DEFAULT NULL,
  `ultcosto` decimal(5,2) DEFAULT NULL,
  `exento` tinyint(1) NOT NULL,
  `subtotal` float NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL,
  `fecha_vence` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compra2`
--

INSERT INTO `detalle_compra2` (`id_server`, `unique_id`, `id_sucursal`, `id_det_compra`, `id_compra`, `id_producto`, `id_server_prod`, `cantidad`, `ultcosto`, `exento`, `subtotal`, `id_presentacion`, `id_server_presen`, `fecha_vence`) VALUES
(0, 'S60f88fd7f3f932.26943826', 0, 1, 1, 1264, 0, '6.0000', '1.15', 0, 6.9, 1650, 0, '0000-00-00'),
(0, 'S60f88fd80012b9.53556694', 0, 2, 1, 1077, 0, '48.0000', '0.30', 0, 14.16, 1374, 0, '0000-00-00'),
(0, 'S60f88fd8005c90.70539262', 0, 3, 1, 161, 0, '24.0000', '0.30', 0, 7.08, 220, 0, '0000-00-00'),
(0, 'S60f88fd8009961.78153986', 0, 4, 1, 647, 0, '48.0000', '0.18', 0, 8.84, 829, 0, '0000-00-00'),
(0, 'S60f88fd800cd90.10138053', 0, 5, 1, 646, 0, '48.0000', '0.18', 0, 8.84, 827, 0, '0000-00-00'),
(0, 'S60f88fd80105d4.45745331', 0, 6, 1, 1261, 0, '24.0000', '0.41', 0, 9.92, 1647, 0, '0000-00-00'),
(0, 'S60f88fd8013e02.15640037', 0, 7, 1, 163, 0, '24.0000', '1.45', 0, 34.87, 222, 0, '0000-00-00'),
(0, 'S60f88fd80173b7.04172544', 0, 8, 1, 157, 0, '24.0000', '0.76', 0, 18.14, 213, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_voucher`
--

CREATE TABLE `detalle_voucher` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `fecha` varchar(11) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `cargo` varchar(11) DEFAULT NULL,
  `porcentage` varchar(11) DEFAULT NULL,
  `descuento` varchar(11) DEFAULT NULL,
  `devolucion` varchar(11) DEFAULT NULL,
  `bonificacion` varchar(11) DEFAULT NULL,
  `retencion` varchar(11) DEFAULT NULL,
  `vin` varchar(11) DEFAULT NULL,
  `saldo` varchar(11) DEFAULT NULL,
  `id_cuenta_pagar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_dev` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_factura_dev` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nombre` text NOT NULL,
  `dui` text NOT NULL,
  `telefono` int(11) NOT NULL,
  `exento` decimal(10,2) NOT NULL,
  `gravado` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones_corte`
--

CREATE TABLE `devoluciones_corte` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_dev` int(11) NOT NULL,
  `id_corte` int(11) NOT NULL,
  `n_devolucion` varchar(30) NOT NULL,
  `t_devolucion` double NOT NULL,
  `afecta` varchar(30) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `exento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones_det`
--

CREATE TABLE `devoluciones_det` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_dev_det` int(11) NOT NULL,
  `id_dev` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `id_factura_detalle` int(11) NOT NULL,
  `exento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `dui` varchar(16) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono1` varchar(12) NOT NULL,
  `telefono2` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `salariobase` float NOT NULL,
  `id_tipo_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `idempresa` int(1) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `razonsocial` varchar(30) DEFAULT NULL,
  `direccion` varchar(25) DEFAULT NULL,
  `ubicacion` varchar(23) DEFAULT NULL,
  `nrc` varchar(6) DEFAULT NULL,
  `nit` varchar(17) DEFAULT NULL,
  `giro` varchar(16) DEFAULT NULL,
  `telefono1` varchar(10) DEFAULT NULL,
  `depto` varchar(10) DEFAULT NULL,
  `direccion2` varchar(32) DEFAULT NULL,
  `telefono2` varchar(9) DEFAULT NULL,
  `logo` varchar(250) NOT NULL,
  `iva` decimal(5,2) NOT NULL,
  `monto_retencion1` decimal(5,2) NOT NULL,
  `monto_retencion10` decimal(5,2) NOT NULL,
  `monto_percepcion` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_server`, `unique_id`, `idempresa`, `nombre`, `razonsocial`, `direccion`, `ubicacion`, `nrc`, `nit`, `giro`, `telefono1`, `depto`, `direccion2`, `telefono2`, `logo`, `iva`, `monto_retencion1`, `monto_retencion10`, `monto_percepcion`) VALUES
(1, 'O5f05eb405a2e80.45664621', 1, 'CALZADO MAYORGA', 'Edgar Rodolfo Mayorga Ascencio', '4a Calle Poniente No. 214', 'San Miguel, El Salvador', '2404-0', '1217-090236-001-0', 'Venta de Calzado', '2661-1836', 'SAN MIGUEL', 'Sucursal Metrocentro Local 64/65', '2667-0452', 'img/5af09749a77c6_logo_sys.png', '13.00', '100.00', '100.00', '100.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estante`
--

CREATE TABLE `estante` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_estante` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `descripcion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `numero_doc` varchar(30) NOT NULL,
  `referencia` varchar(15) NOT NULL,
  `numero_ref` int(11) NOT NULL,
  `subtotal` float NOT NULL,
  `sumas` float NOT NULL,
  `suma_gravado` float NOT NULL,
  `iva` float NOT NULL,
  `retencion` float NOT NULL,
  `venta_exenta` float NOT NULL,
  `total_menos_retencion` float NOT NULL,
  `total` float NOT NULL,
  `descuento` float NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT 0,
  `id_empleado` int(11) NOT NULL,
  `finalizada` tinyint(1) NOT NULL,
  `impresa` tinyint(1) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `serie` varchar(25) NOT NULL,
  `serie_e` varchar(25) NOT NULL,
  `num_fact_impresa` varchar(30) NOT NULL,
  `hora` time NOT NULL,
  `turno` int(11) NOT NULL,
  `id_apertura` int(11) NOT NULL,
  `id_apertura_pagada` int(11) NOT NULL,
  `credito` tinyint(1) NOT NULL,
  `abono` float NOT NULL,
  `saldo` float NOT NULL,
  `afecta` int(11) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `caja` int(11) NOT NULL,
  `numero_doc_e` varchar(30) NOT NULL,
  `num_fact_impresa_e` varchar(30) NOT NULL,
  `nombre` text NOT NULL,
  `direccion` text NOT NULL,
  `precio_aut` int(11) NOT NULL,
  `clave` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_server`, `unique_id`, `id_sucursal`, `id_factura`, `id_cliente`, `fecha`, `numero_doc`, `referencia`, `numero_ref`, `subtotal`, `sumas`, `suma_gravado`, `iva`, `retencion`, `venta_exenta`, `total_menos_retencion`, `total`, `descuento`, `porcentaje`, `id_usuario`, `anulada`, `id_empleado`, `finalizada`, `impresa`, `tipo`, `serie`, `serie_e`, `num_fact_impresa`, `hora`, `turno`, `id_apertura`, `id_apertura_pagada`, `credito`, `abono`, `saldo`, `afecta`, `tipo_documento`, `caja`, `numero_doc_e`, `num_fact_impresa_e`, `nombre`, `direccion`, `precio_aut`, `clave`) VALUES
(0, 'S62bc9438eafaa0.23809861', 1, 1, 1, '2022-06-29', '0000000005_TIK', '', 0, 6.75, 6.75, 6.75, 0, 0, 0, 6.75, 6.75, 0, 0, 1, 0, 1, 1, 1, 'TICKET', '21MS00000001', '', '5', '12:04:40', 1, 2, 2, 0, 0, 0, 0, 'TIK', 1, '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalle`
--

CREATE TABLE `factura_detalle` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_factura_detalle` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_prod_serv` int(11) NOT NULL,
  `id_server_prod` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `precio_venta` decimal(11,4) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `descuento` float NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `tipo_prod_serv` varchar(30) NOT NULL COMMENT 'PRODUCTO o SERVICIO',
  `id_factura_dia` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `impresa_lote` tinyint(1) NOT NULL,
  `hora` time NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL,
  `exento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura_detalle`
--

INSERT INTO `factura_detalle` (`id_server`, `unique_id`, `id_sucursal`, `id_factura_detalle`, `id_factura`, `id_prod_serv`, `id_server_prod`, `cantidad`, `precio_venta`, `subtotal`, `descuento`, `id_empleado`, `tipo_prod_serv`, `id_factura_dia`, `fecha`, `impresa_lote`, `hora`, `id_presentacion`, `id_server_presen`, `exento`) VALUES
(0, 'S62bc9438ec5cc6.46599250', 1, 1, 1, 1, 0, '1.0000', '6.7500', '6.75', 0, 1, 'PRODUCTO', 0, '2022-06-29', 0, '00:00:00', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_cambio_local`
--

CREATE TABLE `log_cambio_local` (
  `id_log_cambio` int(11) NOT NULL,
  `id_server` int(11) DEFAULT NULL,
  `process` varchar(250) NOT NULL,
  `tabla` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_primario` int(11) DEFAULT NULL,
  `subido` int(11) NOT NULL,
  `verificado` int(11) NOT NULL,
  `prioridad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_cambio_local`
--

INSERT INTO `log_cambio_local` (`id_log_cambio`, `id_server`, `process`, `tabla`, `fecha`, `hora`, `id_usuario`, `id_sucursal`, `id_primario`, `subido`, `verificado`, `prioridad`) VALUES
(1, NULL, 'insert', 'producto', '2022-06-21', '09:59:33', 1, 1, 1, 0, 0, 1),
(2, NULL, 'update', 'correlativo', '2022-06-21', '10:00:42', 1, 1, 1, 0, 0, 1),
(3, NULL, 'insert', 'producto', '2022-06-27', '09:52:32', 1, 1, 1, 0, 0, 1),
(4, NULL, 'update', 'correlativo', '2022-06-27', '09:53:42', 1, 1, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_detalle_cambio_local`
--

CREATE TABLE `log_detalle_cambio_local` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_detalle_cambio` int(11) NOT NULL,
  `id_log_cambio` int(11) NOT NULL,
  `tabla` varchar(250) NOT NULL,
  `id_verificador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_detalle_cambio_local`
--

INSERT INTO `log_detalle_cambio_local` (`id_server`, `unique_id`, `id_detalle_cambio`, `id_log_cambio`, `tabla`, `id_verificador`) VALUES
(0, 'S62b1eae5c55dd8.40451601', 1, 1, 'producto', 1),
(0, 'S62b9d240bb70e4.02915254', 2, 3, 'producto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_update_local`
--

CREATE TABLE `log_update_local` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_log_cambio` int(11) NOT NULL,
  `query` text NOT NULL,
  `tabla` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `log_update_local`
--

INSERT INTO `log_update_local` (`id_server`, `unique_id`, `id_log_cambio`, `query`, `tabla`, `fecha`, `hora`, `id_usuario`, `id_sucursal`) VALUES
(0, 'S62ba8adc913425.39503131', 1, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78600ca0.70437817\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc930cb4.44458365', 2, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7860dcc8.73626143\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc943ee8.51356825', 3, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78622e76.54193513\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc953704.62889627', 4, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78634b43.55016501\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc95efe9.89242643', 5, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78644924.72357360\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc968316.23770195', 6, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7864e9b7.80037894\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc972094.96517149', 7, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7865ee29.24636768\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9794a9.21697899', 8, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78669e57.37581209\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc97dc03.92639314', 9, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78674391.39527869\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc983ca5.70509526', 10, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7867c329.65761527\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc98b183.76408524', 11, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78687625.48590687\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc991e21.27954074', 12, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7868ef40.64404782\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9985a0.60733514', 13, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7869ab28.37055820\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc99cd40.03150032', 14, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf786a54f5.18601996\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9a26c2.48548445', 15, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf786aec36.64749459\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9a96f8.08545944', 16, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf786b90c0.13012419\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9aecc6.67276257', 17, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf786c2ab0.35485650\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9b4429.92219699', 18, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf786c9601.49027206\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9bb3d2.68354728', 19, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf786dbfa9.51433476\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9c06b1.40159551', 20, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf786f0072.89570605\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9c7927.23076185', 21, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787069d9.82528580\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9ccab3.52223235', 22, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7871bb03.63390163\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9d28e9.76875065', 23, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78731886.13680121\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9dc4a7.06435297', 24, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78748828.94947470\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9e1915.30821884', 25, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78758d48.71800971\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9e99d3.72306325', 26, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78767e25.65954963\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9ee3d9.70854028', 27, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78777d39.06420707\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9f5383.29855412', 28, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78785801.04033068\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9fa8a5.31327548', 29, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78792828.43391648\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adc9ffac8.82597901', 30, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7879d194.98145026\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca07333.82266547', 31, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787a87a9.75497898\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca0c975.50166916', 32, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787b4729.84243876\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca11dd6.87603970', 33, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787bfd62.17988140\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca19f15.67657217', 34, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787c8dc4.93335754\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca21274.92967285', 35, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787d3b05.79497336\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca2bc75.80944824', 36, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787e0242.93454243\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca37522.57086718', 37, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787e90e8.73501732\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca40163.67167524', 38, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf787f8649.74743044\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca4d411.13563630', 39, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788020c9.05351889\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca5a321.05260220', 40, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7880c2c3.80955688\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca66b82.74571678', 41, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78814404.45790822\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca70ac6.47050084', 42, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788204d3.50996884\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca7d9b5.19737505', 43, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7882ad42.13182541\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca89a69.16607697', 44, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78834755.95602667\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adca96f12.44114641', 45, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788413d9.71817621\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcaa3136.56210715', 46, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7884be97.49686401\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcab2433.67404017', 47, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78853e47.62716243\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcac28c4.59294934', 48, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78860cc3.71589671\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcad2cc9.95011294', 49, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7886d222.75545944\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcadf6b6.88602441', 50, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78879318.21594673\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcaeb5d9.76070940', 51, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788821e1.91244946\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcaf8455.74005476', 52, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7888c4b2.18040819\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb03f16.16843429', 53, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78895663.21058142\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb0cc41.96400679', 54, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788a09b4.20736244\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb17fa7.17298522', 55, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788aaef3.76673129\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb252f1.12409701', 56, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788b47b3.45664899\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb2f892.97173922', 57, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788c1bc1.46078864\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb3c876.02461209', 58, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788cc9b6.04897190\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb49206.93410051', 59, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788d6ed1.76545326\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb55495.67453991', 60, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788e0398.40324970\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb61069.31299700', 61, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788e9c53.84462138\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb6ba48.37802791', 62, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788f1661.42808184\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb785d1.49062797', 63, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf788fc926.40753999\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb85f78.40343700', 64, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78907968.62415298\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb924c6.01600589', 65, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78912403.60611713\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcb9c735.86610003', 66, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf789372c1.87993318\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcba9c27.17819300', 67, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78944a80.48829542\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcbb6963.01981615', 68, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7894f022.87409452\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcbc3952.32494731', 69, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78957f08.74615751\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcbd11e5.69343002', 70, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf789632f8.40770333\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcbdd775.18044545', 71, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7896b307.12878036\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcbe69f0.77708053', 72, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78976c11.16808405\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcbf4a87.43330763', 73, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7897f790.23561630\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc01419.68700853', 74, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78989fc6.03656453\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc0d627.97569711', 75, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf78992830.21231400\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc17ba7.75327790', 76, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf7899a261.03434887\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc24541.97735212', 77, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf789a4710.23800861\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc302f4.47644647', 78, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf789ad782.98879334\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc3ce73.58364376', 79, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf789b9358.20632156\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc48927.02580923', 80, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf789cbc94.78858079\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc561e1.09839143', 81, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf789d9958.15094013\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1),
(0, 'S62ba8adcc625a7.66117862', 82, 'DELETE FROM usuario_modulo WHERE unique_id =\'S62b5cf789ef0c9.49066971\'', 'usuario_modulo', '2022-06-27', '23:00:12', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `numero` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `precio` decimal(11,4) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `vencimiento` date NOT NULL,
  `estado` varchar(25) NOT NULL,
  `referencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id_server`, `unique_id`, `id_sucursal`, `id_lote`, `id_producto`, `fecha_entrada`, `numero`, `cantidad`, `precio`, `id_presentacion`, `vencimiento`, `estado`, `referencia`) VALUES
(0, 'S62b1eb2aa0d009.46909279', 1, 1, 1, '2022-06-21', 1, '94.0000', '1.0000', 1, '0000-00-00', 'VIGENTE', 1),
(0, 'S62b9d286e26db5.84590212', 1, 2, 1, '2022-06-27', 2, '550.0000', '5.0000', 1, '0000-00-00', 'VIGENTE', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `icono` varchar(250) NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_server`, `unique_id`, `id_menu`, `nombre`, `prioridad`, `icono`, `visible`) VALUES
(1, 'O5f05eb409009e5.46706007', 1, 'Productos', 5, 'fa fa-archive', 1),
(2, 'O5f05eb409179a0.18650115', 2, 'Clientes', 1, 'fa fa-users', 1),
(3, 'O5f05eb4093a7c3.20066664', 3, 'Proveedores', 2, 'fa fa-truck', 1),
(4, 'O5f05eb4095af10.27286419', 4, 'Ubicaciones', 4, 'fa fa-database', 0),
(5, 'O5f05eb4097ace5.11347275', 5, 'Facturación', 8, 'fa fa-money', 1),
(6, 'O5f05eb4099d124.33084211', 6, 'Inventario', 7, 'fa fa-table', 1),
(7, 'O5f05eb409bee79.14738654', 7, 'Caja', 12, 'fa fa-money', 1),
(8, 'O5f05eb40a03963.45333314', 8, 'Cuentas por Cobrar', 10, ' fa fa-credit-card', 1),
(9, 'O5f05eb40a23679.51184023', 9, 'Empleados', 3, 'fa fa-users', 1),
(10, 'O5f05eb40a44847.17519732', 10, 'Bancos', 9, 'fa fa-bank', 0),
(11, 'O5f05eb40a65fc6.76958696', 11, 'Compras', 6, 'fa fa-cart-arrow-down', 1),
(12, 'O5f05eb40a876e0.30839970', 12, 'Cuentas por Pagar', 11, 'fa fa-balance-scale', 1),
(13, 'O5f05eb40aa7f76.15900424', 13, 'Cotizaciones', 13, 'fa fa-file-pdf-o', 0),
(14, 'O5f05eb40ac92f6.64346636', 14, 'Traslados', 15, 'fa fa-exchange', 0),
(15, 'O5f05eb40aeb060.65265702', 15, 'Utilidades', 16, 'fa fa-gears', 1),
(16, 'O5f05eb40b0a8a3.32582765', 16, 'Pedidos', 14, 'fa fa-file', 0),
(17, 'O5f05eb40b2ab31.39514402', 17, 'Reportes', 15, 'fa fa-file-pdf-o', 1),
(0, 'O5f05eb40b2ab31.39514407', 18, 'Parqueo', 12, 'fa fa-car', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `mostrarmenu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id_server`, `unique_id`, `id_modulo`, `id_menu`, `nombre`, `descripcion`, `filename`, `mostrarmenu`) VALUES
(1, 'O5f05eb40b557d6.80674465', 1, 2, 'Admin Clientes', 'Admin Clientes', 'admin_cliente.php', 1),
(2, 'O5f05eb40b6cda1.21804727', 2, 2, 'Agregar Cliente', 'Agregar Cliente', 'agregar_cliente.php', 0),
(3, 'O5f05eb40b98960.03796961', 3, 2, 'Editar Cliente', 'Editar Cliente', 'editar_cliente.php', 0),
(4, 'O5f05eb40bb3023.17484334', 4, 0, 'Borrar Cliente', 'Borrar Cliente', 'borrar_cliente.php', 0),
(5, 'O5f05eb40bd51e2.11388209', 5, 2, 'Ver Cliente', 'Ver Cliente', 'ver_cliente.php', 0),
(6, 'O5f05eb40bf6df6.08826724', 6, 1, 'Admin Productos', 'Admin Productos', 'admin_producto.php', 1),
(7, 'O5f05eb40c17e84.99146662', 7, 1, 'Agregar Producto', 'Agregar Producto', 'agregar_producto.php', 0),
(8, 'O5f05eb40c396a4.82413968', 8, 1, 'Editar Producto', 'Editar Producto', 'editar_producto.php', 0),
(9, 'O5f05eb40c5a989.22673514', 9, 0, 'Borrar Producto', 'Borrar Producto', 'borrar_producto.php', 0),
(10, 'O5f05eb40c7c621.03604395', 10, 1, 'Ver Producto', 'Ver Producto', 'ver_producto.php', 0),
(11, 'O5f05eb40c9e083.97450774', 11, 1, 'Admin Categorías', 'Admin Categorías', 'admin_categoria.php', 1),
(12, 'O5f05eb40cbecc6.75279752', 12, 1, 'Agregar Categoría', 'Agregar Categoría', 'agregar_categoria.php', 0),
(13, 'O5f05eb40ce1fd4.53208572', 13, 1, 'Editar Categoría', 'Editar Categoría', 'editar_categoria.php', 0),
(14, 'O5f05eb40d03081.95012102', 14, 1, 'Borrar Categoría', 'Borrar Categoría', 'borrar_categoria.php', 0),
(15, 'O5f05eb40d22bd6.81663215', 15, 1, 'Admin Presentaciones', 'Admin Presentaciones', 'admin_presentacion.php', 1),
(16, 'O5f05eb40d44094.61197172', 16, 1, 'Agregar Presentación', 'Agregar Presentación', 'agregar_presentacion.php', 0),
(17, 'O5f05eb40d66cd4.02334532', 17, 1, 'Editar Presentación', 'Editar Presentación', 'editar_presentacion.php', 0),
(18, 'O5f05eb40d880b1.22139139', 18, 0, 'Borrar Presentación', 'Borrar Presentación', 'borrar_presentacion.php', 0),
(19, 'O5f05eb40da9501.59194579', 19, 3, 'Admin Proveedores', 'Admin Proveedores', 'admin_proveedor.php', 1),
(20, 'O5f05eb40dcaa91.12494562', 20, 3, 'Agregar Proveedor', 'Agregar Proveedor', 'agregar_proveedor.php', 0),
(21, 'O5f05eb40debff4.96361423', 21, 3, 'Editar Proveedor', 'Editar Proveedor', 'editar_proveedor.php', 0),
(22, 'O5f05eb40e0c888.43765922', 22, 3, 'Borrar Proveedor', 'Borrar Proveedor', 'borrar_proveedor.php', 0),
(23, 'O5f05eb40e2d962.77880686', 23, 3, 'Ver Proveedor', 'Ver Proveedor', 'ver_proveedor.php', 0),
(24, 'O5f05eb40e4f194.15626220', 24, 4, 'Ubicaciones', 'Administrar Ubicaciones', 'admin_ubicacion.php', 1),
(25, 'O5f05eb40e708d2.43703360', 25, 4, 'Agregar Ubicación', 'Agregar  Ubicación', 'agregar_ubicacion.php', 0),
(26, 'O5f05eb40e91652.56127768', 26, 4, 'Editar Ubicación', 'Editar Ubicación', 'editar_ubicacion.php', 0),
(27, 'O5f05eb40eb23c0.97318258', 27, 4, 'Borrar Ubicación', 'Borrar Ubicación', 'borrar_ubicacion.php', 0),
(28, 'O5f05eb40ed3615.50647172', 28, 4, 'Estantes', 'Administrar Estantes', 'admin_estante.php', 1),
(29, 'O5f05eb40ef7843.15126785', 29, 4, 'Agregar Estante', 'Agregar Estante', 'agregar_estante.php', 0),
(30, 'O5f05eb40f16e09.24203944', 30, 4, 'Editar Estante', 'Editar  Estante', 'editar_estante.php', 0),
(31, 'O5f05eb40f37b60.00827457', 31, 4, 'Borrar Estante', 'Borrar  Estante', 'borrar_estante.php', 0),
(32, 'O5f05eb41017006.00931282', 32, 4, 'Admin Asignación', 'Admin Asignación', 'admin_asignacion.php', 1),
(33, 'O5f05eb41039f57.28698843', 33, 4, 'Agregar Asignación', 'Agregar Asignación', 'agregar_asignacion.php', 0),
(34, 'O5f05eb410599d1.56660408', 34, 4, 'Admin no Asignado', 'Admin no Asignado', 'admin_producto_no_asignado.php', 0),
(35, 'O5f05eb4107afe1.63279681', 35, 5, 'Pre Venta', 'Pre Venta', 'preventa.php', 1),
(36, 'O5f05eb4109c499.45761506', 36, 5, 'Venta', 'Venta', 'venta.php', 1),
(37, 'O5f05eb410bf365.82456772', 37, 6, 'Cargas de Inventario', 'Cargas de Inventario', 'ingreso_inventario.php', 1),
(38, 'O5f05eb410df348.43628305', 38, 6, 'Descargos de Inventario', 'Descargos de Inventario', 'descargo_inventario.php', 1),
(39, 'O5f05eb41100792.71390260', 39, 4, 'Movimientos', 'Movimientos', 'admin_movimiento_asignacion.php', 1),
(40, 'O5f05eb41121077.53639053', 40, 4, 'Ver Detalle Movimiento', 'Ver Detalle Movimiento', 'ver_detalle_mov.php', 0),
(41, 'O5f05eb41143fe3.20302729', 41, 7, 'Admin Corte', 'Admin Corte', 'admin_corte.php', 1),
(42, 'O5f05eb41163996.99684593', 42, 7, 'Admin Caja', 'Admin Caja', 'admin_caja.php', 0),
(43, 'O5f05eb41184aa5.98721589', 43, 8, 'Admin Créditos', 'Admin Créditos', 'admin_credito.php', 1),
(44, 'O5f05eb411a6e67.01786190', 44, 8, 'Abono Crédito', 'Abono Crédito', 'abono_credito.php', 0),
(45, 'O5f05eb411c9bd0.47966233', 45, 9, 'Admin Empleados', 'Admin Empleados', 'admin_empleado.php', 1),
(46, 'O5f05eb411e9dc6.09963749', 46, 9, 'Agregar Empleado', 'Agregar Empleado', 'agregar_empleado.php', 0),
(47, 'O5f05eb4120b712.48363516', 47, 9, 'Editar Empleado', 'Editar Empleado', 'editar_empleado.php', 0),
(48, 'O5f05eb4122d0f2.55169895', 48, 9, 'Borrar Empleado', 'Borrar Empleado', 'borrar_empleado.php', 0),
(49, 'O5f05eb4124fb23.66721793', 49, 9, 'Ver Empleado', 'Ver Empleado', 'ver_empleado.php', 0),
(50, 'O5f05eb4126ebf0.13796136', 50, 6, 'Consultar Stock', 'Consultar Stock', 'admin_stock.php', 1),
(54, 'O5f05eb4128fd77.61425381', 54, 10, 'Admin Bancos', 'Admin Bancos', 'admin_banco.php', 1),
(55, 'O5f05eb412b23e0.76265701', 55, 10, 'Agregar Banco', 'Agregar Banco', 'agregar_banco.php', 0),
(56, 'O5f05eb412d40c4.02090032', 56, 10, 'Editar Banco', 'Editar Banco', 'editar_banco.php', 0),
(57, 'O5f05eb412f42e3.98087482', 57, 10, 'Borrar Banco', 'Borrar Banco', 'borrar_banco.php', 0),
(58, 'O5f05eb41315275.52911793', 58, 10, 'Ver Banco', 'Ver Banco', 'ver_banco.php', 0),
(59, 'O5f05eb41338459.62191627', 59, 10, 'Admin Cuentas', 'Admin Cuentas', 'cuenta_banco.php', 0),
(60, 'O5f05eb4135b335.28674118', 60, 10, 'Agregar Cuenta', 'Agregar Cuenta', 'agregar_cuenta_banco.php', 0),
(61, 'O5f05eb4137c891.96084833', 61, 10, 'Editar Cuenta', 'Editar Cuenta', 'editar_cuenta_banco.php', 0),
(62, 'O5f05eb4139cd34.42773754', 62, 10, 'Borrar Cuenta', 'Borrar Cuenta', 'cuenta_banco.php', 0),
(63, 'O5f05eb413be8a1.21194885', 63, 10, 'Admin Movimientos', 'Admin Movimiento', 'admin_mov_cta_banco.php', 1),
(64, 'O5f05eb413e1a43.57423716', 64, 10, 'Agregar Movimientos', 'Agregar Movimiento', 'agreg_mov_cta_banco.php', 0),
(65, 'O5f05eb41400a87.41266529', 65, 10, 'Editar Movimientos', 'Editar Movimiento', 'editar_mov_cta_banco.php', 0),
(66, 'O5f05eb41421500.84234036', 66, 10, 'Borrar Movimientos', 'Borrar Movimiento', 'borrar_mov_cta_banco.php', 0),
(68, 'O5f05eb41442002.05211020', 68, 11, 'Admin Compras', 'Admin Compras', 'admin_compra.php', 1),
(69, 'O5f05eb41464be4.30941382', 69, 6, 'Ajuste de Inventario', 'Ajuste de Inventario', 'ajuste_inventario.php', 1),
(70, 'O5f05eb41484aa6.80497387', 70, 6, 'Reporte Ajuste', 'Reporte Ajuste', 'reporte_ajuste.php', 0),
(71, 'O5f05eb414a6d19.90850503', 71, 0, 'Hoja de conteo', 'Hoja de conteo', 'hoja_conteo.php', 0),
(72, 'O5f05eb414c88f5.96500915', 72, 12, 'Admin Pagos', 'Admin Pagos', 'admin_voucher.php', 1),
(73, 'O5f05eb414eb093.79046392', 73, 12, 'Generar Pago', 'Generar Pago', 'pago_proveedor.php', 1),
(74, 'O5f05eb4150ab35.87877289', 74, 12, 'Editar Pago', 'Editar Pago', 'editar_pago_proveedor.php', 0),
(75, 'O5f05eb4152be51.33194004', 75, 12, 'Finalizar Pago', 'Finalizar Pago', 'finalizar_mov_cta_banco.php', 0),
(76, 'O5f05eb4154d640.96305239', 76, 12, 'Imprimir Pago', 'Imprimir Pago', 'voucher.php', 0),
(77, 'O5f05eb41570b15.16047866', 77, 13, 'Admin Cotizaciones', 'Admin Cotizaciones', 'admin_cotizacion.php', 1),
(78, 'O5f05eb41591212.80473418', 78, 13, 'Agregar Cotización', 'Agregar Cotización', 'agregar_cotizacion.php', 0),
(79, 'O5f05eb415b1261.17905602', 79, 13, 'Editar Cotización', 'Editar Cotización', 'editar_cotizacion.php', 0),
(80, 'O5f05eb415d3ef8.42416532', 80, 13, 'Borrar Cotización', 'Borrar Cotización', 'borrar_cotizacion.php', 0),
(81, 'O5f05eb415f4df1.95021631', 81, 13, 'Imprimir Cotización', 'Imprimir Cotización', 'cotizacion.php', 0),
(82, 'O5f05eb41615a01.32542084', 82, 11, 'Agregar Compra', 'Agregar Compra', 'compras.php', 0),
(83, 'O5f05eb416382a4.10908511', 83, 11, 'Ver Compra', 'Ver Compra', 'ver_compra.php', 0),
(84, 'O5f05eb41658b06.18552533', 84, 6, 'Admin Ajuste', 'Admin Ajuste', 'admin_ajuste.php', 1),
(85, 'O5f05eb41678f03.39197378', 85, 14, 'Admin Traslado', 'Admin Traslado', 'admin_traslados.php', 1),
(86, 'O5f05eb4169aa19.80914362', 86, 14, 'Realizar Traslado', 'Realizar Traslado', 'traslado_producto.php', 0),
(87, 'O5f05eb416bbe71.68828167', 87, 14, 'Anular Traslado ', 'Anular Traslado ', 'anular_traslado.php', 0),
(88, 'O5f05eb417055d7.64623279', 88, 14, 'Ver Traslado ', 'Ver Traslado ', 'ver_traslado.php', 0),
(89, 'O5f05eb41728117.72018645', 89, 14, 'Reporte Traslado ', 'Reporte Traslado ', 'reporte_traslado.php', 0),
(90, 'O5f05eb4174a232.29328678', 90, 14, 'Reporte Traslado Recibido ', 'Reporte Traslado ', 'reporte_traslado.php', 0),
(91, 'O5f05eb4176a4d4.64882050', 91, 14, 'Recibir Traslado', 'Recibir Traslado', 'recibir_traslado.php', 0),
(92, 'O5f05eb4178b359.75549721', 92, 15, 'Admin Usuario', 'Admin Usuario', 'admin_usuarios.php', 1),
(93, 'O5f05eb417ac3a6.66387409', 93, 15, 'Agregar Usuario', 'Agregar Usuario', 'agregar_usuario.php', 0),
(94, 'O5f05eb417cde21.93346982', 94, 15, 'Editar Usuario', 'Editar Usuario', 'editar_usuario.php', 0),
(95, 'O5f05eb417eede2.31067181', 95, 15, 'Borrar Usuario', 'Borrar Usuario', 'borrar_usuario.php', 0),
(96, 'O5f05eb4180fce8.80401493', 96, 15, 'Permisos Usuario', 'Permisos Usuario', 'permiso_usuario.php', 0),
(97, 'O5f05eb41830fa2.52731268', 97, 15, 'Admin Empresa', 'Admin Empresa', 'admin_empresa.php', 1),
(98, 'O5f05eb41851923.59364838', 98, 16, 'Admin Pedidos', 'Admin Pedidos', 'admin_pedido.php', 1),
(99, 'O5f05eb4188d972.21223503', 99, 16, 'Agregar Pedido', 'Agregar Pedido', 'agregar_pedido.php', 0),
(100, 'O5f05eb418ae261.13604734', 100, 16, 'Editar Pedido', 'Editar Pedido', 'editar_pedido.php', 0),
(101, 'O5f05eb418cfd29.95596321', 101, 16, 'Borrar Pedido', 'Anular Pedido', 'borrar_pedido.php', 0),
(103, 'O5f05eb418f0a05.83103610', 103, 16, 'Reporte Pedido', 'Reporte Pedido', 'reporte_pedido.php', 0),
(106, 'O5f05eb41912c30.67486844', 106, 5, 'Admin Facturas', 'Admin Facturas', 'admin_factura_rangos.php', 1),
(107, 'O5f05eb419328c2.90434042', 107, 5, 'Ver Factura', 'Ver Factura', 'ver_factura.php', 0),
(108, 'O5f05eb41953a69.64081182', 108, 5, 'Reimprimir Factura ', 'Reimprimir Factura ', 'reimprimir_factura.php', 0),
(109, 'O5f05eb419750b4.84898084', 109, 5, 'Anular Factura ', 'Anular Factura ', 'anular_factura.php', 0),
(110, 'O5f05eb419974d0.00386389', 110, 5, 'Devolución', 'Devolución', 'devolucion.php', 0),
(111, 'O5f05eb419b7319.33813009', 111, 7, 'Admin Movimiento Caja', 'Admin Movimiento Caja', 'admin_movimiento_caja.php', 1),
(112, 'O5f05eb419da677.46993171', 112, 7, 'Agregar ingreso caja', 'Agregar ingreso caja', 'agregar_ingreso_caja.php', 0),
(113, 'O5f05eb41a14bb8.59855440', 113, 7, 'Agregar salida caja', 'Agregar salida caja', 'agregar_salida_caja.php', 0),
(114, 'O5f05eb41a1f576.38455241', 114, 7, 'Editar Movimiento caja', 'Editar Movimiento caja', 'editar_movimiento_caja.php', 0),
(115, 'O5f05eb41a3cf93.32857213', 115, 7, 'Imprimir Movimiento', 'Imprimir Movimiento', 'imprimir_movimiento.php', 0),
(116, 'O5f05eb41a46e63.60453754', 116, 7, 'Borrar Movimiento caja', 'Borrar Movimiento caja', 'Borrar_movimiento_caja.php', 0),
(117, 'O5f05eb41a64563.68833884', 117, 7, 'Corte de Caja', 'Corte de caja diario', 'corte_caja_diario.php', 0),
(118, 'O5f05eb41a6e815.94144447', 118, 5, 'Facturas Pendientes', 'Admin Facturas Pendientes', 'admin_pendiente_rangos.php', 1),
(119, 'O5f05eb41a8f638.74970180', 119, 0, 'Hoja de conteo', 'Hoja de conteo', 'generar_hoja.php', 0),
(120, 'O5f05eb41ab09a6.86058616', 120, 5, 'Admin Devoluciones', 'Devoluciones ', 'admin_devoluciones_rangos.php', 0),
(121, 'O5f05eb41ad25f9.66536186', 121, 17, 'Kardex', 'Reporte Kardex', 'reporte_kardex.php', 1),
(122, 'O5f05eb41af3188.68776028', 122, 17, 'Inventario', 'Inventario', 'ver_reporte_inventario.php', 1),
(123, 'O5f05eb41b25740.72140719', 123, 0, 'Libro de compras ', 'Libro de compras ', 'ver_libro_compras.php', 0),
(124, 'O5f05eb41b46565.91156608', 124, 0, 'Reposición de producto', 'Reposición de producto', 'admin_movimiento_pendiente.php', 0),
(126, 'O5f05eb41b68401.52350919', 126, 17, 'Kardex General', 'Reporte Kardex General', 'reporte_kardex_general.php', 1),
(127, 'O5f05eb41b88981.27862250', 127, 0, 'Resumen de vales', 'Resumen de vales', 'resumen_vale.php', 0),
(128, 'O5f05eb41ba97c1.56833042', 128, 0, 'Ventas a Contribuyentes', 'Libro de Ventas a Contribuyentes', 'ver_libro_ventas_a_contribuyente.php', 0),
(129, 'O5f05eb41bcaf98.66472746', 129, 0, 'Ventas a Consumidores', 'Libro de Ventas a Consumidores', 'ver_libro_ventas_a_consumidores.php', 0),
(130, 'O5f05eb41becfb1.85061161', 130, 0, 'Reporte Fiscal', 'Reporte Fiscal', 'ver_reporte_fiscal.php', 0),
(132, 'O5f05eb41c369d4.28550866', 132, 7, 'Apertura de caja', 'Apertura de caja', 'apertura_caja.php', 0),
(133, 'O5f05eb41c575d4.30502875', 133, 6, 'Administrar lotes', 'administrar lotes', 'admin_lotes.php', 1),
(134, 'O5f05eb41c78835.16429705', 134, 12, 'Admin cuentas por pagar', 'Admin cuentas por pagar', 'admin_cxp_p.php', 1),
(135, 'O5f05eb41c99d36.08775523', 135, 0, 'Admin cuentas por pagar proveedor', 'Admin cuentas por pagar proveedor', 'admin_cxp.php', 0),
(136, 'O5f05eb41cba1b5.11522091', 136, 4, 'Agregar Reasignación', 'Agregar Reasignación', 'agregar_reasignacion.php', 0),
(137, 'O5f05eb41cda5c0.73067800', 137, 15, 'Backup', 'Backup', 'backup.php', 1),
(138, 'O5f05eb41cfc287.66689246', 138, 17, 'Ticket de auditoria', 'Ticket de auditoria', 'ticket_dia.php', 1),
(139, 'O5f05eb41d1db81.80041399', 139, 0, 'Depuracion', 'Depuracion', 'depuracion.php', 0),
(140, 'O5f05eb41d3fad3.12141556', 140, 4, 'Admin transferencias', 'Admin transferencias', 'admin_transferencia.php', 1),
(141, 'O5f05eb41d5f6a5.72491309', 141, 4, 'Agregar Transferencia', 'Agregar Transferencia', 'agregar_transferencia.php', 0),
(142, 'O5f05eb41d81a81.90248161', 142, 5, 'Admin Autorización', 'Admin Autorización', 'admin_autorizacion.php', 1),
(143, 'O5f05eb41dbe234.90974124', 143, 5, 'Agregar Autorización', 'Agregar Autorización', 'agregar_autorizacion.php', 0),
(146, 'O5f05eb41dbe234.90974125', 144, 17, 'Reporte Ingresos y Egresos', 'Reporte Ingresos y Egresos', 'reporte_entrada_salida.php', 1),
(147, 'O5f05eb41dbe234.90974126', 145, 17, 'Reporte de utilidades', 'Reporte de utilidades', 'ver_reporte_utilidad.php', 1),
(144, 'O5f05eb41dbe234.90974127', 146, 17, 'Reporte de Reposicion', 'Reporte de Reposicion', 'ver_reporte_reposicion.php', 1),
(145, 'O5f05eb41dbe234.90974128', 147, 17, 'Reporte de utilidades Por dia', 'Reporte de utilidades Por dia', 'ver_reporte_utilidades_diarias.php', 1),
(68, 'O5f05eb41442002.05211020', 148, 11, 'Admin Compras Guardada', 'Admin Compras Guardada', 'admin_compra_guardada.php', 1),
(176, 'O6064ad064ae143.48077429', 149, 17, 'Reporte Z', 'Reporte Z', 'reportez.php', 1),
(0, '', 150, 5, 'Usar precio en base a porcentaje de utilidad', 'Usar precio basado en porcentaje de utilidad', 'unlock_edit_price', 0),
(0, '', 151, 18, 'Admin parqueo', 'Admin parqueo', 'admin_parqueo.php', 1),
(0, '', 152, 18, 'Admin precios de parqueo', 'Gestionar precios del parqueo', 'precios_parqueo.php', 1),
(0, '', 153, 18, 'Corte de parqueo', 'corte de parqueo', 'corte_parqueo.php', 1),
(0, '', 154, 18, 'Anular parqueo', 'Anular parqueo', 'anular_parqueo', 0),
(0, '', 155, 18, 'Admin cortes parqueo', 'Admin cortes parqueo', 'admin_cortes_parqueo.php', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_caja_tipo`
--

CREATE TABLE `movimiento_caja_tipo` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `ingreso` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_producto`
--

CREATE TABLE `movimiento_producto` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `correlativo` varchar(20) NOT NULL,
  `concepto` varchar(250) NOT NULL,
  `total` float NOT NULL,
  `tipo` varchar(13) CHARACTER SET utf8 NOT NULL,
  `proceso` varchar(50) NOT NULL,
  `referencia` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_suc_origen` int(11) NOT NULL,
  `id_suc_destino` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_traslado` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `conteo` varchar(100) NOT NULL,
  `sistema` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimiento_producto`
--

INSERT INTO `movimiento_producto` (`id_server`, `unique_id`, `id_sucursal`, `id_movimiento`, `correlativo`, `concepto`, `total`, `tipo`, `proceso`, `referencia`, `id_empleado`, `fecha`, `hora`, `id_suc_origen`, `id_suc_destino`, `id_proveedor`, `id_compra`, `id_traslado`, `id_factura`, `numero`, `conteo`, `sistema`) VALUES
(0, 'S62b9d286df1b32.96507683', 1, 1, '0000002_II', 'INVENTARIO INICIAL', 2750, 'ENTRADA', 'II', 2, 1, '2022-06-27', '09:53:42', 1, 1, 0, 0, 0, 0, 0, '', ''),
(0, 'S62bc9438eba858.24823655', 1, 2, '0000000005_TIK', 'VENTA', 6.75, 'SALIDA', 'TIK', 5, 1, '2022-06-29', '12:04:40', 1, 1, 0, 0, 0, 1, 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_producto_detalle`
--

CREATE TABLE `movimiento_producto_detalle` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_server_prod` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `costo` float NOT NULL,
  `precio` float NOT NULL,
  `stock_anterior` decimal(11,4) NOT NULL,
  `stock_actual` decimal(11,4) NOT NULL,
  `proceso` varchar(50) NOT NULL,
  `referencia` int(11) NOT NULL,
  `lote` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimiento_producto_detalle`
--

INSERT INTO `movimiento_producto_detalle` (`id_server`, `unique_id`, `id_sucursal`, `id_detalle`, `id_movimiento`, `id_producto`, `id_server_prod`, `id_presentacion`, `id_server_presen`, `cantidad`, `costo`, `precio`, `stock_anterior`, `stock_actual`, `proceso`, `referencia`, `lote`, `fecha`, `hora`) VALUES
(0, 'S62b9d286e147b6.35858320', 0, 1, 1, 1, 0, 1, 0, '550.0000', 5, 6.75, '0.0000', '550.0000', '', 0, 2, '2022-06-27', '09:53:42'),
(0, 'S62bc9438ee21d8.62858284', 0, 2, 2, 1, 0, 1, 0, '1.0000', 5, 6.75, '550.0000', '549.0000', '', 0, 0, '2022-06-29', '12:04:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_producto_pendiente`
--

CREATE TABLE `movimiento_producto_pendiente` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_server_prod` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `costo` decimal(11,4) NOT NULL,
  `precio` decimal(11,4) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `repuesto` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_stock_ubicacion`
--

CREATE TABLE `movimiento_stock_ubicacion` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_server_prod` int(11) NOT NULL,
  `id_origen` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `anulada` int(11) NOT NULL,
  `afecta` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL,
  `id_mov_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimiento_stock_ubicacion`
--

INSERT INTO `movimiento_stock_ubicacion` (`id_server`, `unique_id`, `id_sucursal`, `id_movimiento`, `id_producto`, `id_server_prod`, `id_origen`, `id_destino`, `cantidad`, `fecha`, `hora`, `anulada`, `afecta`, `id_presentacion`, `id_server_presen`, `id_mov_prod`) VALUES
(0, 'S62b9d286e2fea8.18545992', 1, 1, 1, 0, 0, 1, '550.0000', '2022-06-27', '09:53:42', 0, 0, 1, 0, 1),
(0, 'S62bc9438eda489.65079136', 1, 2, 1, 0, 1, 0, '1.0000', '2022-06-29', '12:04:40', 0, 0, 1, 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mov_caja`
--

CREATE TABLE `mov_caja` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(1) DEFAULT NULL,
  `id_movimiento` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_empleado` int(1) DEFAULT NULL,
  `idtransace` int(11) NOT NULL,
  `alias_tipodoc` char(4) NOT NULL,
  `numero_doc` varchar(30) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `concepto` varchar(50) DEFAULT NULL,
  `corte` int(1) DEFAULT NULL,
  `cobrado` tinyint(1) NOT NULL,
  `cliente` varchar(40) NOT NULL,
  `duui` varchar(10) NOT NULL,
  `entrada` tinyint(1) NOT NULL,
  `salida` tinyint(1) NOT NULL,
  `anulado` tinyint(1) NOT NULL,
  `turno` int(11) NOT NULL,
  `id_apertura` int(11) NOT NULL,
  `nombre_recibe` varchar(100) NOT NULL,
  `nombre_autoriza` varchar(100) NOT NULL,
  `nombre_proveedor` varchar(100) NOT NULL,
  `iva` float NOT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mov_cta_banco`
--

CREATE TABLE `mov_cta_banco` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `alias_tipodoc` varchar(15) NOT NULL,
  `numero_doc` varchar(50) NOT NULL,
  `entrada` float NOT NULL,
  `salida` float NOT NULL,
  `saldo` float NOT NULL,
  `fecha` date NOT NULL,
  `responsable` varchar(150) NOT NULL,
  `concepto` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_municipio` int(11) NOT NULL COMMENT 'ID del municipio',
  `nombre_municipio` varchar(60) NOT NULL COMMENT 'Nombre del municipio',
  `id_departamento_municipio` int(11) NOT NULL COMMENT 'Departamento al cual pertenece el municipio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Municipios de El Salvador';

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id_server`, `unique_id`, `id_municipio`, `nombre_municipio`, `id_departamento_municipio`) VALUES
(1, 'O5f05eb4264d952.15071005', 1, 'Ahuachapán', 1),
(2, 'O5f05eb4265ea72.47300429', 2, 'Jujutla', 1),
(3, 'O5f05eb4267f051.21192471', 3, 'Atiquizaya', 1),
(4, 'O5f05eb426a1481.75000987', 4, 'Concepción de Ataco', 1),
(5, 'O5f05eb426c2638.25299786', 5, 'El Refugio', 1),
(6, 'O5f05eb426e3358.06449427', 6, 'Guaymango', 1),
(7, 'O5f05eb42704a19.90851594', 7, 'Apaneca', 1),
(8, 'O5f05eb42725ce0.10749991', 8, 'San Francisco Menéndez', 1),
(9, 'O5f05eb427472f8.95859854', 9, 'San Lorenzo', 1),
(10, 'O5f05eb427682d2.47552413', 10, 'San Pedro Puxtla', 1),
(11, 'O5f05eb427890d9.61936292', 11, 'Tacuba', 1),
(12, 'O5f05eb427a9be4.60522321', 12, 'Turín', 1),
(13, 'O5f05eb427f1a54.79660319', 13, 'Candelaria de la Frontera', 2),
(14, 'O5f05eb42811745.68066749', 14, 'Chalchuapa', 2),
(15, 'O5f05eb42833143.17645082', 15, 'Coatepeque', 2),
(16, 'O5f05eb428537b6.74300373', 16, 'El Congo', 2),
(17, 'O5f05eb42874a19.86408779', 17, 'El Porvenir', 2),
(18, 'O5f05eb42895ef7.61512454', 18, 'Masahuat', 2),
(19, 'O5f05eb428b6a43.87092835', 19, 'Metapán', 2),
(20, 'O5f05eb42902040.21580209', 20, 'San Antonio Pajonal', 2),
(21, 'O5f05eb42924d29.87679285', 21, 'San Sebastián Salitrillo', 2),
(22, 'O5f05eb42943e20.02147314', 22, 'Santa Ana', 2),
(23, 'O5f05eb42964de8.91476992', 23, 'Santa Rosa Guachipilín', 2),
(24, 'O5f05eb42985802.56729999', 24, 'Santiago de la Frontera', 2),
(25, 'O5f05eb429a8963.83041979', 25, 'Texistepeque', 2),
(26, 'O5f05eb429c7183.58337306', 26, 'Acajutla', 3),
(27, 'O5f05eb429ea416.78572954', 27, 'Armenia', 3),
(28, 'O5f05eb42a0c047.70284121', 28, 'Caluco', 3),
(29, 'O5f05eb42a2d5e8.80867855', 29, 'Cuisnahuat', 3),
(30, 'O5f05eb42a4e2f8.06252531', 30, 'Izalco', 3),
(31, 'O5f05eb42a6f608.71345193', 31, 'Juayúa', 3),
(32, 'O5f05eb42a91472.33209333', 32, 'Nahuizalco', 3),
(33, 'O5f05eb42ad7680.71065217', 33, 'Nahulingo', 3),
(34, 'O5f05eb42af7eb6.33729739', 34, 'Salcoatitán', 3),
(35, 'O5f05eb42b19201.45637142', 35, 'San Antonio del Monte', 3),
(36, 'O5f05eb42b3ac84.84193324', 36, 'San Julián', 3),
(37, 'O5f05eb42b5b759.58332190', 37, 'Santa Catarina Masahuat', 3),
(38, 'O5f05eb42b7c234.95068298', 38, 'Santa Isabel Ishuatán', 3),
(39, 'O5f05eb42b9d785.57966286', 39, 'Santo Domingo de Guzmán', 3),
(40, 'O5f05eb42bbf058.86086664', 40, 'Sonsonate', 3),
(41, 'O5f05eb42bdfce9.65358959', 41, 'Sonzacate', 3),
(42, 'O5f05eb42c00d87.97895616', 42, 'Alegría', 4),
(43, 'O5f05eb42c21b35.23161731', 43, 'Berlín', 11),
(44, 'O5f05eb42c42c20.90100095', 44, 'California', 11),
(45, 'O5f05eb42c63a60.90007833', 45, 'Concepción Batres', 11),
(46, 'O5f05eb42cacb43.85341637', 46, 'El Triunfo', 11),
(47, 'O5f05eb42ccd506.70382492', 47, 'Ereguayquín', 11),
(48, 'O5f05eb42cee9f7.49901962', 48, 'Estanzuelas', 11),
(49, 'O5f05eb42d0f750.62511213', 49, 'Jiquilisco', 11),
(50, 'O5f05eb42d30901.12027912', 50, 'Jucuapa', 11),
(51, 'O5f05eb42d51472.35479417', 51, 'Jucuarán', 11),
(52, 'O5f05eb42d73848.57527076', 52, 'Mercedes Umaña', 11),
(53, 'O5f05eb42d935c1.39809065', 53, 'Nueva Granada', 11),
(54, 'O5f05eb42db4e08.22288885', 54, 'Ozatlán', 11),
(55, 'O5f05eb42dd57a6.67982781', 55, 'Puerto El Triunfo', 11),
(56, 'O5f05eb42df83d1.54884971', 56, 'San Agustín', 11),
(57, 'O5f05eb42e32ba2.87235273', 57, 'San Buenaventura', 11),
(58, 'O5f05eb42e55075.70708293', 58, 'San Dionisio', 11),
(59, 'O5f05eb42e75fe0.00677079', 59, 'San Francisco Javier', 11),
(60, 'O5f05eb42e97249.69563140', 60, 'Santa Elena', 11),
(61, 'O5f05eb42eb8732.03756217', 61, 'Santa María', 11),
(62, 'O5f05eb42ed8198.32347920', 62, 'Santiago de María', 11),
(63, 'O5f05eb42efaf67.09449228', 63, 'Tecapán', 11),
(64, 'O5f05eb42f1ce06.43393936', 64, 'Usulután', 11),
(65, 'O5f05eb42f3e233.37455682', 65, 'Carolina', 13),
(66, 'O5f05eb43029053.54346498', 66, 'Chapeltique', 13),
(67, 'O5f05eb4304aac5.67620258', 67, 'Chinameca', 13),
(68, 'O5f05eb4306c906.48720060', 68, 'Chirilagua', 13),
(69, 'O5f05eb4308c941.64825385', 69, 'Ciudad Barrios', 13),
(70, 'O5f05eb430ada27.10262517', 70, 'Comacarán', 13),
(71, 'O5f05eb430ce605.86122295', 71, 'El Tránsito', 13),
(72, 'O5f05eb430f0226.46271024', 72, 'Lolotique', 13),
(73, 'O5f05eb431116e9.12914046', 73, 'Moncagua', 13),
(74, 'O5f05eb431329c4.06632274', 74, 'Nueva Guadalupe', 13),
(75, 'O5f05eb43156539.66160814', 75, 'Nuevo Edén de San Juan', 13),
(76, 'O5f05eb43175cf7.31457112', 76, 'Quelepa', 13),
(77, 'O5f05eb43197706.76543826', 77, 'San Antonio del Mosco', 13),
(78, 'O5f05eb431b7cf0.62422369', 78, 'San Gerardo', 13),
(79, 'O5f05eb431fed59.30370748', 79, 'San Jorge', 13),
(80, 'O5f05eb4321eec1.45189537', 80, 'San Luis de la Reina', 13),
(81, 'O5f05eb43240712.48344769', 81, 'San Miguel', 13),
(82, 'O5f05eb432618d5.91097735', 82, 'San Rafael Oriente', 13),
(83, 'O5f05eb43284a81.42444058', 83, 'Sesori', 13),
(84, 'O5f05eb432a4a23.22092227', 84, 'Uluazapa', 13),
(85, 'O5f05eb432c5e86.89033440', 85, 'Arambala', 12),
(86, 'O5f05eb432e6814.55484062', 86, 'Cacaopera', 12),
(87, 'O5f05eb433085f4.08007347', 87, 'Chilanga', 12),
(88, 'O5f05eb43328a97.90608276', 88, 'Corinto', 12),
(89, 'O5f05eb43349d89.88774485', 89, 'Delicias de Concepción', 12),
(90, 'O5f05eb4336af43.87810935', 90, 'El Divisadero', 12),
(91, 'O5f05eb4338d691.77333479', 91, 'El Rosario', 12),
(92, 'O5f05eb433ad522.08954035', 92, 'Gualococti', 12),
(93, 'O5f05eb433fa904.49888055', 93, 'Guatajiagua', 12),
(94, 'O5f05eb4341ba60.95447922', 94, 'Joateca', 12),
(95, 'O5f05eb4343dc42.95830046', 95, 'Jocoaitique', 12),
(96, 'O5f05eb4345dc29.12465360', 96, 'Jocoro', 12),
(97, 'O5f05eb4347f0e2.83946693', 97, 'Lolotiquillo', 12),
(98, 'O5f05eb434a0b54.38512421', 98, 'Meanguera', 12),
(99, 'O5f05eb434c2919.95373960', 99, 'Osicala', 12),
(100, 'O5f05eb4350b078.43105775', 100, 'Perquín', 12),
(101, 'O5f05eb4352bc14.51191186', 101, 'San Carlos', 12),
(102, 'O5f05eb4354d534.05069864', 102, 'San Fernando', 12),
(103, 'O5f05eb43570036.04604032', 103, 'San Francisco Gotera', 12),
(104, 'O5f05eb4358fee8.43876916', 104, 'San Isidro', 12),
(105, 'O5f05eb435b0dd5.77072355', 105, 'San Simón', 12),
(106, 'O5f05eb435d26b5.21794520', 106, 'Sensembra', 12),
(107, 'O5f05eb435f4ba7.63030805', 107, 'Sociedad', 12),
(108, 'O5f05eb43615960.58493714', 108, 'Torola', 12),
(109, 'O5f05eb436382f8.01080123', 109, 'Yamabal', 12),
(110, 'O5f05eb4365a832.07581480', 110, 'Yoloaiquín', 12),
(111, 'O5f05eb4367b440.37051463', 111, 'La Unión', 14),
(112, 'O5f05eb4369b6d0.05875922', 112, 'San Alejo', 14),
(113, 'O5f05eb436e08f0.85916902', 113, 'Yucuaiquín', 14),
(114, 'O5f05eb43701c02.38900619', 114, 'Conchagua', 14),
(115, 'O5f05eb437240b6.72431998', 115, 'Intipucá', 14),
(116, 'O5f05eb43744c35.53626094', 116, 'San José', 14),
(117, 'O5f05eb43765e25.74171455', 117, 'El Carmen', 14),
(118, 'O5f05eb43787312.01082444', 118, 'Yayantique', 14),
(119, 'O5f05eb437a86e6.43588326', 119, 'Bolívar', 14),
(120, 'O5f05eb437c9405.45366969', 120, 'Meanguera del Golfo', 14),
(121, 'O5f05eb437ea4f3.40548376', 121, 'Santa Rosa de Lima', 14),
(122, 'O5f05eb4380c3a2.36689096', 122, 'Pasaquina', 14),
(123, 'O5f05eb4382f539.91746309', 123, 'ANAMOROS', 14),
(124, 'O5f05eb43865cb0.30855251', 124, 'Nueva Esparta', 14),
(125, 'O5f05eb43887e91.04337986', 125, 'El Sauce', 14),
(126, 'O5f05eb438a8e11.88984619', 126, 'Concepción de Oriente', 14),
(127, 'O5f05eb438cbad6.00073278', 127, 'Polorós', 14),
(128, 'O5f05eb438eca00.26586173', 128, 'Lislique ', 14),
(129, 'O5f05eb4390ce97.62965718', 129, 'Antiguo Cuscatlán', 4),
(130, 'O5f05eb4392e782.16690249', 130, 'Chiltiupán', 4),
(131, 'O5f05eb43950bd7.53431337', 131, 'Ciudad Arce', 4),
(132, 'O5f05eb43971173.96966638', 132, 'Colón', 4),
(133, 'O5f05eb43992a64.38671662', 133, 'Comasagua', 4),
(134, 'O5f05eb439b4d31.70667489', 134, 'Huizúcar', 4),
(135, 'O5f05eb439d85b0.82054150', 135, 'Jayaque', 4),
(136, 'O5f05eb439f8a79.71048352', 136, 'Jicalapa', 4),
(137, 'O5f05eb43a3b956.76906165', 137, 'La Libertad', 4),
(138, 'O5f05eb43a5c2a3.16151455', 138, 'Santa Tecla', 4),
(139, 'O5f05eb43a7e2f7.74842941', 139, 'Nuevo Cuscatlán', 4),
(140, 'O5f05eb43a9ecd9.11754201', 140, 'San Juan Opico', 4),
(141, 'O5f05eb43abf651.44883048', 141, 'Quezaltepeque', 4),
(142, 'O5f05eb43ae0ed3.24688945', 142, 'Sacacoyo', 4),
(143, 'O5f05eb43b01fa1.76900007', 143, 'San José Villanueva', 4),
(144, 'O5f05eb43b4e2e7.99527578', 144, 'San Matías', 4),
(145, 'O5f05eb43b6ed35.03472043', 145, 'San Pablo Tacachico', 4),
(146, 'O5f05eb43b904b7.54054197', 146, 'Talnique', 4),
(147, 'O5f05eb43bb26c2.81158148', 147, 'Tamanique', 4),
(148, 'O5f05eb43bd3935.13786729', 148, 'Teotepeque', 4),
(149, 'O5f05eb43bf51e0.18640656', 149, 'Tepecoyo', 4),
(150, 'O5f05eb43c15a06.79911254', 150, 'Zaragoza', 4),
(151, 'O5f05eb43c383d2.09812516', 151, 'Agua Caliente', 5),
(152, 'O5f05eb43c5a2a6.40045407', 152, 'Arcatao', 5),
(153, 'O5f05eb43c7b346.77973094', 153, 'Azacualpa', 5),
(154, 'O5f05eb43c9bd59.11262361', 154, 'Cancasque', 5),
(155, 'O5f05eb43cbdfd7.12347728', 155, 'Chalatenango', 5),
(156, 'O5f05eb43cded28.78886347', 156, 'Citalá', 5),
(157, 'O5f05eb43d00d78.86427667', 157, 'Comapala', 5),
(158, 'O5f05eb43d22cd4.70034693', 158, 'Concepción Quezaltepeque', 5),
(159, 'O5f05eb43d44100.51740729', 159, 'Dulce Nombre de María', 5),
(160, 'O5f05eb43d64fd3.34748606', 160, 'El Carrizal', 5),
(161, 'O5f05eb43d86e37.46591278', 161, 'El Paraíso', 5),
(162, 'O5f05eb43da9063.98127434', 162, 'La Laguna', 5),
(163, 'O5f05eb43dc9d20.74587296', 163, 'La Palma', 5),
(164, 'O5f05eb43deb548.24007242', 164, 'La Reina', 5),
(165, 'O5f05eb43e0cf72.72980681', 165, 'Las Vueltas', 5),
(166, 'O5f05eb43e2da30.93023545', 166, 'Nueva Concepción', 5),
(167, 'O5f05eb43e50482.14655158', 167, 'Nueva Trinidad', 5),
(168, 'O5f05eb43e70595.24075927', 168, 'Nombre de Jesús', 5),
(169, 'O5f05eb43e91b42.37983337', 169, 'Ojos de Agua', 5),
(170, 'O5f05eb43ecefa1.07515783', 170, 'Potonico', 5),
(171, 'O5f05eb43ef1979.46162784', 171, 'San Antonio de la Cruz', 5),
(172, 'O5f05eb43f12909.46587691', 172, 'San Antonio Los Ranchos', 5),
(173, 'O5f05eb43f33dd2.59992011', 173, 'San Fernando', 5),
(174, 'O5f05eb440132c2.56115941', 174, 'San Francisco Lempa', 5),
(175, 'O5f05eb44034c57.66724213', 175, 'San Francisco Morazán', 5),
(176, 'O5f05eb44056369.02204107', 176, 'San Ignacio', 5),
(177, 'O5f05eb44077196.59106514', 177, 'San Isidro Labrador', 5),
(178, 'O5f05eb44097dd5.53296263', 178, 'Las Flores', 5),
(179, 'O5f05eb440ba167.61483562', 179, 'San Luis del Carmen', 5),
(180, 'O5f05eb440dab97.74794336', 180, 'San Miguel de Mercedes', 5),
(181, 'O5f05eb440fc222.54723805', 181, 'San Rafael', 5),
(182, 'O5f05eb4411d1e1.80466872', 182, 'Santa Rita', 5),
(183, 'O5f05eb44162de1.72653055', 183, 'Tejutla', 5),
(184, 'O5f05eb44183749.29254038', 184, 'Cojutepeque', 7),
(185, 'O5f05eb441a4c05.27365158', 185, 'Candelaria', 7),
(186, 'O5f05eb441c65a6.91473808', 186, 'El Carmen', 7),
(187, 'O5f05eb441e7fd9.97684321', 187, 'El Rosario', 7),
(188, 'O5f05eb44208b93.95752804', 188, 'Monte San Juan', 7),
(189, 'O5f05eb4422a624.91391840', 189, 'Oratorio de Concepción', 7),
(190, 'O5f05eb4424d702.42295795', 190, 'San Bartolomé Perulapía', 7),
(191, 'O5f05eb4426fe35.58142984', 191, 'San Cristóbal', 7),
(192, 'O5f05eb4428ffb1.36565676', 192, 'San José Guayabal', 7),
(193, 'O5f05eb442b1747.64101753', 193, 'San Pedro Perulapán', 7),
(194, 'O5f05eb442d2432.26517052', 194, 'San Rafael Cedros', 7),
(195, 'O5f05eb442f4745.39970580', 195, 'San Ramón', 7),
(196, 'O5f05eb44316be5.55093327', 196, 'Santa Cruz Analquito', 7),
(197, 'O5f05eb44337a56.14023542', 197, 'Santa Cruz Michapa', 7),
(198, 'O5f05eb443594e7.84750089', 198, 'Suchitoto', 7),
(199, 'O5f05eb443864d8.64866099', 199, 'Tenancingo', 7),
(200, 'O5f05eb443a7d65.92947112', 200, 'Aguilares', 6),
(201, 'O5f05eb443c8475.65666050', 201, 'Apopa', 6),
(202, 'O5f05eb443e9968.39304034', 202, 'Ayutuxtepeque', 6),
(203, 'O5f05eb4440c002.73328974', 203, 'Cuscatancingo', 6),
(204, 'O5f05eb4442cdb6.55099914', 204, 'Ciudad Delgado', 6),
(205, 'O5f05eb4444e499.31684350', 205, 'El Paisnal', 6),
(206, 'O5f05eb4446eb88.77142559', 206, 'Guazapa', 6),
(207, 'O5f05eb44491940.91071840', 207, 'Ilopango', 6),
(208, 'O5f05eb444b2a47.22613167', 208, 'Mejicanos', 6),
(209, 'O5f05eb444d3fc1.96627178', 209, 'Nejapa', 6),
(210, 'O5f05eb444f40e0.20552756', 210, 'Panchimalco', 6),
(211, 'O5f05eb44516469.42697774', 211, 'Rosario de Mora', 6),
(212, 'O5f05eb4455a5d1.21969657', 212, 'San Marcos', 6),
(213, 'O5f05eb4457a8c4.23190478', 213, 'San Martín', 6),
(214, 'O5f05eb4459d143.43937866', 214, 'San Salvador', 6),
(215, 'O5f05eb445bd872.80905098', 215, 'Santiago Texacuangos', 6),
(216, 'O5f05eb445ddb52.33034181', 216, 'Santo Tomás', 6),
(217, 'O5f05eb445ffeb7.88786232', 217, 'Soyapango', 6),
(218, 'O5f05eb44621477.16404241', 218, 'Tonacatepeque', 6),
(219, 'O5f05eb44642a89.53125309', 219, 'Zacatecoluca', 8),
(220, 'O5f05eb44663b92.84389355', 220, 'Cuyultitán', 8),
(221, 'O5f05eb44684716.06548139', 221, 'El Rosario', 8),
(222, 'O5f05eb446a6885.53363669', 222, 'Jerusalén', 8),
(223, 'O5f05eb446c9869.72549157', 223, 'Mercedes La Ceiba', 8),
(224, 'O5f05eb446e9740.34568326', 224, 'Olocuilta', 8),
(225, 'O5f05eb4472f793.55978479', 225, 'Paraíso de Osorio', 8),
(226, 'O5f05eb44750482.08296257', 226, 'San Antonio Masahuat', 8),
(227, 'O5f05eb447728a5.60939595', 227, 'San Emigdio', 8),
(228, 'O5f05eb44793575.82334506', 228, 'San Francisco Chinameca', 8),
(229, 'O5f05eb447b5428.18831978', 229, 'San Pedro Masahuat', 8),
(230, 'O5f05eb447d7057.24976777', 230, 'San Juan Nonualco', 8),
(231, 'O5f05eb447f8a89.30305300', 231, 'San Juan Talpa', 8),
(232, 'O5f05eb44840236.55670989', 232, 'San Juan Tepezontes', 8),
(233, 'O5f05eb448614c1.93648435', 233, 'San Luis La Herradura', 8),
(234, 'O5f05eb44882a57.26774057', 234, 'San Luis Talpa', 8),
(235, 'O5f05eb448a64a0.72398721', 235, 'San Miguel Tepezontes', 8),
(236, 'O5f05eb448c5949.51698908', 236, 'San Pedro Nonualco', 8),
(237, 'O5f05eb448e6c37.32770062', 237, 'San Rafael Obrajuelo', 8),
(238, 'O5f05eb44907f69.35989729', 238, 'Santa María Ostuma', 8),
(239, 'O5f05eb4492ab67.21133439', 239, 'Santiago Nonualco', 8),
(240, 'O5f05eb44949dc5.76415345', 240, 'Tapalhuaca', 8),
(241, 'O5f05eb4498a704.23388914', 241, 'Cinquera', 9),
(242, 'O5f05eb449952b7.57546222', 242, 'Dolores', 9),
(243, 'O5f05eb449b6136.71549893', 243, 'Guacotecti', 9),
(244, 'O5f05eb449d9e36.72393453', 244, 'Ilobasco', 9),
(245, 'O5f05eb449fe279.44820497', 245, 'Jutiapa', 9),
(246, 'O5f05eb44a1f0e0.22683119', 246, 'San Isidro', 9),
(247, 'O5f05eb44a3ffd4.49844589', 247, 'Sensuntepeque', 9),
(248, 'O5f05eb44a62268.92413116', 248, 'Tejutepeque', 9),
(249, 'O5f05eb44a82547.93617534', 249, 'Victoria', 9),
(250, 'O5f05eb44aa4284.11847000', 250, 'Apastepeque', 10),
(251, 'O5f05eb44ac5323.67747106', 251, 'Guadalupe', 10),
(252, 'O5f05eb44ae81f4.44127984', 252, 'San Cayetano Istepeque', 10),
(253, 'O5f05eb44b08eb3.47856753', 253, 'San Esteban Catarina', 10),
(254, 'O5f05eb44b29a65.99025393', 254, 'San Ildefonso', 10),
(255, 'O5f05eb44b4b4f8.20837842', 255, 'San Lorenzo', 10),
(256, 'O5f05eb44b6d0b9.09618531', 256, 'San Sebastián', 10),
(257, 'O5f05eb44b8d1e7.79856619', 257, 'San Vicente', 10),
(258, 'O5f05eb44baff40.20065560', 258, 'Santa Clara', 10),
(259, 'O5f05eb44bd11d9.51326535', 259, 'Santo Domingo', 10),
(260, 'O5f05eb44bf36b8.02873900', 260, 'Tecoluca', 10),
(261, 'O5f05eb44c13e63.25290676', 261, 'Tepetitán', 10),
(262, 'O5f05eb44c34e58.45874013', 262, 'Verapaz', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nc_corte`
--

CREATE TABLE `nc_corte` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_nc` int(11) NOT NULL,
  `id_corte` int(11) NOT NULL,
  `n_nc` int(11) NOT NULL,
  `t_nc` double NOT NULL,
  `afecta` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `exento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id` int(11) NOT NULL,
  `iso` char(2) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parqueo`
--

CREATE TABLE `parqueo` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_parqueo` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `entrada` time NOT NULL,
  `salida` time DEFAULT NULL,
  `total` decimal(10,2) DEFAULT 0.00,
  `numero_doc` varchar(30) DEFAULT NULL,
  `eliminado` tinyint(4) DEFAULT 0,
  `anulada` tinyint(4) NOT NULL,
  `id_corte_parqueo` int(11) NOT NULL COMMENT 'si este campo es cero, el registro se incluye en un nuevo corte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parqueo_precios`
--

CREATE TABLE `parqueo_precios` (
  `id_precio_parqueo` int(11) NOT NULL,
  `precio_hora` decimal(10,2) NOT NULL,
  `precio_fraccion` decimal(10,2) NOT NULL,
  `minutos_fraccion` tinyint(4) NOT NULL COMMENT 'Minutos los cuales equivale la fracción',
  `deleted` date DEFAULT NULL,
  `id_sucursal` smallint(6) NOT NULL,
  `activo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parqueo_precios`
--

INSERT INTO `parqueo_precios` (`id_precio_parqueo`, `precio_hora`, `precio_fraccion`, `minutos_fraccion`, `deleted`, `id_sucursal`, `activo`) VALUES
(1, '1.00', '1.00', 60, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `numero_doc` varchar(30) NOT NULL,
  `total` float NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT 0,
  `id_sucursal` int(11) NOT NULL,
  `finalizada` tinyint(1) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `lugar_entrega` varchar(80) CHARACTER SET utf8 NOT NULL,
  `transporte` varchar(20) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `observaciones` text CHARACTER SET utf8 NOT NULL,
  `hash` varchar(60) NOT NULL,
  `hora_pedido` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_pedido_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_prod_serv` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` float NOT NULL,
  `subtotal` float NOT NULL,
  `combo` tinyint(1) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `tipo_prod_serv` varchar(30) NOT NULL COMMENT 'PRODUCTO o SERVICIO',
  `id_sucursal` int(11) NOT NULL,
  `cant_facturado` float NOT NULL,
  `unidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_prov`
--

CREATE TABLE `pedido_prov` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_pedido_prov` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `numero` varchar(30) NOT NULL,
  `total` float NOT NULL,
  `id_empleado_proceso` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha_factura` date NOT NULL,
  `numero_factura` varchar(50) NOT NULL,
  `id_empleado_factura` int(11) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `lugar_entrega` varchar(80) CHARACTER SET utf8 NOT NULL,
  `reservado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_prov_detalle`
--

CREATE TABLE `pedido_prov_detalle` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_pedido_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `cantidad_enviar` decimal(11,4) NOT NULL,
  `precio_venta` decimal(11,4) NOT NULL,
  `subtotal` decimal(11,2) NOT NULL,
  `tipo_prod_serv` varchar(30) NOT NULL COMMENT 'PRODUCTO o SERVICIO',
  `id_sucursal` int(11) NOT NULL,
  `cant_facturado` decimal(11,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posicion`
--

CREATE TABLE `posicion` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_posicion` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `id_estante` int(11) NOT NULL,
  `posicion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_aut`
--

CREATE TABLE `precio_aut` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id` int(11) NOT NULL,
  `clave` varchar(6) NOT NULL,
  `aplicado` tinyint(4) NOT NULL,
  `id_sucursal` tinyint(4) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_generado` date NOT NULL,
  `fecha_aplicado` date NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `precio_aut`
--

INSERT INTO `precio_aut` (`id_server`, `unique_id`, `id`, `clave`, `aplicado`, `id_sucursal`, `id_usuario`, `fecha_generado`, `fecha_aplicado`, `precio`) VALUES
(1, 'O5f05eb44c9ab72.54213199', 1, 'ca9mj8', 1, 1, 1, '2020-06-23', '2020-06-23', 3),
(0, 'S5f9dd8ce571579.21050526', 2, 'y1asif', 1, 1, 9, '2020-10-31', '2020-10-31', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`id_server`, `unique_id`, `id_sucursal`, `id_presentacion`, `nombre`, `descripcion`) VALUES
(0, 'S62b9d102ebe6b6.12693592', 0, 1, 'Unidad', '1x1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion_producto`
--

CREATE TABLE `presentacion_producto` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_pp` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_server_prod` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `descripcion` varchar(20) CHARACTER SET utf8 NOT NULL,
  `unidad` float NOT NULL,
  `costo` decimal(10,4) NOT NULL,
  `costo_s_iva` int(11) NOT NULL,
  `precio` decimal(12,4) NOT NULL,
  `precio1` decimal(12,4) NOT NULL,
  `precio2` decimal(12,4) NOT NULL,
  `precio3` decimal(12,4) NOT NULL,
  `precio4` decimal(12,4) NOT NULL,
  `precio5` decimal(12,4) NOT NULL,
  `precio6` decimal(12,4) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `barcode` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `presentacion_producto`
--

INSERT INTO `presentacion_producto` (`id_server`, `unique_id`, `id_pp`, `id_producto`, `id_server_prod`, `id_presentacion`, `descripcion`, `unidad`, `costo`, `costo_s_iva`, `precio`, `precio1`, `precio2`, `precio3`, `precio4`, `precio5`, `precio6`, `activo`, `barcode`) VALUES
(0, 'S62b9d240bbb816.67087285', 1, 1, 0, 1, 'Producto de pruebas', 1, '5.0000', 0, '6.7500', '7.0000', '7.5000', '0.0000', '0.0000', '0.0000', '0.0000', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_server` int(11) NOT NULL,
  `unique_id` text COLLATE utf8_spanish_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `barcode` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `codart` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(250) CHARACTER SET latin1 NOT NULL,
  `composicion` text COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(100) CHARACTER SET latin1 NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `perecedero` tinyint(1) NOT NULL,
  `exento` tinyint(1) NOT NULL,
  `minimo` int(11) NOT NULL,
  `decimals` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `imagen` varchar(250) CHARACTER SET latin1 NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `costo` float NOT NULL,
  `precio` float NOT NULL,
  `precio_mayoreo` float NOT NULL,
  `color` text COLLATE utf8_spanish_ci NOT NULL,
  `eval` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_server`, `unique_id`, `id_producto`, `barcode`, `codart`, `descripcion`, `composicion`, `marca`, `estado`, `perecedero`, `exento`, `minimo`, `decimals`, `id_categoria`, `id_proveedor`, `imagen`, `id_sucursal`, `costo`, `precio`, `precio_mayoreo`, `color`, `eval`) VALUES
(0, 'S62b9d240b9c638.37072989', 1, '', '1', 'PRODUCTO DE PRUEBA', '', 'OSS', 1, 0, 0, 20, 0, 1, 1, '', 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `categoria` int(1) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL,
  `codigoant` int(3) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `municipio` varchar(20) DEFAULT NULL,
  `depto` varchar(12) DEFAULT NULL,
  `pais` varchar(10) DEFAULT NULL,
  `contacto` varchar(40) DEFAULT NULL,
  `nrc` varchar(8) DEFAULT NULL,
  `nit` varchar(17) DEFAULT NULL,
  `dui` varchar(12) DEFAULT NULL,
  `giro` varchar(40) DEFAULT NULL,
  `telefono1` varchar(15) DEFAULT NULL,
  `telefono2` varchar(15) DEFAULT NULL,
  `celular` varchar(15) NOT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ultcompra` date DEFAULT NULL,
  `acumulado` int(1) DEFAULT NULL,
  `saldo` int(1) DEFAULT NULL,
  `percibe` int(1) DEFAULT NULL,
  `retiene` int(1) DEFAULT NULL,
  `retiene10` int(1) DEFAULT NULL,
  `a30` int(1) DEFAULT NULL,
  `a60` int(1) DEFAULT NULL,
  `a90` int(1) DEFAULT NULL,
  `m90` int(1) DEFAULT NULL,
  `vencido` int(1) DEFAULT NULL,
  `pagadas` int(1) DEFAULT NULL,
  `pendientes` decimal(7,2) DEFAULT NULL,
  `total1` decimal(7,2) DEFAULT NULL,
  `nombreche` varchar(45) DEFAULT NULL,
  `viñeta` int(1) DEFAULT NULL,
  `nacionalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_server`, `unique_id`, `id_sucursal`, `id_proveedor`, `categoria`, `tipo`, `codigoant`, `nombre`, `direccion`, `municipio`, `depto`, `pais`, `contacto`, `nrc`, `nit`, `dui`, `giro`, `telefono1`, `telefono2`, `celular`, `fax`, `email`, `ultcompra`, `acumulado`, `saldo`, `percibe`, `retiene`, `retiene10`, `a30`, `a60`, `a90`, `m90`, `vencido`, `pagadas`, `pendientes`, `total1`, `nombreche`, `viñeta`, `nacionalidad`) VALUES
(0, 'S62b9d1aeac0140.60040130', 1, 1, 1, 1, NULL, 'PROVEEDOR DE PRUEBAS', '', '81', '13', NULL, 'Sr. Proveedor', '00000', '000000', '', 'Industrial', '7878-8080', '', '', '', 'sr.proveedor@mail.com', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sr. Proveedor', NULL, 68);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `ruta` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id_server`, `unique_id`, `id`, `descripcion`, `ruta`) VALUES
(1, 'O5f05eba6b67e89.17178057', 1, 'server', 'http://localhost/karinasyncro/server/mothership.php'),
(2, 'O5f05eba6b7e9b9.88558815', 2, 'local', 'http://localhost/karinasyncro/sistema/slave.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_stock` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `stock` decimal(11,4) NOT NULL,
  `stock_local` decimal(11,4) NOT NULL,
  `precio_unitario` float NOT NULL,
  `costo_unitario` float NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id_server`, `unique_id`, `id_sucursal`, `id_stock`, `id_producto`, `stock`, `stock_local`, `precio_unitario`, `costo_unitario`, `create_date`, `update_date`) VALUES
(0, 'S62b9d286e1b755.79989137', 1, 1, 1, '549.0000', '550.0000', 6.75, 5, '2022-06-27', '2022-06-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_ubicacion`
--

CREATE TABLE `stock_ubicacion` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_su` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `id_estante` int(11) NOT NULL,
  `id_posicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock_ubicacion`
--

INSERT INTO `stock_ubicacion` (`id_server`, `unique_id`, `id_sucursal`, `id_su`, `id_producto`, `cantidad`, `id_ubicacion`, `id_estante`, `id_posicion`) VALUES
(0, 'S62b9d286e043d4.21348066', 1, 1, 1, '549.0000', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono1` varchar(20) NOT NULL,
  `telefono2` varchar(20) NOT NULL,
  `casa_matriz` tinyint(1) NOT NULL,
  `iva` float NOT NULL,
  `monto_retencion1` float NOT NULL,
  `monto_retencion10` float NOT NULL,
  `monto_percepcion` float NOT NULL,
  `n_sucursal` int(11) NOT NULL,
  `vigencia_factura` int(11) NOT NULL,
  `vigencia_pedido` int(11) NOT NULL,
  `giro` varchar(100) NOT NULL,
  `nrc` varchar(100) NOT NULL,
  `nit` varchar(100) NOT NULL,
  `razon_social` varchar(150) NOT NULL,
  `logo` varchar(150) NOT NULL,
  `serie_cof` varchar(100) NOT NULL,
  `desde_cof` int(11) NOT NULL,
  `hasta_cof` int(11) NOT NULL,
  `serie_ccf` varchar(100) NOT NULL,
  `desde_ccf` int(11) NOT NULL,
  `hasta_ccf` int(11) NOT NULL,
  `ultima_act` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_server`, `unique_id`, `id_sucursal`, `descripcion`, `direccion`, `telefono1`, `telefono2`, `casa_matriz`, `iva`, `monto_retencion1`, `monto_retencion10`, `monto_percepcion`, `n_sucursal`, `vigencia_factura`, `vigencia_pedido`, `giro`, `nrc`, `nit`, `razon_social`, `logo`, `serie_cof`, `desde_cof`, `hasta_cof`, `serie_ccf`, `desde_ccf`, `hasta_ccf`, `ultima_act`) VALUES
(1, 'O5f05eba6d58230.73714202', 1, 'FOLLOW FASHION', '2 AV NORTE, # 108, SAN MIGUEL, SAN MIGUEL', '7740-4886', '', 1, 13, 100, 0, 100, 1, 1, 1, 'VENTA AL POR MENOR DE OTROS PRODUCTOS N.C.P', '306293-0', '0614-090921-101-6', 'S.A DE C.V', 'img/62b1ee1c1c090_follow_logo.png', '18NU000F', 1, 5000, '18UN000C', 1, 5000, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_tipo_empleado` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`id_server`, `unique_id`, `id_tipo_empleado`, `descripcion`) VALUES
(1, 'O5f05eba6d7a449.64890848', 1, 'Administrador'),
(2, 'O5f05eba6d93257.30798688', 2, 'Vendedor'),
(3, 'O5f05eba6db4a16.71013016', 3, 'Cajero'),
(4, 'O5f05eba6dd5c20.32959094', 4, 'Bodeguero'),
(5, 'O5f05eba6df7252.09792126', 5, 'Oficios Varios ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_tipopago` int(11) NOT NULL,
  `alias_tipopago` char(3) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `inactivo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`id_server`, `unique_id`, `id_tipopago`, `alias_tipopago`, `descripcion`, `inactivo`) VALUES
(1, 'O5f05eba6e23ce1.97808373', 1, 'CON', 'CONTADO', 0),
(2, 'O5f05eba6e3c170.13829318', 2, 'TAR', 'TARJETA DEBITO/CREDITO', 1),
(3, 'O5f05eba6e5c752.59341489', 3, 'CRE', 'CREDITO', 0),
(4, 'O5f05eba6e7d292.43341976', 4, 'CHE', 'CHEQUE', 0),
(5, 'O5f05eba6e9f643.40351170', 5, 'TRA', 'TRANSFERENCIA', 0),
(6, 'O5f05eba6ec12d7.46494495', 6, 'PEN', 'PENDIENTE', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_proveedor`
--

CREATE TABLE `tipo_proveedor` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_proveedor`
--

INSERT INTO `tipo_proveedor` (`id_server`, `unique_id`, `id_tipo`, `nombre`, `descripcion`) VALUES
(1, 'O5f05eba6eec1b2.07494052', 1, 'Costo', ''),
(2, 'O5f05eba6f04176.60112373', 2, 'Gasto', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `to_corte`
--

CREATE TABLE `to_corte` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `to_corte_producto`
--

CREATE TABLE `to_corte_producto` (
  `id` int(11) NOT NULL,
  `id_corte` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `to_corte_producto_detalle`
--

CREATE TABLE `to_corte_producto_detalle` (
  `id` int(11) NOT NULL,
  `id_ref` int(11) NOT NULL,
  `cantidad` decimal(10,4) DEFAULT NULL,
  `stock_anterior` decimal(10,4) DEFAULT NULL,
  `stock_actual` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal_origen` int(11) NOT NULL,
  `id_sucursal_destino` int(11) NOT NULL,
  `id_traslado` int(11) NOT NULL,
  `n_vale` varchar(50) NOT NULL,
  `id_ubicacion_destino` int(11) NOT NULL,
  `concepto` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_empleado_envia` int(11) NOT NULL,
  `id_empleado_recibe` int(11) NOT NULL,
  `empleado_envia` varchar(250) NOT NULL,
  `empleado_recibe` varchar(250) NOT NULL,
  `total` float NOT NULL,
  `anulada` tinyint(4) NOT NULL,
  `finalizada` tinyint(4) NOT NULL,
  `id_origen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado_detalle`
--

CREATE TABLE `traslado_detalle` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal_origen` int(11) NOT NULL,
  `id_sucursal_destino` int(11) NOT NULL,
  `id_detalle_traslado` int(11) NOT NULL,
  `id_traslado` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_server_prod` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `unidad` int(11) NOT NULL,
  `costo` float NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL,
  `presentacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado_detalle_g`
--

CREATE TABLE `traslado_detalle_g` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal_origen` int(11) NOT NULL,
  `id_sucursal_destino` int(11) NOT NULL,
  `id_detalle_traslado` int(11) NOT NULL,
  `id_traslado` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_server_prod` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `unidad` int(11) NOT NULL,
  `costo` float NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL,
  `presentacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado_detalle_recibido`
--

CREATE TABLE `traslado_detalle_recibido` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal_origen` int(11) NOT NULL,
  `id_sucursal_destino` int(11) NOT NULL,
  `id_detalle_traslado_recibido` int(11) NOT NULL,
  `id_traslado` int(11) NOT NULL,
  `id_traslado_server` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_server_prod` int(11) NOT NULL,
  `cantidad` decimal(11,4) NOT NULL,
  `recibido` decimal(11,4) NOT NULL,
  `unidad` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_server_presen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado_g`
--

CREATE TABLE `traslado_g` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal_origen` int(11) NOT NULL,
  `id_sucursal_destino` int(11) NOT NULL,
  `id_traslado` int(11) NOT NULL,
  `n_vale` varchar(50) NOT NULL,
  `id_ubicacion_destino` int(11) NOT NULL,
  `concepto` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_empleado_envia` int(11) NOT NULL,
  `id_empleado_recibe` int(11) NOT NULL,
  `empleado_envia` varchar(250) NOT NULL,
  `empleado_recibe` varchar(250) NOT NULL,
  `total` float NOT NULL,
  `anulada` tinyint(4) NOT NULL,
  `finalizada` tinyint(4) NOT NULL,
  `id_origen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `bodega` tinyint(1) NOT NULL,
  `borrado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_server`, `unique_id`, `id_sucursal`, `id_ubicacion`, `descripcion`, `bodega`, `borrado`) VALUES
(1, 'O5f05eba701fe26.32360857', 1, 1, 'LOCAL DE VENTA', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(250) CHARACTER SET utf8 NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(250) NOT NULL,
  `admin` int(11) NOT NULL,
  `precios` int(11) NOT NULL,
  `latitud_ultima` double NOT NULL,
  `longitud_ultima` double NOT NULL,
  `fecha_tracking` date NOT NULL,
  `hora_tracking` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_server`, `unique_id`, `id_sucursal`, `id_usuario`, `id_empleado`, `nombre`, `usuario`, `password`, `admin`, `precios`, `latitud_ultima`, `longitud_ultima`, `fecha_tracking`, `hora_tracking`) VALUES
(1, 'O5f05eba70a0f04.98442249', 1, 1, 1, 'administrador', 'admin', 'f90d1250fd96b918b6d474a2e549510c', 1, 7, 0, 0, '0000-00-00', '00:00:00'),
(0, 'S6206de9b5bb1a8.70064900', 1, 13, 0, 'caja 1', 'caja1', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, 0, 0, '0000-00-00', '00:00:00'),
(0, 'S6206dede811230.11864405', 1, 14, 0, 'caja 2', 'caja2', 'e10adc3949ba59abbe56e057f20f883e', 0, 1, 0, 0, '0000-00-00', '00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_modulo`
--

CREATE TABLE `usuario_modulo` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_mod_user` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_modulo`
--

INSERT INTO `usuario_modulo` (`id_server`, `unique_id`, `id_sucursal`, `id_mod_user`, `id_modulo`, `id_usuario`) VALUES
(1, 'O5f05eba71ae8e9.81652603', 0, 1, 43, 47),
(2, 'O5f05eba71c1c60.19319526', 0, 2, 44, 47),
(3, 'O5f05eba71e0183.18929924', 0, 3, 68, 47),
(4, 'O5f05eba72018f7.09616987', 0, 4, 82, 47),
(5, 'O5f05eba7221f99.12348082', 0, 5, 83, 47),
(6, 'O5f05eba7244727.85262800', 0, 6, 1, 47),
(7, 'O5f05eba72642d0.41656359', 0, 7, 2, 47),
(8, 'O5f05eba7284cb6.06937575', 0, 8, 3, 47),
(9, 'O5f05eba72a90d1.48385613', 0, 9, 4, 47),
(10, 'O5f05eba72cbfb2.90806916', 0, 10, 5, 47),
(11, 'O5f05eba72eb022.85998647', 0, 11, 19, 47),
(12, 'O5f05eba730d496.36874177', 0, 12, 20, 47),
(13, 'O5f05eba73506d0.13785795', 0, 13, 21, 47),
(14, 'O5f05eba7371ab6.29594900', 0, 14, 22, 47),
(15, 'O5f05eba7391838.43509738', 0, 15, 23, 47),
(16, 'O5f05eba73b1477.98020687', 0, 16, 45, 47),
(17, 'O5f05eba73d1ef4.70581627', 0, 17, 46, 47),
(18, 'O5f05eba73f3c84.95446309', 0, 18, 47, 47),
(19, 'O5f05eba7420546.12793440', 0, 19, 48, 47),
(20, 'O5f05eba743b002.90327676', 0, 20, 49, 47),
(21, 'O5f05eba745b6a0.32624680', 0, 21, 77, 47),
(22, 'O5f05eba747da56.31031507', 0, 22, 78, 47),
(23, 'O5f05eba749e622.03335530', 0, 23, 79, 47),
(24, 'O5f05eba74bff29.65350240', 0, 24, 80, 47),
(25, 'O5f05eba74e0ad1.31748918', 0, 25, 81, 47),
(26, 'O5f05eba7503ff7.04224687', 0, 26, 98, 47),
(27, 'O5f05eba7524737.58081008', 0, 27, 99, 47),
(28, 'O5f05eba7545905.17483547', 0, 28, 100, 47),
(29, 'O5f05eba75675d8.12053181', 0, 29, 101, 47),
(30, 'O5f05eba7587d54.01453946', 0, 30, 103, 47),
(31, 'O5f05eba75a8a96.85164063', 0, 31, 72, 47),
(32, 'O5f05eba75ca113.32222166', 0, 32, 73, 47),
(33, 'O5f05eba75eb9d1.76648377', 0, 33, 74, 47),
(34, 'O5f05eba760c7d5.36478921', 0, 34, 75, 47),
(35, 'O5f05eba762d692.81865422', 0, 35, 76, 47),
(36, 'O5f05eba764ed30.82665757', 0, 36, 134, 47),
(37, 'O5f05eba766fe78.84673792', 0, 37, 135, 47),
(38, 'O5f05eba7691e96.26340448', 0, 38, 85, 47),
(39, 'O5f05eba76b1ac1.50503102', 0, 39, 86, 47),
(40, 'O5f05eba76d3b75.49413181', 0, 40, 87, 47),
(41, 'O5f05eba76f5e25.18755398', 0, 41, 88, 47),
(42, 'O5f05eba77182a6.71673330', 0, 42, 89, 47),
(43, 'O5f05eba7737c81.04834757', 0, 43, 90, 47),
(44, 'O5f05eba77598a7.18481436', 0, 44, 91, 47),
(45, 'O5f05eba777ab77.26591328', 0, 45, 92, 47),
(46, 'O5f05eba779b1d2.72962904', 0, 46, 93, 47),
(47, 'O5f05eba77bbad5.35651718', 0, 47, 94, 47),
(48, 'O5f05eba77de3c6.10790877', 0, 48, 95, 47),
(49, 'O5f05eba77fff06.08419738', 0, 49, 96, 47),
(50, 'O5f05eba7820c13.32140160', 0, 50, 97, 47),
(51, 'O5f05eba7842381.48159371', 0, 51, 137, 47),
(52, 'O5f05eba7863e60.82665602', 0, 52, 35, 47),
(53, 'O5f05eba7885cd4.70495642', 0, 53, 36, 47),
(54, 'O5f05eba78a6733.09101369', 0, 54, 106, 47),
(55, 'O5f05eba78c74f5.43801742', 0, 55, 107, 47),
(56, 'O5f05eba78e9161.19252888', 0, 56, 108, 47),
(57, 'O5f05eba7909ab4.25410698', 0, 57, 109, 47),
(58, 'O5f05eba792ad76.36825392', 0, 58, 110, 47),
(59, 'O5f05eba794cc86.39267265', 0, 59, 118, 47),
(60, 'O5f05eba796e393.47061949', 0, 60, 120, 47),
(61, 'O5f05eba7991759.35793907', 0, 61, 37, 47),
(62, 'O5f05eba79b2080.00714355', 0, 62, 38, 47),
(63, 'O5f05eba79d3731.62562662', 0, 63, 50, 47),
(64, 'O5f05eba79f50f4.88840057', 0, 64, 69, 47),
(65, 'O5f05eba7a17af3.20611541', 0, 65, 70, 47),
(66, 'O5f05eba7a38183.03729821', 0, 66, 71, 47),
(67, 'O5f05eba7a597c9.15747388', 0, 67, 84, 47),
(68, 'O5f05eba7a7a266.94183765', 0, 68, 124, 47),
(69, 'O5f05eba7a9c9f1.79898422', 0, 69, 133, 47),
(70, 'O5f05eba7abc960.58338406', 0, 70, 119, 47),
(71, 'O5f05eba7ade0b8.79836068', 0, 71, 121, 47),
(72, 'O5f05eba7b00639.00888099', 0, 72, 122, 47),
(73, 'O5f05eba7b239b3.56982231', 0, 73, 123, 47),
(74, 'O5f05eba7b43684.46772651', 0, 74, 126, 47),
(75, 'O5f05eba7b64225.03197469', 0, 75, 128, 47),
(76, 'O5f05eba7b85d77.32441486', 0, 76, 129, 47),
(77, 'O5f05eba7ba8d30.40335699', 0, 77, 130, 47),
(78, 'O5f05eba7bc9183.86333960', 0, 78, 138, 47),
(79, 'O5f05eba7becab5.68796319', 0, 79, 41, 47),
(80, 'O5f05eba7c0ef78.37119244', 0, 80, 42, 47),
(81, 'O5f05eba7c2e516.11550719', 0, 81, 111, 47),
(82, 'O5f05eba7c4f402.52634619', 0, 82, 112, 47),
(83, 'O5f05eba7c70597.38519073', 0, 83, 113, 47),
(84, 'O5f05eba7c90da5.38499666', 0, 84, 114, 47),
(85, 'O5f05eba7cb42b8.85182139', 0, 85, 115, 47),
(86, 'O5f05eba7cd43e3.47873502', 0, 86, 116, 47),
(87, 'O5f05eba7cf64d5.47061684', 0, 87, 117, 47),
(88, 'O5f05eba7d176f5.55129864', 0, 88, 127, 47),
(89, 'O5f05eba7d386a6.63325660', 0, 89, 132, 47),
(90, 'O5f05eba7d597a4.13054155', 0, 90, 54, 47),
(91, 'O5f05eba7d7acc7.69634282', 0, 91, 55, 47),
(92, 'O5f05eba7d9b8e8.24641520', 0, 92, 56, 47),
(93, 'O5f05eba7dbd589.11615068', 0, 93, 57, 47),
(94, 'O5f05eba7ddf661.45030385', 0, 94, 58, 47),
(95, 'O5f05eba7e013c0.31923651', 0, 95, 59, 47),
(96, 'O5f05eba7e20bd4.91132737', 0, 96, 60, 47),
(97, 'O5f05eba7e42517.76543079', 0, 97, 61, 47),
(98, 'O5f05eba7e64229.03928088', 0, 98, 62, 47),
(99, 'O5f05eba7e85709.62950319', 0, 99, 63, 47),
(100, 'O5f05eba7ea6331.73019304', 0, 100, 64, 47),
(101, 'O5f05eba7ec70f9.42771710', 0, 101, 65, 47),
(102, 'O5f05eba7ee8d81.46827640', 0, 102, 66, 47),
(103, 'O5f05eba7f0a469.54744761', 0, 103, 6, 47),
(104, 'O5f05eba7f2b435.26593953', 0, 104, 7, 47),
(105, 'O5f05eba800a520.28061681', 0, 105, 8, 47),
(106, 'O5f05eba802b7b1.98921420', 0, 106, 9, 47),
(107, 'O5f05eba804f479.63434537', 0, 107, 10, 47),
(108, 'O5f05eba80702b4.98892614', 0, 108, 11, 47),
(109, 'O5f05eba8091147.10241504', 0, 109, 12, 47),
(110, 'O5f05eba80b2d10.96914387', 0, 110, 13, 47),
(111, 'O5f05eba80d4dc7.19986469', 0, 111, 14, 47),
(112, 'O5f05eba80f5f37.24226037', 0, 112, 15, 47),
(113, 'O5f05eba8116f22.87618661', 0, 113, 16, 47),
(114, 'O5f05eba8139221.94620868', 0, 114, 17, 47),
(115, 'O5f05eba815a987.64215049', 0, 115, 18, 47),
(116, 'O5f05eba817b765.87393680', 0, 116, 139, 47),
(117, 'O5f05eba819c827.97737739', 0, 117, 24, 47),
(118, 'O5f05eba81bd494.43717212', 0, 118, 25, 47),
(119, 'O5f05eba81e0127.76879077', 0, 119, 26, 47),
(120, 'O5f05eba82017d9.88033404', 0, 120, 27, 47),
(121, 'O5f05eba8222aa0.44156906', 0, 121, 28, 47),
(122, 'O5f05eba8243690.45810191', 0, 122, 29, 47),
(123, 'O5f05eba8265b53.69713114', 0, 123, 30, 47),
(124, 'O5f05eba8286d02.94293890', 0, 124, 31, 47),
(125, 'O5f05eba82a8141.39828863', 0, 125, 32, 47),
(126, 'O5f05eba82c8f57.12915533', 0, 126, 33, 47),
(127, 'O5f05eba82eb007.30435545', 0, 127, 34, 47),
(128, 'O5f05eba830cc85.08525726', 0, 128, 39, 47),
(129, 'O5f05eba832e367.82924487', 0, 129, 40, 47),
(130, 'O5f05eba83506d3.69516042', 0, 130, 136, 47),
(166, 'O5f05eba8738fb0.64501114', 0, 166, 35, 6),
(171, 'O5f05eba875aa90.25911644', 0, 171, 35, 3),
(172, 'O5f05eba877b7e6.64068302', 0, 172, 106, 3),
(173, 'O5f05eba879cad2.60557030', 0, 173, 107, 3),
(174, 'O5f05eba87bdd03.98714413', 0, 174, 118, 3),
(175, 'O5f05eba87df1c2.39986741', 0, 175, 35, 4),
(176, 'O5f05eba8800899.86361920', 0, 176, 106, 4),
(177, 'O5f05eba8821b44.49774214', 0, 177, 107, 4),
(178, 'O5f05eba8842949.77780368', 0, 178, 118, 4),
(179, 'O5f05eba8861bf2.48399413', 0, 179, 35, 5),
(180, 'O5f05eba8882a15.16803225', 0, 180, 106, 5),
(181, 'O5f05eba88a6825.80940911', 0, 181, 107, 5),
(182, 'O5f05eba88c7612.66067084', 0, 182, 118, 5),
(183, 'O5f05eba88e87f2.10262702', 0, 183, 43, 7),
(184, 'O5f05eba890a489.15828024', 0, 184, 44, 7),
(185, 'O5f05eba892c124.97386068', 0, 185, 68, 7),
(186, 'O5f05eba894d167.34663987', 0, 186, 82, 7),
(187, 'O5f05eba896e7e1.49116918', 0, 187, 83, 7),
(188, 'O5f05eba8990273.15346280', 0, 188, 1, 7),
(189, 'O5f05eba89b3580.12365044', 0, 189, 2, 7),
(190, 'O5f05eba89d4490.87251060', 0, 190, 3, 7),
(191, 'O5f05eba89f54b5.28952414', 0, 191, 4, 7),
(192, 'O5f05eba8a16ce0.91628198', 0, 192, 5, 7),
(193, 'O5f05eba8a39b22.58740739', 0, 193, 19, 7),
(194, 'O5f05eba8a5a4f5.16174323', 0, 194, 20, 7),
(195, 'O5f05eba8a7bb62.10101221', 0, 195, 21, 7),
(196, 'O5f05eba8a9cda6.66181316', 0, 196, 22, 7),
(197, 'O5f05eba8abe8e9.01546551', 0, 197, 23, 7),
(198, 'O5f05eba8adf190.13388801', 0, 198, 45, 7),
(199, 'O5f05eba8b00b53.98780594', 0, 199, 46, 7),
(200, 'O5f05eba8b21708.18962612', 0, 200, 47, 7),
(201, 'O5f05eba8b42ff2.81060950', 0, 201, 48, 7),
(202, 'O5f05eba8b64d34.97209899', 0, 202, 49, 7),
(203, 'O5f05eba8b86730.64985209', 0, 203, 77, 7),
(204, 'O5f05eba8ba7998.36344631', 0, 204, 78, 7),
(205, 'O5f05eba8bc9826.58659427', 0, 205, 79, 7),
(206, 'O5f05eba8beb3c7.95780569', 0, 206, 80, 7),
(207, 'O5f05eba8c0f284.02357798', 0, 207, 81, 7),
(208, 'O5f05eba8c2f601.55429456', 0, 208, 98, 7),
(209, 'O5f05eba8c50644.07247347', 0, 209, 99, 7),
(210, 'O5f05eba8c72243.84062522', 0, 210, 100, 7),
(211, 'O5f05eba8c92d75.63331428', 0, 211, 101, 7),
(212, 'O5f05eba8cb4366.84410576', 0, 212, 103, 7),
(213, 'O5f05eba8cd5c82.09857829', 0, 213, 72, 7),
(214, 'O5f05eba8cf7f91.11459718', 0, 214, 73, 7),
(215, 'O5f05eba8d197f3.90685270', 0, 215, 74, 7),
(216, 'O5f05eba8d3ae32.03093622', 0, 216, 75, 7),
(217, 'O5f05eba8d5c895.05686501', 0, 217, 76, 7),
(218, 'O5f05eba8d7ed20.92489844', 0, 218, 134, 7),
(219, 'O5f05eba8d9df89.19164677', 0, 219, 135, 7),
(220, 'O5f05eba8de1803.94439803', 0, 220, 85, 7),
(221, 'O5f05eba8e02043.54728967', 0, 221, 86, 7),
(222, 'O5f05eba8e23d45.44257726', 0, 222, 87, 7),
(223, 'O5f05eba8e43d35.14945764', 0, 223, 88, 7),
(224, 'O5f05eba8e65b89.12085235', 0, 224, 89, 7),
(225, 'O5f05eba8e86dc6.76510775', 0, 225, 90, 7),
(226, 'O5f05eba8ea82d9.31119421', 0, 226, 91, 7),
(227, 'O5f05eba8ec8b05.71413847', 0, 227, 92, 7),
(228, 'O5f05eba8eea5a8.87107271', 0, 228, 93, 7),
(229, 'O5f05eba8f0bae7.16108757', 0, 229, 94, 7),
(230, 'O5f05eba8f2c7a9.73510558', 0, 230, 95, 7),
(231, 'O5f05eba900b606.33801050', 0, 231, 96, 7),
(232, 'O5f05eba902c4e7.99528422', 0, 232, 97, 7),
(233, 'O5f05eba904dc16.40945783', 0, 233, 137, 7),
(234, 'O5f05eba906f127.32701709', 0, 234, 35, 7),
(235, 'O5f05eba90902f5.18373710', 0, 235, 36, 7),
(236, 'O5f05eba90b0925.25843658', 0, 236, 106, 7),
(237, 'O5f05eba90d3492.51186013', 0, 237, 107, 7),
(238, 'O5f05eba90f46b2.60103875', 0, 238, 108, 7),
(239, 'O5f05eba9115882.01555091', 0, 239, 109, 7),
(240, 'O5f05eba9136263.14698813', 0, 240, 110, 7),
(241, 'O5f05eba91579d4.85609144', 0, 241, 118, 7),
(242, 'O5f05eba91789f3.13419544', 0, 242, 120, 7),
(243, 'O5f05eba91989b4.72921462', 0, 243, 37, 7),
(244, 'O5f05eba91b9c34.66800321', 0, 244, 38, 7),
(245, 'O5f05eba91daf67.57389970', 0, 245, 50, 7),
(246, 'O5f05eba91fd048.43407483', 0, 246, 69, 7),
(247, 'O5f05eba921e0f3.44315249', 0, 247, 70, 7),
(248, 'O5f05eba923f892.54180855', 0, 248, 71, 7),
(249, 'O5f05eba9261172.09807892', 0, 249, 84, 7),
(250, 'O5f05eba9283999.77567690', 0, 250, 124, 7),
(251, 'O5f05eba92a5529.92265278', 0, 251, 133, 7),
(252, 'O5f05eba92c50f2.58576135', 0, 252, 119, 7),
(253, 'O5f05eba92e6cd4.66249385', 0, 253, 121, 7),
(254, 'O5f05eba9308d29.64096444', 0, 254, 122, 7),
(255, 'O5f05eba9328741.00301849', 0, 255, 123, 7),
(256, 'O5f05eba934b5d8.81447427', 0, 256, 126, 7),
(257, 'O5f05eba936cad5.93703898', 0, 257, 128, 7),
(258, 'O5f05eba938e987.32304110', 0, 258, 129, 7),
(259, 'O5f05eba93aebb9.47220176', 0, 259, 130, 7),
(260, 'O5f05eba93cfdc1.76511228', 0, 260, 138, 7),
(261, 'O5f05eba93f07a4.23444900', 0, 261, 41, 7),
(262, 'O5f05eba94134c3.37273496', 0, 262, 42, 7),
(263, 'O5f05eba9433b26.51025815', 0, 263, 111, 7),
(264, 'O5f05eba9454d78.42259281', 0, 264, 112, 7),
(265, 'O5f05eba9475cf3.16152685', 0, 265, 113, 7),
(266, 'O5f05eba9497b94.39810095', 0, 266, 114, 7),
(267, 'O5f05eba94b9f15.11917887', 0, 267, 115, 7),
(268, 'O5f05eba94dc599.37432306', 0, 268, 116, 7),
(269, 'O5f05eba94fd0f7.53238267', 0, 269, 117, 7),
(270, 'O5f05eba951f563.13698916', 0, 270, 127, 7),
(271, 'O5f05eba9540497.25229419', 0, 271, 132, 7),
(272, 'O5f05eba9562270.53220586', 0, 272, 54, 7),
(273, 'O5f05eba9582f88.17203255', 0, 273, 55, 7),
(274, 'O5f05eba95a4972.77720630', 0, 274, 56, 7),
(275, 'O5f05eba95c5364.28588813', 0, 275, 57, 7),
(276, 'O5f05eba95e6c10.76503602', 0, 276, 58, 7),
(277, 'O5f05eba9608ec1.34138567', 0, 277, 59, 7),
(278, 'O5f05eba962a535.61156653', 0, 278, 60, 7),
(279, 'O5f05eba964bba5.18398906', 0, 279, 61, 7),
(280, 'O5f05eba966cdb4.56403043', 0, 280, 62, 7),
(281, 'O5f05eba968d4f2.41413688', 0, 281, 63, 7),
(282, 'O5f05eba96afd80.41183165', 0, 282, 64, 7),
(283, 'O5f05eba96cfdd9.96149711', 0, 283, 65, 7),
(284, 'O5f05eba96f10d9.41313048', 0, 284, 66, 7),
(285, 'O5f05eba9712748.16689870', 0, 285, 6, 7),
(286, 'O5f05eba97349d6.12291891', 0, 286, 7, 7),
(287, 'O5f05eba9755090.75166269', 0, 287, 8, 7),
(288, 'O5f05eba9776059.94813854', 0, 288, 9, 7),
(289, 'O5f05eba9797594.08120094', 0, 289, 10, 7),
(290, 'O5f05eba97b7fc7.42800878', 0, 290, 11, 7),
(291, 'O5f05eba97dbd70.97820929', 0, 291, 12, 7),
(292, 'O5f05eba97fc3f3.63599280', 0, 292, 13, 7),
(293, 'O5f05eba981da06.57441627', 0, 293, 14, 7),
(294, 'O5f05eba983f6a6.59741655', 0, 294, 15, 7),
(295, 'O5f05eba98609e7.59607724', 0, 295, 16, 7),
(296, 'O5f05eba9881344.35678221', 0, 296, 17, 7),
(297, 'O5f05eba98a2833.12321866', 0, 297, 18, 7),
(298, 'O5f05eba98c40f4.60306732', 0, 298, 139, 7),
(299, 'O5f05eba98e4fd5.35058133', 0, 299, 24, 7),
(300, 'O5f05eba9906273.65722745', 0, 300, 25, 7),
(301, 'O5f05eba9927d92.36839482', 0, 301, 26, 7),
(302, 'O5f05eba9949df6.55593509', 0, 302, 27, 7),
(303, 'O5f05eba996a336.82675484', 0, 303, 28, 7),
(304, 'O5f05eba998b486.11929709', 0, 304, 29, 7),
(305, 'O5f05eba99ada80.40318949', 0, 305, 30, 7),
(306, 'O5f05eba99cfbb8.37561687', 0, 306, 31, 7),
(307, 'O5f05eba99f07d9.51109937', 0, 307, 32, 7),
(308, 'O5f05eba9a12371.98043844', 0, 308, 33, 7),
(309, 'O5f05eba9a34725.23916950', 0, 309, 34, 7),
(310, 'O5f05eba9a56018.12343845', 0, 310, 39, 7),
(311, 'O5f05eba9a784c9.40285274', 0, 311, 40, 7),
(312, 'O5f05eba9a99763.18458160', 0, 312, 136, 7),
(313, 'O5f05eba9aba5e9.25788607', 0, 313, 2, 8),
(314, 'O5f05eba9adcb89.83991759', 0, 314, 5, 8),
(315, 'O5f05eba9afdd34.53652677', 0, 315, 78, 8),
(316, 'O5f05eba9b1e2c1.94538993', 0, 316, 81, 8),
(317, 'O5f05eba9b3fcd6.41663377', 0, 317, 99, 8),
(318, 'O5f05eba9b60be4.42158184', 0, 318, 100, 8),
(319, 'O5f05eba9b80bf3.15186493', 0, 319, 101, 8),
(320, 'O5f05eba9ba1a61.41899870', 0, 320, 103, 8),
(321, 'O5f05eba9bc3214.24488508', 0, 321, 88, 8),
(322, 'O5f05eba9be49a3.51373573', 0, 322, 89, 8),
(323, 'O5f05eba9c07319.42712913', 0, 323, 90, 8),
(324, 'O5f05eba9c29d82.28459566', 0, 324, 91, 8),
(325, 'O5f05eba9c4b245.06042705', 0, 325, 35, 8),
(326, 'O5f05eba9c6b7f3.51156245', 0, 326, 36, 8),
(327, 'O5f05eba9c8cd48.28254069', 0, 327, 107, 8),
(328, 'O5f05eba9caf955.57058453', 0, 328, 108, 8),
(329, 'O5f05eba9cd0181.59514783', 0, 329, 110, 8),
(330, 'O5f05eba9cf08c0.20872128', 0, 330, 118, 8),
(331, 'O5f05eba9d11aa5.77024564', 0, 331, 50, 8),
(0, 'S5f8b523a9bb2d3.18295005', 0, 332, 43, 2),
(0, 'S5f8b523a9da309.66094765', 0, 333, 44, 2),
(0, 'S5f8b523a9fcd76.32078602', 0, 334, 68, 2),
(0, 'S5f8b523aa20f87.86803806', 0, 335, 82, 2),
(0, 'S5f8b523aa3e4c0.07601078', 0, 336, 83, 2),
(0, 'S5f8b523aa61bc9.82922678', 0, 337, 1, 2),
(0, 'S5f8b523aa80fa9.44522174', 0, 338, 2, 2),
(0, 'S5f8b523aaa4734.37034997', 0, 339, 3, 2),
(0, 'S5f8b523aac2e55.70045114', 0, 340, 4, 2),
(0, 'S5f8b523aae6494.93835509', 0, 341, 5, 2),
(0, 'S5f8b523ab1b543.69660542', 0, 342, 19, 2),
(0, 'S5f8b523ab3b186.46499875', 0, 343, 20, 2),
(0, 'S5f8b523ab5be57.14246769', 0, 344, 21, 2),
(0, 'S5f8b523ab7ce58.11972087', 0, 345, 22, 2),
(0, 'S5f8b523aba1138.07741401', 0, 346, 23, 2),
(0, 'S5f8b523abbf925.36008003', 0, 347, 45, 2),
(0, 'S5f8b523abe2403.60000609', 0, 348, 46, 2),
(0, 'S5f8b523ac037f3.54598572', 0, 349, 47, 2),
(0, 'S5f8b523ac24f11.17747353', 0, 350, 48, 2),
(0, 'S5f8b523ac460c2.83960599', 0, 351, 49, 2),
(0, 'S5f8b523ac68de6.25615686', 0, 352, 77, 2),
(0, 'S5f8b523ac89292.38287877', 0, 353, 78, 2),
(0, 'S5f8b523acaa0b8.12815358', 0, 354, 79, 2),
(0, 'S5f8b523accbe38.15972893', 0, 355, 80, 2),
(0, 'S5f8b523aced7b9.92821902', 0, 356, 81, 2),
(0, 'S5f8b523ad0e153.51928700', 0, 357, 98, 2),
(0, 'S5f8b523ad2f868.69254556', 0, 358, 99, 2),
(0, 'S5f8b523ad503e0.14656810', 0, 359, 100, 2),
(0, 'S5f8b523ad71f40.29793399', 0, 360, 101, 2),
(0, 'S5f8b523ad93148.06265151', 0, 361, 103, 2),
(0, 'S5f8b523adb79d8.73729067', 0, 362, 72, 2),
(0, 'S5f8b523add69e5.00877527', 0, 363, 73, 2),
(0, 'S5f8b523adf8d96.59333142', 0, 364, 74, 2),
(0, 'S5f8b523ae19630.56235398', 0, 365, 75, 2),
(0, 'S5f8b523ae3ce54.77481911', 0, 366, 76, 2),
(0, 'S5f8b523ae5bec7.59990469', 0, 367, 134, 2),
(0, 'S5f8b523ae7d229.88186242', 0, 368, 135, 2),
(0, 'S5f8b523ae9f291.73683520', 0, 369, 85, 2),
(0, 'S5f8b523aeea252.47535823', 0, 370, 86, 2),
(0, 'S5f8b523af0c2e8.30990572', 0, 371, 87, 2),
(0, 'S5f8b523af2fa38.00268401', 0, 372, 88, 2),
(0, 'S5f8b523b00bb46.58375389', 0, 373, 89, 2),
(0, 'S5f8b523b02bfa2.65731058', 0, 374, 90, 2),
(0, 'S5f8b523b04e4a7.65767049', 0, 375, 91, 2),
(0, 'S5f8b523b070c37.82680263', 0, 376, 92, 2),
(0, 'S5f8b523b0910e5.29899266', 0, 377, 93, 2),
(0, 'S5f8b523b0b3581.38344939', 0, 378, 94, 2),
(0, 'S5f8b523b0d4cf2.87857359', 0, 379, 95, 2),
(0, 'S5f8b523b0f5925.62968241', 0, 380, 96, 2),
(0, 'S5f8b523b115437.25052181', 0, 381, 97, 2),
(0, 'S5f8b523b138131.10403458', 0, 382, 137, 2),
(0, 'S5f8b523b1587d9.06654208', 0, 383, 37, 2),
(0, 'S5f8b523b17cbc7.40599311', 0, 384, 38, 2),
(0, 'S5f8b523b19c4d5.34460253', 0, 385, 50, 2),
(0, 'S5f8b523b1be149.60380496', 0, 386, 69, 2),
(0, 'S5f8b523b1dd426.57526684', 0, 387, 70, 2),
(0, 'S5f8b523b1fdde2.78885563', 0, 388, 71, 2),
(0, 'S5f8b523b21fe46.34914740', 0, 389, 84, 2),
(0, 'S5f8b523b2415f5.78048823', 0, 390, 124, 2),
(0, 'S5f8b523b2625d2.61673670', 0, 391, 133, 2),
(0, 'S5f8b523b2852a3.44229778', 0, 392, 35, 2),
(0, 'S5f8b523b2a4a37.14600820', 0, 393, 36, 2),
(0, 'S5f8b523b2c7011.35591209', 0, 394, 106, 2),
(0, 'S5f8b523b2e8ee5.93776823', 0, 395, 107, 2),
(0, 'S5f8b523b30c981.05405372', 0, 396, 108, 2),
(0, 'S5f8b523b32a5c3.74298324', 0, 397, 109, 2),
(0, 'S5f8b523b34c661.19819470', 0, 398, 110, 2),
(0, 'S5f8b523b38ff14.09477447', 0, 399, 118, 2),
(0, 'S5f8b523b3b1c33.14224676', 0, 400, 120, 2),
(0, 'S5f8b523b3d4614.01893685', 0, 401, 142, 2),
(0, 'S5f8b523b3f5687.28995278', 0, 402, 143, 2),
(0, 'S5f8b523b4152c9.90940398', 0, 403, 41, 2),
(0, 'S5f8b523b4370b9.93759756', 0, 404, 42, 2),
(0, 'S5f8b523b4575e9.75520468', 0, 405, 111, 2),
(0, 'S5f8b523b479018.67681667', 0, 406, 112, 2),
(0, 'S5f8b523b49c307.02136782', 0, 407, 113, 2),
(0, 'S5f8b523b4bc791.90274427', 0, 408, 114, 2),
(0, 'S5f8b523b4de899.63255980', 0, 409, 115, 2),
(0, 'S5f8b523b4ff839.52714704', 0, 410, 116, 2),
(0, 'S5f8b523b523066.61484548', 0, 411, 117, 2),
(0, 'S5f8b523b5429a3.71178703', 0, 412, 127, 2),
(0, 'S5f8b523b565cc6.26186053', 0, 413, 132, 2),
(0, 'S5f8b523b586d66.65397570', 0, 414, 54, 2),
(0, 'S5f8b523b5a7de7.45478318', 0, 415, 55, 2),
(0, 'S5f8b523b5c8817.59662170', 0, 416, 56, 2),
(0, 'S5f8b523b5e94f7.46598407', 0, 417, 57, 2),
(0, 'S5f8b523b60ae79.85689841', 0, 418, 58, 2),
(0, 'S5f8b523b62c664.06050119', 0, 419, 59, 2),
(0, 'S5f8b523b64f039.35292261', 0, 420, 60, 2),
(0, 'S5f8b523b66f461.76602402', 0, 421, 61, 2),
(0, 'S5f8b523b690896.24625401', 0, 422, 62, 2),
(0, 'S5f8b523b6b1512.25187705', 0, 423, 63, 2),
(0, 'S5f8b523b6d2c43.97241846', 0, 424, 64, 2),
(0, 'S5f8b523b6f52e0.78123002', 0, 425, 65, 2),
(0, 'S5f8b523b719eb0.27511642', 0, 426, 66, 2),
(0, 'S5f8b523b739726.38033925', 0, 427, 119, 2),
(0, 'S5f8b523b75a294.99428575', 0, 428, 121, 2),
(0, 'S5f8b523b77c5a4.28758796', 0, 429, 122, 2),
(0, 'S5f8b523b79e975.96681924', 0, 430, 123, 2),
(0, 'S5f8b523b7bdf89.03779199', 0, 431, 126, 2),
(0, 'S5f8b523b7efc47.90058710', 0, 432, 128, 2),
(0, 'S5f8b523b8110f3.19750708', 0, 433, 129, 2),
(0, 'S5f8b523b832b53.09962505', 0, 434, 130, 2),
(0, 'S5f8b523b853748.77553212', 0, 435, 138, 2),
(0, 'S5f8b523b8759c1.17457498', 0, 436, 144, 2),
(0, 'S5f8b523b895f89.41262494', 0, 437, 145, 2),
(0, 'S5f8b523b8b6b21.23367888', 0, 438, 146, 2),
(0, 'S5f8b523b8d7353.84567245', 0, 439, 147, 2),
(0, 'S5f8b523b8fa3c0.03738581', 0, 440, 6, 2),
(0, 'S5f8b523b919fb8.67836034', 0, 441, 7, 2),
(0, 'S5f8b523b93b917.58316844', 0, 442, 8, 2),
(0, 'S5f8b523b95cbc5.61124495', 0, 443, 9, 2),
(0, 'S5f8b523b97e9d1.07610999', 0, 444, 10, 2),
(0, 'S5f8b523b99fc68.28168130', 0, 445, 11, 2),
(0, 'S5f8b523b9c25b6.56792724', 0, 446, 12, 2),
(0, 'S5f8b523b9e3cc4.33028643', 0, 447, 13, 2),
(0, 'S5f8b523ba02d48.40888565', 0, 448, 14, 2),
(0, 'S5f8b523ba25f87.73749993', 0, 449, 15, 2),
(0, 'S5f8b523ba484f4.31535713', 0, 450, 16, 2),
(0, 'S5f8b523ba67725.09292055', 0, 451, 17, 2),
(0, 'S5f8b523ba89f14.21246928', 0, 452, 18, 2),
(0, 'S5f8b523baab7b2.77218190', 0, 453, 139, 2),
(0, 'S5f8b523bace407.09431030', 0, 454, 24, 2),
(0, 'S5f8b523baede27.63667331', 0, 455, 25, 2),
(0, 'S5f8b523bb11797.88084450', 0, 456, 26, 2),
(0, 'S5f8b523bb302a1.29706844', 0, 457, 27, 2),
(0, 'S5f8b523bb51805.62222761', 0, 458, 28, 2),
(0, 'S5f8b523bb72fc0.20764191', 0, 459, 29, 2),
(0, 'S5f8b523bb94fe0.99604464', 0, 460, 30, 2),
(0, 'S5f8b523bbb4db1.28171154', 0, 461, 31, 2),
(0, 'S5f8b523bbd57b3.56557614', 0, 462, 32, 2),
(0, 'S5f8b523bbf7c99.39996649', 0, 463, 33, 2),
(0, 'S5f8b523bc18742.90434170', 0, 464, 34, 2),
(0, 'S5f8b523bc38c50.57436781', 0, 465, 39, 2),
(0, 'S5f8b523bc5bc27.17246283', 0, 466, 40, 2),
(0, 'S5f8b523bc7bd21.00867653', 0, 467, 136, 2),
(0, 'S5f8b523bc9d827.36255107', 0, 468, 140, 2),
(0, 'S5f8b523bcbe763.18420554', 0, 469, 141, 2),
(0, 'S5f9dd8351cb739.55056043', 0, 494, 1, 9),
(0, 'S5f9dd8351edbe3.35054956', 0, 495, 2, 9),
(0, 'S5f9dd83520dfc9.90322170', 0, 496, 3, 9),
(0, 'S5f9dd83522fa39.09415688', 0, 497, 4, 9),
(0, 'S5f9dd83524eba6.98203605', 0, 498, 5, 9),
(0, 'S5f9dd835272153.46813536', 0, 499, 77, 9),
(0, 'S5f9dd835295e02.17174528', 0, 500, 78, 9),
(0, 'S5f9dd8352b6153.45823754', 0, 501, 79, 9),
(0, 'S5f9dd8352d6c72.15814187', 0, 502, 80, 9),
(0, 'S5f9dd8352f92b6.88099284', 0, 503, 81, 9),
(0, 'S5f9dd83531bf12.29642684', 0, 504, 36, 9),
(0, 'S5f9dd83533a8d3.05049042', 0, 505, 106, 9),
(0, 'S5f9dd83535b830.61149278', 0, 506, 107, 9),
(0, 'S5f9dd83537d365.99971622', 0, 507, 108, 9),
(0, 'S5f9dd8353a0386.65400090', 0, 508, 41, 9),
(0, 'S5f9dd8353c0450.00496912', 0, 509, 42, 9),
(0, 'S5f9dd8353e3e48.61773460', 0, 510, 111, 9),
(0, 'S5f9dd835403f31.14504898', 0, 511, 112, 9),
(0, 'S5f9dd835426617.18773987', 0, 512, 113, 9),
(0, 'S5f9dd835446eb8.51617413', 0, 513, 114, 9),
(0, 'S5f9dd835469935.83910080', 0, 514, 115, 9),
(0, 'S5f9dd8354890f4.05521166', 0, 515, 117, 9),
(0, 'S5f9dd8354a8088.77037238', 0, 516, 127, 9),
(0, 'S5f9dd8354ca035.32782339', 0, 517, 132, 9),
(0, 'S60bfb31fb59ac7.28200164', 0, 518, 43, 10),
(0, 'S60bfb31fb645f6.62231038', 0, 519, 44, 10),
(0, 'S60bfb31fb6f000.27040214', 0, 520, 68, 10),
(0, 'S60bfb31fb79158.75368948', 0, 521, 82, 10),
(0, 'S60bfb31fb7f3a3.52219263', 0, 522, 83, 10),
(0, 'S60bfb31fb87a33.42422179', 0, 523, 1, 10),
(0, 'S60bfb31fb8d706.94156155', 0, 524, 2, 10),
(0, 'S60bfb31fb974f8.23961084', 0, 525, 3, 10),
(0, 'S60bfb31fb9f0e3.67165935', 0, 526, 5, 10),
(0, 'S60bfb31fba9724.53054745', 0, 527, 19, 10),
(0, 'S60bfb31fbb02f8.75444657', 0, 528, 20, 10),
(0, 'S60bfb31fbb9d18.03237113', 0, 529, 21, 10),
(0, 'S60bfb31fbc05f2.82444142', 0, 530, 22, 10),
(0, 'S60bfb31fbc99b2.71972110', 0, 531, 23, 10),
(0, 'S60bfb31fbceca2.65608068', 0, 532, 45, 10),
(0, 'S60bfb31fbd6f29.79532013', 0, 533, 46, 10),
(0, 'S60bfb31fbdc265.20104970', 0, 534, 47, 10),
(0, 'S60bfb31fbe31c2.01347413', 0, 535, 48, 10),
(0, 'S60bfb31fbe8687.19161330', 0, 536, 49, 10),
(0, 'S60bfb31fbef586.47631484', 0, 537, 72, 10),
(0, 'S60bfb31fbf8eb0.59698383', 0, 538, 73, 10),
(0, 'S60bfb31fbffc95.02497325', 0, 539, 74, 10),
(0, 'S60bfb31fc09a70.18317987', 0, 540, 75, 10),
(0, 'S60bfb31fc11824.06002915', 0, 541, 76, 10),
(0, 'S60bfb31fc1bd01.30568910', 0, 542, 134, 10),
(0, 'S60bfb31fc25839.54544759', 0, 543, 37, 10),
(0, 'S60bfb31fc2cd85.79351492', 0, 544, 38, 10),
(0, 'S60bfb31fc36603.27983257', 0, 545, 50, 10),
(0, 'S60bfb31fc3d950.99130540', 0, 546, 69, 10),
(0, 'S60bfb31fc4ad42.60114139', 0, 547, 70, 10),
(0, 'S60bfb31fc555a3.28984457', 0, 548, 84, 10),
(0, 'S60bfb31fc5bd87.69160612', 0, 549, 133, 10),
(0, 'S60bfb31fc66a14.47347025', 0, 550, 92, 10),
(0, 'S60bfb31fc6e119.35742288', 0, 551, 93, 10),
(0, 'S60bfb31fc76744.48909159', 0, 552, 94, 10),
(0, 'S60bfb31fc7c4f6.92831835', 0, 553, 95, 10),
(0, 'S60bfb31fc844f7.17848473', 0, 554, 96, 10),
(0, 'S60bfb31fc8a905.02668719', 0, 555, 97, 10),
(0, 'S60bfb31fc921c0.21980525', 0, 556, 137, 10),
(0, 'S60bfb31fc978c6.16908066', 0, 557, 121, 10),
(0, 'S60bfb31fc9f357.87555276', 0, 558, 122, 10),
(0, 'S60bfb31fca52e5.67073648', 0, 559, 126, 10),
(0, 'S60bfb31fcab614.84297338', 0, 560, 144, 10),
(0, 'S60bfb31fcb3d65.71361230', 0, 561, 145, 10),
(0, 'S60bfb31fcb9b65.47907433', 0, 562, 146, 10),
(0, 'S60bfb31fcc13e3.95300427', 0, 563, 147, 10),
(0, 'S60bfb31fcc6f27.78118340', 0, 564, 41, 10),
(0, 'S60bfb31fccd3b5.12918858', 0, 565, 42, 10),
(0, 'S60bfb31fcd1ca3.41833537', 0, 566, 111, 10),
(0, 'S60bfb31fcd6b04.33793861', 0, 567, 112, 10),
(0, 'S60bfb31fcdfeb8.88584137', 0, 568, 113, 10),
(0, 'S60bfb31fce5fc6.55869849', 0, 569, 114, 10),
(0, 'S60bfb31fcf20e0.38167451', 0, 570, 115, 10),
(0, 'S60bfb31fcf7f57.44382076', 0, 571, 116, 10),
(0, 'S60bfb31fd00732.77872490', 0, 572, 117, 10),
(0, 'S60bfb31fd05c43.90145377', 0, 573, 132, 10),
(0, 'S60bfb31fd0d7a0.81229586', 0, 574, 6, 10),
(0, 'S60bfb31fd127c1.57461063', 0, 575, 7, 10),
(0, 'S60bfb31fd17bd1.09783557', 0, 576, 8, 10),
(0, 'S60bfb31fd207d0.90448681', 0, 577, 10, 10),
(0, 'S60bfb31fd26b19.65324706', 0, 578, 11, 10),
(0, 'S60bfb31fd2e7c2.34702749', 0, 579, 12, 10),
(0, 'S60bfb31fd33c94.35464583', 0, 580, 13, 10),
(0, 'S60bfb31fd3b3c0.85129143', 0, 581, 14, 10),
(0, 'S60bfb31fd3fc41.14175808', 0, 582, 15, 10),
(0, 'S60bfb31fd451c5.17898285', 0, 583, 16, 10),
(0, 'S60bfb31fd51052.87280616', 0, 584, 17, 10),
(0, 'S60bfb31fd568a8.85196816', 0, 585, 35, 10),
(0, 'S60bfb31fd62722.59024371', 0, 586, 36, 10),
(0, 'S60bfb31fd6e4b2.66327955', 0, 587, 106, 10),
(0, 'S60bfb31fd730f6.71283053', 0, 588, 107, 10),
(0, 'S60bfb31fd7a988.47430352', 0, 589, 108, 10),
(0, 'S60bfb31fd80724.97639364', 0, 590, 109, 10),
(0, 'S60bfb31fd86372.26829669', 0, 591, 110, 10),
(0, 'S60bfb31fd8e278.35763098', 0, 592, 118, 10),
(0, 'S60bfb31fd94690.60070648', 0, 593, 120, 10),
(0, 'S60bfb31fd9c908.94875258', 0, 594, 142, 10),
(0, 'S60bfb31fda2b40.99018630', 0, 595, 143, 10),
(0, 'S60e77d8ced3474.28712582', 0, 637, 43, 12),
(0, 'S60e77d8cedcb68.75655324', 0, 638, 44, 12),
(0, 'S60e77d8cee4f33.06767440', 0, 639, 68, 12),
(0, 'S60e77d8ceed0d7.79311583', 0, 640, 82, 12),
(0, 'S60e77d8cef2c22.68604840', 0, 641, 83, 12),
(0, 'S60e77d8cef8517.69451898', 0, 642, 1, 12),
(0, 'S60e77d8cf00151.63270349', 0, 643, 2, 12),
(0, 'S60e77d8cf06032.64723303', 0, 644, 3, 12),
(0, 'S60e77d8cf0f3c0.25364601', 0, 645, 5, 12),
(0, 'S60e77d8cf155a1.72447111', 0, 646, 72, 12),
(0, 'S60e77d8cf1dd06.14854963', 0, 647, 73, 12),
(0, 'S60e77d8cf24297.53965966', 0, 648, 74, 12),
(0, 'S60e77d8cf2c324.34291697', 0, 649, 75, 12),
(0, 'S60e77d8cf32632.78904944', 0, 650, 76, 12),
(0, 'S60e77d8cf387f6.64469304', 0, 651, 134, 12),
(0, 'S60e77d8d000bf0.42621230', 0, 652, 37, 12),
(0, 'S60e77d8d00d143.51925416', 0, 653, 50, 12),
(0, 'S60e77d8d025e97.51547568', 0, 654, 41, 12),
(0, 'S60e77d8d030b33.02740110', 0, 655, 42, 12),
(0, 'S60e77d8d03b404.17755654', 0, 656, 111, 12),
(0, 'S60e77d8d0447f8.32923415', 0, 657, 112, 12),
(0, 'S60e77d8d04eb47.59259570', 0, 658, 113, 12),
(0, 'S60e77d8d058318.71430621', 0, 659, 114, 12),
(0, 'S60e77d8d05eab2.19712191', 0, 660, 115, 12),
(0, 'S60e77d8d067073.06150029', 0, 661, 117, 12),
(0, 'S60e77d8d072a16.36387431', 0, 662, 132, 12),
(0, 'S60e77d8d07a8e6.63597524', 0, 663, 6, 12),
(0, 'S60e77d8d081c77.72157589', 0, 664, 7, 12),
(0, 'S60e77d8d08ad29.95463278', 0, 665, 8, 12),
(0, 'S60e77d8d091fe2.33522026', 0, 666, 10, 12),
(0, 'S60e77d8d09bb12.05169256', 0, 667, 11, 12),
(0, 'S60e77d8d0a3888.74436723', 0, 668, 12, 12),
(0, 'S60e77d8d0abce4.88887527', 0, 669, 13, 12),
(0, 'S60e77d8d0b2fa4.67369911', 0, 670, 14, 12),
(0, 'S60e77d8d0bb928.24957710', 0, 671, 15, 12),
(0, 'S60e77d8d0c42c7.95003445', 0, 672, 16, 12),
(0, 'S60e77d8d0cadb4.28497716', 0, 673, 17, 12),
(0, 'S60e77d8d0d1914.89282979', 0, 674, 35, 12),
(0, 'S60e77d8d0d9dc0.67744984', 0, 675, 36, 12),
(0, 'S60e77d8d0e0cf3.33096426', 0, 676, 106, 12),
(0, 'S60e77d8d0ea1c6.58529579', 0, 677, 107, 12),
(0, 'S60e77d8d0f0e05.81983538', 0, 678, 108, 12),
(0, 'S60e77d8d0fb559.20495348', 0, 679, 109, 12),
(0, 'S60e77d8d107168.86538451', 0, 680, 110, 12),
(0, 'S60e77d8d10f6f5.46483391', 0, 681, 118, 12),
(0, 'S60e77d8d11a9e9.91590212', 0, 682, 120, 12),
(0, 'S60e77d8d126040.33078765', 0, 683, 142, 12),
(0, 'S60e77d8d12f516.58766297', 0, 684, 143, 12),
(0, 'S60f892dd2b2be7.78776535', 0, 913, 43, 11),
(0, 'S60f892dd2bb9c4.37441195', 0, 914, 44, 11),
(0, 'S60f892dd2c12f9.68959789', 0, 915, 1, 11),
(0, 'S60f892dd2ca6f1.14811767', 0, 916, 2, 11),
(0, 'S60f892dd2cfdf7.61794120', 0, 917, 3, 11),
(0, 'S60f892dd2d6ce0.10192175', 0, 918, 5, 11),
(0, 'S60f892dd2dbfe6.57599380', 0, 919, 68, 11),
(0, 'S60f892dd2e1856.00143617', 0, 920, 82, 11),
(0, 'S60f892dd2e8bf8.13698824', 0, 921, 83, 11),
(0, 'S60f892dd2eddf5.15705865', 0, 922, 19, 11),
(0, 'S60f892dd2f2eb7.16993552', 0, 923, 20, 11),
(0, 'S60f892dd2f9ca2.05530068', 0, 924, 21, 11),
(0, 'S60f892dd300429.13851673', 0, 925, 23, 11),
(0, 'S60f892dd30ca46.61732553', 0, 926, 72, 11),
(0, 'S60f892dd3137b1.27432604', 0, 927, 73, 11),
(0, 'S60f892dd31cd88.42072881', 0, 928, 74, 11),
(0, 'S60f892dd323616.14852419', 0, 929, 75, 11),
(0, 'S60f892dd32d0e5.62447706', 0, 930, 76, 11),
(0, 'S60f892dd335ea8.06261726', 0, 931, 134, 11),
(0, 'S60f892dd33b871.25980601', 0, 932, 37, 11),
(0, 'S60f892dd341246.35546772', 0, 933, 38, 11),
(0, 'S60f892dd3484a0.47653933', 0, 934, 50, 11),
(0, 'S60f892dd34e093.93515986', 0, 935, 41, 11),
(0, 'S60f892dd355c77.71919847', 0, 936, 42, 11),
(0, 'S60f892dd35b900.54342127', 0, 937, 111, 11),
(0, 'S60f892dd363928.27579558', 0, 938, 112, 11),
(0, 'S60f892dd369b39.56095001', 0, 939, 113, 11),
(0, 'S60f892dd36ecc3.08480138', 0, 940, 115, 11),
(0, 'S60f892dd376b87.05028514', 0, 941, 117, 11),
(0, 'S60f892dd37bd77.54757347', 0, 942, 132, 11),
(0, 'S60f892dd382914.57081408', 0, 943, 6, 11),
(0, 'S60f892dd387cd4.64217991', 0, 944, 7, 11),
(0, 'S60f892dd38e289.48780889', 0, 945, 8, 11),
(0, 'S60f892dd394ce6.42541754', 0, 946, 10, 11),
(0, 'S60f892dd39a116.14279122', 0, 947, 11, 11),
(0, 'S60f892dd3a0f20.21916743', 0, 948, 12, 11),
(0, 'S60f892dd3a6708.14829493', 0, 949, 13, 11),
(0, 'S60f892dd3ad005.41308711', 0, 950, 15, 11),
(0, 'S60f892dd3b3cb9.18218330', 0, 951, 16, 11),
(0, 'S60f892dd3b9070.94705711', 0, 952, 17, 11),
(0, 'S60f892dd3bd991.61023268', 0, 953, 35, 11),
(0, 'S60f892dd3c5102.90653963', 0, 954, 36, 11),
(0, 'S60f892dd3ca484.61412616', 0, 955, 106, 11),
(0, 'S60f892dd3d0711.87659640', 0, 956, 107, 11),
(0, 'S60f892dd3d6031.57692118', 0, 957, 108, 11),
(0, 'S60f892dd3db1f3.06297186', 0, 958, 109, 11),
(0, 'S60f892dd3e1d64.74374036', 0, 959, 110, 11),
(0, 'S60f892dd3e7521.88994153', 0, 960, 118, 11),
(0, 'S60f892dd3ec6a6.09999252', 0, 961, 120, 11),
(0, 'S6206df1ec6d4f9.37789413', 0, 962, 1, 13),
(0, 'S6206df1ec7b321.09855144', 0, 963, 2, 13),
(0, 'S6206df1ec85f98.92589457', 0, 964, 3, 13),
(0, 'S6206df1ec92790.50303355', 0, 965, 5, 13),
(0, 'S6206df1ec9d5c5.68275737', 0, 966, 19, 13),
(0, 'S6206df1eca8d83.81327115', 0, 967, 20, 13),
(0, 'S6206df1ecb1208.89339174', 0, 968, 21, 13),
(0, 'S6206df1ecbd701.03709090', 0, 969, 22, 13),
(0, 'S6206df1ecdf7b4.51611745', 0, 970, 23, 13),
(0, 'S6206df1ecebdd5.10570426', 0, 971, 50, 13),
(0, 'S6206df1ecf7f43.36598751', 0, 972, 41, 13),
(0, 'S6206df1ed01314.24351595', 0, 973, 42, 13),
(0, 'S6206df1ed0c717.68938960', 0, 974, 111, 13),
(0, 'S6206df1ed177a0.58165501', 0, 975, 112, 13),
(0, 'S6206df1ed20144.67594765', 0, 976, 113, 13),
(0, 'S6206df1ed2b246.44489771', 0, 977, 114, 13),
(0, 'S6206df1ed36165.51017207', 0, 978, 115, 13),
(0, 'S6206df1ed3ec80.15962567', 0, 979, 116, 13),
(0, 'S6206df1ed49149.34967490', 0, 980, 117, 13),
(0, 'S6206df1ed51574.35258309', 0, 981, 132, 13),
(0, 'S6206df1ed5c068.24296586', 0, 982, 10, 13),
(0, 'S6206df1ed669c8.33704722', 0, 983, 35, 13),
(0, 'S6206df1ed6ee91.71041244', 0, 984, 36, 13),
(0, 'S6206df1ed79776.07988593', 0, 985, 106, 13),
(0, 'S6206df1ed83c42.41010764', 0, 986, 107, 13),
(0, 'S6206df1ed8ba87.10502446', 0, 987, 108, 13),
(0, 'S6206df1ed95895.05722076', 0, 988, 109, 13),
(0, 'S6206df1ed9da82.75952208', 0, 989, 110, 13),
(0, 'S6206df1eda7dc2.22134362', 0, 990, 118, 13),
(0, 'S6206df1edb21f2.71060617', 0, 991, 120, 13),
(0, 'S6206df1edb9e95.05365397', 0, 992, 142, 13),
(0, 'S6206df1edc4851.21273650', 0, 993, 143, 13),
(0, 'S6206df4c238184.26553654', 0, 994, 1, 14),
(0, 'S6206df4c246448.59560849', 0, 995, 2, 14),
(0, 'S6206df4c252154.58542976', 0, 996, 3, 14),
(0, 'S6206df4c25d622.66202254', 0, 997, 5, 14),
(0, 'S6206df4c268990.02181234', 0, 998, 19, 14),
(0, 'S6206df4c2715d6.73369737', 0, 999, 20, 14),
(0, 'S6206df4c27bd88.61434358', 0, 1000, 21, 14),
(0, 'S6206df4c2877a9.30861761', 0, 1001, 22, 14),
(0, 'S6206df4c291610.71300289', 0, 1002, 23, 14),
(0, 'S6206df4c29d280.69532657', 0, 1003, 50, 14),
(0, 'S6206df4c2a9186.16161379', 0, 1004, 41, 14),
(0, 'S6206df4c2b2648.31485539', 0, 1005, 42, 14),
(0, 'S6206df4c2bd9f5.79071823', 0, 1006, 111, 14),
(0, 'S6206df4c2c89b2.10744305', 0, 1007, 112, 14),
(0, 'S6206df4c2d1638.24393836', 0, 1008, 113, 14),
(0, 'S6206df4c2dc579.12094716', 0, 1009, 114, 14),
(0, 'S6206df4c2e7830.80714571', 0, 1010, 115, 14),
(0, 'S6206df4c2f0050.35781824', 0, 1011, 116, 14),
(0, 'S6206df4c2facd2.36699108', 0, 1012, 117, 14),
(0, 'S6206df4c305786.42290195', 0, 1013, 132, 14),
(0, 'S6206df4c30dcb5.35660661', 0, 1014, 10, 14),
(0, 'S6206df4c318971.04902423', 0, 1015, 35, 14),
(0, 'S6206df4c323139.53756393', 0, 1016, 36, 14),
(0, 'S6206df4c32b551.16230115', 0, 1017, 106, 14),
(0, 'S6206df4c335bb5.29236435', 0, 1018, 107, 14),
(0, 'S6206df4c33dce7.39200013', 0, 1019, 108, 14),
(0, 'S6206df4c348821.44658552', 0, 1020, 109, 14),
(0, 'S6206df4c353cd9.62081305', 0, 1021, 110, 14),
(0, 'S6206df4c35b7f6.80159745', 0, 1022, 118, 14),
(0, 'S6206df4c367521.07611817', 0, 1023, 120, 14),
(0, 'S6206df4c3727b8.47368817', 0, 1024, 142, 14),
(0, 'S6206df4c37b629.05463706', 0, 1025, 143, 14),
(0, 'S62ba8adcc85c93.03122369', 0, 1108, 43, 1),
(0, 'S62ba8adcc94fc6.46536656', 0, 1109, 44, 1),
(0, 'S62ba8adcca2df4.71356917', 0, 1110, 1, 1),
(0, 'S62ba8adccb2f21.20973063', 0, 1111, 2, 1),
(0, 'S62ba8adccc4da2.86987028', 0, 1112, 3, 1),
(0, 'S62ba8adccd1f88.62621387', 0, 1113, 5, 1),
(0, 'S62ba8adcce4c35.96298814', 0, 1114, 68, 1),
(0, 'S62ba8adccfa824.71819256', 0, 1115, 82, 1),
(0, 'S62ba8adcd069d9.25427404', 0, 1116, 83, 1),
(0, 'S62ba8adcd17c77.22004355', 0, 1117, 148, 1),
(0, 'S62ba8adcd276f1.81553873', 0, 1118, 151, 1),
(0, 'S62ba8adcd356a8.14120672', 0, 1119, 152, 1),
(0, 'S62ba8adcd41cd1.98775202', 0, 1120, 153, 1),
(0, 'S62ba8adcd4d808.51545435', 0, 1121, 154, 1),
(0, 'S62ba8adcd58d65.02965627', 0, 1122, 19, 1),
(0, 'S62ba8adcd63cd5.32436095', 0, 1123, 20, 1),
(0, 'S62ba8adcd6cf66.52173869', 0, 1124, 21, 1),
(0, 'S62ba8adcd79622.81208128', 0, 1125, 22, 1),
(0, 'S62ba8adcd87953.99493899', 0, 1126, 23, 1),
(0, 'S62ba8adcd95e98.73492719', 0, 1127, 45, 1),
(0, 'S62ba8adcda11a6.41653058', 0, 1128, 46, 1),
(0, 'S62ba8adcdaf434.94566797', 0, 1129, 47, 1),
(0, 'S62ba8adcdbbaa7.41436676', 0, 1130, 48, 1),
(0, 'S62ba8adcdc8af5.29050801', 0, 1131, 49, 1),
(0, 'S62ba8adcdd4313.89880131', 0, 1132, 72, 1),
(0, 'S62ba8adcddf3a5.82186811', 0, 1133, 73, 1),
(0, 'S62ba8adcdec343.29495317', 0, 1134, 74, 1),
(0, 'S62ba8adcdf8235.79740311', 0, 1135, 75, 1),
(0, 'S62ba8adce04c97.24834175', 0, 1136, 76, 1),
(0, 'S62ba8adce10747.43154200', 0, 1137, 134, 1),
(0, 'S62ba8adce1a8c7.56834614', 0, 1138, 37, 1),
(0, 'S62ba8adce28ce0.10521286', 0, 1139, 38, 1),
(0, 'S62ba8adce36ce0.71924958', 0, 1140, 50, 1),
(0, 'S62ba8adce42a54.96458221', 0, 1141, 69, 1),
(0, 'S62ba8adce4d282.66753048', 0, 1142, 70, 1),
(0, 'S62ba8adce5a044.50409403', 0, 1143, 84, 1),
(0, 'S62ba8adce68855.86937382', 0, 1144, 133, 1),
(0, 'S62ba8adce768b7.31414598', 0, 1145, 92, 1),
(0, 'S62ba8adce83aa8.95194388', 0, 1146, 93, 1),
(0, 'S62ba8adce90076.02367012', 0, 1147, 94, 1),
(0, 'S62ba8adce9bad1.44196224', 0, 1148, 95, 1),
(0, 'S62ba8adceaaff4.34244564', 0, 1149, 96, 1),
(0, 'S62ba8adceb68b6.40187460', 0, 1150, 97, 1),
(0, 'S62ba8adcec3b71.84633599', 0, 1151, 137, 1),
(0, 'S62ba8adced1623.31443495', 0, 1152, 121, 1),
(0, 'S62ba8adcede403.93172045', 0, 1153, 122, 1),
(0, 'S62ba8adcee9245.68411236', 0, 1154, 126, 1),
(0, 'S62ba8adcef59f5.29965928', 0, 1155, 138, 1),
(0, 'S62ba8adcf00fb5.71489691', 0, 1156, 144, 1),
(0, 'S62ba8adcf0c4e6.67175939', 0, 1157, 145, 1),
(0, 'S62ba8adcf1a672.19069946', 0, 1158, 146, 1),
(0, 'S62ba8adcf28a29.17852296', 0, 1159, 147, 1),
(0, 'S62ba8adcf34847.66274756', 0, 1160, 149, 1),
(0, 'S62ba8adcf41579.00055941', 0, 1161, 41, 1),
(0, 'S62ba8add00bdc8.22516089', 0, 1162, 42, 1),
(0, 'S62ba8add017f64.97411962', 0, 1163, 111, 1),
(0, 'S62ba8add022ad5.65416165', 0, 1164, 112, 1),
(0, 'S62ba8add02fa03.39358902', 0, 1165, 113, 1),
(0, 'S62ba8add03bda8.32355397', 0, 1166, 114, 1),
(0, 'S62ba8add047c64.58976949', 0, 1167, 115, 1),
(0, 'S62ba8add053a06.20323620', 0, 1168, 116, 1),
(0, 'S62ba8add064fa1.57325823', 0, 1169, 117, 1),
(0, 'S62ba8add074e37.73577163', 0, 1170, 132, 1),
(0, 'S62ba8add084411.68123797', 0, 1171, 6, 1),
(0, 'S62ba8add090e98.60298781', 0, 1172, 7, 1),
(0, 'S62ba8add09c401.74942194', 0, 1173, 8, 1),
(0, 'S62ba8add0acd46.21447740', 0, 1174, 10, 1),
(0, 'S62ba8add0b9a93.86956016', 0, 1175, 11, 1),
(0, 'S62ba8add0c65e3.04558982', 0, 1176, 12, 1),
(0, 'S62ba8add0d2825.53073360', 0, 1177, 13, 1),
(0, 'S62ba8add0dbc56.50175930', 0, 1178, 14, 1),
(0, 'S62ba8add0e7176.92532690', 0, 1179, 15, 1),
(0, 'S62ba8add0f27e3.10611641', 0, 1180, 16, 1),
(0, 'S62ba8add0fb8e2.04748802', 0, 1181, 17, 1),
(0, 'S62ba8add1059e6.97821094', 0, 1182, 35, 1),
(0, 'S62ba8add1108f8.94134199', 0, 1183, 36, 1),
(0, 'S62ba8add119c04.08487621', 0, 1184, 106, 1),
(0, 'S62ba8add1268d5.21273303', 0, 1185, 107, 1),
(0, 'S62ba8add1339b5.88053138', 0, 1186, 108, 1),
(0, 'S62ba8add13e769.88520333', 0, 1187, 109, 1),
(0, 'S62ba8add147b61.65638583', 0, 1188, 110, 1),
(0, 'S62ba8add154997.41356224', 0, 1189, 118, 1),
(0, 'S62ba8add1611f8.24869234', 0, 1190, 120, 1),
(0, 'S62ba8add16afe7.13466901', 0, 1191, 142, 1),
(0, 'S62ba8add178389.69357632', 0, 1192, 143, 1),
(0, 'S62ba8add183968.66706124', 0, 1193, 150, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voucher`
--

CREATE TABLE `voucher` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_voucher` int(11) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `referencia_pago` varchar(50) NOT NULL,
  `numero_doc` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `monto` float NOT NULL,
  `responsable` varchar(200) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `id_movimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voucher_mov`
--

CREATE TABLE `voucher_mov` (
  `id_server` int(11) NOT NULL,
  `unique_id` text NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_mv` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `id_cuenta_pagar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono_credito`
--
ALTER TABLE `abono_credito`
  ADD PRIMARY KEY (`id_abono_credito`);

--
-- Indices de la tabla `access_conf`
--
ALTER TABLE `access_conf`
  ADD PRIMARY KEY (`id_conf`);

--
-- Indices de la tabla `altclitocli`
--
ALTER TABLE `altclitocli`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apertura_caja`
--
ALTER TABLE `apertura_caja`
  ADD PRIMARY KEY (`id_apertura`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id_banco`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categoria_proveedor`
--
ALTER TABLE `categoria_proveedor`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cheque`
--
ALTER TABLE `cheque`
  ADD PRIMARY KEY (`id_cheque`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `compra2`
--
ALTER TABLE `compra2`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id_configuracion`);

--
-- Indices de la tabla `config_dir`
--
ALTER TABLE `config_dir`
  ADD PRIMARY KEY (`id_config_dir`);

--
-- Indices de la tabla `config_pos`
--
ALTER TABLE `config_pos`
  ADD PRIMARY KEY (`id_config_pos`);

--
-- Indices de la tabla `consignacion`
--
ALTER TABLE `consignacion`
  ADD PRIMARY KEY (`id_consignacion`);

--
-- Indices de la tabla `consignacion_detalle`
--
ALTER TABLE `consignacion_detalle`
  ADD PRIMARY KEY (`id_consignacion_detalle`),
  ADD KEY `id_consignacion` (`id_consignacion`);

--
-- Indices de la tabla `controlcaja`
--
ALTER TABLE `controlcaja`
  ADD PRIMARY KEY (`id_corte`);

--
-- Indices de la tabla `correlativo`
--
ALTER TABLE `correlativo`
  ADD PRIMARY KEY (`id_numdoc`);

--
-- Indices de la tabla `cortes_parqueo`
--
ALTER TABLE `cortes_parqueo`
  ADD PRIMARY KEY (`id_corte_parqueo`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`);

--
-- Indices de la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`id_credito`);

--
-- Indices de la tabla `cuenta_banco`
--
ALTER TABLE `cuenta_banco`
  ADD PRIMARY KEY (`id_cuenta`);

--
-- Indices de la tabla `cuenta_pagar`
--
ALTER TABLE `cuenta_pagar`
  ADD PRIMARY KEY (`id_cuenta_pagar`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `detalle_apertura`
--
ALTER TABLE `detalle_apertura`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_det_compra`);

--
-- Indices de la tabla `detalle_compra2`
--
ALTER TABLE `detalle_compra2`
  ADD PRIMARY KEY (`id_det_compra`);

--
-- Indices de la tabla `detalle_voucher`
--
ALTER TABLE `detalle_voucher`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id_dev`);

--
-- Indices de la tabla `devoluciones_corte`
--
ALTER TABLE `devoluciones_corte`
  ADD PRIMARY KEY (`id_dev`);

--
-- Indices de la tabla `devoluciones_det`
--
ALTER TABLE `devoluciones_det`
  ADD PRIMARY KEY (`id_dev_det`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idempresa`);

--
-- Indices de la tabla `estante`
--
ALTER TABLE `estante`
  ADD PRIMARY KEY (`id_estante`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD PRIMARY KEY (`id_factura_detalle`);

--
-- Indices de la tabla `log_cambio_local`
--
ALTER TABLE `log_cambio_local`
  ADD PRIMARY KEY (`id_log_cambio`);

--
-- Indices de la tabla `log_detalle_cambio_local`
--
ALTER TABLE `log_detalle_cambio_local`
  ADD PRIMARY KEY (`id_detalle_cambio`);

--
-- Indices de la tabla `log_update_local`
--
ALTER TABLE `log_update_local`
  ADD PRIMARY KEY (`id_log_cambio`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id_lote`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `movimiento_caja_tipo`
--
ALTER TABLE `movimiento_caja_tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `movimiento_producto`
--
ALTER TABLE `movimiento_producto`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `movimiento_producto_detalle`
--
ALTER TABLE `movimiento_producto_detalle`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `movimiento_producto_pendiente`
--
ALTER TABLE `movimiento_producto_pendiente`
  ADD PRIMARY KEY (`id_detalle`);

--
-- Indices de la tabla `movimiento_stock_ubicacion`
--
ALTER TABLE `movimiento_stock_ubicacion`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `mov_caja`
--
ALTER TABLE `mov_caja`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `mov_cta_banco`
--
ALTER TABLE `mov_cta_banco`
  ADD PRIMARY KEY (`id_movimiento`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `nc_corte`
--
ALTER TABLE `nc_corte`
  ADD PRIMARY KEY (`id_nc`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parqueo`
--
ALTER TABLE `parqueo`
  ADD PRIMARY KEY (`id_parqueo`);

--
-- Indices de la tabla `parqueo_precios`
--
ALTER TABLE `parqueo_precios`
  ADD PRIMARY KEY (`id_precio_parqueo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id_pedido_detalle`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido_prov`
--
ALTER TABLE `pedido_prov`
  ADD PRIMARY KEY (`id_pedido_prov`);

--
-- Indices de la tabla `pedido_prov_detalle`
--
ALTER TABLE `pedido_prov_detalle`
  ADD PRIMARY KEY (`id_pedido_detalle`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `posicion`
--
ALTER TABLE `posicion`
  ADD PRIMARY KEY (`id_posicion`);

--
-- Indices de la tabla `precio_aut`
--
ALTER TABLE `precio_aut`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`id_presentacion`);

--
-- Indices de la tabla `presentacion_producto`
--
ALTER TABLE `presentacion_producto`
  ADD PRIMARY KEY (`id_pp`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- Indices de la tabla `stock_ubicacion`
--
ALTER TABLE `stock_ubicacion`
  ADD PRIMARY KEY (`id_su`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`id_tipo_empleado`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id_tipopago`);

--
-- Indices de la tabla `tipo_proveedor`
--
ALTER TABLE `tipo_proveedor`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `to_corte`
--
ALTER TABLE `to_corte`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `to_corte_producto`
--
ALTER TABLE `to_corte_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `to_corte_producto_detalle`
--
ALTER TABLE `to_corte_producto_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`id_traslado`);

--
-- Indices de la tabla `traslado_detalle`
--
ALTER TABLE `traslado_detalle`
  ADD PRIMARY KEY (`id_detalle_traslado`);

--
-- Indices de la tabla `traslado_detalle_g`
--
ALTER TABLE `traslado_detalle_g`
  ADD PRIMARY KEY (`id_detalle_traslado`);

--
-- Indices de la tabla `traslado_detalle_recibido`
--
ALTER TABLE `traslado_detalle_recibido`
  ADD PRIMARY KEY (`id_detalle_traslado_recibido`);

--
-- Indices de la tabla `traslado_g`
--
ALTER TABLE `traslado_g`
  ADD PRIMARY KEY (`id_traslado`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `usuario_modulo`
--
ALTER TABLE `usuario_modulo`
  ADD PRIMARY KEY (`id_mod_user`);

--
-- Indices de la tabla `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`);

--
-- Indices de la tabla `voucher_mov`
--
ALTER TABLE `voucher_mov`
  ADD PRIMARY KEY (`id_mv`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abono_credito`
--
ALTER TABLE `abono_credito`
  MODIFY `id_abono_credito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `access_conf`
--
ALTER TABLE `access_conf`
  MODIFY `id_conf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `altclitocli`
--
ALTER TABLE `altclitocli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apertura_caja`
--
ALTER TABLE `apertura_caja`
  MODIFY `id_apertura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id_banco` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria_proveedor`
--
ALTER TABLE `categoria_proveedor`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cheque`
--
ALTER TABLE `cheque`
  MODIFY `id_cheque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra2`
--
ALTER TABLE `compra2`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id_configuracion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `config_dir`
--
ALTER TABLE `config_dir`
  MODIFY `id_config_dir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `config_pos`
--
ALTER TABLE `config_pos`
  MODIFY `id_config_pos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consignacion`
--
ALTER TABLE `consignacion`
  MODIFY `id_consignacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consignacion_detalle`
--
ALTER TABLE `consignacion_detalle`
  MODIFY `id_consignacion_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `controlcaja`
--
ALTER TABLE `controlcaja`
  MODIFY `id_corte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `correlativo`
--
ALTER TABLE `correlativo`
  MODIFY `id_numdoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cortes_parqueo`
--
ALTER TABLE `cortes_parqueo`
  MODIFY `id_corte_parqueo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `id_credito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuenta_banco`
--
ALTER TABLE `cuenta_banco`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cuenta_pagar`
--
ALTER TABLE `cuenta_pagar`
  MODIFY `id_cuenta_pagar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_apertura`
--
ALTER TABLE `detalle_apertura`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_det_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_compra2`
--
ALTER TABLE `detalle_compra2`
  MODIFY `id_det_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `detalle_voucher`
--
ALTER TABLE `detalle_voucher`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  MODIFY `id_dev` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devoluciones_corte`
--
ALTER TABLE `devoluciones_corte`
  MODIFY `id_dev` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devoluciones_det`
--
ALTER TABLE `devoluciones_det`
  MODIFY `id_dev_det` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estante`
--
ALTER TABLE `estante`
  MODIFY `id_estante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  MODIFY `id_factura_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `log_cambio_local`
--
ALTER TABLE `log_cambio_local`
  MODIFY `id_log_cambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `log_detalle_cambio_local`
--
ALTER TABLE `log_detalle_cambio_local`
  MODIFY `id_detalle_cambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `log_update_local`
--
ALTER TABLE `log_update_local`
  MODIFY `id_log_cambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id_lote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de la tabla `movimiento_caja_tipo`
--
ALTER TABLE `movimiento_caja_tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_producto`
--
ALTER TABLE `movimiento_producto`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimiento_producto_detalle`
--
ALTER TABLE `movimiento_producto_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimiento_producto_pendiente`
--
ALTER TABLE `movimiento_producto_pendiente`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_stock_ubicacion`
--
ALTER TABLE `movimiento_stock_ubicacion`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mov_caja`
--
ALTER TABLE `mov_caja`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mov_cta_banco`
--
ALTER TABLE `mov_cta_banco`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del municipio', AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT de la tabla `nc_corte`
--
ALTER TABLE `nc_corte`
  MODIFY `id_nc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parqueo`
--
ALTER TABLE `parqueo`
  MODIFY `id_parqueo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parqueo_precios`
--
ALTER TABLE `parqueo_precios`
  MODIFY `id_precio_parqueo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `id_pedido_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_prov`
--
ALTER TABLE `pedido_prov`
  MODIFY `id_pedido_prov` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_prov_detalle`
--
ALTER TABLE `pedido_prov_detalle`
  MODIFY `id_pedido_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posicion`
--
ALTER TABLE `posicion`
  MODIFY `id_posicion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precio_aut`
--
ALTER TABLE `precio_aut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `id_presentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `presentacion_producto`
--
ALTER TABLE `presentacion_producto`
  MODIFY `id_pp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `stock_ubicacion`
--
ALTER TABLE `stock_ubicacion`
  MODIFY `id_su` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  MODIFY `id_tipo_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id_tipopago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_proveedor`
--
ALTER TABLE `tipo_proveedor`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `to_corte`
--
ALTER TABLE `to_corte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `to_corte_producto`
--
ALTER TABLE `to_corte_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `to_corte_producto_detalle`
--
ALTER TABLE `to_corte_producto_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado`
--
ALTER TABLE `traslado`
  MODIFY `id_traslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado_detalle`
--
ALTER TABLE `traslado_detalle`
  MODIFY `id_detalle_traslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado_detalle_g`
--
ALTER TABLE `traslado_detalle_g`
  MODIFY `id_detalle_traslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado_detalle_recibido`
--
ALTER TABLE `traslado_detalle_recibido`
  MODIFY `id_detalle_traslado_recibido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado_g`
--
ALTER TABLE `traslado_g`
  MODIFY `id_traslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuario_modulo`
--
ALTER TABLE `usuario_modulo`
  MODIFY `id_mod_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1194;

--
-- AUTO_INCREMENT de la tabla `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `voucher_mov`
--
ALTER TABLE `voucher_mov`
  MODIFY `id_mv` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
