-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2018 a las 08:15:26
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sicty`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `idchat` int(11) NOT NULL,
  `idusuario_emisor` int(11) NOT NULL,
  `idusuario_receptor` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat`
--

INSERT INTO `chat` (`idchat`, `idusuario_emisor`, `idusuario_receptor`, `mensaje`, `fecha`) VALUES
(1, 15, 1, 'Hola Juan Carlos', '2018-05-13 00:17:00'),
(2, 1, 2, 'Hola', '2018-05-14 22:57:15'),
(3, 1, 2, 'CÃ³mo estÃ¡s?', '2018-05-14 22:57:19'),
(4, 1, 15, 'Hey', '2018-05-14 22:57:32'),
(5, 1, 3, 'Hola', '2018-05-14 22:57:43'),
(6, 2, 3, 'hola', '2018-05-20 21:59:38'),
(7, 2, 1, 'Hola', '2018-05-22 00:55:06'),
(8, 2, 15, 'hola', '2018-05-22 00:55:21'),
(9, 15, 2, 'como estas ale?', '2018-05-22 00:56:02'),
(10, 1, 2, 'sdfsdf', '2018-06-18 01:11:45'),
(11, 1, 2, 'Hola juan', '2018-06-18 01:11:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`idchat`),
  ADD KEY `receptor_idx` (`idusuario_receptor`),
  ADD KEY `emisor` (`idusuario_emisor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `idchat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `emisor` FOREIGN KEY (`idusuario_emisor`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `receptor` FOREIGN KEY (`idusuario_receptor`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
