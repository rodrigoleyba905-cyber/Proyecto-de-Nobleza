-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-08-2026 a las 20:48:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nobleza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

CREATE TABLE `asignaciones` (
  `idAsignacion` int(11) NOT NULL,
  `numeroSerie` varchar(50) NOT NULL,
  `nombreEquipo` varchar(50) DEFAULT NULL,
  `nombreTrabajador` varchar(150) DEFAULT NULL,
  `nave` varchar(50) DEFAULT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  `idEstadoAsignacion` int(11) DEFAULT NULL,
  `fechaAsignacion` datetime DEFAULT current_timestamp(),
  `asignadoPor` int(11) DEFAULT NULL,
  `fechaDevolucion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaciones`
--

INSERT INTO `asignaciones` (`idAsignacion`, `numeroSerie`, `nombreEquipo`, `nombreTrabajador`, `nave`, `comentarios`, `idEstadoAsignacion`, `fechaAsignacion`, `asignadoPor`, `fechaDevolucion`) VALUES
(1, 'B36BZJ3', '2', '1', 'Nave 4', '1', 1, '2026-08-20 12:42:58', NULL, NULL),
(2, '4CE1110RYP', '1', '1', 'Nave 3', '1', 2, '2026-08-20 12:43:12', NULL, '2026-08-20 12:46:46'),
(3, '4CE1110RYP', '1', '1', 'Nave 4', '1', 2, '2026-08-20 12:46:58', NULL, '2026-08-20 12:47:14');

--
-- Disparadores `asignaciones`
--
DELIMITER $$
CREATE TRIGGER `trg_respaldo_asignacion` AFTER UPDATE ON `asignaciones` FOR EACH ROW BEGIN
     INSERT INTO historial_asignaciones
     (numeroSerie, nombreEquipo, nombreTrabajador, nave, comentarios)
     VALUES
     (OLD.numeroSerie, OLD.nombreEquipo, OLD.nombreTrabajador, OLD.nave, OLD.comentarios);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombreCategoria`) VALUES
(1, 'PC'),
(2, 'Laptop');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_asignacion`
--

CREATE TABLE `estados_asignacion` (
  `idEstadoAsignacion` int(11) NOT NULL,
  `nombreEstadoAsignacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados_asignacion`
--

INSERT INTO `estados_asignacion` (`idEstadoAsignacion`, `nombreEstadoAsignacion`) VALUES
(1, 'ACTIVA'),
(2, 'INACTIVA'),
(3, 'SISTEMAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_hardware`
--

CREATE TABLE `estados_hardware` (
  `idEstado` int(11) NOT NULL,
  `nombreEstado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados_hardware`
--

INSERT INTO `estados_hardware` (`idEstado`, `nombreEstado`) VALUES
(1, 'Nuevo'),
(2, 'Usado'),
(3, 'Desecho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hardware`
--

CREATE TABLE `hardware` (
  `idHardware` int(11) NOT NULL,
  `numeroSerie` varchar(50) NOT NULL,
  `modelo` varchar(150) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idProcesador` int(11) DEFAULT NULL,
  `idSistema` int(11) DEFAULT NULL,
  `disco` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `idPaqueteria` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT current_timestamp(),
  `idEstadoAsignacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hardware`
--

INSERT INTO `hardware` (`idHardware`, `numeroSerie`, `modelo`, `idCategoria`, `idMarca`, `idEstado`, `idProcesador`, `idSistema`, `disco`, `ram`, `idPaqueteria`, `fechaCreacion`, `idEstadoAsignacion`) VALUES
(1, '6KKS6G4', 'DELL PRO 16 PB16250', 2, 2, 2, 5, 2, NULL, '32 GB', 1, '2026-08-06 11:07:32', 0),
(2, '5CD537GC5M', 'HP PROBOOK 4 G1I 16 BH8M9LT ABM', 2, 1, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 1),
(3, '8M27SH4', 'DELL PRO PC16250', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(4, '8W85JK3', 'Vostro 15 3510', 2, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 3),
(5, 'D8G2894', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(6, 'SIN-SERIE-NO4', 'N/A', 1, 1, 2, 1, 2, 'N/A', '12 GB', 2, '2026-08-06 11:07:32', 0),
(7, '7FZ1894', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(8, '3CR54606RN', 'P7P95LT', 1, 1, 2, 1, 1, 'S/DISCO', '8 GB', 1, '2026-08-06 11:07:32', 0),
(9, '4G5KHK3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(10, '4D7FZ44', 'Small Form Factor 7010', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(11, '6J32894', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(12, 'C84DK44', 'Small Form Factor 7010', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(13, '58PJX74', 'Small Form Factor 7020', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(14, 'CM7V144', 'Small Form Factor 7010', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(15, 'JCTF9T3', 'Vostro 15 3510', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 1),
(16, '5QMJMDA4', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(17, '3CR5450D1W', 'P7P95LT', 1, 1, 2, 1, 1, 'S/DISCO', '12 GB', 1, '2026-08-06 11:07:32', 0),
(18, '60WRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(19, '9K32894', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(20, 'PF-4RZB59', '21JQ0007LM', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(21, 'PF-50ZXSY', '21JQ0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 1),
(22, 'CND30603T0', '7H6B6LA', 2, 1, 2, 5, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(23, 'H9RR904', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(24, 'CVPV1-8QUZ-6778', 'A1', 1, NULL, 2, NULL, NULL, NULL, NULL, 1, '2026-08-06 11:07:32', 0),
(25, 'CVPV1-8QUZ-6782', 'A1', 1, NULL, 2, 5, NULL, NULL, '32 GB', 1, '2026-08-06 11:07:32', 0),
(26, '5NRRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(27, 'NXVVAAL001245052767600', 'TMP215-54', 2, 4, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(28, '29NV3D4', 'DELL PRO SLIM', 1, 2, 2, 3, 1, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(29, '2DM71Z3', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(30, '7YK0933', 'Vostro 3681', 1, 2, 2, 1, 2, NULL, '12 GB', 1, '2026-08-06 11:07:32', 0),
(31, 'MP2LL9EZ', '21DJ00QEGJ', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(32, '4CE203CHQ9', '615Y4LA', 1, 1, 2, 1, 2, NULL, '12 GB', 1, '2026-08-06 11:07:32', 0),
(33, 'PW-0CRP2W', '21L4000MLM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 1),
(34, '4CE1103281', '1R2K2LA', 1, 1, 2, 1, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(35, 'CND2501NQS', '5U0S1LT', 2, 1, 2, 5, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(36, 'LR0DR3CD', '20RV002ELM', 2, 3, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(37, '5CD3109Y4R', '6X2K0LT', 2, 1, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(38, 'NO VISIBLE', 'BBZ-WBI9', 2, 6, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(39, 'NXGT8AL0017350155C3400', 'QCS1250 DELL PRO SLIM', 2, 4, 2, 3, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(40, '36DJHK3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(41, '3CR54805PS', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(42, 'GL927M3', 'Latitude 7420', 2, 2, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(43, '3CR54606W8', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(44, '7PQ5DD3', '3080 Micro', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(45, '5CD225NZPB', '6X2K0LT', 2, 1, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(46, 'LR0D2J56', '20RV00NNLM', 2, 3, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(47, 'NXVLFAL006018001207600', 'TMP214', 2, 4, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(48, 'K1N0CV07N536036', 'A507UA', 2, 5, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(49, '3CR54606GS', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(50, '8MWRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(51, 'NXK3LAL004312139E53400', 'A515-57', 2, 4, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(52, '6VQJMD4', 'QCS1250 DELL PRO SLIM', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(53, '7W78R52', 'XPS 8700', 1, 2, 2, 5, 1, '480', '16 GB', 1, '2026-08-06 11:07:32', 0),
(54, '6MQ5DD3', 'OptiPlex 3080 Micro', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(55, 'K1N0CV07N39203C', 'A507UA', 2, 5, 2, 1, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(56, 'PF-4DCJSQ', '20YRS1KH00', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(57, '3CR54606GT', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(58, '3CR54805RF', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(59, '3CR54606GH', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(60, 'DHVZFD3', 'Vostro 3500', 2, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(61, 'PF-4QXDZ3', '21JQ0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(62, '9ZR5DD3', '3080 Micro', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(63, 'PF-4X3P31', '21JQ0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(64, '6JZ1894', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(65, '2YVRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(66, '3CR5520LBK', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(67, 'PW-0CRP2X', '21L4000MLM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(68, '2C72894', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(69, '4CE203BQPN', '615Y5LA', 1, 1, 2, 3, 2, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(70, 'PF-5DJVEJ', '21MB0009LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(71, '75J1MB3', 'Vostro 3500', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(72, 'JAN0CV08M16642E', 'A507U', 2, 5, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(73, '4NQRLS94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(74, '3CR546079M', 'P7P95LT', 1, 1, 2, 1, 1, 'S/DISCO', '4 GB', 1, '2026-08-06 11:07:32', 0),
(75, 'PF-4RW9ES', '21JQ0007LM', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(76, 'CND324290P', '8B5M2LT', 2, 1, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(77, 'PF-555WXQ', '21JQ0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(78, 'PF-4QX51J', '21JQ0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(79, 'CS29F94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(80, 'DXDYH93', 'VOSTRO 3500', 2, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(81, 'PF-4CT15G', '21ED002CAU', 2, 3, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(82, 'B46BZJ3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(83, 'JNNPM21C14000103', 'BBZ-WBI9', 2, 6, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(84, '5CD6106HX1', 'PROBOOK G1I 16 (D66W3LT#ABMX)', 2, 1, 2, 3, NULL, NULL, '16 GB', 1, '2026-08-06 11:07:32', 1),
(85, '3SWRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(86, '4FNS904', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(87, 'PF-558SFK', '21JQ0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(88, 'PW-049TML', '21C4S1HW00', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(89, 'PW-0CRP2X-DUP2', '21L4000MLM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(90, 'PF-4X5F96', '21JQ0007LM', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(91, '5CG23814JC', '5U0S5LT', 2, 1, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(92, 'CND2501NFP', '5U0S1LT', 2, 1, 2, 5, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(93, 'LR0D19CW', '20RV002ELM', 2, 3, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(94, '95Q1PY3', 'Vostro 15 3530', 2, 2, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(95, 'PF-4RSTD6', '21JQ0007LM', 2, 3, 2, 5, 2, '480', '16 GB', 1, '2026-08-06 11:07:32', 3),
(96, '3CR54606P0', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(97, 'J7PMY84', 'DELL PRO (Latitude 3550)', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(98, '3Q29F94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(99, 'GPXRo94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(100, '3CRRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(101, '394DK44', 'D17S', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(102, '3CR5450D7K', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(103, '3CR546074J', 'HP 280 G1', 1, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(104, '3CR54606S2', 'HP 280 G1', 1, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(105, '3CR5450D0X', 'HP 280 G1', 1, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(106, '3NRRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(107, '3CR547036N', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(108, '3CR5450D2J', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(109, '2DCG0V3', 'Vostro 15 3510', 2, 2, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(110, '2LCH9T3', 'Vostro 15 3510', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(111, 'CQQRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(112, '2QD2ZJ3', 'VOSTRO 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(113, 'BQX43H4', 'DELL PRO SLIM  QCS1250', 1, 2, 2, 3, NULL, NULL, '16 GB', 1, '2026-08-06 11:07:32', 3),
(114, '3CR54606H1', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(115, '3CR5450D5H', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(116, 'NXGT8AL001735010323400', 'A515-51', 2, 4, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(117, '7VVRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(118, '3CR553026R', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(119, 'CVPV1-8QUZ-5156', 'A1', 1, NULL, 2, 5, NULL, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(120, 'CVPV1-8QUZ-7687', 'A1', 1, NULL, 2, 5, NULL, NULL, '32 GB', 1, '2026-08-06 11:07:32', 0),
(121, '5LWBK44', 'Small Form Factor 7010', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(122, 'CND2352WQ1', '5U0S1LT', 2, 1, 2, 5, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(123, '3CR54607HD', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(124, '8CG850006X', 'P7P95LT', 1, 1, 2, 1, 2, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(125, '8FGNG94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(126, '3CR54606HG', 'P7P95LT', 1, 1, 2, 1, 1, '480', '4 GB', 1, '2026-08-06 11:07:32', 0),
(127, 'PW0CRR1P', '21KH00F4LM', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(128, 'PF-4QX2V8', '0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(129, '3CR5450BCZ', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(130, '3QZN1Z3', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(131, '8HGNG94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(132, '2WB8894', 'DELL PRO SLIM', 1, 2, 2, 3, 1, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(133, '4CE149CHZR', '615Y4LA', 1, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(134, '4G7FZ44', 'D17S', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(135, 'GABINETE', 'NA', 1, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(136, '7FZ1894-DUP2', 'DELL PRO SLIM  QCS1250', 1, 2, 3, 3, 1, 'N/A', '16 GB', 1, '2026-08-06 11:07:32', 1),
(137, '3CR54606T4', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(138, '3CR54606GM', 'HP 280 G1', 1, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(139, '16042024000464', 'AIO X240', 1, NULL, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(140, '16042024000459', 'AIO X240', 1, NULL, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(141, '3CR54606VB', 'HP 280 G1', 1, 1, 2, 1, 1, '480', '8 GB', 1, '2026-08-06 11:07:32', 0),
(142, '3CR5450B8S', 'P7P95LT', 1, 1, 2, 1, 1, '480', '4 GB', 1, '2026-08-06 11:07:32', 0),
(143, '72WRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(144, '3CR5450CWM', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(145, '3CR5450D02', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(146, 'JAN0CX05U243427', 'F51DU', 2, 5, 2, 3, 2, NULL, '12 GB', 1, '2026-08-06 11:07:32', 0),
(147, 'NA', 'NA', 1, 1, 2, 1, NULL, NULL, '2 GB', 1, '2026-08-06 11:07:32', 0),
(148, 'CVPV1-8QUZ-6764', 'A1', 1, NULL, 2, 5, NULL, NULL, NULL, 1, '2026-08-06 11:07:32', 0),
(149, 'PF-4S2RKB', '21JQ0007LM', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(150, '4CE7443HLY', '2RJ62LT', 1, 1, 2, 1, 2, NULL, '12 GB', 1, '2026-08-06 11:07:32', 0),
(151, '56QHHK3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(152, '2JCS904', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(153, 'H1VGN23', '7070 Tower', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(154, 'DYTJMD4', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(155, '77BWWP3', 'Vostro 3681', 1, 2, 2, 1, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(156, '8PMDHK3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(157, '3CR5450BHT', 'P7P95LT', 1, 1, 2, 1, 1, '240', '4 GB', 1, '2026-08-06 11:07:32', 0),
(158, '3CR5450B48', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(159, 'PF-4X3RAT', 'Think Pad L16 Gen 1', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(160, '3CR5450D1M', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(161, '3CR54606HN', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(162, '38NV3D4', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(163, '3CR5450B58', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(164, '48JP9T3', 'Vostro 15 3510', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(165, '3CR54606RP', 'P7P95LT', 1, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(166, 'B36BZJ3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 1),
(167, 'PF-50PC9V', '21JQ0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(168, '3CR553025K', 'P7P95LT', 1, 1, 2, 1, 2, NULL, '12 GB', 1, '2026-08-06 11:07:32', 0),
(169, 'ENO160616-H4S7006442', 'A1', 1, NULL, 2, 5, NULL, NULL, NULL, 1, '2026-08-06 11:07:32', 0),
(170, '3CR5470529', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(171, '838N1Z3', 'Vostro 3420', 2, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(172, '5CG6338148W', '14-an006la', 2, 1, 2, 2, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(173, '3CR54606JY', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(174, '3CR54606MP', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(175, '3CR54606WG', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(176, '3CR5450BDW', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(177, 'CND2500D0Z', '5U0S1LT', 2, 1, 2, 5, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(178, 'NO VISIBLE-DUP2', 'A1', 1, NULL, 2, 5, NULL, NULL, NULL, 1, '2026-08-06 11:07:32', 0),
(179, 'MP1DT144', '81B000CLLM', 2, 3, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(180, 'DXQJDM4', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(181, '63J52Z3', 'Small Form Factor 7010', 1, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(182, '8CG9221LTJ', '4QJ38LT', 1, 1, 2, 1, 2, '240', '4 GB', 1, '2026-08-06 11:07:32', 0),
(183, '3CR54606T2', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '12 GB', 1, '2026-08-06 11:07:32', 0),
(184, '3CR5450BGH', 'P7P95LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(185, 'MP1ECSA1', '81AY (V330)', 2, 3, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(186, 'F64FZ44', 'Small Form Factor 7010', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(187, '29NV3D4-DUP2', 'QCS1250 DELL PRO SLIM', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(188, 'MP1E6KR2', '81AY0019LM', 2, 3, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(189, '3CR547037J', 'V2V81LT', 1, 1, 2, 1, 1, NULL, '4 GB', 1, '2026-08-06 11:07:32', 0),
(190, 'GSXRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(191, 'CND148690P', '5U0R9LT', 2, 1, 2, 5, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(192, 'JB19HJ3', 'Vostro 3400', 2, 2, 2, 3, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(193, '52RRL94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(194, 'GF31GD3', 'Vostro 3500', 2, 2, 2, 3, 1, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(195, '18L5LM3', '7090 Micro', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(196, 'PW-0CRP5W', 'Think Pad L16 Gen 1', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(197, '1CHH9T3', 'Vostro 15 3510', 2, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(198, '6DPMY84', 'Latitude 3550', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(199, 'PW-0CRP6Q', '21L4000MLM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(200, '2W1S904', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(201, '8CG8508400', '4QJ38LT', NULL, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(202, 'PF-510LZ3', '21JQ0006LM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(203, 'GJKYPZ3', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(204, 'PD', 'PD', 1, NULL, 2, 3, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(205, 'FJ8JHK3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(206, 'PF-4SQA1X', '21HL000SLM', 2, 3, 2, 5, 2, NULL, '32 GB', 1, '2026-08-06 11:07:32', 0),
(207, 'NXVLFAL00703939CC77600', 'TMP214', 2, 4, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(208, '92DCCD3', '3080 Micro', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(209, '3CR61702VT', 'HP 280 G1', 1, 1, 2, 1, 1, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(210, 'PF-4Q7WWB', '21HJ000YLM', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(211, '3KDS904', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(212, 'J6C1QZ3', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(213, 'H388ZJ3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(214, 'PD-DUP2', 'PD', 1, 1, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(215, 'J3DCCD3', '3080 Micro', 1, 2, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(216, 'SIN-SERIE-NO210', '21DJ00QEGJ', 2, 3, 2, 5, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(217, 'PW-0CRP29', '21L4000MLM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(218, '5CD22667M6', '6X2K0LT', 2, 1, 2, 3, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(219, '5HGNG94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(220, '7FGNG94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(221, 'DKGNG94', 'DELL PRO', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(222, 'BMSF5W3', 'Vostro 15 3530', 2, 2, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(223, 'PW-0E0WYM', '21L4000MLM', 2, 3, 2, 3, 2, NULL, '16 GB', 1, '2026-08-06 11:07:32', 0),
(224, 'CND2501NN6', '5U0S1LT', 2, 1, 2, 5, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(225, 'F030ZJ3', 'Vostro 15 3510', 2, 2, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(226, '4CE042298D', '8ZN47LT', 1, 1, 2, 1, 2, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(227, '4CE7091HJF', 'PC HP 280 G2', 1, 1, 2, 1, 2, 'S/DISCO', '8 GB', 1, '2026-08-06 11:07:32', 0),
(228, '3CR5460721', 'HP 280 G1', 1, 1, 2, 1, NULL, '240', '8 GB', 1, '2026-08-06 11:07:32', 0),
(229, '4CE1110RYP', 'HP G5 / TPC-F125-SF', 1, 1, 2, 1, NULL, 'S/DISCO', '8 GB', 1, '2026-08-06 11:07:32', 3),
(230, 'PF-ACT1SG', 'THINKPAD L 15 GEN 2', 2, 3, 2, 1, NULL, NULL, '8 RAM', 1, '2026-08-06 11:07:32', 0),
(231, '5X234J4', 'DELL PRO SLIM  QCS1250', 1, 2, 2, 3, NULL, NULL, '16 RAM', 1, '2026-08-06 11:07:32', 0),
(232, '4ZM23H4', 'DELL PRO SLIM  QCS1250', 1, 2, 2, 3, NULL, NULL, '16 RAM', 1, '2026-08-06 11:07:32', 0),
(233, 'PF4J4F2K', 'V15 G4 ABP', 2, 3, 2, 4, NULL, NULL, '24 GB', 1, '2026-08-06 11:07:32', 0),
(234, 'K1N0CV07N67403D', 'A507U', 2, 5, 2, 1, NULL, NULL, '8 GB', 1, '2026-08-06 11:07:32', 0),
(235, '123132', '212121', 2, 1, 1, 2, 2, '1', '1', 1, '2026-08-07 14:53:30', 3),
(236, '45665456', '11', 2, 2, 3, 2, 1, '1', '1', 4, '2026-08-19 13:28:59', 3),
(237, '1', '1', 1, 1, 1, 1, 1, '1', '1', 2, '2026-08-19 13:47:01', 3),
(238, '51515', '1', 2, 2, 2, 1, 1, '1', '1', 4, '2026-08-19 16:36:34', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_asignaciones`
--

CREATE TABLE `historial_asignaciones` (
  `idHistorial` int(11) NOT NULL,
  `numeroSerie` varchar(50) NOT NULL,
  `tipoMovimiento` varchar(50) NOT NULL,
  `nombreEquipo` varchar(50) DEFAULT NULL,
  `nombreTrabajador` varchar(150) DEFAULT NULL,
  `nave` varchar(50) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `fechaMovimiento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_asignaciones`
--

INSERT INTO `historial_asignaciones` (`idHistorial`, `numeroSerie`, `tipoMovimiento`, `nombreEquipo`, `nombreTrabajador`, `nave`, `comentarios`, `idUsuario`, `fechaMovimiento`) VALUES
(1, '4CE1110RYP', '', '1', '1', 'Nave 3', '1', NULL, '2026-08-20 12:46:46'),
(2, '4CE1110RYP', '', '1', '1', 'Nave 4', '1', NULL, '2026-08-20 12:47:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `idMarca` int(11) NOT NULL,
  `nombreMarca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`idMarca`, `nombreMarca`) VALUES
(1, 'Hp'),
(2, 'Dell'),
(3, 'Lenovo'),
(4, 'Acer'),
(5, 'Asus'),
(6, 'Huawei'),
(7, 'Apple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paqueteria`
--

CREATE TABLE `paqueteria` (
  `idPaqueteria` int(11) NOT NULL,
  `nombrePaqueteria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paqueteria`
--

INSERT INTO `paqueteria` (`idPaqueteria`, `nombrePaqueteria`) VALUES
(1, '2016'),
(2, 'E1'),
(3, 'E3'),
(4, 'E5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesador`
--

CREATE TABLE `procesador` (
  `idProcesador` int(11) NOT NULL,
  `nombreProcesador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `procesador`
--

INSERT INTO `procesador` (`idProcesador`, `nombreProcesador`) VALUES
(1, 'Core i3'),
(2, 'Ryzen 3'),
(3, 'Core i5'),
(4, 'Ryzen 5'),
(5, 'Core i7'),
(6, 'Ryzen 7'),
(7, 'Core i9'),
(8, 'Ryzen 9'),
(9, 'M1'),
(10, 'M2'),
(11, 'M3'),
(12, 'M4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema`
--

CREATE TABLE `sistema` (
  `idSistema` int(11) NOT NULL,
  `nombreSistema` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sistema`
--

INSERT INTO `sistema` (`idSistema`, `nombreSistema`) VALUES
(1, 'Windows 10'),
(2, 'Windows 11'),
(5, 'MacOs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `password_hash`) VALUES
(1, 'Israel G', '$2a$12$LVWWP5vh6U3nOBaWdnoqo.6gDZNAGqjsowaoWC.TdGfgCen3r8PG.'),
(2, 'Jahir H', '$2a$12$IeA8b2u4ozCovORatJTNZuYwkoODjZIZzOzVGa2JsFvJ9t2qGK0UC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD PRIMARY KEY (`idAsignacion`),
  ADD KEY `fk_hardware_cascada` (`numeroSerie`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `estados_asignacion`
--
ALTER TABLE `estados_asignacion`
  ADD PRIMARY KEY (`idEstadoAsignacion`);

--
-- Indices de la tabla `estados_hardware`
--
ALTER TABLE `estados_hardware`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`idHardware`),
  ADD UNIQUE KEY `numeroSerie` (`numeroSerie`),
  ADD KEY `fk_hardware_paqueteria` (`idPaqueteria`);

--
-- Indices de la tabla `historial_asignaciones`
--
ALTER TABLE `historial_asignaciones`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `fk_historial_hardware` (`numeroSerie`),
  ADD KEY `fk_historial_usuario` (`idUsuario`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `paqueteria`
--
ALTER TABLE `paqueteria`
  ADD PRIMARY KEY (`idPaqueteria`);

--
-- Indices de la tabla `procesador`
--
ALTER TABLE `procesador`
  ADD PRIMARY KEY (`idProcesador`);

--
-- Indices de la tabla `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`idSistema`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nombreUsuario` (`nombreUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  MODIFY `idAsignacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados_asignacion`
--
ALTER TABLE `estados_asignacion`
  MODIFY `idEstadoAsignacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estados_hardware`
--
ALTER TABLE `estados_hardware`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `hardware`
--
ALTER TABLE `hardware`
  MODIFY `idHardware` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT de la tabla `historial_asignaciones`
--
ALTER TABLE `historial_asignaciones`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `idMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `paqueteria`
--
ALTER TABLE `paqueteria`
  MODIFY `idPaqueteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `procesador`
--
ALTER TABLE `procesador`
  MODIFY `idProcesador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `sistema`
--
ALTER TABLE `sistema`
  MODIFY `idSistema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `fk_hardware_cascada` FOREIGN KEY (`numeroSerie`) REFERENCES `hardware` (`numeroSerie`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `hardware`
--
ALTER TABLE `hardware`
  ADD CONSTRAINT `fk_hardware_paqueteria` FOREIGN KEY (`idPaqueteria`) REFERENCES `paqueteria` (`idPaqueteria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_asignaciones`
--
ALTER TABLE `historial_asignaciones`
  ADD CONSTRAINT `fk_historial_hardware` FOREIGN KEY (`numeroSerie`) REFERENCES `hardware` (`numeroSerie`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_historial_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
