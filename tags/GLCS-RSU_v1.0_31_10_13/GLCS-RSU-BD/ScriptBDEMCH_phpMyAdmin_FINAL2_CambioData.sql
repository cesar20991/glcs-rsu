-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 26-06-2013 a las 23:37:06
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `bd_emch`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_accesoe`
-- 

DROP TABLE IF EXISTS `t_accesoe`;
CREATE TABLE IF NOT EXISTS `t_accesoe` (
  `idAe` int(11) NOT NULL COMMENT 'Primary key de la tabla acceso',
  `cdPerfil` varchar(4) NOT NULL COMMENT 'Primary key de la tabla perfil',
  `cdGA` int(11) NOT NULL COMMENT 'Primary key de la tabla grupo acceso',
  `cdRuc` char(6) NOT NULL COMMENT 'Primary key de la tabla empresa, aqui nos permitira identificar de que empresa es ese acceso',
  PRIMARY KEY  (`idAe`),
  KEY `fk_T_AccesoE_T_GrupoAcceso1_idx` (`cdGA`),
  KEY `fk_T_AccesoE_T_Empresa1_idx` (`cdRuc`),
  KEY `fk_T_AccesoE_T_Perfil1_idx` (`cdPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_accesoe`
-- 

INSERT INTO `t_accesoe` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (1, 'PF01', 1, 'RC0001');
INSERT INTO `t_accesoe` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (2, 'PF02', 1, 'RC0001');
INSERT INTO `t_accesoe` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (3, 'PF03', 1, 'RC0001');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_accesom`
-- 

DROP TABLE IF EXISTS `t_accesom`;
CREATE TABLE IF NOT EXISTS `t_accesom` (
  `idAm` int(11) NOT NULL COMMENT 'Primary key de la tabla acceso M',
  `cdGA` int(11) NOT NULL COMMENT 'Primary key de la tabla grupo acceso',
  `cdMenu` varchar(6) NOT NULL COMMENT 'Primary key de la tabla menu',
  `estado` tinyint(1) NOT NULL COMMENT 'Si esta o no habilitado',
  PRIMARY KEY  (`idAm`),
  KEY `fk_T_AccesoM_T_GrupoAcceso1_idx` (`cdGA`),
  KEY `fk_T_AccesoM_T_Menu1_idx` (`cdMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_accesom`
-- 

INSERT INTO `t_accesom` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (1, 1, 'ADM001', 1);
INSERT INTO `t_accesom` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (2, 1, 'ADM002', 1);
INSERT INTO `t_accesom` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (3, 1, 'ADM003', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_asignarruta`
-- 

DROP TABLE IF EXISTS `t_asignarruta`;
CREATE TABLE IF NOT EXISTS `t_asignarruta` (
  `CdRuta` char(10) NOT NULL COMMENT 'Primary Key de la Tabla Ruta',
  `Nro` int(11) NOT NULL COMMENT 'Numero de la ruta',
  `cdDespacho` char(10) NOT NULL COMMENT 'Primary key de la tabla Despacho, aqui nos permitira identificar a que despacho pertenece esta ruta',
  `cdRuc` char(6) NOT NULL COMMENT 'Primary key de la tabla empresa, aqui nos permitira identificar a para que empresa se recorrera esta ruta',
  `LATN` double default NULL COMMENT 'Latitud Norte de la ruta',
  `LNGN` double default NULL COMMENT 'Longitud Norte de la ruta',
  `LATS` double default NULL COMMENT 'Latitud sur de la Ruta',
  `LNGS` double default NULL COMMENT 'Longitud Sur de la Ruta',
  `nroV` int(11) NOT NULL COMMENT 'Numero de veces que se debe realizar la ruta(1-2)',
  `obs` varchar(100) default NULL COMMENT 'Alguna observación acerca de la Ruta',
  PRIMARY KEY  (`CdRuta`),
  KEY `fk_T_AsignarRuta_T_DespachoDet1_idx` (`Nro`,`cdDespacho`,`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_asignarruta`
-- 

INSERT INTO `t_asignarruta` (`CdRuta`, `Nro`, `cdDespacho`, `cdRuc`, `LATN`, `LNGN`, `LATS`, `LNGS`, `nroV`, `obs`) VALUES ('AR00000001', 1, 'DP00000001', 'RC0001', -12.0781204770152, -76.9894412333984, -12.0639059602679, -76.9752272333984, 1, NULL);
INSERT INTO `t_asignarruta` (`CdRuta`, `Nro`, `cdDespacho`, `cdRuc`, `LATN`, `LNGN`, `LATS`, `LNGS`, `nroV`, `obs`) VALUES ('AR00000002', 2, 'DP00000001', 'RC0001', -12.088045, -77.023902, -12.074712, -77.013164, 1, 'Asignacion2');
INSERT INTO `t_asignarruta` (`CdRuta`, `Nro`, `cdDespacho`, `cdRuc`, `LATN`, `LNGN`, `LATS`, `LNGS`, `nroV`, `obs`) VALUES ('AR00000003', 3, 'DP00000001', 'RC0001', -12.0802816831162, -77.0120056834105, -12.0687112031478, -77.0028737361449, 1, NULL);
INSERT INTO `t_asignarruta` (`CdRuta`, `Nro`, `cdDespacho`, `cdRuc`, `LATN`, `LNGN`, `LATS`, `LNGS`, `nroV`, `obs`) VALUES ('AR00000004', 4, 'DP00000001', 'RC0001', -12.0574727359001, -77.0246318156737, -12.0432571245882, -77.0104178156737, 1, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_asistencia`
-- 

DROP TABLE IF EXISTS `t_asistencia`;
CREATE TABLE IF NOT EXISTS `t_asistencia` (
  `cdAsistencia` char(5) NOT NULL COMMENT 'Primary key de la Tabla asistencia',
  `cdTurno` char(4) NOT NULL COMMENT 'Primary key de la tabla turno, aqui nos ayudara a saber en que turno se tomo la asistencia',
  `fecha` datetime NOT NULL COMMENT 'Fecha de la asisitencia',
  `usuCrea` varchar(10) NOT NULL COMMENT 'Usuario que crea la asistencia',
  `fechaReg` datetime NOT NULL COMMENT 'fecha en la que se registra la asistencia',
  `usuModf` varchar(10) default NULL COMMENT 'Usuario que modifica la asistencia',
  `fechModf` datetime default NULL COMMENT 'fecha en la que se registra la asistencia',
  PRIMARY KEY  (`cdAsistencia`),
  KEY `fk_T_Asistencia_T_Turno1_idx` (`cdTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_asistencia`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_asistenciaxtrabajador`
-- 

DROP TABLE IF EXISTS `t_asistenciaxtrabajador`;
CREATE TABLE IF NOT EXISTS `t_asistenciaxtrabajador` (
  `cdTrabajador` char(6) NOT NULL COMMENT 'Primary Key de la Tabla Trabajador, aqui nos permitira identificar de que trabajador es la asitencia',
  `cdAsistencia` char(5) NOT NULL COMMENT 'Primary key de la tabla Asistencia, aqui nos permitira identificar la asistencia',
  `Asiste` tinyint(1) default NULL COMMENT 'Variable que nos permitira identificar si asistio o no',
  `Tardanza` tinyint(1) default NULL COMMENT 'Variable que nos permitira identificar si llego tarde',
  `Fustifica` tinyint(1) default NULL COMMENT 'Variable que nos permitira identificar si justifico la falta que pudo tener',
  PRIMARY KEY  (`cdTrabajador`,`cdAsistencia`),
  KEY `fk_AsistenciaXTrabajador_T_Trabajador1_idx` (`cdTrabajador`),
  KEY `fk_AsistenciaXTrabajador_T_Asistencia1_idx` (`cdAsistencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_asistenciaxtrabajador`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_camion`
-- 

DROP TABLE IF EXISTS `t_camion`;
CREATE TABLE IF NOT EXISTS `t_camion` (
  `cdCamion` char(6) NOT NULL COMMENT 'Primary Key de la Tabla Camion',
  `idClase` int(11) NOT NULL COMMENT 'Primary Key de la Tabla Clase',
  `idMarca` int(11) NOT NULL COMMENT 'Primary Key de la Tabla Marca',
  `unidad` int(11) NOT NULL,
  `placa` varchar(8) NOT NULL COMMENT 'Nro de Placa del Camion',
  `anioFab` char(4) NOT NULL COMMENT 'Año de  Fabricación del Camion',
  `anioAdq` char(4) NOT NULL COMMENT 'Año en que se adquirio el camion',
  `nroMotor` varchar(40) NOT NULL COMMENT 'Nro del Motor',
  `pesoBruto` decimal(5,4) NOT NULL COMMENT 'Peso bruto del Camion',
  `tipoCombustible` varchar(20) NOT NULL COMMENT 'Tipo de combustible utiliza el camion',
  `kilometraje` decimal(13,4) NOT NULL COMMENT 'Kilometraje del Camion',
  `imagen` mediumblob COMMENT 'Imagen del camion',
  `estado` tinyint(1) NOT NULL COMMENT 'Estado si que indica si el camion está habilitado o no',
  PRIMARY KEY  (`cdCamion`),
  KEY `fk_T_Camion_T_Clase1_idx` (`idClase`),
  KEY `fk_T_Camion_T_Marca1_idx` (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_camion`
-- 

INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0001', 1, 7, 1, 'XO-5784', '2003', '2007', '30771206', 6.0000, 'd2', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0002', 1, 7, 2, 'XO-5782', '2003', '2007', '30770835', 8.0000, 'gasolina', 1234.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0003', 1, 7, 3, 'XO-6048', '2003', '2007', '307712044', 7.0000, 'd2', 1849.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0004', 1, 7, 4, 'XO-6400', '2003', '2007', '30771950', 7.0000, 'gasolina', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0005', 1, 7, 5, 'XO-6401', '2003', '2005', '30771947', 6.0000, 'd2', 1234.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0006', 1, 7, 6, 'XO-6955', '2004', '2005', '30500442', 8.0000, 'd3', 1849.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0007', 1, 1, 7, 'XO-7815', '2004', '2005', '8028902', 7.0000, 'gasolina', 1298.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0008', 1, 7, 8, 'XO-7858', '2005', '2005', '30789953', 8.0000, 'd3', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0009', 1, 7, 9, 'XO-7881', '2005', '2005', '6076193', 8.0000, 'gasolina', 1849.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0010', 1, 1, 10, 'XO-8624', '2005', '2005', '8048749', 6.0000, 'd3', 1298.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0011', 1, 1, 11, 'XO-8563', '2005', '2005', '8048703', 8.0000, 'd4', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0012', 1, 1, 12, 'C-12454', '2005', '2005', '8058489', 7.0000, 'gasolina', 1849.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0013', 1, 1, 13, 'C-1454', '2005', '2005', '8058493', 7.0000, 'd4', 1298.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0014', 1, 7, 14, 'WGE-356', '2006', '2005', '30566904', 6.0000, 'gasolina', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0015', 1, 7, 15, 'WGE-409', '2006', '2005', '30565819', 8.0000, 'd4', 1298.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0016', 1, 7, 16, 'WGE-535', '2006', '2005', '30566900', 8.0000, 'd5', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0017', 1, 7, 17, 'WGE-357', '2006', '2005', '30566545', 6.0000, 'gasolina', 1700.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0018', 1, 2, 18, 'WGH-667', '2007', '2005', 'F4AE0681D681D6000087', 8.0000, 'd5', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0019', 1, 2, 19, 'WGH-668', '2007', '2005', 'F4AE0681D681D6000085', 6.0000, 'gasolina', 1234.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0020', 1, 2, 20, 'WGH-461', '2007', '2007', 'F4AE0681D681D6001659', 6.0000, 'd5', 1849.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0021', 1, 2, 21, 'WGH-460', '2007', '2007', 'F4AE0681D681D6001685', 6.0000, 'd6', 1298.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0022', 1, 3, 22, 'WGJ-293', '2006', '2007', '470HM2U1492450', 6.0000, 'gasolina', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0023', 1, 3, 23, 'WGI-601', '2006', '2007', '470HM2U1492451', 8.0000, 'd6', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0024', 2, 4, 24, 'XI-5417', '1996', '2006', 'SH021925', 7.0000, 'gasolina', 1234.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0025', 2, 5, 25, 'XO-3515', '2000', '2006', 'D4DAY094833', 7.0000, 'd6', 1849.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0026', 2, 7, 26, 'XO-7859', '2005', '2006', '4123022', 6.0000, 'd7', 1298.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0027', 2, 7, 27, 'XO-8116', '2005', '2006', '4123206', 7.0000, 'gasolina', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0028', 2, 7, 28, 'C-35- EN', '2006', '2006', 'E1T134243', 6.0000, 'd7', 1400.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0029', 2, 6, 29, 'WGF-071', '2007', '2006', '69465223', 7.0000, 'gasolina', 2000.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0030', 2, 6, 30, 'WGF-088', '2007', '2006', '69478119', 7.0000, 'd7', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0031', 1, 7, 31, 'XQ-6729', '1992', '2000', 'D2366T200703', 7.0000, 'd8', 1234.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0032', 1, 7, 32, 'XQ-6807', '1992', '2000', 'D2366T200757CA', 8.0000, 'gasolina', 1849.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0033', 1, 7, 33, 'XQ-6806', '1992', '2000', 'D2366T200750', 7.0000, 'd8', 1298.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0034', 1, 7, 34, 'XQ-6967', '1992', '2000', 'D2366T200735', 7.0000, 'gasolina', 1290.0000, NULL, 1);
INSERT INTO `t_camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0035', 1, 7, 35, 'XQ-6966', '1992', '2000', 'D2366T200699', 6.0000, 'd8', 1800.0000, NULL, 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_clase`
-- 

DROP TABLE IF EXISTS `t_clase`;
CREATE TABLE IF NOT EXISTS `t_clase` (
  `idClase` int(11) NOT NULL COMMENT 'Primary Key de la tabla Clase de camion',
  `Nombre` varchar(40) NOT NULL COMMENT 'Nombre de la clase de camion',
  `Descripcion` varchar(45) default NULL COMMENT 'Descripción de la clase del camion',
  PRIMARY KEY  (`idClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_clase`
-- 

INSERT INTO `t_clase` (`idClase`, `Nombre`, `Descripcion`) VALUES (1, 'COMPACTADORA', NULL);
INSERT INTO `t_clase` (`idClase`, `Nombre`, `Descripcion`) VALUES (2, 'BARANDA', NULL);
INSERT INTO `t_clase` (`idClase`, `Nombre`, `Descripcion`) VALUES (3, 'BARREDORA', NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_cliente`
-- 

DROP TABLE IF EXISTS `t_cliente`;
CREATE TABLE IF NOT EXISTS `t_cliente` (
  `cdCliente` char(10) NOT NULL COMMENT 'Codigo Generado: CLT0000001,CLT0000002,....',
  `cdRuc` char(6) NOT NULL COMMENT 'Primary key de la tabla Empresa',
  `nomUsu` varchar(10) NOT NULL COMMENT 'Primary key de la tabla Usuario, En este caso este es el nombre de usuario del cliente',
  `cdUbig` char(6) NOT NULL COMMENT 'Primary key de la tabla Ubigeo, aqui nos permitira identificar a que distrito pertenece el cliente',
  `nombreComp` varchar(45) NOT NULL COMMENT 'Nombre completo del Cliente',
  `tipoDocI` char(1) NOT NULL COMMENT 'Tipo de Documento de identidad',
  `nroDocI` varchar(15) NOT NULL COMMENT 'Nro de documento de identidad',
  `domicilio` varchar(50) NOT NULL COMMENT 'Dirección del cliente',
  `telefono` varchar(15) default NULL COMMENT 'Nro Telefono fijo ',
  `celular` varchar(15) default NULL COMMENT 'Nro de Celular',
  `email` varchar(45) default NULL COMMENT 'Correo electronico del cliente',
  `estado` tinyint(1) NOT NULL COMMENT 'Si esta habilitado o no',
  PRIMARY KEY  (`cdCliente`),
  KEY `fk_T_Cliente_T_Ubigeo1_idx` (`cdUbig`),
  KEY `fk_T_Cliente_T_Usuario1_idx` (`nomUsu`),
  KEY `fk_T_Cliente_T_Empresa1_idx` (`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_cliente`
-- 

INSERT INTO `t_cliente` (`cdCliente`, `cdRuc`, `nomUsu`, `cdUbig`, `nombreComp`, `tipoDocI`, `nroDocI`, `domicilio`, `telefono`, `celular`, `email`, `estado`) VALUES ('CLT0000001', 'RC0001', 'cmiranda', '150134', 'Carlos Miranda', 'N', '29283746', 'av. San Lusi 345', NULL, NULL, NULL, 1);
INSERT INTO `t_cliente` (`cdCliente`, `cdRuc`, `nomUsu`, `cdUbig`, `nombreComp`, `tipoDocI`, `nroDocI`, `domicilio`, `telefono`, `celular`, `email`, `estado`) VALUES ('CLT0000002', 'RC0001', 'aperez', '150115', 'Angela Perez', 'N', '23245654', 'av. mexico 223', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_comprobante`
-- 

DROP TABLE IF EXISTS `t_comprobante`;
CREATE TABLE IF NOT EXISTS `t_comprobante` (
  `idComprobante` char(10) NOT NULL COMMENT 'CP00000001',
  `cdLiq` char(10) NOT NULL COMMENT 'Primary key de la tabla liquidación',
  `cdMda` varchar(2) NOT NULL COMMENT 'Primary key de la tabla moneda, nos permite identificar con que moneda.',
  `cdTD` varchar(2) NOT NULL COMMENT 'Primary key de la tabla tipoDoc, aqui nos permitira identificar que tipo de documento',
  `fecMov` datetime NOT NULL COMMENT 'Fecha en la que se realizo la compra',
  `serie` varchar(4) NOT NULL COMMENT 'Serie del comprobante',
  `nroDoc` varchar(15) NOT NULL COMMENT 'Nro de documento del comprobante',
  `total` decimal(7,2) NOT NULL COMMENT 'Total que se pago',
  `subTotal` decimal(7,2) NOT NULL COMMENT 'Sub total pagado',
  `IGV` decimal(7,2) NOT NULL COMMENT 'IGV del pago',
  `usuCrea` varchar(10) NOT NULL COMMENT 'Usuario que creo el comprobante',
  `fechaReg` datetime NOT NULL COMMENT 'Fecha en la que se registro el comprobante',
  `usuModf` varchar(10) default NULL COMMENT 'Usuario que modifico el comprobante',
  `fechaModf` datetime default NULL COMMENT 'Fecha en la que se modifico el comprobante',
  `estado` char(2) NOT NULL COMMENT 'PC- Pendiente\nCC- Cobrado',
  PRIMARY KEY  (`idComprobante`),
  KEY `fk_T_Factura_T_Moneda1_idx` (`cdMda`),
  KEY `fk_T_Comprobante_T_Liquidacion1_idx` (`cdLiq`),
  KEY `fk_T_Comprobante_T_TipoDoc1_idx` (`cdTD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_comprobante`
-- 

INSERT INTO `t_comprobante` (`idComprobante`, `cdLiq`, `cdMda`, `cdTD`, `fecMov`, `serie`, `nroDoc`, `total`, `subTotal`, `IGV`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `estado`) VALUES ('CP00000001', 'LQ00000001', '01', 'T1', '2013-06-01 00:00:00', '001', '145474', 4180.72, 3386.38, 794.33, 'vnunez', '2013-06-01 00:00:00', NULL, NULL, 'PC');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_comprobantedet`
-- 

DROP TABLE IF EXISTS `t_comprobantedet`;
CREATE TABLE IF NOT EXISTS `t_comprobantedet` (
  `item` varchar(45) NOT NULL COMMENT 'Primary key de la tabla item',
  `cdServicio` char(6) NOT NULL COMMENT 'Primary key de la tabla Servicio, no permitira identificar que servicio se realizo',
  `idComprobante` char(10) NOT NULL COMMENT 'Primary key de la tabla comprobante, aqui nos permitira saber a que comprobante pertenece el detalle',
  `precio` decimal(7,2) NOT NULL COMMENT 'Precio de la tonelada',
  `cantTN` decimal(7,2) NOT NULL COMMENT 'Canttidad de toneladas',
  `total` decimal(7,2) NOT NULL COMMENT 'Total a pagar',
  PRIMARY KEY  (`item`),
  KEY `fk_T_FacturaDet_T_Servicio1_idx` (`cdServicio`),
  KEY `fk_T_ComprobanteDet_T_Comprobante1_idx` (`idComprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_comprobantedet`
-- 

INSERT INTO `t_comprobantedet` (`item`, `cdServicio`, `idComprobante`, `precio`, `cantTN`, `total`) VALUES ('1', 'SRV001', 'CP00000001', 80.60, 51.87, 4180.72);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_controlviaje`
-- 

DROP TABLE IF EXISTS `t_controlviaje`;
CREATE TABLE IF NOT EXISTS `t_controlviaje` (
  `cdControlViaje` char(10) NOT NULL COMMENT 'Primary Key de la Tabla Control de Viaje',
  `nroViaje` int(11) NOT NULL COMMENT 'Indica el numero del viaje',
  `Nro` int(11) NOT NULL COMMENT 'Nro del Documento despacho',
  `cdDespacho` char(10) NOT NULL COMMENT 'Código del Despacho',
  `cdRuc` char(6) NOT NULL COMMENT 'Ruc de la Empresa',
  `fechaEmi` datetime NOT NULL COMMENT 'Fecha en la que se emite el documento',
  `horaEstimada` char(5) default NULL COMMENT 'Hora en la que se esperaba se comienze el viaje',
  `horaReal` char(5) default NULL COMMENT 'Hora el la que se realizo el viaje',
  `Obs` varchar(300) default NULL COMMENT 'Alguna observación que se halla dado en el control del Viaje',
  PRIMARY KEY  (`cdControlViaje`,`nroViaje`),
  KEY `fk_T_ControlViaje_T_DespachoDet1_idx` (`Nro`,`cdDespacho`,`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_controlviaje`
-- 

INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000001', 1, 1, 'DP00000001', 'RC0001', '2013-05-01 00:00:00', '3:00', '2:00', '');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000002', 2, 1, 'DP00000001', 'RC0001', '2013-05-01 00:00:00', '3:00', '2:00', '');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000003', 1, 2, 'DP00000001', 'RC0001', '2013-05-01 00:00:00', '2:00', '2:00', '');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000004', 2, 2, 'DP00000001', 'RC0001', '2013-05-01 00:00:00', '2:00', '2:00', '');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000005', 1, 3, 'DP00000001', 'RC0001', '2013-05-01 00:00:00', '1:30', '1:30', '');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000006', 2, 3, 'DP00000001', 'RC0001', '2013-05-01 00:00:00', '1:30', '1:30', 'En mi segundo viaje el Motor tiene problemas');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000007', 1, 4, 'DP00000001', 'RC0001', '2013-05-01 00:00:00', '2:00', '2:00', '');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000008', 2, 4, 'DP00000001', 'RC0001', '2013-05-01 00:00:00', '2:00', '2:00', 'revisar frenos antes de fin de mes...');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000009', 1, 5, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000010', 2, 5, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '02:00', '01:00', 'aaa');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000011', 1, 6, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000012', 2, 6, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000013', 1, 7, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000014', 2, 7, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000015', 1, 8, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000016', 2, 8, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000017', 1, 9, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000018', 2, 9, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000019', 1, 10, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000020', 2, 10, 'DP00000002', 'RC0001', '2013-05-02 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000021', 1, 11, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000022', 2, 11, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000023', 1, 12, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000024', 2, 12, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000025', 1, 13, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000026', 2, 13, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000027', 1, 14, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000028', 2, 14, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000029', 1, 15, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000030', 2, 15, 'DP00000003', 'RC0001', '2013-05-03 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000031', 1, 16, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000032', 2, 16, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000033', 1, 17, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000034', 2, 17, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000035', 1, 18, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000036', 2, 18, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000037', 1, 19, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000038', 2, 19, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000039', 1, 20, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000040', 2, 20, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000041', 1, 21, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000042', 2, 21, 'DP00000004', 'RC0001', '2013-05-04 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000043', 1, 28, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000044', 2, 28, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000045', 1, 29, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000046', 2, 29, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000047', 1, 30, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000048', 2, 30, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000049', 1, 31, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000050', 2, 31, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000051', 1, 32, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000052', 2, 32, 'DP00000006', 'RC0001', '2013-05-06 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000053', 1, 22, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000054', 2, 22, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000055', 1, 23, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000056', 2, 23, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000057', 1, 24, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000058', 2, 24, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000059', 1, 25, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000060', 2, 25, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000061', 1, 26, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000062', 2, 26, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000063', 1, 27, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000064', 2, 27, 'DP00000005', 'RC0001', '2013-05-05 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000065', 1, 33, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000066', 2, 33, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000067', 1, 34, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000068', 2, 34, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000069', 1, 35, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000070', 2, 35, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000071', 1, 36, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000072', 2, 36, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000073', 1, 37, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000074', 2, 37, 'DP00000007', 'RC0001', '2013-05-07 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000075', 1, 39, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000076', 2, 39, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000077', 1, 40, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000078', 2, 40, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000079', 1, 41, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000080', 2, 41, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000081', 1, 42, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000082', 2, 42, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000083', 1, 43, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000084', 2, 43, 'DP00000008', 'RC0001', '2013-05-08 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000085', 1, 44, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000086', 2, 44, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000087', 1, 45, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000088', 2, 45, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000089', 1, 46, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000090', 2, 46, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '4:00', '', 'En mi segundo viaje el Motor tiene problemas');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000091', 1, 47, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000092', 2, 47, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000093', 1, 48, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000094', 2, 48, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000095', 1, 49, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000096', 2, 49, 'DP00000009', 'RC0001', '2013-05-09 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000097', 1, 50, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000098', 2, 50, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000099', 1, 51, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000100', 2, 51, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '3:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000101', 1, 52, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000102', 2, 52, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000103', 1, 53, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000104', 2, 53, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000105', 1, 54, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000106', 2, 54, 'DP00000010', 'RC0001', '2013-05-10 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000107', 1, 55, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000108', 2, 55, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000109', 1, 56, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000110', 2, 56, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000111', 1, 57, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000112', 2, 57, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000113', 1, 58, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000114', 2, 58, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000115', 1, 59, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000116', 2, 59, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000117', 1, 60, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000118', 2, 60, 'DP00000011', 'RC0001', '2013-05-11 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000119', 1, 61, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000120', 2, 61, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000121', 1, 62, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000122', 2, 62, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000123', 1, 63, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000124', 2, 63, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000125', 1, 64, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000126', 2, 64, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000127', 1, 65, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000128', 2, 65, 'DP00000012', 'RC0001', '2013-05-12 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000129', 1, 66, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000130', 2, 66, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000131', 1, 67, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000132', 2, 67, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000133', 1, 68, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000134', 2, 68, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000135', 1, 69, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000136', 2, 69, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000137', 1, 70, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000138', 2, 70, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000139', 1, 71, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000140', 2, 71, 'DP00000013', 'RC0001', '2013-05-13 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000141', 1, 72, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000142', 2, 72, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000143', 1, 73, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000144', 2, 73, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000145', 1, 74, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000146', 2, 74, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000147', 1, 75, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000148', 2, 75, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000149', 1, 76, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000150', 2, 76, 'DP00000014', 'RC0001', '2013-05-14 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000151', 1, 77, 'DP00000015', 'RC0001', '2013-05-15 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000152', 2, 77, 'DP00000015', 'RC0001', '2013-05-15 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000153', 1, 78, 'DP00000015', 'RC0001', '2013-05-15 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000154', 2, 78, 'DP00000015', 'RC0001', '2013-05-15 00:00:00', '4:00', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000155', 1, 79, 'DP00000015', 'RC0001', '2013-05-15 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000156', 2, 79, 'DP00000015', 'RC0001', '2013-05-15 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000157', 1, 80, 'DP00000015', 'RC0001', '2013-05-15 00:00:00', '', '', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000158', 2, 80, 'DP00000015', 'RC0001', '2013-05-15 00:00:00', '', '', NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_despacho`
-- 

DROP TABLE IF EXISTS `t_despacho`;
CREATE TABLE IF NOT EXISTS `t_despacho` (
  `cdDespacho` char(10) NOT NULL COMMENT 'Primary key de la tabla Despacho',
  `cdRuc` char(6) NOT NULL COMMENT 'Primary key de la tabla empresa, aqui nos permitira identificar a que empresa le corresponde la liquidación',
  `cdUbig` char(6) NOT NULL COMMENT 'Primary key de la tabla Ubigeo, aqui nos permitira identificar a que distrito corresponde este despacho',
  `cdTurno` char(4) NOT NULL COMMENT 'Primary key de la tabla Turno, aqui nos permitira identificar a que turno corresponde el despacho',
  `nroDespacho` char(10) NOT NULL COMMENT 'Nro interno del despacho',
  `fechaEmi` datetime NOT NULL COMMENT 'Fecha en la que se emitio',
  `zona` varchar(50) NOT NULL COMMENT 'Zona a la que corresponde este despacho',
  `dineroEnviado` decimal(13,4) default NULL COMMENT 'Dinero que se envio en el despacho',
  `totalDineroUso` decimal(13,4) default NULL COMMENT 'Total del dinero que se utilizo',
  `totalDineroSinUso` decimal(13,4) default NULL COMMENT 'Total de dinero que no se utilizo',
  `usuCrea` varchar(10) NOT NULL COMMENT 'usuario que crea el despacho',
  `fechaReg` datetime NOT NULL COMMENT 'Fecha en la que se registro',
  `usuModf` varchar(10) default NULL COMMENT 'Usuario que modifica el despacho',
  `fechaModf` datetime default NULL COMMENT 'Fecha en la que se modifico',
  `evaluacion` char(2) default NULL COMMENT 'se evalua si el despacho fue bueno o malo',
  `obs` varchar(200) default NULL COMMENT 'Alguna observación en el despacho',
  PRIMARY KEY  (`cdDespacho`,`cdRuc`),
  KEY `fk_T_Despacho_T_Ubigeo1_idx` (`cdUbig`),
  KEY `fk_T_Despacho_T_Turno1_idx` (`cdTurno`),
  KEY `fk_T_Despacho_T_Empresa1_idx` (`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_despacho`
-- 

INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000001', 'RC0001', '150115', 'TN02', 'NDP0000001', '2013-05-01 00:00:00', 'zona A', 140.0000, 120.0000, 20.0000, 'coropeza', '2013-05-01 00:00:00', NULL, NULL, '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000002', 'RC0001', '150115', 'TN02', 'NDP0000002', '2013-05-02 00:00:00', 'zona B', NULL, NULL, NULL, 'coropeza', '2013-05-02 00:00:00', 'dparraga', '2013-05-02 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000003', 'RC0001', '150115', 'TN02', 'NDP0000003', '2013-05-03 00:00:00', 'Zona C', 150.0000, 140.0000, 10.0000, 'coropeza', '2013-05-03 00:00:00', 'mrobles', '2013-05-03 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000004', 'RC0001', '150115', 'TN02', 'NDP0000004', '2013-05-04 00:00:00', 'Zona D', NULL, NULL, NULL, 'coropeza', '2013-05-04 00:00:00', 'dparraga', '2013-05-04 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000005', 'RC0001', '150115', 'TN02', 'NDP0000005', '2013-05-05 00:00:00', 'zona E', 140.0000, 120.0000, 20.0000, 'coropeza', '2013-05-05 00:00:00', NULL, NULL, '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000006', 'RC0001', '150115', 'TN02', 'NDP0000006', '2013-05-06 00:00:00', 'zona F', NULL, NULL, NULL, 'coropeza', '2013-05-06 00:00:00', 'dparraga', '2013-05-06 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000007', 'RC0001', '150115', 'TN02', 'NDP0000007', '2013-05-07 00:00:00', 'zona G', NULL, NULL, NULL, 'coropeza', '2013-05-07 00:00:00', 'mrobles', '2013-05-07 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000008', 'RC0001', '150115', 'TN02', 'NDP0000008', '2013-05-08 00:00:00', 'zona H', NULL, NULL, NULL, 'coropeza', '2013-05-08 00:00:00', 'dparraga', '2013-05-08 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000009', 'RC0001', '150115', 'TN02', 'NDP0000009', '2013-05-09 00:00:00', 'zona A', NULL, NULL, NULL, 'coropeza', '2013-05-09 00:00:00', NULL, NULL, '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000010', 'RC0001', '150115', 'TN02', 'NDP0000010', '2013-05-10 00:00:00', 'zona B', 120.0000, 120.0000, 0.0000, 'coropeza', '2013-05-10 00:00:00', 'mrobles', '2013-05-10 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000011', 'RC0001', '150115', 'TN02', 'NDP0000011', '2013-05-11 00:00:00', 'Zona C', NULL, NULL, NULL, 'coropeza', '2013-05-11 00:00:00', 'dparraga', '2013-05-11 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000012', 'RC0001', '150115', 'TN02', 'NDP0000012', '2013-05-12 00:00:00', 'Zona D', NULL, NULL, NULL, 'coropeza', '2013-05-12 00:00:00', NULL, NULL, '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000013', 'RC0001', '150115', 'TN02', 'NDP0000013', '2013-05-13 00:00:00', 'zona E', NULL, NULL, NULL, 'coropeza', '2013-05-13 00:00:00', 'mrobles', '2013-05-13 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000014', 'RC0001', '150115', 'TN02', 'NDP0000014', '2013-05-14 00:00:00', 'zona F', NULL, NULL, NULL, 'coropeza', '2013-05-14 00:00:00', 'dparraga', '2013-05-14 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000015', 'RC0001', '150115', 'TN02', 'NDP0000015', '2013-05-15 00:00:00', 'zona G', NULL, NULL, NULL, 'coropeza', '2013-05-15 00:00:00', 'mrobles', '2013-05-15 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000016', 'RC0001', '150115', 'TN02', 'NDP0000016', '2013-05-16 00:00:00', 'zona H', NULL, NULL, NULL, 'coropeza', '2013-05-16 00:00:00', NULL, NULL, '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000017', 'RC0001', '150115', 'TN02', 'NDP0000017', '2013-05-17 00:00:00', 'zona A', NULL, NULL, NULL, 'coropeza', '2013-05-17 00:00:00', 'dparraga', '2013-05-17 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000018', 'RC0001', '150115', 'TN02', 'NDP0000018', '2013-05-18 00:00:00', 'zona B', 200.0000, 180.0000, 20.0000, 'coropeza', '2013-05-18 00:00:00', NULL, NULL, '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000019', 'RC0001', '150115', 'TN02', 'NDP0000019', '2013-05-19 00:00:00', 'Zona C', NULL, NULL, NULL, 'coropeza', '2013-05-19 00:00:00', 'mrobles', '2013-05-19 00:00:00', '', '');
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000020', 'RC0001', '150115', 'TN02', 'NDP0000020', '2013-05-20 00:00:00', 'Zona D', NULL, NULL, NULL, 'coropeza', '2013-05-20 00:00:00', NULL, NULL, '', '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_despachodet`
-- 

DROP TABLE IF EXISTS `t_despachodet`;
CREATE TABLE IF NOT EXISTS `t_despachodet` (
  `Nro` int(11) NOT NULL COMMENT 'Generar numero: 1,2,3... De acuerdo al cdDespacho y cdRuc (poder Diferenciar)',
  `cdDespacho` char(10) NOT NULL COMMENT 'Primary Key de la Tabla Despacho, aqui nos permitira identificar a que despacho le corresponde el detalle',
  `cdRuc` char(6) NOT NULL COMMENT 'Primary key de la tabla Empresa, aqui nos permitira saber que empresa esta relacionada a este detalle',
  `cdAsigCamion` char(10) NOT NULL COMMENT 'Primary key de la Tabla TrabajadorxCamion',
  `cantViaje` int(11) NOT NULL COMMENT 'Nro de Viajes que se realizaron',
  `evaluacion` char(1) default NULL COMMENT 'B: Bien         	M: Mal',
  PRIMARY KEY  (`Nro`,`cdDespacho`,`cdRuc`),
  KEY `fk_T_DespachoDet_T_TrabajadorXCamion1_idx` (`cdAsigCamion`),
  KEY `fk_T_DespachoDet_T_Despacho1_idx` (`cdDespacho`,`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_despachodet`
-- 

INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (1, 'DP00000001', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (2, 'DP00000001', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (3, 'DP00000001', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (4, 'DP00000001', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (5, 'DP00000002', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (6, 'DP00000002', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (7, 'DP00000002', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (8, 'DP00000002', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (9, 'DP00000002', 'RC0001', 'ATC0000005', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (10, 'DP00000002', 'RC0001', 'ATC0000006', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (11, 'DP00000003', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (12, 'DP00000003', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (13, 'DP00000003', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (14, 'DP00000003', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (15, 'DP00000003', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (16, 'DP00000004', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (17, 'DP00000004', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (18, 'DP00000004', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (19, 'DP00000004', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (20, 'DP00000004', 'RC0001', 'ATC0000005', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (21, 'DP00000004', 'RC0001', 'ATC0000006', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (22, 'DP00000005', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (23, 'DP00000005', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (24, 'DP00000005', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (25, 'DP00000005', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (26, 'DP00000005', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (27, 'DP00000005', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (28, 'DP00000006', 'RC0001', 'ATC0000008', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (29, 'DP00000006', 'RC0001', 'ATC0000009', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (30, 'DP00000006', 'RC0001', 'ATC0000010', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (31, 'DP00000006', 'RC0001', 'ATC0000011', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (32, 'DP00000006', 'RC0001', 'ATC0000012', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (33, 'DP00000007', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (34, 'DP00000007', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (35, 'DP00000007', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (36, 'DP00000007', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (37, 'DP00000007', 'RC0001', 'ATC0000005', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (38, 'DP00000007', 'RC0001', 'ATC0000006', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (39, 'DP00000008', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (40, 'DP00000008', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (41, 'DP00000008', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (42, 'DP00000008', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (43, 'DP00000008', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (44, 'DP00000009', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (45, 'DP00000009', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (46, 'DP00000009', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (47, 'DP00000009', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (48, 'DP00000009', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (49, 'DP00000009', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (50, 'DP00000010', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (51, 'DP00000010', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (52, 'DP00000010', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (53, 'DP00000010', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (54, 'DP00000010', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (55, 'DP00000011', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (56, 'DP00000011', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (57, 'DP00000011', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (58, 'DP00000011', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (59, 'DP00000011', 'RC0001', 'ATC0000005', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (60, 'DP00000011', 'RC0001', 'ATC0000006', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (61, 'DP00000012', 'RC0001', 'ATC0000008', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (62, 'DP00000012', 'RC0001', 'ATC0000009', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (63, 'DP00000012', 'RC0001', 'ATC0000010', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (64, 'DP00000012', 'RC0001', 'ATC0000011', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (65, 'DP00000012', 'RC0001', 'ATC0000012', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (66, 'DP00000013', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (67, 'DP00000013', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (68, 'DP00000013', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (69, 'DP00000013', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (70, 'DP00000013', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (71, 'DP00000013', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (72, 'DP00000014', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (73, 'DP00000014', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (74, 'DP00000014', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (75, 'DP00000014', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (76, 'DP00000014', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (77, 'DP00000015', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (78, 'DP00000015', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (79, 'DP00000015', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (80, 'DP00000015', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (81, 'DP00000015', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (82, 'DP00000015', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (83, 'DP00000016', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (84, 'DP00000016', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (85, 'DP00000016', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (86, 'DP00000016', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (87, 'DP00000016', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (88, 'DP00000017', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (89, 'DP00000017', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (90, 'DP00000017', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (100, 'DP00000017', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (101, 'DP00000017', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (102, 'DP00000017', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (103, 'DP00000018', 'RC0001', 'ATC0000008', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (104, 'DP00000018', 'RC0001', 'ATC0000009', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (105, 'DP00000018', 'RC0001', 'ATC0000010', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (106, 'DP00000018', 'RC0001', 'ATC0000011', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (107, 'DP00000018', 'RC0001', 'ATC0000012', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (108, 'DP00000019', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (109, 'DP00000019', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (110, 'DP00000019', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (111, 'DP00000019', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (112, 'DP00000019', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (113, 'DP00000019', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (114, 'DP00000020', 'RC0001', 'ATC0000008', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (115, 'DP00000020', 'RC0001', 'ATC0000009', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (116, 'DP00000020', 'RC0001', 'ATC0000010', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (117, 'DP00000020', 'RC0001', 'ATC0000011', 2, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_empresa`
-- 

DROP TABLE IF EXISTS `t_empresa`;
CREATE TABLE IF NOT EXISTS `t_empresa` (
  `cdRuc` char(6) NOT NULL COMMENT 'Codigo Generado: RC0001,RC0002,...',
  `cdUbig` char(6) NOT NULL COMMENT 'Primary key de la tabla ubigeo, aqui nos permitirá identificar a que distrito pertenece la empresa',
  `rucE` char(11) NOT NULL COMMENT 'Ruc de la Empresa',
  `rSocial` varchar(150) NOT NULL COMMENT 'Razon social de la empresa',
  `fechaIni` datetime NOT NULL COMMENT 'Fecha en la que inicio la empresa',
  `direccion` varchar(200) NOT NULL COMMENT 'Dirección de la empresa',
  `telef` varchar(15) NOT NULL COMMENT 'Telefono de la empresa',
  `logo` blob COMMENT 'Logo de la empresa',
  PRIMARY KEY  (`cdRuc`),
  KEY `fk_T_Empresa_T_Ubigeo1_idx` (`cdUbig`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_empresa`
-- 

INSERT INTO `t_empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0001', '150134', '20131378115', 'MUNICIPALIDAD DISTRITAL DE SAN LUIS', '1993-05-04 00:00:00', 'Av. del Aire  Nro. 1540 URB. Villa Jardin', '365027', NULL);
INSERT INTO `t_empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0002', '150115', '20131368071', 'MUNICIPALIDAD DISTRITAL DE LA VICTORIA', '1993-05-04 00:00:00', 'AV. IQUITOS NRO. 500', '315766', NULL);
INSERT INTO `t_empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0003', '150103', '20131378620', 'MUNICIPALIDAD DISTRITAL DE ATE', '1993-05-04 00:00:00', 'CAR. CARRETERA CENTRAL KM 7.5', '4941428', NULL);
INSERT INTO `t_empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0004', '150130', '20131373741', 'MUNICIPALIDAD DE SAN BORJA', '1993-05-04 00:00:00', 'AV. AVENIDA JOAQUIN MADRID NRO.200', '6125555', NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_estadoliq`
-- 

DROP TABLE IF EXISTS `t_estadoliq`;
CREATE TABLE IF NOT EXISTS `t_estadoliq` (
  `cdEstadoLiq` char(3) NOT NULL COMMENT 'Primary Key de estado de Liquidación',
  `Nombre` varchar(30) NOT NULL COMMENT 'Nombre del Estado',
  PRIMARY KEY  (`cdEstadoLiq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_estadoliq`
-- 

INSERT INTO `t_estadoliq` (`cdEstadoLiq`, `Nombre`) VALUES ('EL1', 'Pendiente');
INSERT INTO `t_estadoliq` (`cdEstadoLiq`, `Nombre`) VALUES ('EL2', 'Liquidado');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_estadoxliquidacion`
-- 

DROP TABLE IF EXISTS `t_estadoxliquidacion`;
CREATE TABLE IF NOT EXISTS `t_estadoxliquidacion` (
  `fechaEstado` datetime NOT NULL COMMENT 'Fecha de Creación del Estado',
  `cdEstadoLiq` char(3) NOT NULL COMMENT 'Primary Key de la tabla Estado de Liquidación',
  `cdLiq` char(10) NOT NULL COMMENT 'Primary Key de la Tabla Liquidación',
  `Obs` varchar(100) default NULL COMMENT 'Observacion sobre el estado de la Liquidación',
  PRIMARY KEY  (`fechaEstado`,`cdEstadoLiq`,`cdLiq`),
  KEY `fk_T_EstadoxLiquidacion_T_EstadoLiq1_idx` (`cdEstadoLiq`),
  KEY `fk_T_EstadoxLiquidacion_T_Liquidacion1_idx` (`cdLiq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_estadoxliquidacion`
-- 

INSERT INTO `t_estadoxliquidacion` (`fechaEstado`, `cdEstadoLiq`, `cdLiq`, `Obs`) VALUES ('2013-02-02 14:38:54', 'EL1', 'LQ00000001', 'Liquidacion Pendiente');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_grupoacceso`
-- 

DROP TABLE IF EXISTS `t_grupoacceso`;
CREATE TABLE IF NOT EXISTS `t_grupoacceso` (
  `cdGA` int(11) NOT NULL COMMENT 'Primary key de la tabla Grupo acceso',
  `descrip` varchar(100) NOT NULL COMMENT 'Descripcion del Grupo de acceso',
  `estado` tinyint(1) NOT NULL COMMENT 'si esta o no habilitado',
  PRIMARY KEY  (`cdGA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_grupoacceso`
-- 

INSERT INTO `t_grupoacceso` (`cdGA`, `descrip`, `estado`) VALUES (1, 'Administracion', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_incidencia`
-- 

DROP TABLE IF EXISTS `t_incidencia`;
CREATE TABLE IF NOT EXISTS `t_incidencia` (
  `cdInc` char(10) NOT NULL COMMENT 'Primary Key de la Tabla incidencia',
  `cdControlViaje` char(10) NOT NULL COMMENT 'Primary Key de la Tabla Control de Viaje',
  `nroViaje` int(11) NOT NULL COMMENT 'Indica el numero del viaje',
  `fechaInc` datetime NOT NULL COMMENT 'Fecha en la que se dio la incidencia',
  `zona` varchar(100) NOT NULL COMMENT 'Zona en la que se día',
  `problema` varchar(45) NOT NULL COMMENT 'El problema que se genero',
  `horaProb` char(5) NOT NULL COMMENT 'Hora en que se generó el problema',
  `observaciones` varchar(200) default NULL COMMENT 'Alguna pequeña observación acerca del problema',
  `soluc` varchar(200) default NULL COMMENT 'La solución si es que se le dió al problema',
  PRIMARY KEY  (`cdInc`),
  KEY `fk_T_Incidencia_T_ControlViaje1_idx` (`cdControlViaje`,`nroViaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_incidencia`
-- 

INSERT INTO `t_incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000001', 'CV00000001', 1, '2013-05-01 00:00:00', 'zona abc', 'frenos', '01:00', NULL, NULL);
INSERT INTO `t_incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000002', 'CV00000002', 2, '2013-05-01 00:00:00', 'zona dcf', 'kilometraje', '02:00', NULL, NULL);
INSERT INTO `t_incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000003', 'CV00000003', 1, '2013-05-01 00:00:00', 'Campo mar', 'gasolina', '04:00', NULL, NULL);
INSERT INTO `t_incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000004', 'CV00000004', 2, '2013-05-01 00:00:00', 'Parque los heros', 'repuestos', '07:00', NULL, NULL);
INSERT INTO `t_incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000005', 'CV00000005', 1, '2013-05-01 00:00:00', 'Parque olivar', 'accidente', '6:00', NULL, 'se envio personal de auxilio');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_liquidacion`
-- 

DROP TABLE IF EXISTS `t_liquidacion`;
CREATE TABLE IF NOT EXISTS `t_liquidacion` (
  `cdLiq` char(10) NOT NULL COMMENT 'Primary Key de la Tabla Liquidación',
  `cdRuc` char(6) NOT NULL COMMENT 'Primary key de la tabla Empresa, aqui nos permitira identificar a que empresa le pertenece esta liquidación',
  `cdTipoLiq` char(4) NOT NULL COMMENT 'Primary key de la tabla tipo Liquidación, no permitira saber que tipo de liquidación es',
  `fechaApertura` datetime NOT NULL COMMENT 'Fecha de apertura es la fecha en la que se crea la liquidación',
  `fechaInicio` datetime NOT NULL COMMENT 'Iindica desde que fecha se cobrara',
  `fechaFin` datetime NOT NULL COMMENT 'Indica desde hasta que fecha se cobrara',
  `totalTN` decimal(7,2) default NULL COMMENT 'Total de toneladas que se cobraran',
  `asunto` varchar(100) default NULL COMMENT 'alguna observación que se quiera dejar',
  `usuCrea` varchar(10) NOT NULL COMMENT 'Usuario que crea la liquidación',
  `fechaReg` datetime NOT NULL COMMENT 'Fecha en la que se realizo la creación de la liquidación',
  `usuModf` varchar(10) default NULL COMMENT 'Usuario que modifico la liquidación',
  `fechaModf` datetime default NULL COMMENT 'Fecha en la que se modifico la liquidación',
  PRIMARY KEY  (`cdLiq`),
  KEY `fk_T_Liquidacion_T_Empresa1_idx` (`cdRuc`),
  KEY `fk_T_Liquidacion_T_TipoLiquidacion1_idx` (`cdTipoLiq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_liquidacion`
-- 

INSERT INTO `t_liquidacion` (`cdLiq`, `cdRuc`, `cdTipoLiq`, `fechaApertura`, `fechaInicio`, `fechaFin`, `totalTN`, `asunto`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`) VALUES ('LQ00000001', 'RC0001', 'TL01', '2013-02-02 14:38:54', '2013-01-01 00:00:00', '2013-01-31 00:00:00', NULL, NULL, 'coropeza', '2013-02-02 14:38:54', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_marca`
-- 

DROP TABLE IF EXISTS `t_marca`;
CREATE TABLE IF NOT EXISTS `t_marca` (
  `idMarca` int(11) NOT NULL COMMENT 'Primary key de la tabla marca de los camiones',
  `nombreMarca` varchar(40) NOT NULL COMMENT 'Nombre de la marca de camion',
  `descripcion` varchar(45) default NULL COMMENT 'Breve Descripción de la marca',
  PRIMARY KEY  (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_marca`
-- 

INSERT INTO `t_marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (1, 'SCANIA', NULL);
INSERT INTO `t_marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (2, 'IVECO', NULL);
INSERT INTO `t_marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (3, 'INTERNATIONAL', NULL);
INSERT INTO `t_marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (4, 'KIA', NULL);
INSERT INTO `t_marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (5, 'HUINDAY', NULL);
INSERT INTO `t_marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (6, 'DONG FENG', NULL);
INSERT INTO `t_marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (7, 'VOLKSWAGEN', NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_menu`
-- 

DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE IF NOT EXISTS `t_menu` (
  `cdMenu` varchar(6) NOT NULL COMMENT 'Primary key de la tabla Menu',
  `Nombre` varchar(50) NOT NULL COMMENT 'Nombre del Menu',
  `ruta` varchar(100) NOT NULL COMMENT 'Ruta de acceso del Menu',
  `estado` tinyint(1) NOT NULL COMMENT 'Si está o no habilitado',
  PRIMARY KEY  (`cdMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_menu`
-- 

INSERT INTO `t_menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM001', 'Trabajador', '../faces/emch-administracion/trabajador.xhtml', 1);
INSERT INTO `t_menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM002', 'Empresa', '../faces/emch-administracion/empresa.xhtml', 1);
INSERT INTO `t_menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM003', 'Camion', '../faces/emch-administracion/camion.xhtml', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_moneda`
-- 

DROP TABLE IF EXISTS `t_moneda`;
CREATE TABLE IF NOT EXISTS `t_moneda` (
  `cdMda` varchar(2) NOT NULL COMMENT 'Primary key de la tabla moneda',
  `nombre` varchar(20) NOT NULL COMMENT 'Nombre de la moneda',
  `simbolo` varchar(4) NOT NULL COMMENT 'Simbolo de la moneda',
  `estado` tinyint(1) NOT NULL COMMENT 'Si esta o no habilitado',
  PRIMARY KEY  (`cdMda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_moneda`
-- 

INSERT INTO `t_moneda` (`cdMda`, `nombre`, `simbolo`, `estado`) VALUES ('01', 'Soles', 'S/.', 1);
INSERT INTO `t_moneda` (`cdMda`, `nombre`, `simbolo`, `estado`) VALUES ('02', 'Dolares', '$.', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_perfil`
-- 

DROP TABLE IF EXISTS `t_perfil`;
CREATE TABLE IF NOT EXISTS `t_perfil` (
  `cdPerfil` varchar(4) NOT NULL COMMENT 'Primary key de la tabla perfil',
  `nombrePrf` varchar(30) NOT NULL COMMENT 'Nombre del usuario al que le corresponde el perfil',
  `descripPrf` varchar(200) default NULL COMMENT 'Descripcion del usuario al que le corresponde el perfil',
  `estado` tinyint(1) NOT NULL COMMENT 'Estado si esta o no habilitado',
  PRIMARY KEY  (`cdPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_perfil`
-- 

INSERT INTO `t_perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF01', 'Administrador', 'Todos los permisos', 1);
INSERT INTO `t_perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF02', 'Supervisor', 'Todos los permisos menos seguridad', 1);
INSERT INTO `t_perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF03', 'Despachador', 'Perfil para el control de servicio', 1);
INSERT INTO `t_perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF04', 'Contador', 'Perfil para cumplir el rol de contador', 1);
INSERT INTO `t_perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF05', 'Cliente', 'Acceso solo a sus liquidaciones', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_pesaje`
-- 

DROP TABLE IF EXISTS `t_pesaje`;
CREATE TABLE IF NOT EXISTS `t_pesaje` (
  `cdPesaje` char(10) NOT NULL COMMENT 'Primary Key de la Tabla Pesaje',
  `cdControlViaje` char(10) NOT NULL COMMENT 'Primary Key de la Tabla Control de Viaje',
  `nroViaje` int(11) NOT NULL COMMENT 'Indica el numero del viaje',
  `cdLiq` char(10) default NULL COMMENT 'Primary Key de la Tabla Liquidación',
  `nroPesaje` int(11) NOT NULL,
  `fechaPesaje` datetime NOT NULL COMMENT 'Fecha en la que se hizo el Pesaje',
  `pesoBruto` decimal(7,2) NOT NULL COMMENT 'Peso ',
  `tara` decimal(7,2) NOT NULL COMMENT 'Peso adicional',
  `pesoTN` decimal(7,2) NOT NULL,
  `estadoPesaje` char(2) NOT NULL COMMENT 'P: Pendiente , L:Liquidado, ',
  `usuCrea` varchar(10) NOT NULL COMMENT 'Usuario que registro por primera vez el Pesaje',
  `fechaReg` datetime NOT NULL COMMENT 'Fecha en la que se registro el Pesaje',
  `usuModf` varchar(10) default NULL COMMENT 'usuario que edita el pesaje',
  `fechaModf` datetime default NULL COMMENT 'Fecha en la que se modifico',
  `Obs` varchar(100) default NULL COMMENT 'Se registra alguna observación',
  `imagenP` mediumblob COMMENT 'Imagen del Pesaje',
  PRIMARY KEY  (`cdPesaje`),
  KEY `fk_T_Pesaje_T_Liquidacion1_idx` (`cdLiq`),
  KEY `fk_T_Pesaje_T_ControlViaje1_idx` (`cdControlViaje`,`nroViaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_pesaje`
-- 

INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000001', 'CV00000001', 1, 'LQ00000001', 52048, '2013-05-01 00:00:00', 19.19, 12.64, 6.55, 'CC', 'coropeza', '2013-05-01 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000002', 'CV00000002', 2, 'LQ00000001', 52644, '2013-05-01 00:00:00', 22.55, 14.13, 8.42, 'CC', 'coropeza', '2013-05-01 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000003', 'CV00000003', 1, 'LQ00000001', 52764, '2013-05-01 00:00:00', 24.36, 12.49, 11.87, 'CC', 'dparraga', '2013-05-01 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000004', 'CV00000004', 2, 'LQ00000001', 52058, '2013-05-01 00:00:00', 24.98, 12.53, 12.45, 'CC', 'coropeza', '2013-05-01 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000005', 'CV00000005', 1, 'LQ00000001', 52103, '2013-05-01 00:00:00', 25.36, 12.78, 12.58, 'CC', 'coropeza', '2013-05-01 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000006', 'CV00000006', 2, NULL, 52143, '2013-05-01 00:00:00', 27.44, 14.07, 13.37, 'PP', 'coropeza', '2013-05-01 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000007', 'CV00000007', 1, NULL, 52187, '2013-05-01 00:00:00', 24.28, 12.66, 11.62, 'PP', 'dparraga', '2013-05-01 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000008', 'CV00000008', 2, NULL, 52232, '2013-05-01 00:00:00', 25.46, 14.12, 11.34, 'PP', 'coropeza', '2013-05-01 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000009', 'CV00000009', 1, NULL, 52275, '2013-05-02 00:00:00', 25.73, 14.15, 11.58, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000010', 'CV00000010', 2, NULL, 52317, '2013-05-02 00:00:00', 25.78, 12.50, 13.28, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000011', 'CV00000011', 1, NULL, 52355, '2013-05-02 00:00:00', 24.20, 12.76, 11.44, 'PP', 'dparraga', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000012', 'CV00000012', 2, NULL, 52398, '2013-05-02 00:00:00', 23.66, 12.51, 11.15, 'PP', 'dparraga', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000013', 'CV00000013', 1, NULL, 52442, '2013-05-02 00:00:00', 22.81, 12.67, 10.14, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000014', 'CV00000014', 2, NULL, 52487, '2013-05-02 00:00:00', 25.22, 14.10, 11.12, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000015', 'CV00000015', 1, NULL, 52529, '2013-05-02 00:00:00', 22.99, 12.78, 10.21, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000016', 'CV00000016', 2, NULL, 52574, '2013-05-02 00:00:00', 23.19, 12.60, 10.59, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000017', 'CV00000017', 1, NULL, 52616, '2013-05-02 00:00:00', 26.06, 14.22, 11.84, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000018', 'CV00000018', 2, NULL, 52654, '2013-05-02 00:00:00', 22.79, 12.52, 10.27, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000019', 'CV00000019', 1, NULL, 52691, '2013-05-02 00:00:00', 22.71, 12.75, 9.96, 'PP', 'dparraga', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000020', 'CV00000020', 2, NULL, 52731, '2013-05-02 00:00:00', 24.11, 14.17, 9.94, 'PP', 'mvalois', '2013-05-02 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000021', 'CV00000021', 1, NULL, 52773, '2013-05-03 00:00:00', 22.56, 12.46, 10.10, 'PP', 'mvalois', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000022', 'CV00000022', 2, NULL, 52814, '2013-05-03 00:00:00', 23.64, 12.73, 10.91, 'PP', 'dparraga', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000023', 'CV00000023', 1, NULL, 52890, '2013-05-03 00:00:00', 24.48, 12.61, 11.87, 'PP', 'coropeza', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000024', 'CV00000024', 2, NULL, 52905, '2013-05-03 00:00:00', 24.55, 14.08, 10.47, 'PP', 'dparraga', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000025', 'CV00000025', 1, NULL, 52942, '2013-05-03 00:00:00', 21.82, 12.68, 9.14, 'PP', 'coropeza', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000026', 'CV00000026', 2, NULL, 52983, '2013-05-03 00:00:00', 23.49, 14.07, 9.42, 'PP', 'coropeza', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000027', 'CV00000027', 1, NULL, 53027, '2013-05-03 00:00:00', 23.40, 12.45, 10.95, 'PP', 'dparraga', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000028', 'CV00000028', 2, NULL, 53071, '2013-05-03 00:00:00', 23.94, 12.75, 11.19, 'PP', 'coropeza', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000029', 'CV00000029', 1, NULL, 53117, '2013-05-03 00:00:00', 26.01, 14.01, 12.00, 'PP', 'dparraga', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000030', 'CV00000030', 2, NULL, 53159, '2013-05-03 00:00:00', 23.98, 12.59, 11.39, 'PP', 'vnunez', '2013-05-03 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000031', 'CV00000031', 1, NULL, 53204, '2013-05-04 00:00:00', 22.78, 12.70, 10.08, 'PP', 'mvalois', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000032', 'CV00000032', 2, NULL, 52233, '2013-05-04 00:00:00', 24.78, 14.00, 10.78, 'PP', 'mvalois', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000033', 'CV00000033', 1, NULL, 52276, '2013-05-04 00:00:00', 22.29, 12.46, 9.83, 'PP', 'vnunez', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000034', 'CV00000034', 2, NULL, 52518, '2013-05-04 00:00:00', 22.87, 12.73, 10.14, 'PP', 'mvalois', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000035', 'CV00000035', 1, NULL, 52562, '2013-05-04 00:00:00', 23.02, 12.61, 10.41, 'PP', 'vnunez', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000036', 'CV00000036', 2, NULL, 52804, '2013-05-04 00:00:00', 24.98, 13.99, 10.99, 'PP', 'mvalois', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000037', 'CV00000037', 1, NULL, 52861, '2013-05-04 00:00:00', 21.15, 12.62, 8.53, 'PP', 'dparraga', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000038', 'CV00000038', 2, NULL, 52976, '2013-05-04 00:00:00', 24.64, 13.91, 10.73, 'PP', 'coropeza', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000039', 'CV00000039', 1, NULL, 53190, '2013-05-04 00:00:00', 21.55, 12.49, 9.06, 'PP', 'coropeza', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000040', 'CV00000040', 2, NULL, 53233, '2013-05-04 00:00:00', 21.40, 12.62, 8.78, 'PP', 'dparraga', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000041', 'CV00000041', 1, NULL, 53103, '2013-05-04 00:00:00', 24.53, 14.09, 10.44, 'PP', 'coropeza', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000042', 'CV00000042', 2, NULL, 53148, '2013-05-04 00:00:00', 25.91, 12.79, 13.12, 'PP', 'coropeza', '2013-05-04 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000043', 'CV00000043', 1, NULL, 52192, '2013-05-06 00:00:00', 20.79, 14.03, 6.76, 'PP', 'dparraga', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000044', 'CV00000044', 2, NULL, 52476, '2013-05-06 00:00:00', 19.42, 12.46, 6.96, 'PP', 'coropeza', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000045', 'CV00000045', 1, NULL, 52521, '2013-05-06 00:00:00', 24.11, 12.46, 11.65, 'PP', 'vnunez', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000046', 'CV00000046', 2, NULL, 52895, '2013-05-06 00:00:00', 23.40, 12.76, 10.64, 'PP', 'mvalois', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000047', 'CV00000047', 1, NULL, 52097, '2013-05-06 00:00:00', 23.18, 12.56, 10.62, 'PP', 'vnunez', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000048', 'CV00000048', 2, NULL, 52224, '2013-05-06 00:00:00', 25.49, 14.10, 11.39, 'PP', 'mvalois', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000049', 'CV00000049', 1, NULL, 52978, '2013-05-06 00:00:00', 20.85, 12.65, 8.20, 'PP', 'vnunez', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000050', 'CV00000050', 2, NULL, 53023, '2013-05-06 00:00:00', 24.42, 13.98, 10.44, 'PP', 'mvalois', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000051', 'CV00000051', 1, NULL, 52718, '2013-05-06 00:00:00', 23.28, 12.47, 10.81, 'PP', 'vnunez', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000052', 'CV00000052', 2, NULL, 52183, '2013-05-06 00:00:00', 24.84, 12.75, 12.09, 'PP', 'mvalois', '2013-05-06 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000053', 'CV00000053', 1, NULL, 52267, '2013-05-05 00:00:00', 24.48, 13.99, 10.49, 'PP', 'vnunez', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000054', 'CV00000054', 2, NULL, 52350, '2013-05-05 00:00:00', 25.13, 12.61, 12.52, 'PP', 'dparraga', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000055', 'CV00000055', 1, NULL, 52390, '2013-05-05 00:00:00', 21.09, 12.67, 8.42, 'PP', 'mvalois', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000056', 'CV00000056', 2, NULL, 52436, '2013-05-05 00:00:00', 25.55, 13.88, 11.67, 'PP', 'mvalois', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000057', 'CV00000057', 1, NULL, 52520, '2013-05-05 00:00:00', 23.30, 12.51, 10.79, 'PP', 'dparraga', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000058', 'CV00000058', 2, NULL, 52564, '2013-05-05 00:00:00', 23.03, 12.72, 10.31, 'PP', 'mvalois', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000059', 'CV00000059', 1, NULL, 52683, '2013-05-05 00:00:00', 24.14, 12.60, 11.54, 'PP', 'coropeza', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000060', 'CV00000060', 2, NULL, 52807, '2013-05-05 00:00:00', 26.67, 13.98, 12.69, 'PP', 'dparraga', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000061', 'CV00000061', 1, NULL, 52851, '2013-05-05 00:00:00', 23.67, 12.68, 10.99, 'PP', 'coropeza', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000062', 'CV00000062', 2, NULL, 52936, '2013-05-05 00:00:00', 23.91, 13.97, 9.94, 'PP', 'coropeza', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000063', 'CV00000063', 1, NULL, 53066, '2013-05-05 00:00:00', 26.98, 14.06, 12.92, 'PP', 'dparraga', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000064', 'CV00000064', 2, NULL, 53107, '2013-05-05 00:00:00', 24.59, 12.64, 11.95, 'PP', 'coropeza', '2013-05-05 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000065', 'CV00000065', 1, NULL, 53149, '2013-05-07 00:00:00', 22.86, 12.72, 10.14, 'PP', 'dparraga', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000066', 'CV00000066', 2, NULL, 53193, '2013-05-07 00:00:00', 23.35, 12.48, 10.87, 'PP', 'mvalois', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000067', 'CV00000067', 1, NULL, 52606, '2013-05-07 00:00:00', 22.28, 12.68, 9.60, 'PP', 'ecardenas', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000068', 'CV00000068', 2, NULL, 52996, '2013-05-07 00:00:00', 25.87, 14.02, 11.85, 'PP', 'mvalois', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000069', 'CV00000069', 1, NULL, 53014, '2013-05-07 00:00:00', 21.49, 12.50, 8.99, 'PP', 'ecardenas', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000070', 'CV00000070', 2, NULL, 52847, '2013-05-07 00:00:00', 23.43, 12.74, 10.69, 'PP', 'mvalois', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000071', 'CV00000071', 1, NULL, 52140, '2013-05-07 00:00:00', 23.71, 12.67, 11.04, 'PP', 'mvalois', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000072', 'CV00000072', 2, NULL, 52311, '2013-05-07 00:00:00', 26.40, 14.01, 12.39, 'PP', 'ecardenas', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000073', 'CV00000073', 1, NULL, 52719, '2013-05-07 00:00:00', 23.08, 12.70, 10.38, 'PP', 'mvalois', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000074', 'CV00000074', 2, NULL, 52762, '2013-05-07 00:00:00', 26.11, 13.99, 12.12, 'PP', 'ecardenas', '2013-05-07 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000075', 'CV00000075', 1, NULL, 52151, '2013-05-08 00:00:00', 23.71, 12.55, 11.16, 'PP', 'ecardenas', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000076', 'CV00000076', 2, NULL, 52603, '2013-05-08 00:00:00', 24.56, 12.59, 11.97, 'PP', 'mvalois', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000077', 'CV00000077', 1, NULL, 52821, '2013-05-08 00:00:00', 23.18, 12.77, 10.41, 'PP', 'ecardenas', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000078', 'CV00000078', 2, NULL, 52934, '2013-05-08 00:00:00', 26.30, 14.07, 12.23, 'PP', 'mvalois', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000079', 'CV00000079', 1, NULL, 53063, '2013-05-08 00:00:00', 24.76, 13.94, 10.82, 'PP', 'ecardenas', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000080', 'CV00000080', 2, NULL, 52066, '2013-05-08 00:00:00', 21.66, 12.57, 9.09, 'PP', 'dparraga', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000081', 'CV00000081', 1, NULL, 52109, '2013-05-08 00:00:00', 23.71, 14.19, 9.52, 'PP', 'coropeza', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000082', 'CV00000082', 2, NULL, 52142, '2013-05-08 00:00:00', 22.34, 12.80, 9.54, 'PP', 'dparraga', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000083', 'CV00000083', 1, NULL, 52235, '2013-05-08 00:00:00', 22.50, 12.60, 9.90, 'PP', 'coropeza', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000084', 'CV00000084', 2, NULL, 52280, '2013-05-08 00:00:00', 19.86, 12.63, 7.23, 'PP', 'coropeza', '2013-05-08 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000085', 'CV00000085', 1, NULL, 52322, '2013-05-09 00:00:00', 20.99, 12.68, 8.31, 'PP', 'dparraga', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000086', 'CV00000086', 2, NULL, 52361, '2013-05-09 00:00:00', 24.25, 14.05, 10.20, 'PP', 'coropeza', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000087', 'CV00000087', 1, NULL, 52402, '2013-05-09 00:00:00', 25.48, 12.76, 12.72, 'PP', 'dparraga', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000088', 'CV00000088', 2, NULL, 52446, '2013-05-09 00:00:00', 23.85, 12.64, 11.21, 'PP', 'ecardenas', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000089', 'CV00000089', 1, NULL, 52492, '2013-05-09 00:00:00', 26.36, 14.08, 12.28, 'PP', 'dparraga', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000090', 'CV00000090', 2, NULL, 52533, '2013-05-09 00:00:00', 23.61, 12.51, 11.10, 'PP', 'mvalois', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000091', 'CV00000091', 1, NULL, 52575, '2013-05-09 00:00:00', 23.34, 12.65, 10.69, 'PP', 'dparraga', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000092', 'CV00000092', 2, NULL, 52618, '2013-05-09 00:00:00', 26.74, 14.05, 12.69, 'PP', 'mvalois', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000093', 'CV00000093', 1, NULL, 52653, '2013-05-09 00:00:00', 24.30, 12.51, 11.79, 'PP', 'ecardenas', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000094', 'CV00000094', 2, NULL, 52693, '2013-05-09 00:00:00', 23.33, 12.72, 10.61, 'PP', 'mvalois', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000095', 'CV00000095', 1, NULL, 52734, '2013-05-09 00:00:00', 24.35, 14.12, 10.23, 'PP', 'dparraga', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000096', 'CV00000096', 2, NULL, 52776, '2013-05-09 00:00:00', 24.80, 12.70, 12.10, 'PP', 'mvalois', '2013-05-09 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000097', 'CV00000097', 1, NULL, 52865, '2013-05-10 00:00:00', 22.19, 12.65, 9.54, 'PP', 'coropeza', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000098', 'CV00000098', 2, NULL, 52910, '2013-05-10 00:00:00', 25.94, 14.08, 11.86, 'PP', 'dparraga', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000099', 'CV00000099', 1, NULL, 52948, '2013-05-10 00:00:00', 23.57, 12.52, 11.05, 'PP', 'dparraga', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000100', 'CV00000100', 2, NULL, 52989, '2013-05-10 00:00:00', 24.59, 14.05, 10.54, 'PP', 'coropeza', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000101', 'CV00000101', 1, NULL, 53033, '2013-05-10 00:00:00', 23.00, 12.66, 10.34, 'PP', 'coropeza', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000102', 'CV00000102', 2, NULL, 53078, '2013-05-10 00:00:00', 23.91, 12.58, 11.33, 'PP', 'coropeza', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000103', 'CV00000103', 1, NULL, 53119, '2013-05-10 00:00:00', 23.61, 12.56, 11.05, 'PP', 'coropeza', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000104', 'CV00000104', 2, NULL, 53162, '2013-05-10 00:00:00', 24.38, 13.99, 10.39, 'PP', 'dparraga', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000105', 'CV00000105', 1, NULL, 53206, '2013-05-10 00:00:00', 22.76, 12.52, 10.24, 'PP', 'ecardenas', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000106', 'CV00000106', 2, NULL, 52062, '2013-05-10 00:00:00', 22.62, 12.63, 9.99, 'PP', 'dparraga', '2013-05-10 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000107', 'CV00000107', 1, NULL, 52108, '2013-05-11 00:00:00', 24.04, 12.70, 11.34, 'PP', 'ecardenas', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000108', 'CV00000108', 2, NULL, 52190, '2013-05-11 00:00:00', 24.26, 14.00, 10.26, 'PP', 'mvalois', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000109', 'CV00000109', 1, NULL, 52321, '2013-05-11 00:00:00', 21.95, 12.60, 9.35, 'PP', 'dparraga', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000110', 'CV00000110', 2, NULL, 52357, '2013-05-11 00:00:00', 25.74, 13.99, 11.75, 'PP', 'ecardenas', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000111', 'CV00000111', 1, NULL, 52401, '2013-05-11 00:00:00', 23.13, 12.69, 10.44, 'PP', 'dparraga', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000112', 'CV00000112', 2, NULL, 52449, '2013-05-11 00:00:00', 23.57, 12.69, 10.88, 'PP', 'ecardenas', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000113', 'CV00000113', 1, NULL, 52532, '2013-05-11 00:00:00', 25.13, 14.08, 11.05, 'PP', 'coropeza', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000114', 'CV00000114', 2, NULL, 52578, '2013-05-11 00:00:00', 23.94, 12.50, 11.44, 'PP', 'dparraga', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000115', 'CV00000115', 1, NULL, 52615, '2013-05-11 00:00:00', 22.75, 12.64, 10.11, 'PP', 'coropeza', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000116', 'CV00000116', 2, NULL, 52682, '2013-05-11 00:00:00', 24.02, 13.98, 10.04, 'PP', 'dparraga', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000117', 'CV00000117', 1, NULL, 52692, '2013-05-11 00:00:00', 23.19, 12.54, 10.65, 'PP', 'coropeza', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000118', 'CV00000118', 2, NULL, 52733, '2013-05-11 00:00:00', 23.43, 12.71, 10.72, 'PP', 'coropeza', '2013-05-11 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000119', 'CV00000119', 1, NULL, 52774, '2013-05-12 00:00:00', 25.27, 14.12, 11.15, 'PP', 'coropeza', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000120', 'CV00000120', 2, NULL, 52819, '2013-05-12 00:00:00', 24.56, 12.72, 11.84, 'PP', 'dparraga', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000121', 'CV00000121', 1, NULL, 52862, '2013-05-12 00:00:00', 23.89, 12.69, 11.20, 'PP', 'ecardenas', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000122', 'CV00000122', 2, NULL, 52907, '2013-05-12 00:00:00', 20.15, 12.49, 7.66, 'PP', 'ecardenas', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000123', 'CV00000123', 1, NULL, 52945, '2013-05-12 00:00:00', 23.28, 12.77, 10.51, 'PP', 'ecardenas', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000124', 'CV00000124', 2, NULL, 53018, '2013-05-12 00:00:00', 22.57, 12.78, 9.79, 'PP', 'ecardenas', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000125', 'CV00000125', 1, NULL, 53030, '2013-05-12 00:00:00', 27.07, 14.14, 12.93, 'PP', 'ecardenas', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000126', 'CV00000126', 2, NULL, 53074, '2013-05-12 00:00:00', 21.74, 12.54, 9.20, 'PP', 'ecardenas', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000127', 'CV00000127', 1, NULL, 53118, '2013-05-12 00:00:00', 20.69, 12.60, 8.09, 'PP', 'ecardenas', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000128', 'CV00000128', 2, NULL, 53158, '2013-05-12 00:00:00', 24.64, 14.10, 10.54, 'PP', 'ecardenas', '2013-05-12 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000129', 'CV00000129', 1, NULL, 53205, '2013-05-13 00:00:00', 23.11, 12.64, 10.47, 'PP', 'ecardenas', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000130', 'CV00000130', 2, NULL, 52061, '2013-05-13 00:00:00', 24.28, 12.45, 11.83, 'PP', 'ecardenas', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000131', 'CV00000131', 1, NULL, 52104, '2013-05-13 00:00:00', 25.42, 12.84, 12.58, 'PP', 'coropeza', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000132', 'CV00000132', 2, NULL, 52150, '2013-05-13 00:00:00', 26.56, 14.10, 12.46, 'PP', 'dparraga', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000133', 'CV00000133', 1, NULL, 52194, '2013-05-13 00:00:00', 22.45, 12.61, 9.84, 'PP', 'coropeza', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000134', 'CV00000134', 2, NULL, 52234, '2013-05-13 00:00:00', 24.20, 13.95, 10.25, 'PP', 'coropeza', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000135', 'CV00000135', 1, NULL, 52279, '2013-05-13 00:00:00', 23.55, 12.40, 11.15, 'PP', 'coropeza', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000136', 'CV00000136', 2, NULL, 52320, '2013-05-13 00:00:00', 24.66, 12.59, 12.07, 'PP', 'dparraga', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000137', 'CV00000137', 1, NULL, 52362, '2013-05-13 00:00:00', 24.76, 12.70, 12.06, 'PP', 'coropeza', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000138', 'CV00000138', 2, NULL, 52403, '2013-05-13 00:00:00', 24.75, 13.96, 10.79, 'PP', 'dparraga', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000139', 'CV00000139', 1, NULL, 52444, '2013-05-13 00:00:00', 23.61, 12.56, 11.05, 'PP', 'ecardenas', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000140', 'CV00000140', 2, NULL, 52475, '2013-05-13 00:00:00', 24.28, 13.93, 10.35, 'PP', 'ecardenas', '2013-05-13 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000141', 'CV00000141', 1, NULL, 52490, '2013-05-14 00:00:00', 23.71, 12.41, 11.30, 'PP', 'dparraga', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000142', 'CV00000142', 2, NULL, 52491, '2013-05-14 00:00:00', 23.72, 12.64, 11.08, 'PP', 'ecardenas', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000143', 'CV00000143', 1, NULL, 52534, '2013-05-14 00:00:00', 24.18, 12.48, 11.70, 'PP', 'ecardenas', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000144', 'CV00000144', 2, NULL, 52583, '2013-05-14 00:00:00', 24.74, 14.02, 10.72, 'PP', 'ecardenas', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000145', 'CV00000145', 1, NULL, 52619, '2013-05-14 00:00:00', 23.44, 12.59, 10.85, 'PP', 'dparraga', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000146', 'CV00000146', 2, NULL, 52657, '2013-05-14 00:00:00', 21.84, 12.49, 9.35, 'PP', 'ecardenas', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000147', 'CV00000147', 1, NULL, 52694, '2013-05-14 00:00:00', 22.73, 12.57, 10.16, 'PP', 'coropeza', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000148', 'CV00000148', 2, NULL, 52737, '2013-05-14 00:00:00', 23.29, 12.78, 10.51, 'PP', 'coropeza', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000149', 'CV00000149', 1, NULL, 52775, '2013-05-14 00:00:00', 27.41, 14.33, 13.08, 'PP', 'coropeza', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000150', 'CV00000150', 2, NULL, 52820, '2013-05-14 00:00:00', 24.81, 12.65, 12.16, 'PP', 'coropeza', '2013-05-14 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000151', 'CV00000151', 1, NULL, 52868, '2013-05-15 00:00:00', 23.53, 12.56, 10.97, 'PP', 'coropeza', '2013-05-15 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000152', 'CV00000152', 2, NULL, 52909, '2013-05-15 00:00:00', 25.73, 13.92, 11.81, 'PP', 'dparraga', '2013-05-15 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000153', 'CV00000153', 1, NULL, 52949, '2013-05-15 00:00:00', 23.80, 12.77, 11.03, 'PP', 'coropeza', '2013-05-15 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000154', 'CV00000154', 2, NULL, 52987, '2013-05-15 00:00:00', 24.60, 14.10, 10.50, 'PP', 'coropeza', '2013-05-15 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000155', 'CV00000155', 1, NULL, 53032, '2013-05-15 00:00:00', 24.35, 12.67, 11.68, 'PP', 'ecardenas', '2013-05-15 00:00:00', NULL, NULL, '', 0x4e554c4c);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000156', 'CV00000156', 2, NULL, 53076, '2013-05-15 00:00:00', 24.62, 12.44, 12.18, 'PP', 'dparraga', '2013-05-15 00:00:00', NULL, NULL, '', 0x4e554c4c);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_seguro`
-- 

DROP TABLE IF EXISTS `t_seguro`;
CREATE TABLE IF NOT EXISTS `t_seguro` (
  `idSeguro` char(5) NOT NULL COMMENT 'Primary key de la tabla Seguro, nos permitirá identificar',
  `nombreSeguro` varchar(45) NOT NULL COMMENT 'Nombre de la empresa de seguro',
  `Descripcion` varchar(45) default NULL COMMENT 'una breve descripción de la empresa',
  `telf` varchar(15) default NULL COMMENT 'Telefono de la empresa aseguradora',
  PRIMARY KEY  (`idSeguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_seguro`
-- 

INSERT INTO `t_seguro` (`idSeguro`, `nombreSeguro`, `Descripcion`, `telf`) VALUES ('SEG01', 'MAPFRE', NULL, NULL);
INSERT INTO `t_seguro` (`idSeguro`, `nombreSeguro`, `Descripcion`, `telf`) VALUES ('SEG02', 'Rimac Seguros', NULL, NULL);
INSERT INTO `t_seguro` (`idSeguro`, `nombreSeguro`, `Descripcion`, `telf`) VALUES ('SEG03', 'Pacifico ', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_seguroxcamion`
-- 

DROP TABLE IF EXISTS `t_seguroxcamion`;
CREATE TABLE IF NOT EXISTS `t_seguroxcamion` (
  `fechaVec` datetime NOT NULL COMMENT 'Fecha de vencimiento del seguro del camion',
  `idSeguro` char(5) NOT NULL COMMENT 'Primary key de la tabla Seguro',
  `cdCamion` char(6) NOT NULL COMMENT 'Primary Key de la Tabla Camion',
  `nroPoliza` int(11) NOT NULL COMMENT 'Nro de la Poliza del Seguro',
  `obs` varchar(50) default NULL COMMENT 'Algún pequeño de detalle u observación sobre el seguro del camión',
  PRIMARY KEY  (`fechaVec`,`idSeguro`,`cdCamion`),
  KEY `fk_T_SeguroXCamion_T_Seguro1_idx` (`idSeguro`),
  KEY `fk_T_SeguroXCamion_T_Camion1_idx` (`cdCamion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_seguroxcamion`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_servicio`
-- 

DROP TABLE IF EXISTS `t_servicio`;
CREATE TABLE IF NOT EXISTS `t_servicio` (
  `cdServicio` char(6) NOT NULL COMMENT 'Codigo Generado: SRV0000001,SRV0000002,....',
  `nombreServ` varchar(100) NOT NULL COMMENT 'Nombre del servicio',
  `descripServ` varchar(300) NOT NULL COMMENT 'Descripción del servicio',
  `nCortoServ` varchar(10) default NULL COMMENT 'Abreviacion del Nombre del servicio',
  PRIMARY KEY  (`cdServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_servicio`
-- 

INSERT INTO `t_servicio` (`cdServicio`, `nombreServ`, `descripServ`, `nCortoServ`) VALUES ('SRV001', 'Servicio de Recoleccion de RSU', 'Servicio de Recolección, Transporte y Disposición Final de Residuos Sólidos', 'SRTRSU');
INSERT INTO `t_servicio` (`cdServicio`, `nombreServ`, `descripServ`, `nCortoServ`) VALUES ('SRV002', 'Disposición Final de RSU', 'Disposición Final', 'DFRSU');
INSERT INTO `t_servicio` (`cdServicio`, `nombreServ`, `descripServ`, `nCortoServ`) VALUES ('SRV003', 'Destrucción de Mercaderias', 'Destrucción de Material', 'DMRSU');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_soat`
-- 

DROP TABLE IF EXISTS `t_soat`;
CREATE TABLE IF NOT EXISTS `t_soat` (
  `idSOAT` int(11) NOT NULL COMMENT 'Primary key de la Tabla Soat',
  `nombreSOAT` varchar(30) NOT NULL COMMENT 'Nombre de la empresa de SOAT',
  `telf` varchar(15) default NULL COMMENT 'Nro de Telefono de la empresa del SOAT',
  PRIMARY KEY  (`idSOAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_soat`
-- 

INSERT INTO `t_soat` (`idSOAT`, `nombreSOAT`, `telf`) VALUES (1, 'Rimac Seguros', NULL);
INSERT INTO `t_soat` (`idSOAT`, `nombreSOAT`, `telf`) VALUES (2, 'MAPFRE', NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_soatxcamion`
-- 

DROP TABLE IF EXISTS `t_soatxcamion`;
CREATE TABLE IF NOT EXISTS `t_soatxcamion` (
  `fechaVecS` datetime NOT NULL COMMENT 'Fecha de Vencimiento del SOAT del camión',
  `idSOAT` int(11) NOT NULL COMMENT 'Primary key de la Tabla SOAT',
  `cdCamion` char(6) NOT NULL COMMENT 'Primary Key de la Tabla Camion',
  `obs` varchar(50) default NULL COMMENT 'Algún detalle o incidente sobre el SOAT del Camión',
  PRIMARY KEY  (`fechaVecS`,`idSOAT`,`cdCamion`),
  KEY `fk_T_SOATxCamion_T_SOAT1_idx` (`idSOAT`),
  KEY `fk_T_SOATxCamion_T_Camion1_idx` (`cdCamion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_soatxcamion`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_tipodoc`
-- 

DROP TABLE IF EXISTS `t_tipodoc`;
CREATE TABLE IF NOT EXISTS `t_tipodoc` (
  `cdTD` varchar(2) NOT NULL,
  `descrip` varchar(100) NOT NULL,
  `nCorto` varchar(6) default NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY  (`cdTD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_tipodoc`
-- 

INSERT INTO `t_tipodoc` (`cdTD`, `descrip`, `nCorto`, `estado`) VALUES ('T1', 'Factura', 'FACT', 1);
INSERT INTO `t_tipodoc` (`cdTD`, `descrip`, `nCorto`, `estado`) VALUES ('T2', 'Cobranza', 'COB', 2);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_tipoliquidacion`
-- 

DROP TABLE IF EXISTS `t_tipoliquidacion`;
CREATE TABLE IF NOT EXISTS `t_tipoliquidacion` (
  `cdTipoLiq` char(4) NOT NULL COMMENT 'Primary Key de la Tabla Tipo de Liquidación',
  `Nombre` varchar(50) NOT NULL COMMENT 'Nombre del Tipo de liquidación',
  PRIMARY KEY  (`cdTipoLiq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_tipoliquidacion`
-- 

INSERT INTO `t_tipoliquidacion` (`cdTipoLiq`, `Nombre`) VALUES ('TL01', 'Mensual');
INSERT INTO `t_tipoliquidacion` (`cdTipoLiq`, `Nombre`) VALUES ('TL02', 'Semanal');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_tipotrabajador`
-- 

DROP TABLE IF EXISTS `t_tipotrabajador`;
CREATE TABLE IF NOT EXISTS `t_tipotrabajador` (
  `cdTipoTrabajador` char(3) NOT NULL COMMENT 'Primary key de la tabla tipo trabajador',
  `Nombre` varchar(50) NOT NULL COMMENT 'Nombre del tipo de trabajador',
  PRIMARY KEY  (`cdTipoTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_tipotrabajador`
-- 

INSERT INTO `t_tipotrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP1', 'Supervisor');
INSERT INTO `t_tipotrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP2', 'Despachador');
INSERT INTO `t_tipotrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP3', 'Contador');
INSERT INTO `t_tipotrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP4', 'Jefe');
INSERT INTO `t_tipotrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP5', 'Chofer');
INSERT INTO `t_tipotrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP6', 'Ayudante');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_trabajador`
-- 

DROP TABLE IF EXISTS `t_trabajador`;
CREATE TABLE IF NOT EXISTS `t_trabajador` (
  `cdTrabajador` char(6) NOT NULL COMMENT 'Primary key de la tabla trabajador',
  `nomUsu` varchar(10) default NULL COMMENT 'nombre de usuario que tiene el trabajador en el sistema',
  `cdTipoTrabajador` char(3) NOT NULL COMMENT 'Primary key de la tabla tipo trabajador, aqui nos permitirá identificar que tipo de trabajador es',
  `cdUbig` char(6) NOT NULL COMMENT 'Primary key de la tabla ubigeo, aqui nos permitira saber en que distrito vive el trabajador',
  `nombres` varchar(45) NOT NULL COMMENT 'Nombres del trabajador',
  `apellidos` varchar(45) NOT NULL COMMENT 'Apellidos del trabajador',
  `DNI` varchar(8) NOT NULL COMMENT 'DNI del trabajador',
  `telefono` varchar(15) default NULL COMMENT 'Telefono del trabajador',
  `celular` varchar(15) default NULL COMMENT 'Celular del trabajador',
  `email` varchar(45) default NULL COMMENT 'Correo electronico del trabajador',
  `estado` tinyint(1) NOT NULL COMMENT 'Determinara si el trabajador sigue o no activo',
  PRIMARY KEY  (`cdTrabajador`),
  KEY `fk_T_Trabajador_T_TipoTrabajador1_idx` (`cdTipoTrabajador`),
  KEY `fk_T_Trabajador_T_Ubigeo1_idx` (`cdUbig`),
  KEY `fk_T_Trabajador_T_Usuario1_idx` (`nomUsu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_trabajador`
-- 

INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0000', NULL, 'TP4', '150140', 'Cesar Augusto', 'Oropeza Sanchez', '47358236', NULL, '989893374', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0001', NULL, 'TP5', '150140', 'Lilian Eugenia', 'Gomez Alvarez', '57736310', NULL, '994587411', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0002', NULL, 'TP5', '150140', 'Beatriz Elena', 'Osorio Laverde', '72323122', NULL, '996323814', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0003', NULL, 'TP5', '150140', 'Gloria', 'Sanclemente', '94578419', NULL, '945784199', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0004', NULL, 'TP5', '150114', 'Carlos Augusto', 'Montoya Serna', '33651713', NULL, '994686157', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0005', NULL, 'TP5', '150133', 'Herman', 'Correa Ramirez', '14268665', NULL, '945478137', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0006', NULL, 'TP5', '150123', 'Gerardo Emilio', 'Duque Gutierrez', '43920843', NULL, '965689134', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0007', NULL, 'TP5', '150118', 'Pablo', 'Osorno Mejia', '94587457', NULL, '945874579', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0008', NULL, 'TP5', '150117', 'Arturo', 'Tabares Mora', '96587323', NULL, '965873231', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0009', NULL, 'TP5', '150136', 'Jaime', 'Lopez Tobon', '98754875', NULL, '987548751', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0010', NULL, 'TP5', '150116', 'Julio Cesar', 'Rodas Monsalve', '38877943', NULL, '995625487', 'cesar20991@hotmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0011', NULL, 'TP5', '150135', 'Gustavo', 'Rodriguez Vallejo', '4431891', NULL, '923654587', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0012', NULL, 'TP5', '150122', 'Maria VIctoria', 'Arias Gomez', '60388222', NULL, '994568788', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0013', NULL, 'TP5', '150140', 'WALTER NOE', 'BALLESTEROS MORALES', '30777053', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0014', NULL, 'TP5', '150122', 'EDWIN EDGARDO', 'BALTODANO SANCHEZ', '52102919', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0015', NULL, 'TP5', '150117', 'MIGUEL ALBERTO', 'GRADOS JAVIER', '75797229', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0016', NULL, 'TP5', '150140', 'RAUL IGNACIO', 'FLORES TORRES', '43155520', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0017', NULL, 'TP5', '150117', 'JOSE ALEJANDRO', 'ESTACIO CERNA', '43155520', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0018', NULL, 'TP5', '150140', 'OMAR', 'DUEÑAS CARDENAS', '43155520', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0019', NULL, 'TP5', '150122', 'JUAN FELIPE', 'DIOSES ALBAN', '56163817', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0020', NULL, 'TP5', '150117', 'JAIME AQUILES', 'MATOS GUTIERREZ', '57593941', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0021', NULL, 'TP5', '150140', 'RAFAEL', 'MIRANDA CRUZ', '39549401', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0022', NULL, 'TP5', '150122', ' RAUL EDGARDO', 'MONTOYA BENITES', '31305107', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0023', NULL, 'TP5', '150122', 'JUAN BENITO', 'POLO ÑIQUE', '48359985', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0024', NULL, 'TP5', '150140', 'JAVIER JESUS', 'RIOS SIFUENTES', '24809967', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0025', NULL, 'TP5', '150122', 'RICHARD ANGEL', 'TORRES QUISPE', '40884249', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0026', NULL, 'TP5', '150117', 'LENY FRANK', 'VIZCARRA DIAZ', '56480292', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0027', NULL, 'TP5', '150122', 'VALENTIN GIORDANO', 'VIZZI BALDEON', '45071014', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0028', NULL, 'TP5', '150140', 'WILFREDO MIGUEL', 'YAÑEZ LAZO', '69763300', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0029', NULL, 'TP5', '150117', 'CHRISTIAN', 'ZAPATA QUINTANA', '43931490', NULL, NULL, NULL, 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0030', NULL, 'TP5', '150140', 'JORGE LUIS', 'LIVIA MORAN', '56650735', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_trabajadorxcamion`
-- 

DROP TABLE IF EXISTS `t_trabajadorxcamion`;
CREATE TABLE IF NOT EXISTS `t_trabajadorxcamion` (
  `cdAsigCamion` char(10) NOT NULL COMMENT 'Codigo Generado: ATC0000001,ATC0000002,ATC0000003',
  `cdCamion` char(6) NOT NULL COMMENT 'Primary key de la tabla camion, aqui nos permitira saber a que camion estaran asignados los trabajadores',
  `cdTrabajador` char(6) NOT NULL COMMENT 'Primary key de la tabla trabajador, aqui nos permitira saber que trabajador es asignado',
  `cdTurno` char(4) NOT NULL COMMENT 'Primary key de la tabla turno, aqui nos permitira saber en que turno deben estar los trabajadores y el camion',
  `fechaAsig` datetime NOT NULL COMMENT 'Fecha en la que se ha asignado',
  `estado` tinyint(1) NOT NULL COMMENT 'Estado que determinara si está asignacion seguira o no vigente.',
  `observacion` varchar(200) default NULL COMMENT 'Alguna observación de esta asignación',
  PRIMARY KEY  (`cdAsigCamion`),
  KEY `fk_T_TrabajadorXCamion_T_Camion1_idx` (`cdCamion`),
  KEY `fk_T_TrabajadorXCamion_T_Trabajador1_idx` (`cdTrabajador`),
  KEY `fk_T_TrabajadorXCamion_T_Turno1_idx` (`cdTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_trabajadorxcamion`
-- 

INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000001', 'CA0004', 'TR0008', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000002', 'CA0005', 'TR0009', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000003', 'CA0003', 'TR0011', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000004', 'CA0002', 'TR0012', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000005', 'CA0008', 'TR0004', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000006', 'CA0009', 'TR0005', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000007', 'CA0010', 'TR0012', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000008', 'CA0011', 'TR0013', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000009', 'CA0012', 'TR0014', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000010', 'CA0013', 'TR0015', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000011', 'CA0014', 'TR0016', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000012', 'CA0015', 'TR0017', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000013', 'CA0016', 'TR0018', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000014', 'CA0017', 'TR0019', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000015', 'CA0018', 'TR0020', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000016', 'CA0019', 'TR0021', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000017', 'CA0020', 'TR0022', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000018', 'CA0021', 'TR0023', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000019', 'CA0022', 'TR0024', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000020', 'CA0023', 'TR0025', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000021', 'CA0024', 'TR0026', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000022', 'CA0025', 'TR0027', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000023', 'CA0026', 'TR0028', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000024', 'CA0027', 'TR0029', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000025', 'CA0028', 'TR0030', 'TN02', '2013-05-01 01:38:54', 1, '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_turno`
-- 

DROP TABLE IF EXISTS `t_turno`;
CREATE TABLE IF NOT EXISTS `t_turno` (
  `cdTurno` char(4) NOT NULL COMMENT 'Primary key de la tabla Turno',
  `nombTurno` varchar(20) NOT NULL COMMENT 'Nombre del Turno de trabajo',
  `Obs` varchar(100) default NULL COMMENT 'Alguna observación acerca del turno',
  PRIMARY KEY  (`cdTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_turno`
-- 

INSERT INTO `t_turno` (`cdTurno`, `nombTurno`, `Obs`) VALUES ('TN01', 'Mañana', '8:00 am - 8:00pm');
INSERT INTO `t_turno` (`cdTurno`, `nombTurno`, `Obs`) VALUES ('TN02', 'Noche', '8:00 pm - 8:00am');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_ubigeo`
-- 

DROP TABLE IF EXISTS `t_ubigeo`;
CREATE TABLE IF NOT EXISTS `t_ubigeo` (
  `cdUbig` char(6) NOT NULL COMMENT 'Primary key de la tabla Ubigeo',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre de la ubicación geográfica',
  `estado` tinyint(1) NOT NULL COMMENT 'Estado si esta o no habilitado',
  PRIMARY KEY  (`cdUbig`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_ubigeo`
-- 

INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150101', 'LIMA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150102', 'ANCON', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150103', 'ATE', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150104', 'BARRANCO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150105', 'BREÑA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150106', 'CARABAYLLO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150107', 'CHACLACAYO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150108', 'CHORRILLOS', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150109', 'CIENEGUILLA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150110', 'COMAS', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150111', 'EL AGUSTINO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150112', 'INDEPENDENCIA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150113', 'JESUS MARIA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150114', 'LA MOLINA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150115', 'LA VICTORIA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150116', 'LINCE', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150117', 'LOS OLIVOS', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150118', 'LURIGANCHO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150119', 'LURIN', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150120', 'MAGDALENA DEL MAR', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150121', 'PUEBLO LIBRE', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150122', 'MIRAFLORES', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150123', 'PACHACAMAC', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150124', 'PUCUSANA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150125', 'PUENTE PIEDRA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150126', 'PUNTA HERMOSA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150127', 'PUNTA NEGRA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150128', 'RIMAC', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150129', 'SAN BARTOLO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150130', 'SAN BORJA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150131', 'SAN ISIDRO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150132', 'SAN JUAN DE LURIGANCHO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150133', 'SAN JUAN DE MIRAFLORES', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150134', 'SAN LUIS', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150135', 'SAN MARTIN DE PORRES', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150136', 'SAN MIGUEL', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150137', 'SANTA ANITA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150138', 'SANTA MARIA DEL MAR', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150139', 'SANTA ROSA', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150140', 'SANTIAGO DE SURCO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150141', 'SURQUILLO', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150142', 'VILLA EL SALVADOR', 1);
INSERT INTO `t_ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150143', 'VILLA MARIA DEL TRIUNFO', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_usuario`
-- 

DROP TABLE IF EXISTS `t_usuario`;
CREATE TABLE IF NOT EXISTS `t_usuario` (
  `nomUsu` varchar(10) NOT NULL COMMENT 'primer nombre seguido del apellido, EJM: coropeza',
  `cdPerfil` varchar(4) NOT NULL COMMENT 'Primary key de la tabla perfil',
  `pass` varchar(10) NOT NULL COMMENT 'Contraseña del usuario',
  `estado` tinyint(1) NOT NULL COMMENT 'estado si esta o no habilitado',
  PRIMARY KEY  (`nomUsu`),
  KEY `fk_T_Usuario_T_Perfil1_idx` (`cdPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_usuario`
-- 

INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('aperez', 'PF05', '12345', 1);
INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('cmiranda', 'PF05', '12345', 1);
INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('coropeza', 'PF01', '12345', 1);
INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('dparraga', 'PF01', '12345', 1);
INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('ecardenas', 'PF01', '12345', 1);
INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('mrobles', 'PF01', '12345', 1);
INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('mvalois', 'PF01', '12345', 1);
INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('rcisneros', 'PF01', '12345', 1);
INSERT INTO `t_usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('vnunez', 'PF01', '12345', 1);

-- 
-- Filtros para las tablas descargadas (dump)
-- 

-- 
-- Filtros para la tabla `t_accesoe`
-- 
ALTER TABLE `t_accesoe`
  ADD CONSTRAINT `fk_T_AccesoE_T_Empresa1` FOREIGN KEY (`cdRuc`) REFERENCES `t_empresa` (`cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_AccesoE_T_GrupoAcceso1` FOREIGN KEY (`cdGA`) REFERENCES `t_grupoacceso` (`cdGA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_AccesoE_T_Perfil1` FOREIGN KEY (`cdPerfil`) REFERENCES `t_perfil` (`cdPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_accesom`
-- 
ALTER TABLE `t_accesom`
  ADD CONSTRAINT `fk_T_AccesoM_T_GrupoAcceso1` FOREIGN KEY (`cdGA`) REFERENCES `t_grupoacceso` (`cdGA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_AccesoM_T_Menu1` FOREIGN KEY (`cdMenu`) REFERENCES `t_menu` (`cdMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_asignarruta`
-- 
ALTER TABLE `t_asignarruta`
  ADD CONSTRAINT `fk_T_AsignarRuta_T_DespachoDet1` FOREIGN KEY (`Nro`, `cdDespacho`, `cdRuc`) REFERENCES `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_asistencia`
-- 
ALTER TABLE `t_asistencia`
  ADD CONSTRAINT `fk_T_Asistencia_T_Turno1` FOREIGN KEY (`cdTurno`) REFERENCES `t_turno` (`cdTurno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_asistenciaxtrabajador`
-- 
ALTER TABLE `t_asistenciaxtrabajador`
  ADD CONSTRAINT `fk_AsistenciaXTrabajador_T_Asistencia1` FOREIGN KEY (`cdAsistencia`) REFERENCES `t_asistencia` (`cdAsistencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AsistenciaXTrabajador_T_Trabajador1` FOREIGN KEY (`cdTrabajador`) REFERENCES `t_trabajador` (`cdTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_camion`
-- 
ALTER TABLE `t_camion`
  ADD CONSTRAINT `fk_T_Camion_T_Clase1` FOREIGN KEY (`idClase`) REFERENCES `t_clase` (`idClase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Camion_T_Marca1` FOREIGN KEY (`idMarca`) REFERENCES `t_marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_cliente`
-- 
ALTER TABLE `t_cliente`
  ADD CONSTRAINT `fk_T_Cliente_T_Empresa1` FOREIGN KEY (`cdRuc`) REFERENCES `t_empresa` (`cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Cliente_T_Ubigeo1` FOREIGN KEY (`cdUbig`) REFERENCES `t_ubigeo` (`cdUbig`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Cliente_T_Usuario1` FOREIGN KEY (`nomUsu`) REFERENCES `t_usuario` (`nomUsu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_comprobante`
-- 
ALTER TABLE `t_comprobante`
  ADD CONSTRAINT `fk_T_Comprobante_T_Liquidacion1` FOREIGN KEY (`cdLiq`) REFERENCES `t_liquidacion` (`cdLiq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Comprobante_T_TipoDoc1` FOREIGN KEY (`cdTD`) REFERENCES `t_tipodoc` (`cdTD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Factura_T_Moneda1` FOREIGN KEY (`cdMda`) REFERENCES `t_moneda` (`cdMda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_comprobantedet`
-- 
ALTER TABLE `t_comprobantedet`
  ADD CONSTRAINT `fk_T_ComprobanteDet_T_Comprobante1` FOREIGN KEY (`idComprobante`) REFERENCES `t_comprobante` (`idComprobante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_FacturaDet_T_Servicio1` FOREIGN KEY (`cdServicio`) REFERENCES `t_servicio` (`cdServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_controlviaje`
-- 
ALTER TABLE `t_controlviaje`
  ADD CONSTRAINT `fk_T_ControlViaje_T_DespachoDet1` FOREIGN KEY (`Nro`, `cdDespacho`, `cdRuc`) REFERENCES `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_despacho`
-- 
ALTER TABLE `t_despacho`
  ADD CONSTRAINT `fk_T_Despacho_T_Empresa1` FOREIGN KEY (`cdRuc`) REFERENCES `t_empresa` (`cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Despacho_T_Turno1` FOREIGN KEY (`cdTurno`) REFERENCES `t_turno` (`cdTurno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Despacho_T_Ubigeo1` FOREIGN KEY (`cdUbig`) REFERENCES `t_ubigeo` (`cdUbig`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_despachodet`
-- 
ALTER TABLE `t_despachodet`
  ADD CONSTRAINT `fk_T_DespachoDet_T_Despacho1` FOREIGN KEY (`cdDespacho`, `cdRuc`) REFERENCES `t_despacho` (`cdDespacho`, `cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_DespachoDet_T_TrabajadorXCamion1` FOREIGN KEY (`cdAsigCamion`) REFERENCES `t_trabajadorxcamion` (`cdAsigCamion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_empresa`
-- 
ALTER TABLE `t_empresa`
  ADD CONSTRAINT `fk_T_Empresa_T_Ubigeo1` FOREIGN KEY (`cdUbig`) REFERENCES `t_ubigeo` (`cdUbig`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_estadoxliquidacion`
-- 
ALTER TABLE `t_estadoxliquidacion`
  ADD CONSTRAINT `fk_T_EstadoxLiquidacion_T_EstadoLiq1` FOREIGN KEY (`cdEstadoLiq`) REFERENCES `t_estadoliq` (`cdEstadoLiq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_EstadoxLiquidacion_T_Liquidacion1` FOREIGN KEY (`cdLiq`) REFERENCES `t_liquidacion` (`cdLiq`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_incidencia`
-- 
ALTER TABLE `t_incidencia`
  ADD CONSTRAINT `fk_T_Incidencia_T_ControlViaje1` FOREIGN KEY (`cdControlViaje`, `nroViaje`) REFERENCES `t_controlviaje` (`cdControlViaje`, `nroViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_liquidacion`
-- 
ALTER TABLE `t_liquidacion`
  ADD CONSTRAINT `fk_T_Liquidacion_T_Empresa1` FOREIGN KEY (`cdRuc`) REFERENCES `t_empresa` (`cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Liquidacion_T_TipoLiquidacion1` FOREIGN KEY (`cdTipoLiq`) REFERENCES `t_tipoliquidacion` (`cdTipoLiq`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_pesaje`
-- 
ALTER TABLE `t_pesaje`
  ADD CONSTRAINT `fk_T_Pesaje_T_ControlViaje1` FOREIGN KEY (`cdControlViaje`, `nroViaje`) REFERENCES `t_controlviaje` (`cdControlViaje`, `nroViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Pesaje_T_Liquidacion1` FOREIGN KEY (`cdLiq`) REFERENCES `t_liquidacion` (`cdLiq`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_seguroxcamion`
-- 
ALTER TABLE `t_seguroxcamion`
  ADD CONSTRAINT `fk_T_SeguroXCamion_T_Camion1` FOREIGN KEY (`cdCamion`) REFERENCES `t_camion` (`cdCamion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_SeguroXCamion_T_Seguro1` FOREIGN KEY (`idSeguro`) REFERENCES `t_seguro` (`idSeguro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_soatxcamion`
-- 
ALTER TABLE `t_soatxcamion`
  ADD CONSTRAINT `fk_T_SOATxCamion_T_Camion1` FOREIGN KEY (`cdCamion`) REFERENCES `t_camion` (`cdCamion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_SOATxCamion_T_SOAT1` FOREIGN KEY (`idSOAT`) REFERENCES `t_soat` (`idSOAT`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_trabajador`
-- 
ALTER TABLE `t_trabajador`
  ADD CONSTRAINT `fk_T_Trabajador_T_TipoTrabajador1` FOREIGN KEY (`cdTipoTrabajador`) REFERENCES `t_tipotrabajador` (`cdTipoTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Trabajador_T_Ubigeo1` FOREIGN KEY (`cdUbig`) REFERENCES `t_ubigeo` (`cdUbig`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Trabajador_T_Usuario1` FOREIGN KEY (`nomUsu`) REFERENCES `t_usuario` (`nomUsu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_trabajadorxcamion`
-- 
ALTER TABLE `t_trabajadorxcamion`
  ADD CONSTRAINT `fk_T_TrabajadorXCamion_T_Camion1` FOREIGN KEY (`cdCamion`) REFERENCES `t_camion` (`cdCamion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_TrabajadorXCamion_T_Trabajador1` FOREIGN KEY (`cdTrabajador`) REFERENCES `t_trabajador` (`cdTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_TrabajadorXCamion_T_Turno1` FOREIGN KEY (`cdTurno`) REFERENCES `t_turno` (`cdTurno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_usuario`
-- 
ALTER TABLE `t_usuario`
  ADD CONSTRAINT `fk_T_Usuario_T_Perfil1` FOREIGN KEY (`cdPerfil`) REFERENCES `t_perfil` (`cdPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
