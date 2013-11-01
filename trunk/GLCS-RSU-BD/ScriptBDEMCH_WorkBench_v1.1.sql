SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `BD_EMCH` ;
CREATE SCHEMA IF NOT EXISTS `BD_EMCH` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `BD_EMCH` ;

-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Perfil` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Perfil` (
  `cdPerfil` VARCHAR(4) NOT NULL COMMENT 'Primary key de la tabla perfil',
  `nombrePrf` VARCHAR(30) NOT NULL COMMENT 'Nombre del usuario al que le corresponde el perfil',
  `descripPrf` VARCHAR(200) NULL COMMENT 'Descripcion del usuario al que le corresponde el perfil',
  `estado` TINYINT(1) NOT NULL COMMENT 'Estado si esta o no habilitado',
  PRIMARY KEY (`cdPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Usuario` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Usuario` (
  `nomUsu` VARCHAR(10) NOT NULL COMMENT 'primer nombre seguido del apellido, EJM: coropeza',
  `cdPerfil` VARCHAR(4) NOT NULL COMMENT 'Primary key de la tabla perfil',
  `pass` VARCHAR(10) NOT NULL COMMENT 'Contraseña del usuario',
  `estado` TINYINT(1) NOT NULL COMMENT 'estado si esta o no habilitado',
  `accesoWeb` TINYINT(1) NOT NULL,
  `accesoMobile` TINYINT(1) NULL,
  PRIMARY KEY (`nomUsu`),
  INDEX `fk_T_Usuario_T_Perfil1_idx` (`cdPerfil` ASC),
  CONSTRAINT `fk_T_Usuario_T_Perfil1`
    FOREIGN KEY (`cdPerfil`)
    REFERENCES `BD_EMCH`.`T_Perfil` (`cdPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Ubigeo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Ubigeo` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Ubigeo` (
  `cdUbig` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla Ubigeo',
  `nombre` VARCHAR(50) NOT NULL COMMENT 'Nombre de la ubicación geográfica',
  `estado` TINYINT(1) NOT NULL COMMENT 'Estado si esta o no habilitado',
  PRIMARY KEY (`cdUbig`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Empresa` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Empresa` (
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Codigo Generado: RC0001,RC0002,...',
  `cdUbig` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla ubigeo, aqui nos permitirá identificar a que distrito pertenece la empresa',
  `rucE` CHAR(11) NOT NULL COMMENT 'Ruc de la Empresa',
  `rSocial` VARCHAR(150) NOT NULL COMMENT 'Razon social de la empresa',
  `fechaIni` DATETIME NOT NULL COMMENT 'Fecha en la que inicio la empresa',
  `direccion` VARCHAR(200) NOT NULL COMMENT 'Dirección de la empresa',
  `telef` VARCHAR(15) NOT NULL COMMENT 'Telefono de la empresa',
  `logo` BLOB NULL COMMENT 'Logo de la empresa',
  INDEX `fk_T_Empresa_T_Ubigeo1_idx` (`cdUbig` ASC),
  PRIMARY KEY (`cdRuc`),
  CONSTRAINT `fk_T_Empresa_T_Ubigeo1`
    FOREIGN KEY (`cdUbig`)
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Cliente` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Cliente` (
  `cdCliente` CHAR(10) NOT NULL COMMENT 'Codigo Generado: CLT0000001,CLT0000002,....',
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla Empresa',
  `nomUsu` VARCHAR(10) NOT NULL COMMENT 'Primary key de la tabla Usuario, En este caso este es el nombre de usuario del cliente',
  `cdUbig` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla Ubigeo, aqui nos permitira identificar a que distrito pertenece el cliente',
  `nombreComp` VARCHAR(45) NOT NULL COMMENT 'Nombre completo del Cliente',
  `tipoDocI` CHAR(1) NOT NULL COMMENT 'Tipo de Documento de identidad',
  `nroDocI` VARCHAR(15) NOT NULL COMMENT 'Nro de documento de identidad',
  `domicilio` VARCHAR(50) NOT NULL COMMENT 'Dirección del cliente',
  `telefono` VARCHAR(15) NULL COMMENT 'Nro Telefono fijo ',
  `celular` VARCHAR(15) NULL COMMENT 'Nro de Celular',
  `email` VARCHAR(45) NULL COMMENT 'Correo electronico del cliente',
  `estado` TINYINT(1) NOT NULL COMMENT 'Si esta habilitado o no',
  PRIMARY KEY (`cdCliente`),
  INDEX `fk_T_Cliente_T_Ubigeo1_idx` (`cdUbig` ASC),
  INDEX `fk_T_Cliente_T_Usuario1_idx` (`nomUsu` ASC),
  INDEX `fk_T_Cliente_T_Empresa1_idx` (`cdRuc` ASC),
  CONSTRAINT `fk_T_Cliente_T_Ubigeo1`
    FOREIGN KEY (`cdUbig`)
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_T_Usuario1`
    FOREIGN KEY (`nomUsu`)
    REFERENCES `BD_EMCH`.`T_Usuario` (`nomUsu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_T_Empresa1`
    FOREIGN KEY (`cdRuc`)
    REFERENCES `BD_EMCH`.`T_Empresa` (`cdRuc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_TipoTrabajador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_TipoTrabajador` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_TipoTrabajador` (
  `cdTipoTrabajador` CHAR(3) NOT NULL COMMENT 'Primary key de la tabla tipo trabajador',
  `Nombre` VARCHAR(50) NOT NULL COMMENT 'Nombre del tipo de trabajador',
  PRIMARY KEY (`cdTipoTrabajador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Trabajador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Trabajador` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Trabajador` (
  `cdTrabajador` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla trabajador',
  `nomUsu` VARCHAR(10) NULL COMMENT 'nombre de usuario que tiene el trabajador en el sistema',
  `cdTipoTrabajador` CHAR(3) NOT NULL COMMENT 'Primary key de la tabla tipo trabajador, aqui nos permitirá identificar que tipo de trabajador es',
  `cdUbig` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla ubigeo, aqui nos permitira saber en que distrito vive el trabajador',
  `nombres` VARCHAR(45) NOT NULL COMMENT 'Nombres del trabajador',
  `apellidos` VARCHAR(45) NOT NULL COMMENT 'Apellidos del trabajador',
  `DNI` VARCHAR(8) NOT NULL COMMENT 'DNI del trabajador',
  `telefono` VARCHAR(15) NULL COMMENT 'Telefono del trabajador',
  `celular` VARCHAR(15) NULL COMMENT 'Celular del trabajador',
  `email` VARCHAR(45) NULL COMMENT 'Correo electronico del trabajador',
  `estado` TINYINT(1) NOT NULL COMMENT 'Determinara si el trabajador sigue o no activo',
  PRIMARY KEY (`cdTrabajador`),
  INDEX `fk_T_Trabajador_T_TipoTrabajador1_idx` (`cdTipoTrabajador` ASC),
  INDEX `fk_T_Trabajador_T_Ubigeo1_idx` (`cdUbig` ASC),
  INDEX `fk_T_Trabajador_T_Usuario1_idx` (`nomUsu` ASC),
  CONSTRAINT `fk_T_Trabajador_T_TipoTrabajador1`
    FOREIGN KEY (`cdTipoTrabajador`)
    REFERENCES `BD_EMCH`.`T_TipoTrabajador` (`cdTipoTrabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Trabajador_T_Ubigeo1`
    FOREIGN KEY (`cdUbig`)
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Trabajador_T_Usuario1`
    FOREIGN KEY (`nomUsu`)
    REFERENCES `BD_EMCH`.`T_Usuario` (`nomUsu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Camion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Camion` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Camion` (
  `cdCamion` CHAR(6) NOT NULL COMMENT 'Primary Key de la Tabla Camion',
  `unidad` INT NOT NULL,
  `placa` VARCHAR(8) NOT NULL COMMENT 'Nro de Placa del Camion',
  `marca` VARCHAR(20) NOT NULL COMMENT 'Marca que utiliza la empresa:\n- SCANIA\n- IVECO\n- INTERNATIONAL\n- KIA\n- HUINDAY\n- DONG FENG\n- VOLKSWAGEN',
  `clase` VARCHAR(40) NOT NULL COMMENT 'Clase que utiliza la empresa:\n- Compactadora\n- Baranda\n- Barredora',
  `anioFab` CHAR(4) NOT NULL COMMENT 'Año de  Fabricación del Camion',
  `anioAdq` CHAR(4) NOT NULL COMMENT 'Año en que se adquirio el camion',
  `nroMotor` VARCHAR(40) NOT NULL COMMENT 'Nro del Motor',
  `pesoBruto` DECIMAL(5,4) NOT NULL COMMENT 'Peso bruto del Camion',
  `tipoCombustible` VARCHAR(20) NOT NULL COMMENT 'Tipo de combustible utiliza el camion',
  `kilometraje` DECIMAL(13,4) NOT NULL COMMENT 'Kilometraje del Camion',
  `imagen` MEDIUMBLOB NULL COMMENT 'Imagen del camion',
  `estado` TINYINT(1) NOT NULL COMMENT 'Estado si que indica si el camion está habilitado o no',
  PRIMARY KEY (`cdCamion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Turno` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Turno` (
  `cdTurno` CHAR(4) NOT NULL COMMENT 'Primary key de la tabla Turno',
  `nombTurno` VARCHAR(20) NOT NULL COMMENT 'Nombre del Turno de trabajo',
  `Obs` VARCHAR(100) NULL COMMENT 'Alguna observación acerca del turno',
  PRIMARY KEY (`cdTurno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Despacho`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Despacho` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Despacho` (
  `cdDespacho` CHAR(10) NOT NULL COMMENT 'Primary key de la tabla Despacho',
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla empresa, aqui nos permitira identificar a que empresa le corresponde la liquidación',
  `cdUbig` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla Ubigeo, aqui nos permitira identificar a que distrito corresponde este despacho',
  `cdTurno` CHAR(4) NOT NULL COMMENT 'Primary key de la tabla Turno, aqui nos permitira identificar a que turno corresponde el despacho',
  `nroDespacho` CHAR(10) NOT NULL COMMENT 'Nro interno del despacho',
  `fechaEmi` DATETIME NOT NULL COMMENT 'Fecha en la que se emitio',
  `zona` VARCHAR(50) NOT NULL COMMENT 'Zona a la que corresponde este despacho',
  `dineroEnviado` DECIMAL(13,4) NULL COMMENT 'Dinero que se envio en el despacho',
  `totalDineroUso` DECIMAL(13,4) NULL COMMENT 'Total del dinero que se utilizo',
  `totalDineroSinUso` DECIMAL(13,4) NULL COMMENT 'Total de dinero que no se utilizo',
  `usuCrea` VARCHAR(10) NOT NULL COMMENT 'usuario que crea el despacho',
  `fechaReg` DATETIME NOT NULL COMMENT 'Fecha en la que se registro',
  `usuModf` VARCHAR(10) NULL COMMENT 'Usuario que modifica el despacho',
  `fechaModf` DATETIME NULL COMMENT 'Fecha en la que se modifico',
  `evaluacion` CHAR(2) NULL COMMENT 'se evalua si el despacho fue bueno o malo',
  `obs` VARCHAR(200) NULL COMMENT 'Alguna observación en el despacho',
  PRIMARY KEY (`cdDespacho`, `cdRuc`),
  INDEX `fk_T_Despacho_T_Ubigeo1_idx` (`cdUbig` ASC),
  INDEX `fk_T_Despacho_T_Turno1_idx` (`cdTurno` ASC),
  INDEX `fk_T_Despacho_T_Empresa1_idx` (`cdRuc` ASC),
  CONSTRAINT `fk_T_Despacho_T_Ubigeo1`
    FOREIGN KEY (`cdUbig`)
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Despacho_T_Turno1`
    FOREIGN KEY (`cdTurno`)
    REFERENCES `BD_EMCH`.`T_Turno` (`cdTurno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Despacho_T_Empresa1`
    FOREIGN KEY (`cdRuc`)
    REFERENCES `BD_EMCH`.`T_Empresa` (`cdRuc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_TrabajadorXCamion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_TrabajadorXCamion` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_TrabajadorXCamion` (
  `cdAsigCamion` CHAR(10) NOT NULL COMMENT 'Codigo Generado: ATC0000001,ATC0000002,ATC0000003',
  `cdCamion` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla camion, aqui nos permitira saber a que camion estaran asignados los trabajadores',
  `cdTrabajador` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla trabajador, aqui nos permitira saber que trabajador es asignado',
  `cdTurno` CHAR(4) NOT NULL COMMENT 'Primary key de la tabla turno, aqui nos permitira saber en que turno deben estar los trabajadores y el camion',
  `fechaAsig` DATETIME NOT NULL COMMENT 'Fecha en la que se ha asignado',
  `estado` TINYINT(1) NOT NULL COMMENT 'Estado que determinara si está asignacion seguira o no vigente.',
  `observacion` VARCHAR(200) NULL COMMENT 'Alguna observación de esta asignación',
  PRIMARY KEY (`cdAsigCamion`),
  INDEX `fk_T_TrabajadorXCamion_T_Camion1_idx` (`cdCamion` ASC),
  INDEX `fk_T_TrabajadorXCamion_T_Trabajador1_idx` (`cdTrabajador` ASC),
  INDEX `fk_T_TrabajadorXCamion_T_Turno1_idx` (`cdTurno` ASC),
  CONSTRAINT `fk_T_TrabajadorXCamion_T_Camion1`
    FOREIGN KEY (`cdCamion`)
    REFERENCES `BD_EMCH`.`T_Camion` (`cdCamion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_TrabajadorXCamion_T_Trabajador1`
    FOREIGN KEY (`cdTrabajador`)
    REFERENCES `BD_EMCH`.`T_Trabajador` (`cdTrabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_TrabajadorXCamion_T_Turno1`
    FOREIGN KEY (`cdTurno`)
    REFERENCES `BD_EMCH`.`T_Turno` (`cdTurno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_DespachoDet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_DespachoDet` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_DespachoDet` (
  `Nro` INT NOT NULL COMMENT 'Generar numero: 1,2,3... De acuerdo al cdDespacho y cdRuc (poder Diferenciar)',
  `cdDespacho` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla Despacho, aqui nos permitira identificar a que despacho le corresponde el detalle',
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla Empresa, aqui nos permitira saber que empresa esta relacionada a este detalle',
  `cdAsigCamion` CHAR(10) NOT NULL COMMENT 'Primary key de la Tabla TrabajadorxCamion',
  `cantViaje` INT NOT NULL COMMENT 'Nro de Viajes que se realizaron',
  `evaluacion` CHAR(1) NULL COMMENT 'B: Bien         	M: Mal',
  INDEX `fk_T_DespachoDet_T_TrabajadorXCamion1_idx` (`cdAsigCamion` ASC),
  PRIMARY KEY (`Nro`, `cdDespacho`, `cdRuc`),
  INDEX `fk_T_DespachoDet_T_Despacho1_idx` (`cdDespacho` ASC, `cdRuc` ASC),
  CONSTRAINT `fk_T_DespachoDet_T_TrabajadorXCamion1`
    FOREIGN KEY (`cdAsigCamion`)
    REFERENCES `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_DespachoDet_T_Despacho1`
    FOREIGN KEY (`cdDespacho` , `cdRuc`)
    REFERENCES `BD_EMCH`.`T_Despacho` (`cdDespacho` , `cdRuc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_ControlViaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_ControlViaje` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_ControlViaje` (
  `cdControlViaje` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla Control de Viaje',
  `nroViaje` INT NOT NULL COMMENT 'Indica el numero del viaje',
  `Nro` INT NOT NULL COMMENT 'Nro del Documento despacho',
  `cdDespacho` CHAR(10) NOT NULL COMMENT 'Código del Despacho',
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Ruc de la Empresa',
  `fechaEmi` DATETIME NOT NULL COMMENT 'Fecha en la que se emite el documento',
  `horaEstimada` CHAR(5) NULL COMMENT 'Hora en la que se esperaba se comienze el viaje',
  `horaReal` CHAR(5) NULL COMMENT 'Hora el la que se realizo el viaje',
  `Obs` VARCHAR(300) NULL COMMENT 'Alguna observación que se halla dado en el control del Viaje',
  PRIMARY KEY (`cdControlViaje`, `nroViaje`),
  INDEX `fk_T_ControlViaje_T_DespachoDet1_idx` (`Nro` ASC, `cdDespacho` ASC, `cdRuc` ASC),
  CONSTRAINT `fk_T_ControlViaje_T_DespachoDet1`
    FOREIGN KEY (`Nro` , `cdDespacho` , `cdRuc`)
    REFERENCES `BD_EMCH`.`T_DespachoDet` (`Nro` , `cdDespacho` , `cdRuc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AsignarRuta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AsignarRuta` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_AsignarRuta` (
  `CdRuta` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla Ruta',
  `Nro` INT NOT NULL COMMENT 'Numero de la ruta',
  `cdDespacho` CHAR(10) NOT NULL COMMENT 'Primary key de la tabla Despacho, aqui nos permitira identificar a que despacho pertenece esta ruta',
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla empresa, aqui nos permitira identificar a para que empresa se recorrera esta ruta',
  `LATN` DOUBLE NULL COMMENT 'Latitud Norte de la ruta',
  `LNGN` DOUBLE NULL COMMENT 'Longitud Norte de la ruta',
  `LATS` DOUBLE NULL COMMENT 'Latitud sur de la Ruta',
  `LNGS` DOUBLE NULL COMMENT 'Longitud Sur de la Ruta',
  `nroV` INT NOT NULL COMMENT 'Numero de veces que se debe realizar la ruta(1-2)',
  `obs` VARCHAR(100) NULL COMMENT 'Alguna observación acerca de la Ruta',
  PRIMARY KEY (`CdRuta`),
  INDEX `fk_T_AsignarRuta_T_DespachoDet1_idx` (`Nro` ASC, `cdDespacho` ASC, `cdRuc` ASC),
  CONSTRAINT `fk_T_AsignarRuta_T_DespachoDet1`
    FOREIGN KEY (`Nro` , `cdDespacho` , `cdRuc`)
    REFERENCES `BD_EMCH`.`T_DespachoDet` (`Nro` , `cdDespacho` , `cdRuc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Asistencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Asistencia` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Asistencia` (
  `cdAsistencia` CHAR(5) NOT NULL COMMENT 'Primary key de la Tabla asistencia',
  `cdTurno` CHAR(4) NOT NULL COMMENT 'Primary key de la tabla turno, aqui nos ayudara a saber en que turno se tomo la asistencia',
  `fecha` DATETIME NOT NULL COMMENT 'Fecha de la asisitencia',
  `usuCrea` VARCHAR(10) NOT NULL COMMENT 'Usuario que crea la asistencia',
  `fechaReg` DATETIME NOT NULL COMMENT 'fecha en la que se registra la asistencia',
  `usuModf` VARCHAR(10) NULL COMMENT 'Usuario que modifica la asistencia',
  `fechModf` DATETIME NULL COMMENT 'fecha en la que se registra la asistencia',
  PRIMARY KEY (`cdAsistencia`),
  INDEX `fk_T_Asistencia_T_Turno1_idx` (`cdTurno` ASC),
  CONSTRAINT `fk_T_Asistencia_T_Turno1`
    FOREIGN KEY (`cdTurno`)
    REFERENCES `BD_EMCH`.`T_Turno` (`cdTurno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Incidencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Incidencia` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Incidencia` (
  `cdInc` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla incidencia',
  `cdControlViaje` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla Control de Viaje',
  `nroViaje` INT NOT NULL COMMENT 'Indica el numero del viaje',
  `fechaInc` DATETIME NOT NULL COMMENT 'Fecha en la que se dio la incidencia',
  `zona` VARCHAR(100) NOT NULL COMMENT 'Zona en la que se día',
  `problema` VARCHAR(45) NOT NULL COMMENT 'El problema que se genero',
  `horaProb` CHAR(5) NOT NULL COMMENT 'Hora en que se generó el problema',
  `observaciones` VARCHAR(200) NULL COMMENT 'Alguna pequeña observación acerca del problema',
  `soluc` VARCHAR(200) NULL COMMENT 'La solución si es que se le dió al problema',
  PRIMARY KEY (`cdInc`),
  INDEX `fk_T_Incidencia_T_ControlViaje1_idx` (`cdControlViaje` ASC, `nroViaje` ASC),
  CONSTRAINT `fk_T_Incidencia_T_ControlViaje1`
    FOREIGN KEY (`cdControlViaje` , `nroViaje`)
    REFERENCES `BD_EMCH`.`T_ControlViaje` (`cdControlViaje` , `nroViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_GrupoAcceso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_GrupoAcceso` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_GrupoAcceso` (
  `cdGA` INT NOT NULL COMMENT 'Primary key de la tabla Grupo acceso',
  `descrip` VARCHAR(100) NOT NULL COMMENT 'Descripcion del Grupo de acceso',
  `estado` TINYINT(1) NOT NULL COMMENT 'si esta o no habilitado',
  PRIMARY KEY (`cdGA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AccesoE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AccesoE` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_AccesoE` (
  `idAe` INT NOT NULL COMMENT 'Primary key de la tabla acceso',
  `cdPerfil` VARCHAR(4) NOT NULL COMMENT 'Primary key de la tabla perfil',
  `cdGA` INT NOT NULL COMMENT 'Primary key de la tabla grupo acceso',
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla empresa, aqui nos permitira identificar de que empresa es ese acceso',
  INDEX `fk_T_AccesoE_T_GrupoAcceso1_idx` (`cdGA` ASC),
  PRIMARY KEY (`idAe`),
  INDEX `fk_T_AccesoE_T_Empresa1_idx` (`cdRuc` ASC),
  INDEX `fk_T_AccesoE_T_Perfil1_idx` (`cdPerfil` ASC),
  CONSTRAINT `fk_T_AccesoE_T_GrupoAcceso1`
    FOREIGN KEY (`cdGA`)
    REFERENCES `BD_EMCH`.`T_GrupoAcceso` (`cdGA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_AccesoE_T_Empresa1`
    FOREIGN KEY (`cdRuc`)
    REFERENCES `BD_EMCH`.`T_Empresa` (`cdRuc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_AccesoE_T_Perfil1`
    FOREIGN KEY (`cdPerfil`)
    REFERENCES `BD_EMCH`.`T_Perfil` (`cdPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Menu` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Menu` (
  `cdMenu` VARCHAR(6) NOT NULL COMMENT 'Primary key de la tabla Menu',
  `Nombre` VARCHAR(50) NOT NULL COMMENT 'Nombre del Menu',
  `ruta` VARCHAR(100) NULL COMMENT 'Ruta de acceso del Menu',
  `estado` TINYINT(1) NOT NULL COMMENT 'Si está o no habilitado',
  PRIMARY KEY (`cdMenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AccesoM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AccesoM` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_AccesoM` (
  `idAm` INT NOT NULL COMMENT 'Primary key de la tabla acceso M',
  `cdGA` INT NOT NULL COMMENT 'Primary key de la tabla grupo acceso',
  `cdMenu` VARCHAR(6) NOT NULL COMMENT 'Primary key de la tabla menu',
  `estado` TINYINT(1) NOT NULL COMMENT 'Si esta o no habilitado',
  INDEX `fk_T_AccesoM_T_GrupoAcceso1_idx` (`cdGA` ASC),
  PRIMARY KEY (`idAm`),
  INDEX `fk_T_AccesoM_T_Menu1_idx` (`cdMenu` ASC),
  CONSTRAINT `fk_T_AccesoM_T_GrupoAcceso1`
    FOREIGN KEY (`cdGA`)
    REFERENCES `BD_EMCH`.`T_GrupoAcceso` (`cdGA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_AccesoM_T_Menu1`
    FOREIGN KEY (`cdMenu`)
    REFERENCES `BD_EMCH`.`T_Menu` (`cdMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AsistenciaXTrabajador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AsistenciaXTrabajador` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_AsistenciaXTrabajador` (
  `cdTrabajador` CHAR(6) NOT NULL COMMENT 'Primary Key de la Tabla Trabajador, aqui nos permitira identificar de que trabajador es la asitencia',
  `cdAsistencia` CHAR(5) NOT NULL COMMENT 'Primary key de la tabla Asistencia, aqui nos permitira identificar la asistencia',
  `Asiste` TINYINT(1) NULL COMMENT 'Variable que nos permitira identificar si asistio o no',
  `Tardanza` TINYINT(1) NULL COMMENT 'Variable que nos permitira identificar si llego tarde',
  `Fustifica` TINYINT(1) NULL COMMENT 'Variable que nos permitira identificar si justifico la falta que pudo tener',
  INDEX `fk_AsistenciaXTrabajador_T_Trabajador1_idx` (`cdTrabajador` ASC),
  INDEX `fk_AsistenciaXTrabajador_T_Asistencia1_idx` (`cdAsistencia` ASC),
  PRIMARY KEY (`cdTrabajador`, `cdAsistencia`),
  CONSTRAINT `fk_AsistenciaXTrabajador_T_Trabajador1`
    FOREIGN KEY (`cdTrabajador`)
    REFERENCES `BD_EMCH`.`T_Trabajador` (`cdTrabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsistenciaXTrabajador_T_Asistencia1`
    FOREIGN KEY (`cdAsistencia`)
    REFERENCES `BD_EMCH`.`T_Asistencia` (`cdAsistencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_TipoLiquidacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_TipoLiquidacion` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_TipoLiquidacion` (
  `cdTipoLiq` CHAR(4) NOT NULL COMMENT 'Primary Key de la Tabla Tipo de Liquidación',
  `Nombre` VARCHAR(50) NOT NULL COMMENT 'Nombre del Tipo de liquidación',
  PRIMARY KEY (`cdTipoLiq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Liquidacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Liquidacion` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Liquidacion` (
  `cdLiq` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla Liquidación',
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla Empresa, aqui nos permitira identificar a que empresa le pertenece esta liquidación',
  `cdTipoLiq` CHAR(4) NOT NULL COMMENT 'Primary key de la tabla tipo Liquidación, no permitira saber que tipo de liquidación es',
  `fechaApertura` DATETIME NOT NULL COMMENT 'Fecha de apertura es la fecha en la que se crea la liquidación',
  `fechaInicio` DATETIME NOT NULL COMMENT 'Iindica desde que fecha se cobrara',
  `fechaFin` DATETIME NOT NULL COMMENT 'Indica desde hasta que fecha se cobrara',
  `totalTN` DECIMAL(7,2) NULL COMMENT 'Total de toneladas que se cobraran',
  `asunto` VARCHAR(100) NULL COMMENT 'alguna observación que se quiera dejar',
  `usuCrea` VARCHAR(10) NOT NULL COMMENT 'Usuario que crea la liquidación',
  `fechaReg` DATETIME NOT NULL COMMENT 'Fecha en la que se realizo la creación de la liquidación',
  `usuModf` VARCHAR(10) NULL COMMENT 'Usuario que modifico la liquidación',
  `fechaModf` DATETIME NULL COMMENT 'Fecha en la que se modifico la liquidación',
  PRIMARY KEY (`cdLiq`),
  INDEX `fk_T_Liquidacion_T_Empresa1_idx` (`cdRuc` ASC),
  INDEX `fk_T_Liquidacion_T_TipoLiquidacion1_idx` (`cdTipoLiq` ASC),
  CONSTRAINT `fk_T_Liquidacion_T_Empresa1`
    FOREIGN KEY (`cdRuc`)
    REFERENCES `BD_EMCH`.`T_Empresa` (`cdRuc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Liquidacion_T_TipoLiquidacion1`
    FOREIGN KEY (`cdTipoLiq`)
    REFERENCES `BD_EMCH`.`T_TipoLiquidacion` (`cdTipoLiq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Pesaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Pesaje` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Pesaje` (
  `cdPesaje` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla Pesaje',
  `cdControlViaje` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla Control de Viaje',
  `nroViaje` INT NOT NULL COMMENT 'Indica el numero del viaje',
  `cdLiq` CHAR(10) NULL COMMENT 'Primary Key de la Tabla Liquidación',
  `nroPesaje` INT NOT NULL,
  `fechaPesaje` DATETIME NOT NULL COMMENT 'Fecha en la que se hizo el Pesaje',
  `pesoBruto` DECIMAL(7,2) NOT NULL COMMENT 'Peso ',
  `tara` DECIMAL(7,2) NOT NULL COMMENT 'Peso adicional',
  `pesoTN` DECIMAL(7,2) NOT NULL,
  `estadoPesaje` CHAR(2) NOT NULL COMMENT 'P: Pendiente , L:Liquidado, ',
  `usuCrea` VARCHAR(10) NOT NULL COMMENT 'Usuario que registro por primera vez el Pesaje',
  `fechaReg` DATETIME NOT NULL COMMENT 'Fecha en la que se registro el Pesaje',
  `usuModf` VARCHAR(10) NULL COMMENT 'usuario que edita el pesaje',
  `fechaModf` DATETIME NULL COMMENT 'Fecha en la que se modifico',
  `Obs` VARCHAR(100) NULL COMMENT 'Se registra alguna observación',
  `imagenP` MEDIUMBLOB NULL COMMENT 'Imagen del Pesaje',
  PRIMARY KEY (`cdPesaje`),
  INDEX `fk_T_Pesaje_T_Liquidacion1_idx` (`cdLiq` ASC),
  INDEX `fk_T_Pesaje_T_ControlViaje1_idx` (`cdControlViaje` ASC, `nroViaje` ASC),
  CONSTRAINT `fk_T_Pesaje_T_Liquidacion1`
    FOREIGN KEY (`cdLiq`)
    REFERENCES `BD_EMCH`.`T_Liquidacion` (`cdLiq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Pesaje_T_ControlViaje1`
    FOREIGN KEY (`cdControlViaje` , `nroViaje`)
    REFERENCES `BD_EMCH`.`T_ControlViaje` (`cdControlViaje` , `nroViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Comprobante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Comprobante` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Comprobante` (
  `idComprobante` CHAR(10) NOT NULL COMMENT 'CP00000001',
  `cdLiq` CHAR(10) NOT NULL COMMENT 'Primary key de la tabla liquidación',
  `tipoDocumento` VARCHAR(20) NOT NULL,
  `fecMov` DATETIME NOT NULL COMMENT 'Fecha en la que se realizo la compra',
  `serie` VARCHAR(4) NOT NULL COMMENT 'Serie del comprobante',
  `nroDoc` VARCHAR(15) NOT NULL COMMENT 'Nro de documento del comprobante',
  `moneda` CHAR(2) NOT NULL COMMENT 'SS:SOLES / DD: DOLARES',
  `total` DECIMAL(7,2) NOT NULL COMMENT 'Total que se pago',
  `subTotal` DECIMAL(7,2) NOT NULL COMMENT 'Sub total pagado',
  `IGV` DECIMAL(7,2) NOT NULL COMMENT 'IGV del pago',
  `usuCrea` VARCHAR(10) NOT NULL COMMENT 'Usuario que creo el comprobante',
  `fechaReg` DATETIME NOT NULL COMMENT 'Fecha en la que se registro el comprobante',
  `usuModf` VARCHAR(10) NULL COMMENT 'Usuario que modifico el comprobante',
  `fechaModf` DATETIME NULL COMMENT 'Fecha en la que se modifico el comprobante',
  `estado` CHAR(2) NOT NULL COMMENT 'PC- Pendiente\nCC- Cobrado',
  PRIMARY KEY (`idComprobante`),
  INDEX `fk_T_Comprobante_T_Liquidacion1_idx` (`cdLiq` ASC),
  CONSTRAINT `fk_T_Comprobante_T_Liquidacion1`
    FOREIGN KEY (`cdLiq`)
    REFERENCES `BD_EMCH`.`T_Liquidacion` (`cdLiq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Servicio` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_Servicio` (
  `cdServicio` CHAR(6) NOT NULL COMMENT 'Codigo Generado: SRV0000001,SRV0000002,....',
  `nombreServ` VARCHAR(100) NOT NULL COMMENT 'Nombre del servicio',
  `descripServ` VARCHAR(300) NOT NULL COMMENT 'Descripción del servicio',
  `nCortoServ` VARCHAR(10) NULL COMMENT 'Abreviacion del Nombre del servicio',
  PRIMARY KEY (`cdServicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_ComprobanteDet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_ComprobanteDet` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_ComprobanteDet` (
  `item` VARCHAR(45) NOT NULL COMMENT 'Primary key de la tabla item',
  `cdServicio` CHAR(6) NOT NULL COMMENT 'Primary key de la tabla Servicio, no permitira identificar que servicio se realizo',
  `idComprobante` CHAR(10) NOT NULL COMMENT 'Primary key de la tabla comprobante, aqui nos permitira saber a que comprobante pertenece el detalle',
  `precio` DECIMAL(7,2) NOT NULL COMMENT 'Precio de la tonelada',
  `cantTN` DECIMAL(7,2) NOT NULL COMMENT 'Canttidad de toneladas',
  `total` DECIMAL(7,2) NOT NULL COMMENT 'Total a pagar',
  PRIMARY KEY (`item`),
  INDEX `fk_T_FacturaDet_T_Servicio1_idx` (`cdServicio` ASC),
  INDEX `fk_T_ComprobanteDet_T_Comprobante1_idx` (`idComprobante` ASC),
  CONSTRAINT `fk_T_FacturaDet_T_Servicio1`
    FOREIGN KEY (`cdServicio`)
    REFERENCES `BD_EMCH`.`T_Servicio` (`cdServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_ComprobanteDet_T_Comprobante1`
    FOREIGN KEY (`idComprobante`)
    REFERENCES `BD_EMCH`.`T_Comprobante` (`idComprobante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_EstadoLiq`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_EstadoLiq` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_EstadoLiq` (
  `cdEstadoLiq` CHAR(3) NOT NULL COMMENT 'Primary Key de estado de Liquidación',
  `Nombre` VARCHAR(30) NOT NULL COMMENT 'Nombre del Estado',
  PRIMARY KEY (`cdEstadoLiq`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_EstadoxLiquidacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_EstadoxLiquidacion` ;

CREATE TABLE IF NOT EXISTS `BD_EMCH`.`T_EstadoxLiquidacion` (
  `fechaEstado` DATETIME NOT NULL COMMENT 'Fecha de Creación del Estado',
  `cdEstadoLiq` CHAR(3) NOT NULL COMMENT 'Primary Key de la tabla Estado de Liquidación',
  `cdLiq` CHAR(10) NOT NULL COMMENT 'Primary Key de la Tabla Liquidación',
  `Obs` VARCHAR(100) NULL COMMENT 'Observacion sobre el estado de la Liquidación',
  INDEX `fk_T_EstadoxLiquidacion_T_EstadoLiq1_idx` (`cdEstadoLiq` ASC),
  PRIMARY KEY (`fechaEstado`, `cdEstadoLiq`, `cdLiq`),
  INDEX `fk_T_EstadoxLiquidacion_T_Liquidacion1_idx` (`cdLiq` ASC),
  CONSTRAINT `fk_T_EstadoxLiquidacion_T_EstadoLiq1`
    FOREIGN KEY (`cdEstadoLiq`)
    REFERENCES `BD_EMCH`.`T_EstadoLiq` (`cdEstadoLiq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_EstadoxLiquidacion_T_Liquidacion1`
    FOREIGN KEY (`cdLiq`)
    REFERENCES `BD_EMCH`.`T_Liquidacion` (`cdLiq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Perfil`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF01', 'Administrador', 'Acceso a todos los modulos', 1);
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF02', 'Supervisor', 'Acceso a los modulos Administración, Control, Operaciones', 1);
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF03', 'Despachador', 'Despachador', 1);
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF04', 'Contador', 'Acceso al módulo de operaciones', 1);
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF05', 'Cliente', 'Acceso solo a sus liquidaciones', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`, `accesoWeb`, `accesoMobile`) VALUES ('coropeza', 'PF01', '12345', 1, 1, 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`, `accesoWeb`, `accesoMobile`) VALUES ('mvalois', 'PF01', '12345', 1, 1, 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`, `accesoWeb`, `accesoMobile`) VALUES ('dparraga', 'PF01', '12345', 1, 1, NULL);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`, `accesoWeb`, `accesoMobile`) VALUES ('mrobles', 'PF01', '12345', 1, 1, NULL);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`, `accesoWeb`, `accesoMobile`) VALUES ('vnunez', 'PF01', '12345', 1, 1, 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`, `accesoWeb`, `accesoMobile`) VALUES ('cmiranda', 'PF05', '12345', 1, 1, NULL);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`, `accesoWeb`, `accesoMobile`) VALUES ('aperez', 'PF05', '12345', 1, 1, NULL);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`, `accesoWeb`, `accesoMobile`) VALUES ('glopez', 'PF01', '12345', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Ubigeo`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150101', 'LIMA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150102', 'ANCON', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150103', 'ATE', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150104', 'BARRANCO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150105', 'BREÑA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150106', 'CARABAYLLO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150107', 'CHACLACAYO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150108', 'CHORRILLOS', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150109', 'CIENEGUILLA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150110', 'COMAS', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150111', 'EL AGUSTINO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150112', 'INDEPENDENCIA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150113', 'JESUS MARIA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150114', 'LA MOLINA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150115', 'LA VICTORIA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150116', 'LINCE', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150117', 'LOS OLIVOS', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150118', 'LURIGANCHO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150119', 'LURIN', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150120', 'MAGDALENA DEL MAR', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150121', 'PUEBLO LIBRE', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150122', 'MIRAFLORES', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150123', 'PACHACAMAC', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150124', 'PUCUSANA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150125', 'PUENTE PIEDRA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150126', 'PUNTA HERMOSA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150127', 'PUNTA NEGRA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150128', 'RIMAC', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150129', 'SAN BARTOLO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150130', 'SAN BORJA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150131', 'SAN ISIDRO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150132', 'SAN JUAN DE LURIGANCHO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150133', 'SAN JUAN DE MIRAFLORES', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150134', 'SAN LUIS', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150135', 'SAN MARTIN DE PORRES', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150136', 'SAN MIGUEL', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150137', 'SANTA ANITA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150138', 'SANTA MARIA DEL MAR', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150139', 'SANTA ROSA', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150140', 'SANTIAGO DE SURCO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150141', 'SURQUILLO', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150142', 'VILLA EL SALVADOR', 1);
INSERT INTO `BD_EMCH`.`T_Ubigeo` (`cdUbig`, `nombre`, `estado`) VALUES ('150143', 'VILLA MARIA DEL TRIUNFO', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Empresa`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0001', '150134', '20131378115', 'MUNICIPALIDAD DISTRITAL DE SAN LUIS', '1993-05-04', 'Av. del Aire  Nro. 1540 URB. Villa Jardin', '365027', NULL);
INSERT INTO `BD_EMCH`.`T_Empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0002', '150115', '20131368071', 'MUNICIPALIDAD DISTRITAL DE LA VICTORIA', '1993-05-04', 'AV. IQUITOS NRO. 500', '315766', NULL);
INSERT INTO `BD_EMCH`.`T_Empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0003', '150103', '20131378620', 'MUNICIPALIDAD DISTRITAL DE ATE', '1993-05-04', 'CAR. CARRETERA CENTRAL KM 7.5', '4941428', NULL);
INSERT INTO `BD_EMCH`.`T_Empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0004', '150130', '20131373741', 'MUNICIPALIDAD DE SAN BORJA', '1993-05-04', 'AV. AVENIDA JOAQUIN MADRID NRO.200', '6125555', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Cliente` (`cdCliente`, `cdRuc`, `nomUsu`, `cdUbig`, `nombreComp`, `tipoDocI`, `nroDocI`, `domicilio`, `telefono`, `celular`, `email`, `estado`) VALUES ('CLT0000001', 'RC0001', 'cmiranda', '150134', 'Carlos Miranda', 'N', '29283746', 'av. San Lusi 345', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Cliente` (`cdCliente`, `cdRuc`, `nomUsu`, `cdUbig`, `nombreComp`, `tipoDocI`, `nroDocI`, `domicilio`, `telefono`, `celular`, `email`, `estado`) VALUES ('CLT0000002', 'RC0001', 'aperez', '150115', 'Angela Perez', 'N', '23245654', 'av. mexico 223', NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_TipoTrabajador`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_TipoTrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP1', 'Supervisor');
INSERT INTO `BD_EMCH`.`T_TipoTrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP2', 'Despachador');
INSERT INTO `BD_EMCH`.`T_TipoTrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP3', 'Contador');
INSERT INTO `BD_EMCH`.`T_TipoTrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP4', 'Jefe');
INSERT INTO `BD_EMCH`.`T_TipoTrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP5', 'Chofer');
INSERT INTO `BD_EMCH`.`T_TipoTrabajador` (`cdTipoTrabajador`, `Nombre`) VALUES ('TP6', 'Ayudante');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Trabajador`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0000', NULL, 'TP4', '150140', 'Cesar Augusto', 'Oropeza Sanchez', '47358236', NULL, '989893374', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0001', NULL, 'TP5', '150140', 'Lilian Eugenia', 'Gomez Alvarez', '57736310', NULL, '994587411', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0002', NULL, 'TP5', '150140', 'Beatriz Elena', 'Osorio Laverde', '72323122', NULL, '996323814', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0003', NULL, 'TP5', '150140', 'Gloria', 'Sanclemente', '945784199', NULL, '945784199', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0004', NULL, 'TP5', '150114', 'Carlos Augusto', 'Montoya Serna', '33651713', NULL, '994686157', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0005', NULL, 'TP5', '150133', 'Herman', 'Correa Ramirez', '14268665', NULL, '945478137', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0006', NULL, 'TP5', '150123', 'Gerardo Emilio', 'Duque Gutierrez', '43920843', NULL, '965689134', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0007', NULL, 'TP5', '150118', 'Pablo', 'Osorno Mejia', '945874579', NULL, '945874579', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0008', NULL, 'TP5', '150117', 'Arturo', 'Tabares Mora', '965873231', NULL, '965873231', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0009', NULL, 'TP5', '150136', 'Jaime', 'Lopez Tobon', '987548751', NULL, '987548751', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0010', NULL, 'TP5', '150116', 'Julio Cesar', 'Rodas Monsalve', '38877943', NULL, '995625487', 'cesar20991@hotmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0011', NULL, 'TP5', '150135', 'Gustavo', 'Rodriguez Vallejo', '4431891', NULL, '923654587', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0012', NULL, 'TP5', '150122', 'Maria VIctoria', 'Arias Gomez', '60388222', NULL, '994568788', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0013', NULL, 'TP5', '150140', 'WALTER NOE', 'BALLESTEROS MORALES', '30777053', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0014', NULL, 'TP5', '150122', 'EDWIN EDGARDO', 'BALTODANO SANCHEZ', '52102919', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0015', NULL, 'TP5', '150117', 'MIGUEL ALBERTO', 'GRADOS JAVIER', '75797229', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0016', NULL, 'TP5', '150140', 'RAUL IGNACIO', 'FLORES TORRES', '43155520', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0017', NULL, 'TP5', '150117', 'JOSE ALEJANDRO', 'ESTACIO CERNA', '43155520', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0018', NULL, 'TP5', '150140', 'OMAR', 'DUEÑAS CARDENAS', '43155520', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0019', NULL, 'TP5', '150122', 'JUAN FELIPE', 'DIOSES ALBAN', '56163817', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0020', NULL, 'TP5', '150117', 'JAIME AQUILES', 'MATOS GUTIERREZ', '57593941', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0021', NULL, 'TP5', '150140', 'RAFAEL', 'MIRANDA CRUZ', '39549401', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0022', NULL, 'TP5', '150122', ' RAUL EDGARDO', 'MONTOYA BENITES', '31305107', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0023', NULL, 'TP5', '150122', 'JUAN BENITO', 'POLO ÑIQUE', '48359985', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0024', NULL, 'TP5', '150140', 'JAVIER JESUS', 'RIOS SIFUENTES', '24809967', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0025', NULL, 'TP5', '150122', 'RICHARD ANGEL', 'TORRES QUISPE', '40884249', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0026', NULL, 'TP5', '150117', 'LENY FRANK', 'VIZCARRA DIAZ', '56480292', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0027', NULL, 'TP5', '150122', 'VALENTIN GIORDANO', 'VIZZI BALDEON', '45071014', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0028', NULL, 'TP5', '150140', 'WILFREDO MIGUEL', 'YAÑEZ LAZO', '69763300', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0029', NULL, 'TP5', '150117', 'CHRISTIAN', 'ZAPATA QUINTANA', '43931490', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0030', NULL, 'TP5', '150140', 'JORGE LUIS', 'LIVIA MORAN', '56650735', NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Camion`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0001', 1, 'XO-5784', 'VOLKSWAGEN', 'Compactadora', '2003', '2007', '30771206', 6, 'd2', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0002', 2, 'XO-5782', 'VOLKSWAGEN', 'Compactadora', '2003', '2007', '30770835', 8, 'gasolina', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0003', 3, 'XO-6048', 'VOLKSWAGEN', 'Compactadora', '2003', '2007', '307712044', 7, 'd2', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0004', 4, 'XO-6400', 'VOLKSWAGEN', 'Compactadora', '2003', '2007', '30771950', 7, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0005', 5, 'XO-6401', 'VOLKSWAGEN', 'Compactadora', '2003', '2005', '30771947', 6, 'd2', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0006', 6, 'XO-6955', 'VOLKSWAGEN', 'Compactadora', '2004', '2005', '30500442', 8, 'd3', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0007', 7, 'XO-7815', 'SCANIA', 'Compactadora', '2004', '2005', '8028902', 7, 'gasolina', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0008', 8, 'XO-7858', 'VOLKSWAGEN', 'Compactadora', '2005', '2005', '30789953', 8, 'd3', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0009', 9, 'XO-7881', 'VOLKSWAGEN', 'Compactadora', '2005', '2005', '6076193', 8, 'gasolina', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0010', 10, 'XO-8624', 'SCANIA', 'Compactadora', '2005', '2005', '8048749', 6, 'd3', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0011', 11, 'XO-8563', 'SCANIA', 'Compactadora', '2005', '2005', '8048703', 8, 'd4', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0012', 12, 'C-12454', 'SCANIA', 'Compactadora', '2005', '2005', '8058489', 7, 'gasolina', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0013', 13, 'C-1454', 'SCANIA', 'Compactadora', '2005', '2005', '8058493', 7, 'd4', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0014', 14, 'WGE-356', 'VOLKSWAGEN', 'Compactadora', '2006', '2005', '30566904', 6, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0015', 15, 'WGE-409', 'VOLKSWAGEN', 'Compactadora', '2006', '2005', '30565819', 8, 'd4', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0016', 16, 'WGE-535', 'VOLKSWAGEN', 'Compactadora', '2006', '2005', '30566900', 8, 'd5', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0017', 17, 'WGE-357', 'VOLKSWAGEN', 'Compactadora', '2006', '2005', '30566545', 6, 'gasolina', 1700, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0018', 18, 'WGH-667', 'IVECO', 'Compactadora', '2007', '2005', 'F4AE0681D681D6000087', 8, 'd5', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0019', 19, 'WGH-668', 'IVECO', 'Compactadora', '2007', '2005', 'F4AE0681D681D6000085', 6, 'gasolina', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0020', 20, 'WGH-461', 'IVECO', 'Compactadora', '2007', '2007', 'F4AE0681D681D6001659', 6, 'd5', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0021', 21, 'WGH-460', 'IVECO', 'Compactadora', '2007', '2007', 'F4AE0681D681D6001685', 6, 'd6', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0022', 22, 'WGJ-293', 'INTERNATIONAL', 'Compactadora', '2006', '2007', '470HM2U1492450', 6, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0023', 23, 'WGI-601', 'INTERNATIONAL', 'Compactadora', '2006', '2007', '470HM2U1492451', 8, 'd6', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0024', 24, 'XI-5417', 'KIA', 'Baranda', '1996', '2006', 'SH021925', 7, 'gasolina', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0025', 25, 'XO-3515', 'HUINDAY', 'Baranda', '2000', '2006', 'D4DAY094833', 7, 'd6', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0026', 26, 'XO-7859', 'VOLKSWAGEN', 'Baranda', '2005', '2006', '4123022', 6, 'd7', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0027', 27, 'XO-8116', 'VOLKSWAGEN', 'Baranda', '2005', '2006', '4123206', 7, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0028', 28, 'C-35- EN TRAMITE', 'VOLKSWAGEN', 'Baranda', '2006', '2006', 'E1T134243', 6, 'd7', 1400, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0029', 29, 'WGF-071', 'DONG FENG', 'Baranda', '2007', '2006', '69465223', 7, 'gasolina', 2000, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0030', 30, 'WGF-088', 'DONG FENG', 'Baranda', '2007', '2006', '69478119', 7, 'd7', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0031', 31, 'XQ-6729', 'VOLKSWAGEN', 'Compactadora', '1992', '2000', 'D2366T200703', 7, 'd8', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0032', 32, 'XQ-6807', 'VOLKSWAGEN', 'Compactadora', '1992', '2000', 'D2366T200757CA', 8, 'gasolina', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0033', 33, 'XQ-6806', 'VOLKSWAGEN', 'Compactadora', '1992', '2000', 'D2366T200750', 7, 'd8', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0034', 34, 'XQ-6967', 'VOLKSWAGEN', 'Compactadora', '1992', '2000', 'D2366T200735', 7, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `unidad`, `placa`, `marca`, `clase`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0035', 35, 'XQ-6966', 'VOLKSWAGEN', 'Compactadora', '1992', '2000', 'D2366T200699', 6, 'd8', 1800, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Turno`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Turno` (`cdTurno`, `nombTurno`, `Obs`) VALUES ('TN01', 'Mañana', '8:00 am - 8:00pm');
INSERT INTO `BD_EMCH`.`T_Turno` (`cdTurno`, `nombTurno`, `Obs`) VALUES ('TN02', 'Noche', '8:00 pm - 8:00am');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Despacho`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000001', 'RC0001', '150134', 'TN02', 'NDP0000001', '2013-05-01', 'zona A', 140.00, 120.00, 20.00, 'coropeza', '2013-05-01', NULL, NULL, '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000002', 'RC0001', '150134', 'TN02', 'NDP0000002', '2013-05-02', 'zona B', NULL, NULL, NULL, 'coropeza', '2013-05-02', 'dparraga', '2013-05-02', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000003', 'RC0001', '150134', 'TN02', 'NDP0000003', '2013-05-03', 'Zona C', 150.00, 140.00, 10.00, 'coropeza', '2013-05-03', 'mrobles', '2013-05-03', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000004', 'RC0001', '150134', 'TN02', 'NDP0000004', '2013-05-04', 'Zona D', NULL, NULL, NULL, 'coropeza', '2013-05-04', 'dparraga', '2013-05-04', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000005', 'RC0001', '150134', 'TN02', 'NDP0000005', '2013-05-05', 'zona E', 140.00, 120.00, 20.00, 'coropeza', '2013-05-05', NULL, NULL, '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000006', 'RC0001', '150134', 'TN02', 'NDP0000006', '2013-05-06', 'zona F', NULL, NULL, NULL, 'coropeza', '2013-05-06', 'dparraga', '2013-05-06', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000007', 'RC0001', '150134', 'TN02', 'NDP0000007', '2013-05-07', 'zona G', NULL, NULL, NULL, 'coropeza', '2013-05-07', 'mrobles', '2013-05-07', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000008', 'RC0001', '150134', 'TN02', 'NDP0000008', '2013-05-08', 'zona H', NULL, NULL, NULL, 'coropeza', '2013-05-08', 'dparraga', '2013-05-08', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000009', 'RC0001', '150134', 'TN02', 'NDP0000009', '2013-05-09', 'zona A', NULL, NULL, NULL, 'coropeza', '2013-05-09', NULL, NULL, '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000010', 'RC0001', '150134', 'TN02', 'NDP0000010', '2013-05-10', 'zona B', 120.00, 120.00, 0.00, 'coropeza', '2013-05-10', 'mrobles', '2013-05-10', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000011', 'RC0001', '150134', 'TN02', 'NDP0000011', '2013-05-11', 'Zona C', NULL, NULL, NULL, 'coropeza', '2013-05-11', 'dparraga', '2013-05-11', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000012', 'RC0001', '150134', 'TN02', 'NDP0000012', '2013-05-12', 'Zona D', NULL, NULL, NULL, 'coropeza', '2013-05-12', NULL, NULL, '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000013', 'RC0001', '150134', 'TN02', 'NDP0000013', '2013-05-13', 'zona E', NULL, NULL, NULL, 'coropeza', '2013-05-13', 'mrobles', '2013-05-13', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000014', 'RC0001', '150134', 'TN02', 'NDP0000014', '2013-05-14', 'zona F', NULL, NULL, NULL, 'coropeza', '2013-05-14', 'dparraga', '2013-05-14', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000015', 'RC0001', '150134', 'TN02', 'NDP0000015', '2013-05-15', 'zona G', NULL, NULL, NULL, 'coropeza', '2013-05-15', 'mrobles', '2013-05-15', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000016', 'RC0001', '150134', 'TN02', 'NDP0000016', '2013-05-16', 'zona H', NULL, NULL, NULL, 'coropeza', '2013-05-16', NULL, NULL, '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000017', 'RC0001', '150134', 'TN02', 'NDP0000017', '2013-05-17', 'zona A', NULL, NULL, NULL, 'coropeza', '2013-05-17', 'dparraga', '2013-05-17', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000018', 'RC0001', '150134', 'TN02', 'NDP0000018', '2013-05-18', 'zona B', 200.00, 180.00, 20.00, 'coropeza', '2013-05-18', NULL, NULL, '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000019', 'RC0001', '150134', 'TN02', 'NDP0000019', '2013-05-19', 'Zona C', NULL, NULL, NULL, 'coropeza', '2013-05-19', 'mrobles', '2013-05-19', '', '');
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000020', 'RC0001', '150134', 'TN02', 'NDP0000020', '2013-05-20', 'Zona D', NULL, NULL, NULL, 'coropeza', '2013-05-20', NULL, NULL, '', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_TrabajadorXCamion`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000001', 'CA0004', 'TR0008', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000002', 'CA0005', 'TR0009', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000003', 'CA0003', 'TR0011', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000004', 'CA0002', 'TR0012', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000005', 'CA0008', 'TR0004', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000006', 'CA0009', 'TR0005', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000007', 'CA0010', 'TR0012', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000008', 'CA0011', 'TR0013', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000009', 'CA0012', 'TR0014', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000010', 'CA0013', 'TR0015', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000011', 'CA0014', 'TR0016', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000012', 'CA0015', 'TR0017', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000013', 'CA0016', 'TR0018', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000014', 'CA0017', 'TR0019', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000015', 'CA0018', 'TR0020', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000016', 'CA0019', 'TR0021', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000017', 'CA0020', 'TR0022', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000018', 'CA0021', 'TR0023', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000019', 'CA0022', 'TR0024', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000020', 'CA0023', 'TR0025', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000021', 'CA0024', 'TR0026', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000022', 'CA0025', 'TR0027', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000023', 'CA0026', 'TR0028', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000024', 'CA0027', 'TR0029', 'TN02', '2013-05-01 01:38:54', 1, '');
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000025', 'CA0028', 'TR0030', 'TN02', '2013-05-01 01:38:54', 1, '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_DespachoDet`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (1, 'DP00000001', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (2, 'DP00000001', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (3, 'DP00000001', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (4, 'DP00000001', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (5, 'DP00000002', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (6, 'DP00000002', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (7, 'DP00000002', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (8, 'DP00000002', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (9, 'DP00000002', 'RC0001', 'ATC0000005', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (10, 'DP00000002', 'RC0001', 'ATC0000006', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (11, 'DP00000003', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (12, 'DP00000003', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (13, 'DP00000003', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (14, 'DP00000003', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (15, 'DP00000003', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (16, 'DP00000004', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (17, 'DP00000004', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (18, 'DP00000004', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (19, 'DP00000004', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (20, 'DP00000004', 'RC0001', 'ATC0000005', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (21, 'DP00000004', 'RC0001', 'ATC0000006', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (22, 'DP00000005', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (23, 'DP00000005', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (24, 'DP00000005', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (25, 'DP00000005', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (26, 'DP00000005', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (27, 'DP00000005', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (28, 'DP00000006', 'RC0001', 'ATC0000008', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (29, 'DP00000006', 'RC0001', 'ATC0000009', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (30, 'DP00000006', 'RC0001', 'ATC0000010', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (31, 'DP00000006', 'RC0001', 'ATC0000011', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (32, 'DP00000006', 'RC0001', 'ATC0000012', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (33, 'DP00000007', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (34, 'DP00000007', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (35, 'DP00000007', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (36, 'DP00000007', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (37, 'DP00000007', 'RC0001', 'ATC0000005', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (38, 'DP00000007', 'RC0001', 'ATC0000006', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (39, 'DP00000008', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (40, 'DP00000008', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (41, 'DP00000008', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (42, 'DP00000008', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (43, 'DP00000008', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (44, 'DP00000009', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (45, 'DP00000009', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (46, 'DP00000009', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (47, 'DP00000009', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (48, 'DP00000009', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (49, 'DP00000009', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (50, 'DP00000010', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (51, 'DP00000010', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (52, 'DP00000010', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (53, 'DP00000010', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (54, 'DP00000010', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (55, 'DP00000011', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (56, 'DP00000011', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (57, 'DP00000011', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (58, 'DP00000011', 'RC0001', 'ATC0000004', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (59, 'DP00000011', 'RC0001', 'ATC0000005', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (60, 'DP00000011', 'RC0001', 'ATC0000006', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (61, 'DP00000012', 'RC0001', 'ATC0000008', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (62, 'DP00000012', 'RC0001', 'ATC0000009', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (63, 'DP00000012', 'RC0001', 'ATC0000010', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (64, 'DP00000012', 'RC0001', 'ATC0000011', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (65, 'DP00000012', 'RC0001', 'ATC0000012', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (66, 'DP00000013', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (67, 'DP00000013', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (68, 'DP00000013', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (69, 'DP00000013', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (70, 'DP00000013', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (71, 'DP00000013', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (72, 'DP00000014', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (73, 'DP00000014', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (74, 'DP00000014', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (75, 'DP00000014', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (76, 'DP00000014', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (77, 'DP00000015', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (78, 'DP00000015', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (79, 'DP00000015', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (80, 'DP00000015', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (81, 'DP00000015', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (82, 'DP00000015', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (83, 'DP00000016', 'RC0001', 'ATC0000014', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (84, 'DP00000016', 'RC0001', 'ATC0000015', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (85, 'DP00000016', 'RC0001', 'ATC0000016', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (86, 'DP00000016', 'RC0001', 'ATC0000017', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (87, 'DP00000016', 'RC0001', 'ATC0000018', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (88, 'DP00000017', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (89, 'DP00000017', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (90, 'DP00000017', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (100, 'DP00000017', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (101, 'DP00000017', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (102, 'DP00000017', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (103, 'DP00000018', 'RC0001', 'ATC0000008', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (104, 'DP00000018', 'RC0001', 'ATC0000009', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (105, 'DP00000018', 'RC0001', 'ATC0000010', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (106, 'DP00000018', 'RC0001', 'ATC0000011', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (107, 'DP00000018', 'RC0001', 'ATC0000012', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (108, 'DP00000019', 'RC0001', 'ATC0000020', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (109, 'DP00000019', 'RC0001', 'ATC0000021', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (110, 'DP00000019', 'RC0001', 'ATC0000022', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (111, 'DP00000019', 'RC0001', 'ATC0000023', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (112, 'DP00000019', 'RC0001', 'ATC0000024', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (113, 'DP00000019', 'RC0001', 'ATC0000025', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (114, 'DP00000020', 'RC0001', 'ATC0000008', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (115, 'DP00000020', 'RC0001', 'ATC0000009', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (116, 'DP00000020', 'RC0001', 'ATC0000010', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (117, 'DP00000020', 'RC0001', 'ATC0000011', 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_ControlViaje`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000001', 1, 1, 'DP00000001', 'RC0001', '2013-05-01', '3:00', '2:00', '');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000002', 2, 1, 'DP00000001', 'RC0001', '2013-05-01', '3:00', '2:00', '');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000003', 1, 2, 'DP00000001', 'RC0001', '2013-05-01', '2:00', '2:00', '');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000004', 2, 2, 'DP00000001', 'RC0001', '2013-05-01', '2:00', '2:00', '');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000005', 1, 3, 'DP00000001', 'RC0001', '2013-05-01', '1:30', '1:30', '');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000006', 2, 3, 'DP00000001', 'RC0001', '2013-05-01', '1:30', '1:30', 'En mi segundo viaje el Motor tiene problemas');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000007', 1, 4, 'DP00000001', 'RC0001', '2013-05-01', '2:00', '2:00', '');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000008', 2, 4, 'DP00000001', 'RC0001', '2013-05-01', '2:00', '2:00', 'revisar frenos antes de fin de mes...');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000009', 1, 5, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000010', 2, 5, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000011', 1, 6, 'DP00000002', 'RC0001', '2013-05-02', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000012', 2, 6, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000013', 1, 7, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000014', 2, 7, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000015', 1, 8, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000016', 2, 8, 'DP00000002', 'RC0001', '2013-05-02', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000017', 1, 9, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000018', 2, 9, 'DP00000002', 'RC0001', '2013-05-02', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000019', 1, 10, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000020', 2, 10, 'DP00000002', 'RC0001', '2013-05-02', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000021', 1, 11, 'DP00000003', 'RC0001', '2013-05-03', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000022', 2, 11, 'DP00000003', 'RC0001', '2013-05-03', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000023', 1, 12, 'DP00000003', 'RC0001', '2013-05-03', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000024', 2, 12, 'DP00000003', 'RC0001', '2013-05-03', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000025', 1, 13, 'DP00000003', 'RC0001', '2013-05-03', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000026', 2, 13, 'DP00000003', 'RC0001', '2013-05-03', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000027', 1, 14, 'DP00000003', 'RC0001', '2013-05-03', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000028', 2, 14, 'DP00000003', 'RC0001', '2013-05-03', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000029', 1, 15, 'DP00000003', 'RC0001', '2013-05-03', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000030', 2, 15, 'DP00000003', 'RC0001', '2013-05-03', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000031', 1, 16, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000032', 2, 16, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000033', 1, 17, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000034', 2, 17, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000035', 1, 18, 'DP00000004', 'RC0001', '2013-05-04', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000036', 2, 18, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000037', 1, 19, 'DP00000004', 'RC0001', '2013-05-04', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000038', 2, 19, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000039', 1, 20, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000040', 2, 20, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000041', 1, 21, 'DP00000004', 'RC0001', '2013-05-04', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000042', 2, 21, 'DP00000004', 'RC0001', '2013-05-04', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000043', 1, 28, 'DP00000006', 'RC0001', '2013-05-06', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000044', 2, 28, 'DP00000006', 'RC0001', '2013-05-06', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000045', 1, 29, 'DP00000006', 'RC0001', '2013-05-06', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000046', 2, 29, 'DP00000006', 'RC0001', '2013-05-06', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000047', 1, 30, 'DP00000006', 'RC0001', '2013-05-06', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000048', 2, 30, 'DP00000006', 'RC0001', '2013-05-06', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000049', 1, 31, 'DP00000006', 'RC0001', '2013-05-06', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000050', 2, 31, 'DP00000006', 'RC0001', '2013-05-06', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000051', 1, 32, 'DP00000006', 'RC0001', '2013-05-06', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000052', 2, 32, 'DP00000006', 'RC0001', '2013-05-06', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000053', 1, 22, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000054', 2, 22, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000055', 1, 23, 'DP00000005', 'RC0001', '2013-05-05', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000056', 2, 23, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000057', 1, 24, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000058', 2, 24, 'DP00000005', 'RC0001', '2013-05-05', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000059', 1, 25, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000060', 2, 25, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000061', 1, 26, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000062', 2, 26, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000063', 1, 27, 'DP00000005', 'RC0001', '2013-05-05', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000064', 2, 27, 'DP00000005', 'RC0001', '2013-05-05', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000065', 1, 33, 'DP00000007', 'RC0001', '2013-05-07', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000066', 2, 33, 'DP00000007', 'RC0001', '2013-05-07', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000067', 1, 34, 'DP00000007', 'RC0001', '2013-05-07', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000068', 2, 34, 'DP00000007', 'RC0001', '2013-05-07', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000069', 1, 35, 'DP00000007', 'RC0001', '2013-05-07', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000070', 2, 35, 'DP00000007', 'RC0001', '2013-05-07', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000071', 1, 36, 'DP00000007', 'RC0001', '2013-05-07', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000072', 2, 36, 'DP00000007', 'RC0001', '2013-05-07', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000073', 1, 37, 'DP00000007', 'RC0001', '2013-05-07', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000074', 2, 37, 'DP00000007', 'RC0001', '2013-05-07', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000075', 1, 39, 'DP00000008', 'RC0001', '2013-05-08', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000076', 2, 39, 'DP00000008', 'RC0001', '2013-05-08', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000077', 1, 40, 'DP00000008', 'RC0001', '2013-05-08', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000078', 2, 40, 'DP00000008', 'RC0001', '2013-05-08', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000079', 1, 41, 'DP00000008', 'RC0001', '2013-05-08', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000080', 2, 41, 'DP00000008', 'RC0001', '2013-05-08', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000081', 1, 42, 'DP00000008', 'RC0001', '2013-05-08', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000082', 2, 42, 'DP00000008', 'RC0001', '2013-05-08', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000083', 1, 43, 'DP00000008', 'RC0001', '2013-05-08', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000084', 2, 43, 'DP00000008', 'RC0001', '2013-05-08', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000085', 1, 44, 'DP00000009', 'RC0001', '2013-05-09', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000086', 2, 44, 'DP00000009', 'RC0001', '2013-05-09', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000087', 1, 45, 'DP00000009', 'RC0001', '2013-05-09', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000088', 2, 45, 'DP00000009', 'RC0001', '2013-05-09', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000089', 1, 46, 'DP00000009', 'RC0001', '2013-05-09', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000090', 2, 46, 'DP00000009', 'RC0001', '2013-05-09', '4:00', '', 'En mi segundo viaje el Motor tiene problemas');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000091', 1, 47, 'DP00000009', 'RC0001', '2013-05-09', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000092', 2, 47, 'DP00000009', 'RC0001', '2013-05-09', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000093', 1, 48, 'DP00000009', 'RC0001', '2013-05-09', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000094', 2, 48, 'DP00000009', 'RC0001', '2013-05-09', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000095', 1, 49, 'DP00000009', 'RC0001', '2013-05-09', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000096', 2, 49, 'DP00000009', 'RC0001', '2013-05-09', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000097', 1, 50, 'DP00000010', 'RC0001', '2013-05-10', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000098', 2, 50, 'DP00000010', 'RC0001', '2013-05-10', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000099', 1, 51, 'DP00000010', 'RC0001', '2013-05-10', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000100', 2, 51, 'DP00000010', 'RC0001', '2013-05-10', '3:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000101', 1, 52, 'DP00000010', 'RC0001', '2013-05-10', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000102', 2, 52, 'DP00000010', 'RC0001', '2013-05-10', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000103', 1, 53, 'DP00000010', 'RC0001', '2013-05-10', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000104', 2, 53, 'DP00000010', 'RC0001', '2013-05-10', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000105', 1, 54, 'DP00000010', 'RC0001', '2013-05-10', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000106', 2, 54, 'DP00000010', 'RC0001', '2013-05-10', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000107', 1, 55, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000108', 2, 55, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000109', 1, 56, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000110', 2, 56, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000111', 1, 57, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000112', 2, 57, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000113', 1, 58, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000114', 2, 58, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000115', 1, 59, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000116', 2, 59, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000117', 1, 60, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000118', 2, 60, 'DP00000011', 'RC0001', '2013-05-11', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000119', 1, 61, 'DP00000012', 'RC0001', '2013-05-12', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000120', 2, 61, 'DP00000012', 'RC0001', '2013-05-12', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000121', 1, 62, 'DP00000012', 'RC0001', '2013-05-12', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000122', 2, 62, 'DP00000012', 'RC0001', '2013-05-12', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000123', 1, 63, 'DP00000012', 'RC0001', '2013-05-12', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000124', 2, 63, 'DP00000012', 'RC0001', '2013-05-12', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000125', 1, 64, 'DP00000012', 'RC0001', '2013-05-12', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000126', 2, 64, 'DP00000012', 'RC0001', '2013-05-12', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000127', 1, 65, 'DP00000012', 'RC0001', '2013-05-12', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000128', 2, 65, 'DP00000012', 'RC0001', '2013-05-12', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000129', 1, 66, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000130', 2, 66, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000131', 1, 67, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000132', 2, 67, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000133', 1, 68, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000134', 2, 68, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000135', 1, 69, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000136', 2, 69, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000137', 1, 70, 'DP00000013', 'RC0001', '2013-05-13', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000138', 2, 70, 'DP00000013', 'RC0001', '2013-05-13', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000139', 1, 71, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000140', 2, 71, 'DP00000013', 'RC0001', '2013-05-13', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000141', 1, 72, 'DP00000014', 'RC0001', '2013-05-14', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000142', 2, 72, 'DP00000014', 'RC0001', '2013-05-14', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000143', 1, 73, 'DP00000014', 'RC0001', '2013-05-14', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000144', 2, 73, 'DP00000014', 'RC0001', '2013-05-14', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000145', 1, 74, 'DP00000014', 'RC0001', '2013-05-14', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000146', 2, 74, 'DP00000014', 'RC0001', '2013-05-14', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000147', 1, 75, 'DP00000014', 'RC0001', '2013-05-14', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000148', 2, 75, 'DP00000014', 'RC0001', '2013-05-14', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000149', 1, 76, 'DP00000014', 'RC0001', '2013-05-14', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000150', 2, 76, 'DP00000014', 'RC0001', '2013-05-14', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000151', 1, 77, 'DP00000015', 'RC0001', '2013-05-15', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000152', 2, 77, 'DP00000015', 'RC0001', '2013-05-15', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000153', 1, 78, 'DP00000015', 'RC0001', '2013-05-15', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000154', 2, 78, 'DP00000015', 'RC0001', '2013-05-15', '4:00', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000155', 1, 79, 'DP00000015', 'RC0001', '2013-05-15', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000156', 2, 79, 'DP00000015', 'RC0001', '2013-05-15', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000157', 1, 80, 'DP00000015', 'RC0001', '2013-05-15', '', '', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000158', 2, 80, 'DP00000015', 'RC0001', '2013-05-15', '', '', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_AsignarRuta`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_AsignarRuta` (`CdRuta`, `Nro`, `cdDespacho`, `cdRuc`, `LATN`, `LNGN`, `LATS`, `LNGS`, `nroV`, `obs`) VALUES ('AR00000001', 1, 'DP00000001', 'RC0001', -12.0781204770152, -76.9894412333984, -12.0639059602679, -76.9752272333984, 1, NULL);
INSERT INTO `BD_EMCH`.`T_AsignarRuta` (`CdRuta`, `Nro`, `cdDespacho`, `cdRuc`, `LATN`, `LNGN`, `LATS`, `LNGS`, `nroV`, `obs`) VALUES ('AR00000002', 2, 'DP00000001', 'RC0001', -12.088045, -77.023902, -12.074712, -77.013164, 1, 'Asignacion2');
INSERT INTO `BD_EMCH`.`T_AsignarRuta` (`CdRuta`, `Nro`, `cdDespacho`, `cdRuc`, `LATN`, `LNGN`, `LATS`, `LNGS`, `nroV`, `obs`) VALUES ('AR00000003', 3, 'DP00000001', 'RC0001', -12.0802816831162, -77.0120056834105, -12.0687112031478, -77.0028737361449, 1, NULL);
INSERT INTO `BD_EMCH`.`T_AsignarRuta` (`CdRuta`, `Nro`, `cdDespacho`, `cdRuc`, `LATN`, `LNGN`, `LATS`, `LNGS`, `nroV`, `obs`) VALUES ('AR00000004', 4, 'DP00000001', 'RC0001', -12.0574727359001, -77.0246318156737, -12.0432571245882, -77.0104178156737, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Incidencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000001', 'CV00000001', 1, '2013-05-01', 'zona abc', 'frenos', '01:00', NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000002', 'CV00000002', 2, '2013-05-01', 'zona dcf', 'kilometraje', '02:00', NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000003', 'CV00000003', 1, '2013-05-01', 'Campo mar', 'gasolina', '04:00', NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000004', 'CV00000004', 2, '2013-05-01', 'Parque los heros', 'repuestos', '07:00', NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Incidencia` (`cdInc`, `cdControlViaje`, `nroViaje`, `fechaInc`, `zona`, `problema`, `horaProb`, `observaciones`, `soluc`) VALUES ('CI00000005', 'CV00000005', 1, '2013-05-01', 'Parque olivar', 'accidente', '6:00', NULL, 'se envio personal de auxilio');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_GrupoAcceso`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_GrupoAcceso` (`cdGA`, `descrip`, `estado`) VALUES (1, 'Administracion', 1);
INSERT INTO `BD_EMCH`.`T_GrupoAcceso` (`cdGA`, `descrip`, `estado`) VALUES (2, 'Supervisor', 1);
INSERT INTO `BD_EMCH`.`T_GrupoAcceso` (`cdGA`, `descrip`, `estado`) VALUES (3, 'Despachador', 1);
INSERT INTO `BD_EMCH`.`T_GrupoAcceso` (`cdGA`, `descrip`, `estado`) VALUES (4, 'Contador', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_AccesoE`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_AccesoE` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (1, 'PF01', 1, 'RC0001');
INSERT INTO `BD_EMCH`.`T_AccesoE` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (2, 'PF02', 1, 'RC0001');
INSERT INTO `BD_EMCH`.`T_AccesoE` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (3, 'PF03', 1, 'RC0001');
INSERT INTO `BD_EMCH`.`T_AccesoE` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (4, 'PF04', 1, 'RC0001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Menu`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM000', 'SEGURIDAD', '', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM001', 'CAMBIAR CONTRASEÑA', '#', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM002', 'Administrar Usuario', '../faces/emch-seguridad/usuario.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM003', 'Administrar Perfil', '#', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM004', 'ADMINISTRACION', NULL, 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM005', 'Trabajador', '../faces/emch-administracion/trabajador.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM006', 'Empresa', '../faces/emch-administracion/empresa.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM007', 'Camión', '../faces/emch-administracion/camion.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM008', 'Verificar Comprobantes', '../faces/emch-administracion/verificarcomprobante.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM009', 'CONTROL DE TRANSPORTE', NULL, 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM010', 'Despacho', '../faces/emch-control/HojaDeDespacho.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM011', 'Control de Viaje', '../faces/emch-administracion/controlviaje.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM012', 'Asignar Ruta', '../faces/emch-control/listardespacho.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM013', 'Incidencia - Problemas', '../faces/emch-control/incidencia.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM014', 'Asistencia', '../faces/emch-control/Asistencia.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM015', 'OPERACIONES', NULL, 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM016', 'Comprobante', '../faces/emch-operaciones/comprobante.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM017', 'Generar Comprobante', '../faces/emch-operaciones/vistaliquidaciones.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM018', 'Liquidación', '../faces/emch-operaciones/ConsultarLiquidacion.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM019', 'Reporte (estadistíco)', '../faces/emch-operaciones/reporte.xhtml', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_AccesoM`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (1, 1, 'ADM000', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (2, 1, 'ADM001', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (3, 1, 'ADM002', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (4, 1, 'ADM003', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (5, 1, 'ADM004', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (6, 1, 'ADM005', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (7, 1, 'ADM006', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (8, 1, 'ADM007', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (9, 1, 'ADM008', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (10, 1, 'ADM009', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (11, 1, 'ADM010', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (12, 1, 'ADM011', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (13, 1, 'ADM012', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (14, 1, 'ADM013', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (15, 1, 'ADM014', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (16, 1, 'ADM015', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (17, 1, 'ADM016', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (18, 1, 'ADM017', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (19, 1, 'ADM018', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (20, 1, 'ADM019', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (21, 2, 'ADM004', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (22, 2, 'ADM005', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (23, 2, 'ADM006', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (24, 2, 'ADM007', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (25, 2, 'ADM008', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (26, 2, 'ADM009', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (27, 2, 'ADM010', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (28, 2, 'ADM011', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (29, 2, 'ADM012', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (30, 2, 'ADM013', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (31, 2, 'ADM014', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (32, 2, 'ADM015', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (33, 2, 'ADM016', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (34, 2, 'ADM017', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (35, 2, 'ADM018', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (36, 2, 'ADM019', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (37, 3, 'ADM004', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (38, 3, 'ADM005', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (39, 3, 'ADM006', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (40, 3, 'ADM007', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (41, 3, 'ADM008', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (42, 3, 'ADM009', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (43, 3, 'ADM010', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (44, 3, 'ADM011', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (45, 3, 'ADM012', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (46, 3, 'ADM013', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (47, 3, 'ADM014', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (48, 4, 'ADM015', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (49, 4, 'ADM016', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (50, 4, 'ADM017', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (51, 4, 'ADM018', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (52, 4, 'ADM019', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_TipoLiquidacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_TipoLiquidacion` (`cdTipoLiq`, `Nombre`) VALUES ('TL01', 'Mensual');
INSERT INTO `BD_EMCH`.`T_TipoLiquidacion` (`cdTipoLiq`, `Nombre`) VALUES ('TL02', 'Semanal');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Liquidacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Liquidacion` (`cdLiq`, `cdRuc`, `cdTipoLiq`, `fechaApertura`, `fechaInicio`, `fechaFin`, `totalTN`, `asunto`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`) VALUES ('LQ00000001', 'RC0001', 'TL01', '2013-02-02 14:38:54', '2013-01-01 00:00:00', '2013-01-31 00:00:00', 51.87, 'Apertura de Liquidación para Munic. San Luis', 'coropeza', '2013-02-02 14:38:54', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Pesaje`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000001', 'CV00000001', 1, 'LQ00000001', 52048, '2013-05-01', 19.19, 12.64, 6.55, 'CC', 'coropeza', '2013-05-01', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000002', 'CV00000002', 2, 'LQ00000001', 52644, '2013-05-01', 22.55, 14.13, 8.42, 'CC', 'coropeza', '2013-05-01', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000003', 'CV00000003', 1, 'LQ00000001', 52764, '2013-05-01', 24.36, 12.49, 11.87, 'CC', 'dparraga', '2013-05-01', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000004', 'CV00000004', 2, 'LQ00000001', 52058, '2013-05-01', 24.98, 12.53, 12.45, 'CC', 'coropeza', '2013-05-01', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000005', 'CV00000005', 1, 'LQ00000001', 52103, '2013-05-01', 25.36, 12.78, 12.58, 'CC', 'coropeza', '2013-05-01', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000006', 'CV00000006', 2, NULL, 52143, '2013-05-01', 27.44, 14.07, 13.37, 'PP', 'coropeza', '2013-05-01', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000007', 'CV00000007', 1, NULL, 52187, '2013-05-01', 24.28, 12.66, 11.62, 'PP', 'dparraga', '2013-05-01', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000008', 'CV00000008', 2, NULL, 52232, '2013-05-01', 25.46, 14.12, 11.34, 'PP', 'coropeza', '2013-05-01', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000009', 'CV00000009', 1, NULL, 52275, '2013-05-02', 25.73, 14.15, 11.58, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000010', 'CV00000010', 2, NULL, 52317, '2013-05-02', 25.78, 12.50, 13.28, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000011', 'CV00000011', 1, NULL, 52355, '2013-05-02', 24.20, 12.76, 11.44, 'PP', 'dparraga', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000012', 'CV00000012', 2, NULL, 52398, '2013-05-02', 23.66, 12.51, 11.15, 'PP', 'dparraga', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000013', 'CV00000013', 1, NULL, 52442, '2013-05-02', 22.81, 12.67, 10.14, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000014', 'CV00000014', 2, NULL, 52487, '2013-05-02', 25.22, 14.10, 11.12, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000015', 'CV00000015', 1, NULL, 52529, '2013-05-02', 22.99, 12.78, 10.21, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000016', 'CV00000016', 2, NULL, 52574, '2013-05-02', 23.19, 12.60, 10.59, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000017', 'CV00000017', 1, NULL, 52616, '2013-05-02', 26.06, 14.22, 11.84, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000018', 'CV00000018', 2, NULL, 52654, '2013-05-02', 22.79, 12.52, 10.27, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000019', 'CV00000019', 1, NULL, 52691, '2013-05-02', 22.71, 12.75, 9.96, 'PP', 'dparraga', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000020', 'CV00000020', 2, NULL, 52731, '2013-05-02', 24.11, 14.17, 9.94, 'PP', 'mvalois', '2013-05-02', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000021', 'CV00000021', 1, NULL, 52773, '2013-05-03', 22.56, 12.46, 10.10, 'PP', 'mvalois', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000022', 'CV00000022', 2, NULL, 52814, '2013-05-03', 23.64, 12.73, 10.91, 'PP', 'dparraga', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000023', 'CV00000023', 1, NULL, 52890, '2013-05-03', 24.48, 12.61, 11.87, 'PP', 'coropeza', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000024', 'CV00000024', 2, NULL, 52905, '2013-05-03', 24.55, 14.08, 10.47, 'PP', 'dparraga', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000025', 'CV00000025', 1, NULL, 52942, '2013-05-03', 21.82, 12.68, 9.14, 'PP', 'coropeza', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000026', 'CV00000026', 2, NULL, 52983, '2013-05-03', 23.49, 14.07, 9.42, 'PP', 'coropeza', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000027', 'CV00000027', 1, NULL, 53027, '2013-05-03', 23.40, 12.45, 10.95, 'PP', 'dparraga', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000028', 'CV00000028', 2, NULL, 53071, '2013-05-03', 23.94, 12.75, 11.19, 'PP', 'coropeza', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000029', 'CV00000029', 1, NULL, 53117, '2013-05-03', 26.01, 14.01, 12.00, 'PP', 'dparraga', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000030', 'CV00000030', 2, NULL, 53159, '2013-05-03', 23.98, 12.59, 11.39, 'PP', 'vnunez', '2013-05-03', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000031', 'CV00000031', 1, NULL, 53204, '2013-05-04', 22.78, 12.70, 10.08, 'PP', 'mvalois', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000032', 'CV00000032', 2, NULL, 52233, '2013-05-04', 24.78, 14.00, 10.78, 'PP', 'mvalois', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000033', 'CV00000033', 1, NULL, 52276, '2013-05-04', 22.29, 12.46, 9.83, 'PP', 'vnunez', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000034', 'CV00000034', 2, NULL, 52518, '2013-05-04', 22.87, 12.73, 10.14, 'PP', 'mvalois', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000035', 'CV00000035', 1, NULL, 52562, '2013-05-04', 23.02, 12.61, 10.41, 'PP', 'vnunez', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000036', 'CV00000036', 2, NULL, 52804, '2013-05-04', 24.98, 13.99, 10.99, 'PP', 'mvalois', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000037', 'CV00000037', 1, NULL, 52861, '2013-05-04', 21.15, 12.62, 8.53, 'PP', 'dparraga', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000038', 'CV00000038', 2, NULL, 52976, '2013-05-04', 24.64, 13.91, 10.73, 'PP', 'coropeza', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000039', 'CV00000039', 1, NULL, 53190, '2013-05-04', 21.55, 12.49, 9.06, 'PP', 'coropeza', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000040', 'CV00000040', 2, NULL, 53233, '2013-05-04', 21.40, 12.62, 8.78, 'PP', 'dparraga', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000041', 'CV00000041', 1, NULL, 53103, '2013-05-04', 24.53, 14.09, 10.44, 'PP', 'coropeza', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000042', 'CV00000042', 2, NULL, 53148, '2013-05-04', 25.91, 12.79, 13.12, 'PP', 'coropeza', '2013-05-04', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000043', 'CV00000043', 1, NULL, 52192, '2013-05-06', 20.79, 14.03, 6.76, 'PP', 'dparraga', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000044', 'CV00000044', 2, NULL, 52476, '2013-05-06', 19.42, 12.46, 6.96, 'PP', 'coropeza', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000045', 'CV00000045', 1, NULL, 52521, '2013-05-06', 24.11, 12.46, 11.65, 'PP', 'vnunez', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000046', 'CV00000046', 2, NULL, 52895, '2013-05-06', 23.40, 12.76, 10.64, 'PP', 'mvalois', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000047', 'CV00000047', 1, NULL, 52097, '2013-05-06', 23.18, 12.56, 10.62, 'PP', 'vnunez', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000048', 'CV00000048', 2, NULL, 52224, '2013-05-06', 25.49, 14.10, 11.39, 'PP', 'mvalois', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000049', 'CV00000049', 1, NULL, 52978, '2013-05-06', 20.85, 12.65, 8.20, 'PP', 'vnunez', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000050', 'CV00000050', 2, NULL, 53023, '2013-05-06', 24.42, 13.98, 10.44, 'PP', 'mvalois', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000051', 'CV00000051', 1, NULL, 52718, '2013-05-06', 23.28, 12.47, 10.81, 'PP', 'vnunez', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000052', 'CV00000052', 2, NULL, 52183, '2013-05-06', 24.84, 12.75, 12.09, 'PP', 'mvalois', '2013-05-06', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000053', 'CV00000053', 1, NULL, 52267, '2013-05-05', 24.48, 13.99, 10.49, 'PP', 'vnunez', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000054', 'CV00000054', 2, NULL, 52350, '2013-05-05', 25.13, 12.61, 12.52, 'PP', 'dparraga', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000055', 'CV00000055', 1, NULL, 52390, '2013-05-05', 21.09, 12.67, 8.42, 'PP', 'mvalois', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000056', 'CV00000056', 2, NULL, 52436, '2013-05-05', 25.55, 13.88, 11.67, 'PP', 'mvalois', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000057', 'CV00000057', 1, NULL, 52520, '2013-05-05', 23.30, 12.51, 10.79, 'PP', 'dparraga', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000058', 'CV00000058', 2, NULL, 52564, '2013-05-05', 23.03, 12.72, 10.31, 'PP', 'mvalois', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000059', 'CV00000059', 1, NULL, 52683, '2013-05-05', 24.14, 12.60, 11.54, 'PP', 'coropeza', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000060', 'CV00000060', 2, NULL, 52807, '2013-05-05', 26.67, 13.98, 12.69, 'PP', 'dparraga', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000061', 'CV00000061', 1, NULL, 52851, '2013-05-05', 23.67, 12.68, 10.99, 'PP', 'coropeza', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000062', 'CV00000062', 2, NULL, 52936, '2013-05-05', 23.91, 13.97, 9.94, 'PP', 'coropeza', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000063', 'CV00000063', 1, NULL, 53066, '2013-05-05', 26.98, 14.06, 12.92, 'PP', 'dparraga', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000064', 'CV00000064', 2, NULL, 53107, '2013-05-05', 24.59, 12.64, 11.95, 'PP', 'coropeza', '2013-05-05', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000065', 'CV00000065', 1, NULL, 53149, '2013-05-07', 22.86, 12.72, 10.14, 'PP', 'dparraga', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000066', 'CV00000066', 2, NULL, 53193, '2013-05-07', 23.35, 12.48, 10.87, 'PP', 'mvalois', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000067', 'CV00000067', 1, NULL, 52606, '2013-05-07', 22.28, 12.68, 9.60, 'PP', 'ecardenas', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000068', 'CV00000068', 2, NULL, 52996, '2013-05-07', 25.87, 14.02, 11.85, 'PP', 'mvalois', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000069', 'CV00000069', 1, NULL, 53014, '2013-05-07', 21.49, 12.50, 8.99, 'PP', 'ecardenas', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000070', 'CV00000070', 2, NULL, 52847, '2013-05-07', 23.43, 12.74, 10.69, 'PP', 'mvalois', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000071', 'CV00000071', 1, NULL, 52140, '2013-05-07', 23.71, 12.67, 11.04, 'PP', 'mvalois', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000072', 'CV00000072', 2, NULL, 52311, '2013-05-07', 26.40, 14.01, 12.39, 'PP', 'ecardenas', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000073', 'CV00000073', 1, NULL, 52719, '2013-05-07', 23.08, 12.70, 10.38, 'PP', 'mvalois', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000074', 'CV00000074', 2, NULL, 52762, '2013-05-07', 26.11, 13.99, 12.12, 'PP', 'ecardenas', '2013-05-07', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000075', 'CV00000075', 1, NULL, 52151, '2013-05-08', 23.71, 12.55, 11.16, 'PP', 'ecardenas', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000076', 'CV00000076', 2, NULL, 52603, '2013-05-08', 24.56, 12.59, 11.97, 'PP', 'mvalois', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000077', 'CV00000077', 1, NULL, 52821, '2013-05-08', 23.18, 12.77, 10.41, 'PP', 'ecardenas', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000078', 'CV00000078', 2, NULL, 52934, '2013-05-08', 26.30, 14.07, 12.23, 'PP', 'mvalois', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000079', 'CV00000079', 1, NULL, 53063, '2013-05-08', 24.76, 13.94, 10.82, 'PP', 'ecardenas', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000080', 'CV00000080', 2, NULL, 52066, '2013-05-08', 21.66, 12.57, 9.09, 'PP', 'dparraga', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000081', 'CV00000081', 1, NULL, 52109, '2013-05-08', 23.71, 14.19, 9.52, 'PP', 'coropeza', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000082', 'CV00000082', 2, NULL, 52142, '2013-05-08', 22.34, 12.80, 9.54, 'PP', 'dparraga', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000083', 'CV00000083', 1, NULL, 52235, '2013-05-08', 22.50, 12.60, 9.90, 'PP', 'coropeza', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000084', 'CV00000084', 2, NULL, 52280, '2013-05-08', 19.86, 12.63, 7.23, 'PP', 'coropeza', '2013-05-08', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000085', 'CV00000085', 1, NULL, 52322, '2013-05-09', 20.99, 12.68, 8.31, 'PP', 'dparraga', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000086', 'CV00000086', 2, NULL, 52361, '2013-05-09', 24.25, 14.05, 10.20, 'PP', 'coropeza', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000087', 'CV00000087', 1, NULL, 52402, '2013-05-09', 25.48, 12.76, 12.72, 'PP', 'dparraga', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000088', 'CV00000088', 2, NULL, 52446, '2013-05-09', 23.85, 12.64, 11.21, 'PP', 'ecardenas', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000089', 'CV00000089', 1, NULL, 52492, '2013-05-09', 26.36, 14.08, 12.28, 'PP', 'dparraga', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000090', 'CV00000090', 2, NULL, 52533, '2013-05-09', 23.61, 12.51, 11.10, 'PP', 'mvalois', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000091', 'CV00000091', 1, NULL, 52575, '2013-05-09', 23.34, 12.65, 10.69, 'PP', 'dparraga', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000092', 'CV00000092', 2, NULL, 52618, '2013-05-09', 26.74, 14.05, 12.69, 'PP', 'mvalois', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000093', 'CV00000093', 1, NULL, 52653, '2013-05-09', 24.30, 12.51, 11.79, 'PP', 'ecardenas', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000094', 'CV00000094', 2, NULL, 52693, '2013-05-09', 23.33, 12.72, 10.61, 'PP', 'mvalois', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000095', 'CV00000095', 1, NULL, 52734, '2013-05-09', 24.35, 14.12, 10.23, 'PP', 'dparraga', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000096', 'CV00000096', 2, NULL, 52776, '2013-05-09', 24.80, 12.70, 12.10, 'PP', 'mvalois', '2013-05-09', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000097', 'CV00000097', 1, NULL, 52865, '2013-05-10', 22.19, 12.65, 9.54, 'PP', 'coropeza', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000098', 'CV00000098', 2, NULL, 52910, '2013-05-10', 25.94, 14.08, 11.86, 'PP', 'dparraga', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000099', 'CV00000099', 1, NULL, 52948, '2013-05-10', 23.57, 12.52, 11.05, 'PP', 'dparraga', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000100', 'CV00000100', 2, NULL, 52989, '2013-05-10', 24.59, 14.05, 10.54, 'PP', 'coropeza', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000101', 'CV00000101', 1, NULL, 53033, '2013-05-10', 23.00, 12.66, 10.34, 'PP', 'coropeza', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000102', 'CV00000102', 2, NULL, 53078, '2013-05-10', 23.91, 12.58, 11.33, 'PP', 'coropeza', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000103', 'CV00000103', 1, NULL, 53119, '2013-05-10', 23.61, 12.56, 11.05, 'PP', 'coropeza', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000104', 'CV00000104', 2, NULL, 53162, '2013-05-10', 24.38, 13.99, 10.39, 'PP', 'dparraga', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000105', 'CV00000105', 1, NULL, 53206, '2013-05-10', 22.76, 12.52, 10.24, 'PP', 'ecardenas', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000106', 'CV00000106', 2, NULL, 52062, '2013-05-10', 22.62, 12.63, 9.99, 'PP', 'dparraga', '2013-05-10', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000107', 'CV00000107', 1, NULL, 52108, '2013-05-11', 24.04, 12.70, 11.34, 'PP', 'ecardenas', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000108', 'CV00000108', 2, NULL, 52190, '2013-05-11', 24.26, 14.00, 10.26, 'PP', 'mvalois', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000109', 'CV00000109', 1, NULL, 52321, '2013-05-11', 21.95, 12.60, 9.35, 'PP', 'dparraga', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000110', 'CV00000110', 2, NULL, 52357, '2013-05-11', 25.74, 13.99, 11.75, 'PP', 'ecardenas', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000111', 'CV00000111', 1, NULL, 52401, '2013-05-11', 23.13, 12.69, 10.44, 'PP', 'dparraga', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000112', 'CV00000112', 2, NULL, 52449, '2013-05-11', 23.57, 12.69, 10.88, 'PP', 'ecardenas', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000113', 'CV00000113', 1, NULL, 52532, '2013-05-11', 25.13, 14.08, 11.05, 'PP', 'coropeza', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000114', 'CV00000114', 2, NULL, 52578, '2013-05-11', 23.94, 12.50, 11.44, 'PP', 'dparraga', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000115', 'CV00000115', 1, NULL, 52615, '2013-05-11', 22.75, 12.64, 10.11, 'PP', 'coropeza', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000116', 'CV00000116', 2, NULL, 52682, '2013-05-11', 24.02, 13.98, 10.04, 'PP', 'dparraga', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000117', 'CV00000117', 1, NULL, 52692, '2013-05-11', 23.19, 12.54, 10.65, 'PP', 'coropeza', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000118', 'CV00000118', 2, NULL, 52733, '2013-05-11', 23.43, 12.71, 10.72, 'PP', 'coropeza', '2013-05-11', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000119', 'CV00000119', 1, NULL, 52774, '2013-05-12', 25.27, 14.12, 11.15, 'PP', 'coropeza', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000120', 'CV00000120', 2, NULL, 52819, '2013-05-12', 24.56, 12.72, 11.84, 'PP', 'dparraga', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000121', 'CV00000121', 1, NULL, 52862, '2013-05-12', 23.89, 12.69, 11.20, 'PP', 'ecardenas', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000122', 'CV00000122', 2, NULL, 52907, '2013-05-12', 20.15, 12.49, 7.66, 'PP', 'ecardenas', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000123', 'CV00000123', 1, NULL, 52945, '2013-05-12', 23.28, 12.77, 10.51, 'PP', 'ecardenas', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000124', 'CV00000124', 2, NULL, 53018, '2013-05-12', 22.57, 12.78, 9.79, 'PP', 'ecardenas', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000125', 'CV00000125', 1, NULL, 53030, '2013-05-12', 27.07, 14.14, 12.93, 'PP', 'ecardenas', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000126', 'CV00000126', 2, NULL, 53074, '2013-05-12', 21.74, 12.54, 9.20, 'PP', 'ecardenas', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000127', 'CV00000127', 1, NULL, 53118, '2013-05-12', 20.69, 12.60, 8.09, 'PP', 'ecardenas', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000128', 'CV00000128', 2, NULL, 53158, '2013-05-12', 24.64, 14.10, 10.54, 'PP', 'ecardenas', '2013-05-12', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000129', 'CV00000129', 1, NULL, 53205, '2013-05-13', 23.11, 12.64, 10.47, 'PP', 'ecardenas', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000130', 'CV00000130', 2, NULL, 52061, '2013-05-13', 24.28, 12.45, 11.83, 'PP', 'ecardenas', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000131', 'CV00000131', 1, NULL, 52104, '2013-05-13', 25.42, 12.84, 12.58, 'PP', 'coropeza', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000132', 'CV00000132', 2, NULL, 52150, '2013-05-13', 26.56, 14.10, 12.46, 'PP', 'dparraga', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000133', 'CV00000133', 1, NULL, 52194, '2013-05-13', 22.45, 12.61, 9.84, 'PP', 'coropeza', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000134', 'CV00000134', 2, NULL, 52234, '2013-05-13', 24.20, 13.95, 10.25, 'PP', 'coropeza', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000135', 'CV00000135', 1, NULL, 52279, '2013-05-13', 23.55, 12.40, 11.15, 'PP', 'coropeza', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000136', 'CV00000136', 2, NULL, 52320, '2013-05-13', 24.66, 12.59, 12.07, 'PP', 'dparraga', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000137', 'CV00000137', 1, NULL, 52362, '2013-05-13', 24.76, 12.70, 12.06, 'PP', 'coropeza', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000138', 'CV00000138', 2, NULL, 52403, '2013-05-13', 24.75, 13.96, 10.79, 'PP', 'dparraga', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000139', 'CV00000139', 1, NULL, 52444, '2013-05-13', 23.61, 12.56, 11.05, 'PP', 'ecardenas', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000140', 'CV00000140', 2, NULL, 52475, '2013-05-13', 24.28, 13.93, 10.35, 'PP', 'ecardenas', '2013-05-13', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000141', 'CV00000141', 1, NULL, 52490, '2013-05-14', 23.71, 12.41, 11.30, 'PP', 'dparraga', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000142', 'CV00000142', 2, NULL, 52491, '2013-05-14', 23.72, 12.64, 11.08, 'PP', 'ecardenas', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000143', 'CV00000143', 1, NULL, 52534, '2013-05-14', 24.18, 12.48, 11.70, 'PP', 'ecardenas', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000144', 'CV00000144', 2, NULL, 52583, '2013-05-14', 24.74, 14.02, 10.72, 'PP', 'ecardenas', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000145', 'CV00000145', 1, NULL, 52619, '2013-05-14', 23.44, 12.59, 10.85, 'PP', 'dparraga', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000146', 'CV00000146', 2, NULL, 52657, '2013-05-14', 21.84, 12.49, 9.35, 'PP', 'ecardenas', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000147', 'CV00000147', 1, NULL, 52694, '2013-05-14', 22.73, 12.57, 10.16, 'PP', 'coropeza', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000148', 'CV00000148', 2, NULL, 52737, '2013-05-14', 23.29, 12.78, 10.51, 'PP', 'coropeza', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000149', 'CV00000149', 1, NULL, 52775, '2013-05-14', 27.41, 14.33, 13.08, 'PP', 'coropeza', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000150', 'CV00000150', 2, NULL, 52820, '2013-05-14', 24.81, 12.65, 12.16, 'PP', 'coropeza', '2013-05-14', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000151', 'CV00000151', 1, NULL, 52868, '2013-05-15', 23.53, 12.56, 10.97, 'PP', 'coropeza', '2013-05-15', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000152', 'CV00000152', 2, NULL, 52909, '2013-05-15', 25.73, 13.92, 11.81, 'PP', 'dparraga', '2013-05-15', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000153', 'CV00000153', 1, NULL, 52949, '2013-05-15', 23.80, 12.77, 11.03, 'PP', 'coropeza', '2013-05-15', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000154', 'CV00000154', 2, NULL, 52987, '2013-05-15', 24.60, 14.10, 10.50, 'PP', 'coropeza', '2013-05-15', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000155', 'CV00000155', 1, NULL, 53032, '2013-05-15', 24.35, 12.67, 11.68, 'PP', 'ecardenas', '2013-05-15', NULL, NULL, '', 0x4E554C4C);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000156', 'CV00000156', 2, NULL, 53076, '2013-05-15', 24.62, 12.44, 12.18, 'PP', 'dparraga', '2013-05-15', NULL, NULL, '', 0x4E554C4C);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Comprobante`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Comprobante` (`idComprobante`, `cdLiq`, `tipoDocumento`, `fecMov`, `serie`, `nroDoc`, `moneda`, `total`, `subTotal`, `IGV`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `estado`) VALUES ('CP00000001', 'LQ00000001', 'FACTURA', '2013-06-01', '001', '145474', 'SS', 4180.722, 3386.38, 794.33, 'vnunez', '2013-06-01', NULL, NULL, 'PC');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Servicio` (`cdServicio`, `nombreServ`, `descripServ`, `nCortoServ`) VALUES ('SRV001', 'Servicio de Recoleccion de RSU', 'Servicio de Recolección, Transporte y Disposición Final de Residuos Sólidos', 'SRTRSU');
INSERT INTO `BD_EMCH`.`T_Servicio` (`cdServicio`, `nombreServ`, `descripServ`, `nCortoServ`) VALUES ('SRV002', 'Disposición Final de RSU', 'Disposición Final', 'DFRSU');
INSERT INTO `BD_EMCH`.`T_Servicio` (`cdServicio`, `nombreServ`, `descripServ`, `nCortoServ`) VALUES ('SRV003', 'Destrucción de Mercaderias', 'Destrucción de Material', 'DMRSU');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_ComprobanteDet`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_ComprobanteDet` (`item`, `cdServicio`, `idComprobante`, `precio`, `cantTN`, `total`) VALUES ('1', 'SRV001', 'CP00000001', 80.60, 51.87, 4180.722);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_EstadoLiq`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_EstadoLiq` (`cdEstadoLiq`, `Nombre`) VALUES ('EL1', 'Pendiente');
INSERT INTO `BD_EMCH`.`T_EstadoLiq` (`cdEstadoLiq`, `Nombre`) VALUES ('EL2', 'Liquidado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_EstadoxLiquidacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_EstadoxLiquidacion` (`fechaEstado`, `cdEstadoLiq`, `cdLiq`, `Obs`) VALUES ('2013-02-02 14:38:54', 'EL1', 'LQ00000001', 'Liquidacion Pendiente');

COMMIT;

