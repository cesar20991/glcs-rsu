-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 03-06-2013 a las 02:26:42
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
  `idAe` int(11) NOT NULL,
  `cdPerfil` varchar(4) NOT NULL,
  `cdGA` int(11) NOT NULL,
  `cdRuc` char(6) NOT NULL,
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
  `idAm` int(11) NOT NULL,
  `cdGA` int(11) NOT NULL,
  `cdMenu` varchar(6) NOT NULL,
  `estado` tinyint(1) NOT NULL,
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
  `CdRuta` char(10) NOT NULL,
  `Nro` int(11) NOT NULL,
  `cdDespacho` char(10) NOT NULL,
  `cdRuc` char(6) NOT NULL,
  `LATN` double default NULL,
  `LNGN` double default NULL,
  `LATS` double default NULL,
  `LNGS` double default NULL,
  `nroV` int(11) NOT NULL,
  `obs` varchar(100) default NULL,
  PRIMARY KEY  (`CdRuta`),
  KEY `fk_T_AsignarRuta_T_DespachoDet1_idx` (`Nro`,`cdDespacho`,`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_asignarruta`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_asistencia`
-- 

DROP TABLE IF EXISTS `t_asistencia`;
CREATE TABLE IF NOT EXISTS `t_asistencia` (
  `cdAsistencia` char(5) NOT NULL,
  `cdTurno` char(4) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuCrea` varchar(10) NOT NULL,
  `fechaReg` datetime NOT NULL,
  `usuModf` varchar(10) default NULL,
  `fechModf` datetime default NULL,
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
  `cdTrabajador` char(6) NOT NULL,
  `cdAsistencia` char(5) NOT NULL,
  `Asiste` tinyint(1) default NULL,
  `Tardanza` tinyint(1) default NULL,
  `Fustifica` tinyint(1) default NULL,
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
  `cdCamion` char(6) NOT NULL,
  `idClase` int(11) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `unidad` int(11) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `anioFab` char(4) NOT NULL,
  `anioAdq` char(4) NOT NULL,
  `nroMotor` varchar(40) NOT NULL,
  `pesoBruto` decimal(5,4) NOT NULL,
  `tipoCombustible` varchar(20) NOT NULL,
  `kilometraje` decimal(13,4) NOT NULL,
  `imagen` mediumblob,
  `estado` tinyint(1) NOT NULL,
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
  `idClase` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Descripcion` varchar(45) default NULL,
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
  `cdRuc` char(6) NOT NULL,
  `nomUsu` varchar(10) NOT NULL,
  `cdUbig` char(6) NOT NULL,
  `nombreComp` varchar(45) NOT NULL,
  `tipoDocI` char(1) NOT NULL,
  `nroDocI` varchar(15) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `telefono` varchar(15) default NULL,
  `celular` varchar(15) default NULL,
  `email` varchar(45) default NULL,
  `estado` tinyint(1) NOT NULL,
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
  `idComprobante` char(10) NOT NULL,
  `cdLiq` char(10) NOT NULL,
  `cdMda` varchar(2) NOT NULL,
  `cdTD` varchar(2) NOT NULL,
  `fecMov` datetime NOT NULL,
  `serie` varchar(4) NOT NULL,
  `nroDoc` varchar(15) NOT NULL,
  `total` decimal(7,2) NOT NULL,
  `subTotal` decimal(7,2) NOT NULL,
  `IGV` decimal(7,2) NOT NULL,
  `usuCrea` varchar(10) NOT NULL,
  `fechaReg` datetime NOT NULL,
  `usuModf` varchar(10) default NULL,
  `fechaModf` datetime default NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY  (`idComprobante`),
  KEY `fk_T_Factura_T_Moneda1_idx` (`cdMda`),
  KEY `fk_T_Comprobante_T_Liquidacion1_idx` (`cdLiq`),
  KEY `fk_T_Comprobante_T_TipoDoc1_idx` (`cdTD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_comprobante`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_comprobantedet`
-- 

DROP TABLE IF EXISTS `t_comprobantedet`;
CREATE TABLE IF NOT EXISTS `t_comprobantedet` (
  `item` varchar(45) NOT NULL,
  `cdServicio` char(6) NOT NULL,
  `idComprobante` char(10) NOT NULL,
  `precioUnit` decimal(7,2) NOT NULL,
  `IGV` decimal(7,2) NOT NULL,
  `total` decimal(7,2) NOT NULL,
  PRIMARY KEY  (`item`),
  KEY `fk_T_FacturaDet_T_Servicio1_idx` (`cdServicio`),
  KEY `fk_T_ComprobanteDet_T_Comprobante1_idx` (`idComprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_comprobantedet`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_controlviaje`
-- 

DROP TABLE IF EXISTS `t_controlviaje`;
CREATE TABLE IF NOT EXISTS `t_controlviaje` (
  `cdControlViaje` char(10) NOT NULL,
  `nroViaje` int(11) NOT NULL,
  `Nro` int(11) NOT NULL,
  `cdDespacho` char(10) NOT NULL,
  `cdRuc` char(6) NOT NULL,
  `fechaEmi` datetime NOT NULL,
  `horaEstimada` char(5) NOT NULL,
  `horaReal` char(5) NOT NULL,
  `Obs` varchar(300) default NULL,
  PRIMARY KEY  (`cdControlViaje`,`nroViaje`),
  KEY `fk_T_ControlViaje_T_DespachoDet1_idx` (`Nro`,`cdDespacho`,`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_controlviaje`
-- 

INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000001', 1, 1, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '03:00', '02:00', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000002', 2, 1, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '03:00', '02:00', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000003', 1, 2, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '02:00', '02:00', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000004', 2, 2, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '02:00', '02:00', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000005', 1, 3, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '01:30', '01:30', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000006', 2, 3, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '01:30', '01:30', 'En mi segundo viaje el Motor tiene problemas');
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000007', 1, 4, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '02:00', '02:00', NULL);
INSERT INTO `t_controlviaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000008', 2, 4, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '02:00', '02:00', 'revisar frenos antes de fin de mes...');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_despacho`
-- 

DROP TABLE IF EXISTS `t_despacho`;
CREATE TABLE IF NOT EXISTS `t_despacho` (
  `cdDespacho` char(10) NOT NULL,
  `cdRuc` char(6) NOT NULL,
  `cdUbig` char(6) NOT NULL,
  `cdTurno` char(4) NOT NULL,
  `nroDespacho` char(10) NOT NULL,
  `fechaEmi` datetime NOT NULL,
  `zona` varchar(50) NOT NULL,
  `dineroEnviado` decimal(13,4) default NULL,
  `totalDineroUso` decimal(13,4) default NULL,
  `totalDineroSinUso` decimal(13,4) default NULL,
  `usuCrea` varchar(10) NOT NULL,
  `fechaReg` datetime NOT NULL,
  `usuModf` varchar(10) default NULL,
  `fechaModf` datetime default NULL,
  `evaluacion` char(1) default NULL,
  `obs` varchar(200) default NULL,
  PRIMARY KEY  (`cdDespacho`,`cdRuc`),
  KEY `fk_T_Despacho_T_Ubigeo1_idx` (`cdUbig`),
  KEY `fk_T_Despacho_T_Turno1_idx` (`cdTurno`),
  KEY `fk_T_Despacho_T_Empresa1_idx` (`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_despacho`
-- 

INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000001', 'RC0001', '150115', 'TN02', 'NDP0000001', '2013-01-01 01:38:54', 'zona de gamarra', NULL, NULL, NULL, 'coropeza', '2013-01-01 01:41:24', NULL, NULL, NULL, NULL);
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000002', 'RC0001', '150115', 'TN02', 'NDP0000002', '2013-01-02 01:38:54', 'zona aviacion', NULL, NULL, NULL, 'coropeza', '2013-01-02 01:41:24', NULL, NULL, NULL, NULL);
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000003', 'RC0001', '150115', 'TN02', 'NDP0000003', '2013-01-03 01:38:54', 'zona B', NULL, NULL, NULL, 'coropeza', '2013-01-03 01:41:24', NULL, NULL, NULL, NULL);
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000004', 'RC0001', '150115', 'TN02', 'NDP0000004', '2013-01-04 01:38:54', 'zona J', 400.0000, NULL, NULL, 'coropeza', '2013-01-04 01:41:24', NULL, NULL, NULL, NULL);
INSERT INTO `t_despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000005', 'RC0001', '150115', 'TN02', 'NDP0000005', '2013-01-05 01:38:54', 'zona Q', 390.0000, NULL, NULL, 'coropeza', '2013-01-05 01:41:24', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_despachodet`
-- 

DROP TABLE IF EXISTS `t_despachodet`;
CREATE TABLE IF NOT EXISTS `t_despachodet` (
  `Nro` int(11) NOT NULL COMMENT 'Generar numero: 1,2,3... De acuerdo al cdDespacho y cdRuc (poder Diferenciar)',
  `cdDespacho` char(10) NOT NULL,
  `cdRuc` char(6) NOT NULL,
  `cdAsigCamion` char(10) NOT NULL,
  `cantViaje` int(11) NOT NULL,
  `evaluacion` char(1) default NULL COMMENT 'B: Bien         	M: Mal',
  PRIMARY KEY  (`Nro`,`cdDespacho`,`cdRuc`),
  KEY `fk_T_DespachoDet_T_TrabajadorXCamion1_idx` (`cdAsigCamion`),
  KEY `fk_T_DespachoDet_T_Despacho1_idx` (`cdDespacho`,`cdRuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_despachodet`
-- 

INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (1, 'DP00000001', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (1, 'DP00000002', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (2, 'DP00000001', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (2, 'DP00000002', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (3, 'DP00000001', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (3, 'DP00000002', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (4, 'DP00000001', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (4, 'DP00000002', 'RC0001', 'ATC0000004', 2, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_empresa`
-- 

DROP TABLE IF EXISTS `t_empresa`;
CREATE TABLE IF NOT EXISTS `t_empresa` (
  `cdRuc` char(6) NOT NULL COMMENT 'Codigo Generado: RC0001,RC0002,...',
  `cdUbig` char(6) NOT NULL,
  `rucE` char(11) NOT NULL,
  `rSocial` varchar(150) NOT NULL,
  `fechaIni` datetime NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telef` varchar(15) NOT NULL,
  `logo` blob,
  PRIMARY KEY  (`cdRuc`),
  KEY `fk_T_Empresa_T_Ubigeo1_idx` (`cdUbig`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_empresa`
-- 

INSERT INTO `t_empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0001', '150134', '20131378115', 'MUNICIPALIDAD DISTRITAL DE SAN LUIS', '0000-00-00 00:00:00', 'Av. del Aire  Nro. 1540 URB. Villa Jardin', '365027', NULL);
INSERT INTO `t_empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0002', '150115', '20131368071', 'MUNICIPALIDAD DISTRITAL DE LA VICTORIA', '0000-00-00 00:00:00', 'AV. IQUITOS NRO. 500', '315766', NULL);
INSERT INTO `t_empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0003', '150103', '20131378620', 'MUNICIPALIDAD DISTRITAL DE ATE', '0000-00-00 00:00:00', 'CAR. CARRETERA CENTRAL KM 7.5', '4941428', NULL);
INSERT INTO `t_empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0004', '150130', '20131373741', 'MUNICIPALIDAD DE SAN BORJA', '0000-00-00 00:00:00', 'AV. AVENIDA JOAQUIN MADRID NRO.200', '6125555', NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_estadoliq`
-- 

DROP TABLE IF EXISTS `t_estadoliq`;
CREATE TABLE IF NOT EXISTS `t_estadoliq` (
  `cdEstadoLiq` char(3) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY  (`cdEstadoLiq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_estadoliq`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_estadoxliquidacion`
-- 

DROP TABLE IF EXISTS `t_estadoxliquidacion`;
CREATE TABLE IF NOT EXISTS `t_estadoxliquidacion` (
  `fechaEstado` datetime NOT NULL,
  `cdEstadoLiq` char(3) NOT NULL,
  `cdLiq` char(10) NOT NULL,
  `Obs` varchar(100) default NULL,
  PRIMARY KEY  (`fechaEstado`,`cdEstadoLiq`,`cdLiq`),
  KEY `fk_T_EstadoxLiquidacion_T_EstadoLiq1_idx` (`cdEstadoLiq`),
  KEY `fk_T_EstadoxLiquidacion_T_Liquidacion1_idx` (`cdLiq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_estadoxliquidacion`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_grupoacceso`
-- 

DROP TABLE IF EXISTS `t_grupoacceso`;
CREATE TABLE IF NOT EXISTS `t_grupoacceso` (
  `cdGA` int(11) NOT NULL,
  `descrip` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
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
  `cdInc` char(10) NOT NULL,
  `cdControlViaje` char(10) NOT NULL,
  `nroViaje` int(11) NOT NULL,
  `fechaInc` datetime NOT NULL,
  `zona` varchar(100) NOT NULL,
  `problema` varchar(45) NOT NULL,
  `horaProb` char(5) NOT NULL,
  `observaciones` varchar(200) default NULL,
  `soluc` varchar(200) default NULL,
  PRIMARY KEY  (`cdInc`),
  KEY `fk_T_Incidencia_T_ControlViaje1_idx` (`cdControlViaje`,`nroViaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_incidencia`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_liquidacion`
-- 

DROP TABLE IF EXISTS `t_liquidacion`;
CREATE TABLE IF NOT EXISTS `t_liquidacion` (
  `cdLiq` char(10) NOT NULL,
  `cdRuc` char(6) NOT NULL,
  `cdTipoLiq` char(4) NOT NULL,
  `fechaApertura` datetime NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `totalTN` decimal(7,4) default NULL,
  `asunto` varchar(100) default NULL,
  `usuCrea` varchar(10) NOT NULL,
  `fechaReg` datetime NOT NULL,
  `usuModf` varchar(10) default NULL,
  `fechaModf` datetime default NULL,
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
  `idMarca` int(11) NOT NULL,
  `nombreMarca` varchar(40) NOT NULL,
  `descripcion` varchar(45) default NULL,
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
  `cdMenu` varchar(6) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
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
  `cdMda` varchar(2) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `simbolo` varchar(4) NOT NULL,
  `estado` tinyint(1) NOT NULL,
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
  `cdPerfil` varchar(4) NOT NULL,
  `nombrePrf` varchar(30) NOT NULL,
  `descripPrf` varchar(200) default NULL,
  `estado` tinyint(1) NOT NULL,
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
  `cdPesaje` char(10) NOT NULL COMMENT 'codigo generado: PS00000001,PS00000002,...',
  `cdControlViaje` char(10) NOT NULL,
  `nroViaje` int(11) NOT NULL,
  `cdLiq` char(10) default NULL,
  `nroPesaje` int(11) NOT NULL,
  `fechaPesaje` datetime NOT NULL,
  `pesoBruto` decimal(5,4) NOT NULL,
  `tara` decimal(5,4) NOT NULL,
  `pesoTN` decimal(5,4) NOT NULL,
  `estadoPesaje` char(1) NOT NULL COMMENT 'P: Pendiente , L:Liquidado, ',
  `usuCrea` varchar(10) NOT NULL,
  `fechaReg` datetime NOT NULL,
  `usuModf` varchar(10) default NULL,
  `fechaModf` datetime default NULL,
  `Obs` varchar(100) default NULL,
  `imagenP` mediumblob,
  PRIMARY KEY  (`cdPesaje`),
  KEY `fk_T_Pesaje_T_Liquidacion1_idx` (`cdLiq`),
  KEY `fk_T_Pesaje_T_ControlViaje1_idx` (`cdControlViaje`,`nroViaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_pesaje`
-- 

INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000001', 'CV00000001', 1, NULL, 521747, '2013-01-01 00:00:00', 9.9999, 9.9999, 6.5500, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000002', 'CV00000002', 2, NULL, 521810, '2013-01-01 00:00:00', 9.9999, 9.9999, 8.4200, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000003', 'CV00000003', 1, NULL, 522063, '2013-01-01 00:00:00', 9.9999, 9.9999, 9.9999, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000004', 'CV00000004', 2, NULL, 522080, '2013-01-01 00:00:00', 9.9999, 9.9999, 9.9999, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000005', 'CV00000005', 1, NULL, 522082, '2013-01-01 00:00:00', 9.9999, 9.9999, 9.9999, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000006', 'CV00000006', 2, NULL, 522098, '2013-01-01 00:00:00', 9.9999, 9.9999, 9.9999, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000007', 'CV00000007', 1, NULL, 522196, '2013-01-01 00:00:00', 9.9999, 9.9999, 9.9999, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000008', 'CV00000008', 2, NULL, 522320, '2013-01-01 00:00:00', 9.9999, 9.9999, 9.9999, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_seguro`
-- 

DROP TABLE IF EXISTS `t_seguro`;
CREATE TABLE IF NOT EXISTS `t_seguro` (
  `idSeguro` char(5) NOT NULL,
  `nombreSeguro` varchar(45) NOT NULL,
  `Descripcion` varchar(45) default NULL,
  `telf` varchar(15) default NULL,
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
  `fechaVec` datetime NOT NULL,
  `idSeguro` char(5) NOT NULL,
  `cdCamion` char(6) NOT NULL,
  `nroPoliza` int(11) NOT NULL,
  `obs` varchar(50) default NULL,
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
  `nombreServ` varchar(100) NOT NULL,
  `descripServ` varchar(300) NOT NULL,
  `nCortoServ` varchar(10) default NULL,
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
  `idSOAT` int(11) NOT NULL,
  `nombreSOAT` varchar(30) NOT NULL,
  `telf` varchar(15) default NULL,
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
  `fechaVecS` datetime NOT NULL,
  `idSOAT` int(11) NOT NULL,
  `cdCamion` char(6) NOT NULL,
  `obs` varchar(50) default NULL,
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


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_tipoliquidacion`
-- 

DROP TABLE IF EXISTS `t_tipoliquidacion`;
CREATE TABLE IF NOT EXISTS `t_tipoliquidacion` (
  `cdTipoLiq` char(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
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
  `cdTipoTrabajador` char(3) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
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
  `cdTrabajador` char(6) NOT NULL,
  `nomUsu` varchar(10) default NULL,
  `cdTipoTrabajador` char(3) NOT NULL,
  `cdUbig` char(6) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `telefono` varchar(15) default NULL,
  `celular` varchar(15) default NULL,
  `email` varchar(45) default NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY  (`cdTrabajador`),
  KEY `fk_T_Trabajador_T_TipoTrabajador1_idx` (`cdTipoTrabajador`),
  KEY `fk_T_Trabajador_T_Ubigeo1_idx` (`cdUbig`),
  KEY `fk_T_Trabajador_T_Usuario1_idx` (`nomUsu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_trabajador`
-- 

INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0001', NULL, 'TP1', '150140', 'Lilian Eugenia', 'Gomez Alvarez', '57736310', NULL, '994587411', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0002', NULL, 'TP1', '150140', 'Beatriz Elena', 'Osorio Laverde', '72323122', NULL, '996323814', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0003', NULL, 'TP1', '150140', 'Gloria', 'Sanclemente', '94578419', NULL, '945784199', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0004', NULL, 'TP2', '150114', 'Carlos Augusto', 'Montoya Serna', '33651713', NULL, '994686157', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0005', NULL, 'TP2', '150133', 'Herman', 'Correa Ramirez', '14268665', NULL, '945478137', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0006', NULL, 'TP2', '150123', 'Gerardo Emilio', 'Duque Gutierrez', '43920843', NULL, '965689134', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0007', NULL, 'TP3', '150118', 'Pablo', 'Osorno Mejia', '94587457', NULL, '945874579', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0008', NULL, 'TP5', '150117', 'Arturo', 'Tabares Mora', '96587323', NULL, '965873231', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0009', NULL, 'TP5', '150136', 'Jaime', 'Lopez Tobon', '98754875', NULL, '987548751', 'erick.cardenas@outlook.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0010', NULL, 'TP6', '150116', 'Julio Cesar', 'Rodas Monsalve', '38877943', NULL, '995625487', 'cesar20991@hotmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0011', NULL, 'TP5', '150135', 'Gustavo', 'Rodriguez Vallejo', '4431891', NULL, '923654587', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0012', NULL, 'TP5', '150122', 'Maria VIctoria', 'Arias Gomez', '60388222', NULL, '994568788', 'cesar20991@gmail.com', 1);
INSERT INTO `t_trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0013', NULL, 'TP4', '150140', 'Cesar Augusto', 'Oropeza Sanchez', '47358236', NULL, '989893374', 'cesar20991@gmail.com', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_trabajadorxcamion`
-- 

DROP TABLE IF EXISTS `t_trabajadorxcamion`;
CREATE TABLE IF NOT EXISTS `t_trabajadorxcamion` (
  `cdAsigCamion` char(10) NOT NULL COMMENT 'Codigo Generado: ATC0000001,ATC0000002,ATC0000003',
  `cdCamion` char(6) NOT NULL,
  `cdTrabajador` char(6) NOT NULL,
  `cdTurno` char(4) NOT NULL,
  `fechaAsig` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `observacion` varchar(200) default NULL,
  PRIMARY KEY  (`cdAsigCamion`),
  KEY `fk_T_TrabajadorXCamion_T_Camion1_idx` (`cdCamion`),
  KEY `fk_T_TrabajadorXCamion_T_Trabajador1_idx` (`cdTrabajador`),
  KEY `fk_T_TrabajadorXCamion_T_Turno1_idx` (`cdTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_trabajadorxcamion`
-- 

INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000001', 'CA0004', 'TR0008', 'TN02', '2013-05-02 06:06:49', 1, NULL);
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000002', 'CA0005', 'TR0009', 'TN02', '2013-05-02 06:06:52', 1, NULL);
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000003', 'CA0003', 'TR0011', 'TN02', '2013-05-01 06:06:52', 1, NULL);
INSERT INTO `t_trabajadorxcamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000004', 'CA0002', 'TR0012', 'TN02', '2013-05-01 06:06:52', 1, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_turno`
-- 

DROP TABLE IF EXISTS `t_turno`;
CREATE TABLE IF NOT EXISTS `t_turno` (
  `cdTurno` char(4) NOT NULL,
  `nombTurno` varchar(20) NOT NULL,
  `Obs` varchar(100) default NULL,
  PRIMARY KEY  (`cdTurno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `t_turno`
-- 

INSERT INTO `t_turno` (`cdTurno`, `nombTurno`, `Obs`) VALUES ('TN01', 'Mañana', NULL);
INSERT INTO `t_turno` (`cdTurno`, `nombTurno`, `Obs`) VALUES ('TN02', 'Noche', NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `t_ubigeo`
-- 

DROP TABLE IF EXISTS `t_ubigeo`;
CREATE TABLE IF NOT EXISTS `t_ubigeo` (
  `cdUbig` char(6) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL,
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
  `cdPerfil` varchar(4) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `estado` tinyint(1) NOT NULL,
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
  ADD CONSTRAINT `fk_T_AccesoE_T_GrupoAcceso1` FOREIGN KEY (`cdGA`) REFERENCES `t_grupoacceso` (`cdGA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_AccesoE_T_Empresa1` FOREIGN KEY (`cdRuc`) REFERENCES `t_empresa` (`cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_AsistenciaXTrabajador_T_Trabajador1` FOREIGN KEY (`cdTrabajador`) REFERENCES `t_trabajador` (`cdTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AsistenciaXTrabajador_T_Asistencia1` FOREIGN KEY (`cdAsistencia`) REFERENCES `t_asistencia` (`cdAsistencia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_T_Cliente_T_Ubigeo1` FOREIGN KEY (`cdUbig`) REFERENCES `t_ubigeo` (`cdUbig`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Cliente_T_Usuario1` FOREIGN KEY (`nomUsu`) REFERENCES `t_usuario` (`nomUsu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Cliente_T_Empresa1` FOREIGN KEY (`cdRuc`) REFERENCES `t_empresa` (`cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_comprobante`
-- 
ALTER TABLE `t_comprobante`
  ADD CONSTRAINT `fk_T_Factura_T_Moneda1` FOREIGN KEY (`cdMda`) REFERENCES `t_moneda` (`cdMda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Comprobante_T_Liquidacion1` FOREIGN KEY (`cdLiq`) REFERENCES `t_liquidacion` (`cdLiq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Comprobante_T_TipoDoc1` FOREIGN KEY (`cdTD`) REFERENCES `t_tipodoc` (`cdTD`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_comprobantedet`
-- 
ALTER TABLE `t_comprobantedet`
  ADD CONSTRAINT `fk_T_FacturaDet_T_Servicio1` FOREIGN KEY (`cdServicio`) REFERENCES `t_servicio` (`cdServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_ComprobanteDet_T_Comprobante1` FOREIGN KEY (`idComprobante`) REFERENCES `t_comprobante` (`idComprobante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_controlviaje`
-- 
ALTER TABLE `t_controlviaje`
  ADD CONSTRAINT `fk_T_ControlViaje_T_DespachoDet1` FOREIGN KEY (`Nro`, `cdDespacho`, `cdRuc`) REFERENCES `t_despachodet` (`Nro`, `cdDespacho`, `cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_despacho`
-- 
ALTER TABLE `t_despacho`
  ADD CONSTRAINT `fk_T_Despacho_T_Ubigeo1` FOREIGN KEY (`cdUbig`) REFERENCES `t_ubigeo` (`cdUbig`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Despacho_T_Turno1` FOREIGN KEY (`cdTurno`) REFERENCES `t_turno` (`cdTurno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Despacho_T_Empresa1` FOREIGN KEY (`cdRuc`) REFERENCES `t_empresa` (`cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_despachodet`
-- 
ALTER TABLE `t_despachodet`
  ADD CONSTRAINT `fk_T_DespachoDet_T_TrabajadorXCamion1` FOREIGN KEY (`cdAsigCamion`) REFERENCES `t_trabajadorxcamion` (`cdAsigCamion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_DespachoDet_T_Despacho1` FOREIGN KEY (`cdDespacho`, `cdRuc`) REFERENCES `t_despacho` (`cdDespacho`, `cdRuc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_T_Pesaje_T_Liquidacion1` FOREIGN KEY (`cdLiq`) REFERENCES `t_liquidacion` (`cdLiq`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_Pesaje_T_ControlViaje1` FOREIGN KEY (`cdControlViaje`, `nroViaje`) REFERENCES `t_controlviaje` (`cdControlViaje`, `nroViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_seguroxcamion`
-- 
ALTER TABLE `t_seguroxcamion`
  ADD CONSTRAINT `fk_T_SeguroXCamion_T_Seguro1` FOREIGN KEY (`idSeguro`) REFERENCES `t_seguro` (`idSeguro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_SeguroXCamion_T_Camion1` FOREIGN KEY (`cdCamion`) REFERENCES `t_camion` (`cdCamion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Filtros para la tabla `t_soatxcamion`
-- 
ALTER TABLE `t_soatxcamion`
  ADD CONSTRAINT `fk_T_SOATxCamion_T_SOAT1` FOREIGN KEY (`idSOAT`) REFERENCES `t_soat` (`idSOAT`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_T_SOATxCamion_T_Camion1` FOREIGN KEY (`cdCamion`) REFERENCES `t_camion` (`cdCamion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
