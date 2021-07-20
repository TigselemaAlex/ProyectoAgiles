-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2021 a las 07:52:44
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `controlactivos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `ID_ACT` varchar(30) NOT NULL,
  `NOM_ACT` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `activos`
--

INSERT INTO `activos` (`ID_ACT`, `NOM_ACT`) VALUES
('ac01', 'mesa'),
('ac02', 'pueta'),
('ac03', 'pepeline'),
('ac04', 'mataviejas'),
('ac05', 'esfinge');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_validaciones`
--

CREATE TABLE `detalle_validaciones` (
  `ID_USU_VAL` varchar(10) NOT NULL,
  `EST_USU_VAL` varchar(20) NOT NULL,
  `ID_VAL_PER` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro_validaciones`
--

CREATE TABLE `maestro_validaciones` (
  `ID_VAL` int(5) NOT NULL,
  `NOM_VAL` varchar(20) NOT NULL,
  `FEC_HOR_VAL` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `CEDULA` varchar(10) NOT NULL,
  `NOMBRE` varchar(12) NOT NULL,
  `APELLIDO` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`CEDULA`, `NOMBRE`, `APELLIDO`) VALUES
('0401527650', 'pablo', 'puetate'),
('180383437', 'alex', 'tigselema'),
('1805283452', 'jhonatan', 'pazmiño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_activos`
--

CREATE TABLE `usuario_activos` (
  `ID_USU_PER` varchar(10) NOT NULL,
  `ID_ACT_USU` varchar(30) NOT NULL,
  `EST_ACT` varchar(1) NOT NULL,
  `OBV_ACT` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_activos`
--

INSERT INTO `usuario_activos` (`ID_USU_PER`, `ID_ACT_USU`, `EST_ACT`, `OBV_ACT`) VALUES
('180383437', 'ac01', 'n', 'Sin revisar'),
('0401527650', 'ac02', 'y', 'Revisado'),
('1805283452', 'ac03', 'y', 'Un activo dañado'),
('0401527650', 'ac04', 'y', 'tiene sangre de vieja'),
('0401527650', 'ac05', 'n', 'Hermoso');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`ID_ACT`);

--
-- Indices de la tabla `detalle_validaciones`
--
ALTER TABLE `detalle_validaciones`
  ADD KEY `ID_VAL_PER` (`ID_VAL_PER`),
  ADD KEY `ID_USU_VAL` (`ID_USU_VAL`);

--
-- Indices de la tabla `maestro_validaciones`
--
ALTER TABLE `maestro_validaciones`
  ADD PRIMARY KEY (`ID_VAL`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`CEDULA`);

--
-- Indices de la tabla `usuario_activos`
--
ALTER TABLE `usuario_activos`
  ADD KEY `ID_USU_PER` (`ID_USU_PER`,`ID_ACT_USU`),
  ADD KEY `ID_ACT_USU` (`ID_ACT_USU`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `maestro_validaciones`
--
ALTER TABLE `maestro_validaciones`
  MODIFY `ID_VAL` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_validaciones`
--
ALTER TABLE `detalle_validaciones`
  ADD CONSTRAINT `detalle_validaciones_ibfk_1` FOREIGN KEY (`ID_VAL_PER`) REFERENCES `maestro_validaciones` (`ID_VAL`),
  ADD CONSTRAINT `detalle_validaciones_ibfk_2` FOREIGN KEY (`ID_USU_VAL`) REFERENCES `usuarios` (`CEDULA`);

--
-- Filtros para la tabla `usuario_activos`
--
ALTER TABLE `usuario_activos`
  ADD CONSTRAINT `usuario_activos_ibfk_1` FOREIGN KEY (`ID_ACT_USU`) REFERENCES `activos` (`ID_ACT`),
  ADD CONSTRAINT `usuario_activos_ibfk_2` FOREIGN KEY (`ID_USU_PER`) REFERENCES `usuarios` (`CEDULA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
