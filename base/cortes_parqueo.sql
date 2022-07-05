-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-06-2022 a las 14:22:42
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

--
-- Volcado de datos para la tabla `cortes_parqueo`
--


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cortes_parqueo`
--
ALTER TABLE `cortes_parqueo`
  ADD PRIMARY KEY (`id_corte_parqueo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cortes_parqueo`
--
ALTER TABLE `cortes_parqueo`
  MODIFY `id_corte_parqueo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
