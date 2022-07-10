-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2022 a las 22:07:28
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemadeformularios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dirigido`
--

CREATE TABLE `dirigido` (
  `IdFormulario` int(11) NOT NULL,
  `Publico` varchar(256) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE `formulario` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `Url` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `Tipo` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `Titulo` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `FechaVencimiento` date NOT NULL,
  `estado` varchar(64) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `formulario`
--

INSERT INTO `formulario` (`Id`, `Descripcion`, `Url`, `Tipo`, `Titulo`, `FechaVencimiento`, `estado`) VALUES
(26, 'Responde acá para cambiar certamen de SO dependiendo de tu preferencia', 'https://forms.gle/WYZgZ498dgbJFHaa6', 'Encuesta', 'Encuesta Cambiar Certamen', '2022-05-02', 'DISPONIBLE'),
(27, 'Participa de el nuevo seminario de ICI, y gana premios', 'https://forms.gle/WYZgZ498dgbJFHaa6', 'Actividad', 'Seminario ICI', '2022-05-03', 'DISPONIBLE'),
(28, 'Asiste al cuarto conversatorio de ICI, responde para inscribirte', 'https://forms.gle/WYZgZ498dgbJFHaa6', 'Actividad', 'Conversatorio ICI', '2022-05-05', 'DISPONIBLE'),
(29, 'Concurso de fotografía! participa enviándonos una foto de tu mascota y participa!', 'https://forms.gle/WYZgZ498dgbJFHaa6', 'Actividad', 'Concurso Fotografía', '2022-05-10', 'DISPONIBLE'),
(30, 'Encuesta para cambiar horario de las clases del martes de angular', 'https://forms.gle/WYZgZ498dgbJFHaa6', 'Encuesta', 'Encuesta de Asignatura Angular', '2022-05-10', 'FINALIZADO'),
(31, 'Concurso de fotografía! participa enviándonos una foto de tu ultimo viaje de vacaciones y participa!', 'https://forms.gle/WYZgZ498dgbJFHaa6', 'Actividad', 'Concurso Fotografia', '2022-05-10', 'FINALIZADO'),
(34, 'asdasd', 'asdasd', 'asdasd', 'asdasd', '2022-07-22', 'DISPONIBLE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestiona`
--

CREATE TABLE `gestiona` (
  `RutUsuario` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `IdFormulario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `Id` int(11) NOT NULL,
  `Rol` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `UserName` varchar(180) COLLATE utf8_spanish_ci NOT NULL,
  `Contraseña` varchar(256) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`Id`, `Rol`, `UserName`, `Contraseña`) VALUES
(1, 'Estudiante', 'C_Castro', 'abkdsljfnkasdnflkjasdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Rut` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `IdLogin` int(11) NOT NULL,
  `Nombre` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `Cargo` varchar(180) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Rut`, `IdLogin`, `Nombre`, `Cargo`) VALUES
('201237123-5', 1, 'Cristobal Castro', 'Estudiante');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dirigido`
--
ALTER TABLE `dirigido`
  ADD KEY `IdFormulario` (`IdFormulario`);

--
-- Indices de la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `gestiona`
--
ALTER TABLE `gestiona`
  ADD KEY `IdFormulario` (`IdFormulario`),
  ADD KEY `RutUsuario` (`RutUsuario`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Rut`),
  ADD KEY `IdLogin` (`IdLogin`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `formulario`
--
ALTER TABLE `formulario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dirigido`
--
ALTER TABLE `dirigido`
  ADD CONSTRAINT `dirigido_ibfk_1` FOREIGN KEY (`IdFormulario`) REFERENCES `formulario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gestiona`
--
ALTER TABLE `gestiona`
  ADD CONSTRAINT `gestiona_ibfk_1` FOREIGN KEY (`RutUsuario`) REFERENCES `usuario` (`Rut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gestiona_ibfk_2` FOREIGN KEY (`IdFormulario`) REFERENCES `formulario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IdLogin`) REFERENCES `login` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
