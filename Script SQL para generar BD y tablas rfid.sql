-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2020 a las 04:02:03
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rfid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaborador`
--

CREATE TABLE `colaborador` (
  `Nombres` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Acceso` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `UID` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `colaborador`
--

INSERT INTO `colaborador` (`Nombres`, `Apellidos`, `Acceso`, `UID`) VALUES
('Michael E. ', 'Jackson', 'Main Lab, 1st Level', 191919),
('Jose', 'Pineda', 'DataCenter', 575830),
('Carl J.', 'Sagan', 'Observatory Access', 789456);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `UID` int(32) NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp(),
  `Hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `Acceso` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Puerta Laboratorio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`UID`, `Fecha`, `Hora`, `Acceso`) VALUES
(575830, '2020-03-05', '2020-03-05 16:40:55', 'Puerta Laboratorio'),
(575830, '2020-03-05', '2020-03-05 16:50:01', 'Puerta Laboratorio'),
(575830, '2020-03-05', '2020-03-05 16:52:42', 'Puerta Laboratorio'),
(575830, '2020-03-05', '2020-03-05 16:57:59', 'Puerta Laboratorio'),
(575830, '2020-03-05', '2020-03-05 16:58:23', 'Puerta Laboratorio'),
(575830, '2020-03-05', '2020-03-05 17:18:46', 'Puerta Laboratorio'),
(575830, '0000-00-00', '2020-03-05 17:23:18', 'Puerta Laboratorio'),
(575830, '0000-00-00', '2020-03-05 17:23:40', 'Puerta Laboratorio'),
(575830, '2020-03-05', '2020-03-05 17:33:01', 'Lector: Nivel 3, Pue'),
(575830, '2020-03-05', '2020-03-05 17:52:07', 'Lector: Nivel 3, Pue'),
(575830, '2020-03-05', '2020-03-05 17:56:18', 'Lector: Nivel 3, Pue'),
(575830, '2020-03-05', '2020-03-05 17:58:09', 'Lector: Nivel 3, Pue'),
(575830, '2020-03-05', '2020-03-05 17:59:36', 'Lector: Nivel 3, Pue'),
(575830, '2020-03-05', '2020-03-05 18:01:48', 'Lector: Nivel 3, Pue'),
(575830, '2020-03-05', '2020-03-05 18:16:33', 'Lector: Nivel 3, Pue'),
(575830, '2020-03-05', '2020-03-05 18:17:10', 'Lector: Nivel 3, Pue'),
(191919, '2020-03-05', '2020-03-05 21:20:00', 'Lector: Nivel 3, Pue'),
(191919, '2020-03-05', '2020-03-05 21:20:45', 'Lector: Nivel 3, Pue'),
(191919, '2020-03-05', '2020-03-05 21:20:50', 'Lector: Nivel 3, Pue'),
(789456, '2020-03-05', '2020-03-05 21:32:00', 'Lector: Nivel 3, Pue'),
(191919, '2020-03-05', '2020-03-05 21:32:04', 'Lector: Nivel 3, Pue'),
(789456, '2020-03-05', '2020-03-05 21:32:15', 'Lector: Nivel 3, Pue'),
(191919, '2020-03-05', '2020-03-05 21:32:18', 'Lector: Nivel 3, Pue'),
(789456, '2020-03-05', '2020-03-05 21:36:55', 'Lector: Nivel 3, Pue'),
(191919, '2020-03-05', '2020-03-05 21:37:00', 'Lector: Nivel 3, Pue'),
(789456, '2020-03-05', '2020-03-05 21:37:05', 'Lector: Nivel 3, Pue'),
(191919, '2020-03-05', '2020-03-05 21:37:09', 'Lector: Nivel 3, Pue'),
(191919, '2020-03-05', '2020-03-05 21:37:15', 'Lector: Nivel 3, Pue'),
(789456, '2020-03-05', '2020-03-05 21:37:33', 'Lector: Nivel 3, Pue');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colaborador`
--
ALTER TABLE `colaborador`
  ADD PRIMARY KEY (`UID`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD KEY `LLaveUID` (`UID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `LLaveUID` FOREIGN KEY (`UID`) REFERENCES `colaborador` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
