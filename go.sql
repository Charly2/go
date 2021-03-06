-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2018 a las 18:35:13
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
-- Base de datos: `go`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `img` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `precio`, `stock`, `img`) VALUES
(1, 'Telefono', 50, 2, 'data:image/png;base64,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'),
(2, 'Foto', 400, 1, 'data:image/png;base64,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'),
(3, 'Otro', 50, 45, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAABOIAAATiAGjigkoAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAE9SURBVHja7NoxFsIwCAbg/NzLtdfpWbyOaw+Ga1+1CUkggb5kUzvkEwrECmZOT1iUHrIWZEEWJL9wfvF6f0KVsGPf8PjUQtRswimdzh9wIARfI8JBIvP3C7+m1hUDZ4DbrPl3s7PD+waFPd5WLXaUasjsS9wQZ2PEBUjSR2ZhqqqotCGOxlS3gprOPgrT1M9qRxTL8oyeptwya1mU52J5tRrjNcuzqLxan0d6MWrzncYY34pRHVItziNQumY4BJUbhQWMFBFcKM8QXD8FcpfjXOgPuesxGlK6Ubnh/S4MGSCSMFKqGDJEtDS5ZgwZI4b1JY1ZywWGGqLhcpGjlOqKCjlFVGPIMaIKQ84RYgwFQIgwFARRxFAgRBYj+e3XO+Y3PNEevaWUcOyb2VF3SmSe81R3/RdlQRZkQUKt7wCiNVvgf/umewAAAABJRU5ErkJggg==');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
