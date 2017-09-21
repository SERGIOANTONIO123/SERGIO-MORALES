-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2017 a las 21:16:03
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idadministrador` tinyint(4) NOT NULL,
  `nombreadministrador` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `telefonoadministrador` varchar(13) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idadministrador`, `nombreadministrador`, `telefonoadministrador`) VALUES
(6, 'sergio', '514654651'),
(9, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbol`
--

CREATE TABLE `arbol` (
  `idarbol` mediumint(9) NOT NULL,
  `gpsarbol` point NOT NULL,
  `alturaarbol` smallint(6) NOT NULL,
  `fechasiembraarbol` date NOT NULL,
  `idvariedad` tinyint(4) NOT NULL,
  `idparcela` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `arbol`
--

INSERT INTO `arbol` (`idarbol`, `gpsarbol`, `alturaarbol`, `fechasiembraarbol`, `idvariedad`, `idparcela`) VALUES
(9, '\0\0\0\0\0\0\0\0\0\0\0\0\0(@\0\0\0\0\0\0*@', 0, '0000-00-00', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ataques`
--

CREATE TABLE `ataques` (
  `idataque` mediumint(9) NOT NULL,
  `fechaataque` date NOT NULL,
  `porcentajeataque` tinyint(4) NOT NULL,
  `idarbol` mediumint(9) NOT NULL,
  `idenfermedad` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `idauditoria` mediumint(9) NOT NULL,
  `fechaauditoria` datetime NOT NULL,
  `descripcionauditoria` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `idusuario` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`idauditoria`, `fechaauditoria`, `descripcionauditoria`, `idusuario`) VALUES
(1, '2017-03-27 00:00:00', 'inserto administrador ', 1),
(2, '2017-03-27 00:00:00', 'elimino administrador ', 1),
(3, '2017-03-27 00:00:00', 'inserto administrador ', 2),
(4, '2017-03-27 00:00:00', 'elimino administrador ', 2),
(5, '2017-03-27 00:00:00', 'inserto administrador ', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` mediumint(9) NOT NULL,
  `nombrecliente` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `telefonocliente` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `emailcliente` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombrecliente`, `telefonocliente`, `emailcliente`) VALUES
(6, 'cristian santamaria', '3508456654', 'dfafddbflkajsdflkjsaldkfjhalsf'),
(7, 'sergio peña', '3508159410', 'fdkbfajksdflasdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `idenfermedad` mediumint(9) NOT NULL,
  `descripcionenfermedad` varchar(700) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `enfermedad`
--

INSERT INTO `enfermedad` (`idenfermedad`, `descripcionenfermedad`) VALUES
(1, 'HOJAS SECAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `floracion`
--

CREATE TABLE `floracion` (
  `idfloracion` mediumint(9) NOT NULL,
  `cantidadflores` smallint(6) NOT NULL,
  `fechainiciofloracion` date NOT NULL,
  `fechafinfloracion` date NOT NULL,
  `idarbol` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `floracion`
--

INSERT INTO `floracion` (`idfloracion`, `cantidadflores`, `fechainiciofloracion`, `fechafinfloracion`, `idarbol`) VALUES
(1, 0, '0000-00-00', '0000-00-00', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foliacion`
--

CREATE TABLE `foliacion` (
  `idfoliacion` mediumint(9) NOT NULL,
  `cantidadhojas` smallint(6) NOT NULL,
  `areahoja` smallint(6) NOT NULL,
  `fechafoliacion` date NOT NULL,
  `idarbol` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcela`
--

CREATE TABLE `parcela` (
  `idparcela` mediumint(9) NOT NULL,
  `nombreparcela` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `phparcela` decimal(4,0) NOT NULL,
  `idadministrador` tinyint(4) NOT NULL,
  `idtiposuelo` tinyint(4) NOT NULL,
  `idvereda` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `parcela`
--

INSERT INTO `parcela` (`idparcela`, `nombreparcela`, `phparcela`, `idadministrador`, `idtiposuelo`, `idvereda`) VALUES
(1, 'los guyabos', '0', 6, 2, 1),
(2, 'los mandarinos', '14', 6, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `podas`
--

CREATE TABLE `podas` (
  `idpoda` mediumint(9) NOT NULL,
  `fechapoda` date NOT NULL,
  `idtipopoda` tinyint(4) NOT NULL,
  `idarbol` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `idproduccion` mediumint(9) NOT NULL,
  `fechainicioproduccion` date NOT NULL,
  `kilosproducidos` tinyint(4) NOT NULL,
  `kilosperdida` tinyint(4) NOT NULL,
  `idarbol` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` tinyint(4) NOT NULL,
  `nombrerol` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `arbolrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `produccionrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `podasrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `tipopodarol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `variedadrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `foliacionrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `floracionrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `ataquerol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `enfermedadrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `parcelarol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `tiposuelorol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `administradorrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `tratamientorol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `tipotratamientorol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `ventasrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `clienterol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `auditoriarol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `usuariorol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `veredarol` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `rolrol` varchar(4) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `arbolrol`, `produccionrol`, `podasrol`, `tipopodarol`, `variedadrol`, `foliacionrol`, `floracionrol`, `ataquerol`, `enfermedadrol`, `parcelarol`, `tiposuelorol`, `administradorrol`, `tratamientorol`, `tipotratamientorol`, `ventasrol`, `clienterol`, `auditoriarol`, `usuariorol`, `veredarol`, `rolrol`) VALUES
(1, 'DUEÑOFINCA', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud'),
(2, 'admin', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud', 'crud');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopoda`
--

CREATE TABLE `tipopoda` (
  `idtipopoda` tinyint(4) NOT NULL,
  `descripciontipopoda` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipopoda`
--

INSERT INTO `tipopoda` (`idtipopoda`, `descripciontipopoda`) VALUES
(1, 'chupones'),
(2, 'quitar hojas secas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposuelo`
--

CREATE TABLE `tiposuelo` (
  `idtiposuelo` tinyint(4) NOT NULL,
  `descripciontiposuelo` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tiposuelo`
--

INSERT INTO `tiposuelo` (`idtiposuelo`, `descripciontiposuelo`) VALUES
(1, 'arcilloso'),
(2, 'arenoso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotratamiento`
--

CREATE TABLE `tipotratamiento` (
  `idtipotratamiento` mediumint(9) NOT NULL,
  `descripciontipotratamiento` varchar(1000) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipotratamiento`
--

INSERT INTO `tipotratamiento` (`idtipotratamiento`, `descripciontipotratamiento`) VALUES
(10, ''),
(11, ''),
(12, ''),
(13, ''),
(14, ''),
(15, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idtratamiento` mediumint(9) NOT NULL,
  `fechaaplicacion` date NOT NULL,
  `cantidadtratamiento` smallint(6) NOT NULL,
  `idataque` mediumint(9) NOT NULL,
  `idtipotratamiento` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` mediumint(9) NOT NULL,
  `nombreusuario` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `emailusuario` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `claveusuario` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `fecharegistrousuario` date NOT NULL,
  `fechaultimaclave` date NOT NULL,
  `idrol` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombreusuario`, `emailusuario`, `claveusuario`, `fecharegistrousuario`, `fechaultimaclave`, `idrol`) VALUES
(1, 'sergio peña', 'sergio@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2015-02-02', '2109-11-11', 1),
(2, 'sergio', 'ser@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2017-03-02', '2017-03-01', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variedad`
--

CREATE TABLE `variedad` (
  `idvariedad` tinyint(4) NOT NULL,
  `descripcionvariedad` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `variedad`
--

INSERT INTO `variedad` (`idvariedad`, `descripcionvariedad`) VALUES
(1, 'caturro\r\n'),
(2, 'castilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventas` mediumint(9) NOT NULL,
  `kilosvendidos` smallint(6) NOT NULL,
  `fechaventa` date NOT NULL,
  `idcliente` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventas`, `kilosvendidos`, `fechaventa`, `idcliente`) VALUES
(8, 0, '0000-00-00', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vereda`
--

CREATE TABLE `vereda` (
  `idvereda` mediumint(9) NOT NULL,
  `nombrevereda` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vereda`
--

INSERT INTO `vereda` (`idvereda`, `nombrevereda`) VALUES
(1, 'uityuyfu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idadministrador`);

--
-- Indices de la tabla `arbol`
--
ALTER TABLE `arbol`
  ADD PRIMARY KEY (`idarbol`),
  ADD KEY `idvariedad` (`idvariedad`),
  ADD KEY `idparcela` (`idparcela`);

--
-- Indices de la tabla `ataques`
--
ALTER TABLE `ataques`
  ADD PRIMARY KEY (`idataque`),
  ADD KEY `idarbol` (`idarbol`),
  ADD KEY `idenfermedad` (`idenfermedad`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`idauditoria`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`idenfermedad`);

--
-- Indices de la tabla `floracion`
--
ALTER TABLE `floracion`
  ADD PRIMARY KEY (`idfloracion`),
  ADD KEY `idarbol` (`idarbol`);

--
-- Indices de la tabla `foliacion`
--
ALTER TABLE `foliacion`
  ADD PRIMARY KEY (`idfoliacion`),
  ADD KEY `idarbol` (`idarbol`);

--
-- Indices de la tabla `parcela`
--
ALTER TABLE `parcela`
  ADD PRIMARY KEY (`idparcela`),
  ADD KEY `idadministrador` (`idadministrador`),
  ADD KEY `idtiposuelo` (`idtiposuelo`),
  ADD KEY `idvereda` (`idvereda`);

--
-- Indices de la tabla `podas`
--
ALTER TABLE `podas`
  ADD PRIMARY KEY (`idpoda`),
  ADD KEY `idtipopoda` (`idtipopoda`),
  ADD KEY `idarbol` (`idarbol`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`idproduccion`),
  ADD KEY `idarbol` (`idarbol`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tipopoda`
--
ALTER TABLE `tipopoda`
  ADD PRIMARY KEY (`idtipopoda`);

--
-- Indices de la tabla `tiposuelo`
--
ALTER TABLE `tiposuelo`
  ADD PRIMARY KEY (`idtiposuelo`);

--
-- Indices de la tabla `tipotratamiento`
--
ALTER TABLE `tipotratamiento`
  ADD PRIMARY KEY (`idtipotratamiento`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idtratamiento`),
  ADD KEY `idataque` (`idataque`),
  ADD KEY `idtipotratamiento` (`idtipotratamiento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `idrol` (`idrol`);

--
-- Indices de la tabla `variedad`
--
ALTER TABLE `variedad`
  ADD PRIMARY KEY (`idvariedad`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventas`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Indices de la tabla `vereda`
--
ALTER TABLE `vereda`
  ADD PRIMARY KEY (`idvereda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idadministrador` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `arbol`
--
ALTER TABLE `arbol`
  MODIFY `idarbol` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `ataques`
--
ALTER TABLE `ataques`
  MODIFY `idataque` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `idauditoria` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `idenfermedad` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `floracion`
--
ALTER TABLE `floracion`
  MODIFY `idfloracion` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `foliacion`
--
ALTER TABLE `foliacion`
  MODIFY `idfoliacion` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `parcela`
--
ALTER TABLE `parcela`
  MODIFY `idparcela` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `podas`
--
ALTER TABLE `podas`
  MODIFY `idpoda` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `idproduccion` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipopoda`
--
ALTER TABLE `tipopoda`
  MODIFY `idtipopoda` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tiposuelo`
--
ALTER TABLE `tiposuelo`
  MODIFY `idtiposuelo` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipotratamiento`
--
ALTER TABLE `tipotratamiento`
  MODIFY `idtipotratamiento` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idtratamiento` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `variedad`
--
ALTER TABLE `variedad`
  MODIFY `idvariedad` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventas` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `vereda`
--
ALTER TABLE `vereda`
  MODIFY `idvereda` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arbol`
--
ALTER TABLE `arbol`
  ADD CONSTRAINT `arbol_ibfk_1` FOREIGN KEY (`idvariedad`) REFERENCES `variedad` (`idvariedad`),
  ADD CONSTRAINT `arbol_ibfk_2` FOREIGN KEY (`idparcela`) REFERENCES `parcela` (`idparcela`);

--
-- Filtros para la tabla `ataques`
--
ALTER TABLE `ataques`
  ADD CONSTRAINT `ataques_ibfk_1` FOREIGN KEY (`idarbol`) REFERENCES `arbol` (`idarbol`),
  ADD CONSTRAINT `ataques_ibfk_2` FOREIGN KEY (`idenfermedad`) REFERENCES `enfermedad` (`idenfermedad`);

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `floracion`
--
ALTER TABLE `floracion`
  ADD CONSTRAINT `floracion_ibfk_1` FOREIGN KEY (`idarbol`) REFERENCES `arbol` (`idarbol`);

--
-- Filtros para la tabla `foliacion`
--
ALTER TABLE `foliacion`
  ADD CONSTRAINT `foliacion_ibfk_1` FOREIGN KEY (`idarbol`) REFERENCES `arbol` (`idarbol`);

--
-- Filtros para la tabla `parcela`
--
ALTER TABLE `parcela`
  ADD CONSTRAINT `parcela_ibfk_1` FOREIGN KEY (`idadministrador`) REFERENCES `administrador` (`idadministrador`),
  ADD CONSTRAINT `parcela_ibfk_2` FOREIGN KEY (`idtiposuelo`) REFERENCES `tiposuelo` (`idtiposuelo`),
  ADD CONSTRAINT `parcela_ibfk_3` FOREIGN KEY (`idvereda`) REFERENCES `vereda` (`idvereda`);

--
-- Filtros para la tabla `podas`
--
ALTER TABLE `podas`
  ADD CONSTRAINT `podas_ibfk_1` FOREIGN KEY (`idtipopoda`) REFERENCES `tipopoda` (`idtipopoda`),
  ADD CONSTRAINT `podas_ibfk_2` FOREIGN KEY (`idarbol`) REFERENCES `arbol` (`idarbol`);

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`idarbol`) REFERENCES `arbol` (`idarbol`);

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`idataque`) REFERENCES `ataques` (`idataque`),
  ADD CONSTRAINT `tratamiento_ibfk_2` FOREIGN KEY (`idtipotratamiento`) REFERENCES `tipotratamiento` (`idtipotratamiento`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
