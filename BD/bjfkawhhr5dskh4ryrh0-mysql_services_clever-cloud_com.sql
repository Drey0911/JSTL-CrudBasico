-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: bjfkawhhr5dskh4ryrh0-mysql.services.clever-cloud.com:3306
-- Tiempo de generación: 06-04-2025 a las 04:43:42
-- Versión del servidor: 8.4.2-2
-- Versión de PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bjfkawhhr5dskh4ryrh0`
--
CREATE DATABASE IF NOT EXISTS `bjfkawhhr5dskh4ryrh0` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bjfkawhhr5dskh4ryrh0`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int NOT NULL,
  `descripcion` varchar(15) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(1, 'DOCTORADO'),
(2, 'MAESTRIA'),
(3, 'ESPECIALISTA'),
(4, 'PROFESIONAL'),
(5, 'OTROS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int NOT NULL,
  `nombres` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido1` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido2` varchar(100) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `edad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombres`, `apellido1`, `apellido2`, `edad`) VALUES
(1, 'Andrey Stteven', 'Mantilla ', 'Leon', 21),
(2, 'Prueba', 'prueba', 'prueba', 77),
(3, 'Clever', 'Cloud ', 'Prueba', 22),
(4, 'Andrey', 'Mantilla', 'LEON', 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_equipo` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `fecha_adquisicion` date NOT NULL,
  `precio` double NOT NULL,
  `estado` varchar(100) NOT NULL,
  `observaciones` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `id_equipo`, `categoria`, `marca`, `fecha_adquisicion`, `precio`, `estado`, `observaciones`) VALUES
(1, 'PRUEBA', 'EA15025H', 'Laptop', 'HP', '2025-04-04', 2000000, 'En Reparacion', 'N/A'),
(3, 'PRUEBA2', 'FFGH1008', 'PC de escritorio', 'Asus', '2025-04-01', 5000000, 'Buen estado', 'Cambio de procesador'),
(4, 'prirba', '1464bkb', 'Servidor', 'vgjk', '2025-04-16', 466464, 'En Reparacion', 'na');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` int NOT NULL,
  `cedula` varchar(15) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `nombre` varchar(40) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `area` varchar(25) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `id_categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `cedula`, `nombre`, `area`, `telefono`, `id_categoria`) VALUES
(3, '303303333', 'Juan Carlos Castro', 'Matemática', '67455-7788', 4),
(4, '10071930510', 'Andrey', 'Sistemas', '13131322332', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
