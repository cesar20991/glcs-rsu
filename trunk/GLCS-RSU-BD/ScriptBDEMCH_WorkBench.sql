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

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Perfil` (
  `cdPerfil` VARCHAR(4) NOT NULL ,
  `nombrePrf` VARCHAR(30) NOT NULL ,
  `descripPrf` VARCHAR(200) NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdPerfil`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Usuario` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Usuario` (
  `nomUsu` VARCHAR(10) NOT NULL COMMENT 'primer nombre seguido del apellido, EJM: coropeza' ,
  `cdPerfil` VARCHAR(4) NOT NULL ,
  `pass` VARCHAR(10) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`nomUsu`) ,
  INDEX `fk_T_Usuario_T_Perfil1_idx` (`cdPerfil` ASC) ,
  CONSTRAINT `fk_T_Usuario_T_Perfil1`
    FOREIGN KEY (`cdPerfil` )
    REFERENCES `BD_EMCH`.`T_Perfil` (`cdPerfil` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Ubigeo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Ubigeo` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Ubigeo` (
  `cdUbig` CHAR(6) NOT NULL ,
  `nombre` VARCHAR(50) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdUbig`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Empresa` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Empresa` (
  `cdRuc` CHAR(6) NOT NULL COMMENT 'Codigo Generado: RC0001,RC0002,...' ,
  `cdUbig` CHAR(6) NOT NULL ,
  `rucE` CHAR(11) NOT NULL ,
  `rSocial` VARCHAR(150) NOT NULL ,
  `fechaIni` DATETIME NOT NULL ,
  `direccion` VARCHAR(200) NOT NULL ,
  `telef` VARCHAR(15) NOT NULL ,
  `logo` BLOB NULL ,
  INDEX `fk_T_Empresa_T_Ubigeo1_idx` (`cdUbig` ASC) ,
  PRIMARY KEY (`cdRuc`) ,
  CONSTRAINT `fk_T_Empresa_T_Ubigeo1`
    FOREIGN KEY (`cdUbig` )
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Cliente` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Cliente` (
  `cdCliente` CHAR(10) NOT NULL COMMENT 'Codigo Generado: CLT0000001,CLT0000002,....' ,
  `cdRuc` CHAR(6) NOT NULL ,
  `nomUsu` VARCHAR(10) NOT NULL ,
  `cdUbig` CHAR(6) NOT NULL ,
  `nombreComp` VARCHAR(45) NOT NULL ,
  `tipoDocI` CHAR(1) NOT NULL ,
  `nroDocI` VARCHAR(15) NOT NULL ,
  `domicilio` VARCHAR(50) NOT NULL ,
  `telefono` VARCHAR(15) NULL ,
  `celular` VARCHAR(15) NULL ,
  `email` VARCHAR(45) NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdCliente`) ,
  INDEX `fk_T_Cliente_T_Ubigeo1_idx` (`cdUbig` ASC) ,
  INDEX `fk_T_Cliente_T_Usuario1_idx` (`nomUsu` ASC) ,
  INDEX `fk_T_Cliente_T_Empresa1_idx` (`cdRuc` ASC) ,
  CONSTRAINT `fk_T_Cliente_T_Ubigeo1`
    FOREIGN KEY (`cdUbig` )
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_T_Usuario1`
    FOREIGN KEY (`nomUsu` )
    REFERENCES `BD_EMCH`.`T_Usuario` (`nomUsu` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_T_Empresa1`
    FOREIGN KEY (`cdRuc` )
    REFERENCES `BD_EMCH`.`T_Empresa` (`cdRuc` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_TipoTrabajador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_TipoTrabajador` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_TipoTrabajador` (
  `cdTipoTrabajador` CHAR(3) NOT NULL ,
  `Nombre` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`cdTipoTrabajador`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Trabajador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Trabajador` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Trabajador` (
  `cdTrabajador` CHAR(6) NOT NULL ,
  `nomUsu` VARCHAR(10) NULL ,
  `cdTipoTrabajador` CHAR(3) NOT NULL ,
  `cdUbig` CHAR(6) NOT NULL ,
  `nombres` VARCHAR(45) NOT NULL ,
  `apellidos` VARCHAR(45) NOT NULL ,
  `DNI` VARCHAR(8) NOT NULL ,
  `telefono` VARCHAR(15) NULL ,
  `celular` VARCHAR(15) NULL ,
  `email` VARCHAR(45) NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdTrabajador`) ,
  INDEX `fk_T_Trabajador_T_TipoTrabajador1_idx` (`cdTipoTrabajador` ASC) ,
  INDEX `fk_T_Trabajador_T_Ubigeo1_idx` (`cdUbig` ASC) ,
  INDEX `fk_T_Trabajador_T_Usuario1_idx` (`nomUsu` ASC) ,
  CONSTRAINT `fk_T_Trabajador_T_TipoTrabajador1`
    FOREIGN KEY (`cdTipoTrabajador` )
    REFERENCES `BD_EMCH`.`T_TipoTrabajador` (`cdTipoTrabajador` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Trabajador_T_Ubigeo1`
    FOREIGN KEY (`cdUbig` )
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Trabajador_T_Usuario1`
    FOREIGN KEY (`nomUsu` )
    REFERENCES `BD_EMCH`.`T_Usuario` (`nomUsu` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Clase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Clase` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Clase` (
  `idClase` INT NOT NULL ,
  `Nombre` VARCHAR(40) NOT NULL ,
  `Descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idClase`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Marca` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Marca` (
  `idMarca` INT NOT NULL ,
  `nombreMarca` VARCHAR(40) NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idMarca`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Camion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Camion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Camion` (
  `cdCamion` CHAR(6) NOT NULL ,
  `idClase` INT NOT NULL ,
  `idMarca` INT NOT NULL ,
  `unidad` INT NOT NULL ,
  `placa` VARCHAR(8) NOT NULL ,
  `anioFab` CHAR(4) NOT NULL ,
  `anioAdq` CHAR(4) NOT NULL ,
  `nroMotor` VARCHAR(40) NOT NULL ,
  `pesoBruto` DECIMAL(5,4) NOT NULL ,
  `tipoCombustible` VARCHAR(20) NOT NULL ,
  `kilometraje` DECIMAL(13,4) NOT NULL ,
  `imagen` MEDIUMBLOB NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdCamion`) ,
  INDEX `fk_T_Camion_T_Clase1_idx` (`idClase` ASC) ,
  INDEX `fk_T_Camion_T_Marca1_idx` (`idMarca` ASC) ,
  CONSTRAINT `fk_T_Camion_T_Clase1`
    FOREIGN KEY (`idClase` )
    REFERENCES `BD_EMCH`.`T_Clase` (`idClase` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Camion_T_Marca1`
    FOREIGN KEY (`idMarca` )
    REFERENCES `BD_EMCH`.`T_Marca` (`idMarca` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Turno` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Turno` (
  `cdTurno` CHAR(4) NOT NULL ,
  `nombTurno` VARCHAR(20) NOT NULL ,
  `Obs` VARCHAR(100) NULL ,
  PRIMARY KEY (`cdTurno`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Despacho`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Despacho` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Despacho` (
  `cdDespacho` CHAR(10) NOT NULL ,
  `cdRuc` CHAR(6) NOT NULL ,
  `cdUbig` CHAR(6) NOT NULL ,
  `cdTurno` CHAR(4) NOT NULL ,
  `nroDespacho` CHAR(10) NOT NULL ,
  `fechaEmi` DATETIME NOT NULL ,
  `zona` VARCHAR(50) NOT NULL ,
  `dineroEnviado` DECIMAL(13,4) NULL ,
  `totalDineroUso` DECIMAL(13,4) NULL ,
  `totalDineroSinUso` DECIMAL(13,4) NULL ,
  `usuCrea` VARCHAR(10) NOT NULL ,
  `fechaReg` DATETIME NOT NULL ,
  `usuModf` VARCHAR(10) NULL ,
  `fechaModf` DATETIME NULL ,
  `evaluacion` CHAR(1) NULL ,
  `obs` VARCHAR(200) NULL ,
  PRIMARY KEY (`cdDespacho`, `cdRuc`) ,
  INDEX `fk_T_Despacho_T_Ubigeo1_idx` (`cdUbig` ASC) ,
  INDEX `fk_T_Despacho_T_Turno1_idx` (`cdTurno` ASC) ,
  INDEX `fk_T_Despacho_T_Empresa1_idx` (`cdRuc` ASC) ,
  CONSTRAINT `fk_T_Despacho_T_Ubigeo1`
    FOREIGN KEY (`cdUbig` )
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Despacho_T_Turno1`
    FOREIGN KEY (`cdTurno` )
    REFERENCES `BD_EMCH`.`T_Turno` (`cdTurno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Despacho_T_Empresa1`
    FOREIGN KEY (`cdRuc` )
    REFERENCES `BD_EMCH`.`T_Empresa` (`cdRuc` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_TrabajadorXCamion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_TrabajadorXCamion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_TrabajadorXCamion` (
  `cdAsigCamion` CHAR(10) NOT NULL COMMENT 'Codigo Generado: ATC0000001,ATC0000002,ATC0000003' ,
  `cdCamion` CHAR(6) NOT NULL ,
  `cdTrabajador` CHAR(6) NOT NULL ,
  `cdTurno` CHAR(4) NOT NULL ,
  `fechaAsig` DATETIME NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  `observacion` VARCHAR(200) NULL ,
  PRIMARY KEY (`cdAsigCamion`) ,
  INDEX `fk_T_TrabajadorXCamion_T_Camion1_idx` (`cdCamion` ASC) ,
  INDEX `fk_T_TrabajadorXCamion_T_Trabajador1_idx` (`cdTrabajador` ASC) ,
  INDEX `fk_T_TrabajadorXCamion_T_Turno1_idx` (`cdTurno` ASC) ,
  CONSTRAINT `fk_T_TrabajadorXCamion_T_Camion1`
    FOREIGN KEY (`cdCamion` )
    REFERENCES `BD_EMCH`.`T_Camion` (`cdCamion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_TrabajadorXCamion_T_Trabajador1`
    FOREIGN KEY (`cdTrabajador` )
    REFERENCES `BD_EMCH`.`T_Trabajador` (`cdTrabajador` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_TrabajadorXCamion_T_Turno1`
    FOREIGN KEY (`cdTurno` )
    REFERENCES `BD_EMCH`.`T_Turno` (`cdTurno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_DespachoDet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_DespachoDet` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_DespachoDet` (
  `Nro` INT NOT NULL COMMENT 'Generar numero: 1,2,3... De acuerdo al cdDespacho y cdRuc (poder Diferenciar)' ,
  `cdDespacho` CHAR(10) NOT NULL ,
  `cdRuc` CHAR(6) NOT NULL ,
  `cdAsigCamion` CHAR(10) NOT NULL ,
  `cantViaje` INT NOT NULL ,
  `evaluacion` CHAR(1) NULL COMMENT 'B: Bien         	M: Mal' ,
  INDEX `fk_T_DespachoDet_T_TrabajadorXCamion1_idx` (`cdAsigCamion` ASC) ,
  PRIMARY KEY (`Nro`, `cdDespacho`, `cdRuc`) ,
  INDEX `fk_T_DespachoDet_T_Despacho1_idx` (`cdDespacho` ASC, `cdRuc` ASC) ,
  CONSTRAINT `fk_T_DespachoDet_T_TrabajadorXCamion1`
    FOREIGN KEY (`cdAsigCamion` )
    REFERENCES `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_DespachoDet_T_Despacho1`
    FOREIGN KEY (`cdDespacho` , `cdRuc` )
    REFERENCES `BD_EMCH`.`T_Despacho` (`cdDespacho` , `cdRuc` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_ControlViaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_ControlViaje` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_ControlViaje` (
  `cdControlViaje` CHAR(10) NOT NULL ,
  `nroViaje` INT NOT NULL ,
  `Nro` INT NOT NULL ,
  `cdDespacho` CHAR(10) NOT NULL ,
  `cdRuc` CHAR(6) NOT NULL ,
  `fechaEmi` DATETIME NOT NULL ,
  `horaEstimada` CHAR(5) NOT NULL ,
  `horaReal` CHAR(5) NOT NULL ,
  `Obs` VARCHAR(300) NULL ,
  PRIMARY KEY (`cdControlViaje`, `nroViaje`) ,
  INDEX `fk_T_ControlViaje_T_DespachoDet1_idx` (`Nro` ASC, `cdDespacho` ASC, `cdRuc` ASC) ,
  CONSTRAINT `fk_T_ControlViaje_T_DespachoDet1`
    FOREIGN KEY (`Nro` , `cdDespacho` , `cdRuc` )
    REFERENCES `BD_EMCH`.`T_DespachoDet` (`Nro` , `cdDespacho` , `cdRuc` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AsignarRuta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AsignarRuta` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_AsignarRuta` (
  `CdRuta` CHAR(10) NOT NULL ,
  `Nro` INT NOT NULL ,
  `cdDespacho` CHAR(10) NOT NULL ,
  `cdRuc` CHAR(6) NOT NULL ,
  `LATN` DOUBLE NULL ,
  `LNGN` DOUBLE NULL ,
  `LATS` DOUBLE NULL ,
  `LNGS` DOUBLE NULL ,
  `nroV` INT NOT NULL ,
  `obs` VARCHAR(100) NULL ,
  PRIMARY KEY (`CdRuta`) ,
  INDEX `fk_T_AsignarRuta_T_DespachoDet1_idx` (`Nro` ASC, `cdDespacho` ASC, `cdRuc` ASC) ,
  CONSTRAINT `fk_T_AsignarRuta_T_DespachoDet1`
    FOREIGN KEY (`Nro` , `cdDespacho` , `cdRuc` )
    REFERENCES `BD_EMCH`.`T_DespachoDet` (`Nro` , `cdDespacho` , `cdRuc` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Asistencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Asistencia` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Asistencia` (
  `cdAsistencia` CHAR(5) NOT NULL ,
  `cdTurno` CHAR(4) NOT NULL ,
  `fecha` DATETIME NOT NULL ,
  `usuCrea` VARCHAR(10) NOT NULL ,
  `fechaReg` DATETIME NOT NULL ,
  `usuModf` VARCHAR(10) NULL ,
  `fechModf` DATETIME NULL ,
  PRIMARY KEY (`cdAsistencia`) ,
  INDEX `fk_T_Asistencia_T_Turno1_idx` (`cdTurno` ASC) ,
  CONSTRAINT `fk_T_Asistencia_T_Turno1`
    FOREIGN KEY (`cdTurno` )
    REFERENCES `BD_EMCH`.`T_Turno` (`cdTurno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Incidencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Incidencia` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Incidencia` (
  `cdInc` CHAR(10) NOT NULL ,
  `cdControlViaje` CHAR(10) NOT NULL ,
  `nroViaje` INT NOT NULL ,
  `fechaInc` DATETIME NOT NULL ,
  `zona` VARCHAR(100) NOT NULL ,
  `problema` VARCHAR(45) NOT NULL ,
  `horaProb` CHAR(5) NOT NULL ,
  `observaciones` VARCHAR(200) NULL ,
  `soluc` VARCHAR(200) NULL ,
  PRIMARY KEY (`cdInc`) ,
  INDEX `fk_T_Incidencia_T_ControlViaje1_idx` (`cdControlViaje` ASC, `nroViaje` ASC) ,
  CONSTRAINT `fk_T_Incidencia_T_ControlViaje1`
    FOREIGN KEY (`cdControlViaje` , `nroViaje` )
    REFERENCES `BD_EMCH`.`T_ControlViaje` (`cdControlViaje` , `nroViaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_GrupoAcceso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_GrupoAcceso` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_GrupoAcceso` (
  `cdGA` INT NOT NULL ,
  `descrip` VARCHAR(100) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdGA`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AccesoE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AccesoE` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_AccesoE` (
  `idAe` INT NOT NULL ,
  `cdPerfil` VARCHAR(4) NOT NULL ,
  `cdGA` INT NOT NULL ,
  `cdRuc` CHAR(6) NOT NULL ,
  INDEX `fk_T_AccesoE_T_GrupoAcceso1_idx` (`cdGA` ASC) ,
  PRIMARY KEY (`idAe`) ,
  INDEX `fk_T_AccesoE_T_Empresa1_idx` (`cdRuc` ASC) ,
  INDEX `fk_T_AccesoE_T_Perfil1_idx` (`cdPerfil` ASC) ,
  CONSTRAINT `fk_T_AccesoE_T_GrupoAcceso1`
    FOREIGN KEY (`cdGA` )
    REFERENCES `BD_EMCH`.`T_GrupoAcceso` (`cdGA` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_AccesoE_T_Empresa1`
    FOREIGN KEY (`cdRuc` )
    REFERENCES `BD_EMCH`.`T_Empresa` (`cdRuc` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_AccesoE_T_Perfil1`
    FOREIGN KEY (`cdPerfil` )
    REFERENCES `BD_EMCH`.`T_Perfil` (`cdPerfil` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Menu` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Menu` (
  `cdMenu` VARCHAR(6) NOT NULL ,
  `Nombre` VARCHAR(50) NOT NULL ,
  `ruta` VARCHAR(100) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdMenu`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AccesoM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AccesoM` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_AccesoM` (
  `idAm` INT NOT NULL ,
  `cdGA` INT NOT NULL ,
  `cdMenu` VARCHAR(6) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  INDEX `fk_T_AccesoM_T_GrupoAcceso1_idx` (`cdGA` ASC) ,
  PRIMARY KEY (`idAm`) ,
  INDEX `fk_T_AccesoM_T_Menu1_idx` (`cdMenu` ASC) ,
  CONSTRAINT `fk_T_AccesoM_T_GrupoAcceso1`
    FOREIGN KEY (`cdGA` )
    REFERENCES `BD_EMCH`.`T_GrupoAcceso` (`cdGA` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_AccesoM_T_Menu1`
    FOREIGN KEY (`cdMenu` )
    REFERENCES `BD_EMCH`.`T_Menu` (`cdMenu` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AsistenciaXTrabajador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AsistenciaXTrabajador` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_AsistenciaXTrabajador` (
  `cdTrabajador` CHAR(6) NOT NULL ,
  `cdAsistencia` CHAR(5) NOT NULL ,
  `Asiste` TINYINT(1) NULL ,
  `Tardanza` TINYINT(1) NULL ,
  `Fustifica` TINYINT(1) NULL ,
  INDEX `fk_AsistenciaXTrabajador_T_Trabajador1_idx` (`cdTrabajador` ASC) ,
  INDEX `fk_AsistenciaXTrabajador_T_Asistencia1_idx` (`cdAsistencia` ASC) ,
  PRIMARY KEY (`cdTrabajador`, `cdAsistencia`) ,
  CONSTRAINT `fk_AsistenciaXTrabajador_T_Trabajador1`
    FOREIGN KEY (`cdTrabajador` )
    REFERENCES `BD_EMCH`.`T_Trabajador` (`cdTrabajador` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsistenciaXTrabajador_T_Asistencia1`
    FOREIGN KEY (`cdAsistencia` )
    REFERENCES `BD_EMCH`.`T_Asistencia` (`cdAsistencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_TipoLiquidacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_TipoLiquidacion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_TipoLiquidacion` (
  `cdTipoLiq` CHAR(4) NOT NULL ,
  `Nombre` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`cdTipoLiq`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Liquidacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Liquidacion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Liquidacion` (
  `cdLiq` CHAR(10) NOT NULL ,
  `cdRuc` CHAR(6) NOT NULL ,
  `cdTipoLiq` CHAR(4) NOT NULL ,
  `fechaApertura` DATETIME NOT NULL ,
  `fechaInicio` DATETIME NOT NULL ,
  `fechaFin` DATETIME NOT NULL ,
  `totalTN` DECIMAL(7,4) NULL ,
  `asunto` VARCHAR(100) NULL ,
  `usuCrea` VARCHAR(10) NOT NULL ,
  `fechaReg` DATETIME NOT NULL ,
  `usuModf` VARCHAR(10) NULL ,
  `fechaModf` DATETIME NULL ,
  PRIMARY KEY (`cdLiq`) ,
  INDEX `fk_T_Liquidacion_T_Empresa1_idx` (`cdRuc` ASC) ,
  INDEX `fk_T_Liquidacion_T_TipoLiquidacion1_idx` (`cdTipoLiq` ASC) ,
  CONSTRAINT `fk_T_Liquidacion_T_Empresa1`
    FOREIGN KEY (`cdRuc` )
    REFERENCES `BD_EMCH`.`T_Empresa` (`cdRuc` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Liquidacion_T_TipoLiquidacion1`
    FOREIGN KEY (`cdTipoLiq` )
    REFERENCES `BD_EMCH`.`T_TipoLiquidacion` (`cdTipoLiq` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Pesaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Pesaje` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Pesaje` (
  `cdPesaje` CHAR(10) NOT NULL COMMENT 'codigo generado: PS00000001,PS00000002,...' ,
  `cdControlViaje` CHAR(10) NOT NULL ,
  `nroViaje` INT NOT NULL ,
  `cdLiq` CHAR(10) NULL ,
  `nroPesaje` INT NOT NULL ,
  `fechaPesaje` DATETIME NOT NULL ,
  `pesoBruto` DECIMAL(5,4) NOT NULL ,
  `tara` DECIMAL(5,4) NOT NULL ,
  `pesoTN` DECIMAL(5,4) NOT NULL ,
  `estadoPesaje` CHAR(1) NOT NULL COMMENT 'P: Pendiente , L:Liquidado, ' ,
  `usuCrea` VARCHAR(10) NOT NULL ,
  `fechaReg` DATETIME NOT NULL ,
  `usuModf` VARCHAR(10) NULL ,
  `fechaModf` DATETIME NULL ,
  `Obs` VARCHAR(100) NULL ,
  `imagenP` MEDIUMBLOB NULL ,
  PRIMARY KEY (`cdPesaje`) ,
  INDEX `fk_T_Pesaje_T_Liquidacion1_idx` (`cdLiq` ASC) ,
  INDEX `fk_T_Pesaje_T_ControlViaje1_idx` (`cdControlViaje` ASC, `nroViaje` ASC) ,
  CONSTRAINT `fk_T_Pesaje_T_Liquidacion1`
    FOREIGN KEY (`cdLiq` )
    REFERENCES `BD_EMCH`.`T_Liquidacion` (`cdLiq` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Pesaje_T_ControlViaje1`
    FOREIGN KEY (`cdControlViaje` , `nroViaje` )
    REFERENCES `BD_EMCH`.`T_ControlViaje` (`cdControlViaje` , `nroViaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Moneda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Moneda` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Moneda` (
  `cdMda` VARCHAR(2) NOT NULL ,
  `nombre` VARCHAR(20) NOT NULL ,
  `simbolo` VARCHAR(4) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdMda`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_TipoDoc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_TipoDoc` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_TipoDoc` (
  `cdTD` VARCHAR(2) NOT NULL ,
  `descrip` VARCHAR(100) NOT NULL ,
  `nCorto` VARCHAR(6) NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdTD`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Comprobante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Comprobante` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Comprobante` (
  `idComprobante` CHAR(10) NOT NULL ,
  `cdLiq` CHAR(10) NOT NULL ,
  `cdMda` VARCHAR(2) NOT NULL ,
  `cdTD` VARCHAR(2) NOT NULL ,
  `fecMov` DATETIME NOT NULL ,
  `serie` VARCHAR(4) NOT NULL ,
  `nroDoc` VARCHAR(15) NOT NULL ,
  `total` DECIMAL(7,2) NOT NULL ,
  `subTotal` DECIMAL(7,2) NOT NULL ,
  `IGV` DECIMAL(7,2) NOT NULL ,
  `usuCrea` VARCHAR(10) NOT NULL ,
  `fechaReg` DATETIME NOT NULL ,
  `usuModf` VARCHAR(10) NULL ,
  `fechaModf` DATETIME NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`idComprobante`) ,
  INDEX `fk_T_Factura_T_Moneda1_idx` (`cdMda` ASC) ,
  INDEX `fk_T_Comprobante_T_Liquidacion1_idx` (`cdLiq` ASC) ,
  INDEX `fk_T_Comprobante_T_TipoDoc1_idx` (`cdTD` ASC) ,
  CONSTRAINT `fk_T_Factura_T_Moneda1`
    FOREIGN KEY (`cdMda` )
    REFERENCES `BD_EMCH`.`T_Moneda` (`cdMda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Comprobante_T_Liquidacion1`
    FOREIGN KEY (`cdLiq` )
    REFERENCES `BD_EMCH`.`T_Liquidacion` (`cdLiq` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Comprobante_T_TipoDoc1`
    FOREIGN KEY (`cdTD` )
    REFERENCES `BD_EMCH`.`T_TipoDoc` (`cdTD` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Servicio` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Servicio` (
  `cdServicio` CHAR(6) NOT NULL COMMENT 'Codigo Generado: SRV0000001,SRV0000002,....' ,
  `nombreServ` VARCHAR(100) NOT NULL ,
  `descripServ` VARCHAR(300) NOT NULL ,
  `nCortoServ` VARCHAR(10) NULL ,
  PRIMARY KEY (`cdServicio`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_ComprobanteDet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_ComprobanteDet` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_ComprobanteDet` (
  `item` VARCHAR(45) NOT NULL ,
  `cdServicio` CHAR(6) NOT NULL ,
  `idComprobante` CHAR(10) NOT NULL ,
  `precioUnit` DECIMAL(7,2) NOT NULL ,
  `IGV` DECIMAL(7,2) NOT NULL ,
  `total` DECIMAL(7,2) NOT NULL ,
  PRIMARY KEY (`item`) ,
  INDEX `fk_T_FacturaDet_T_Servicio1_idx` (`cdServicio` ASC) ,
  INDEX `fk_T_ComprobanteDet_T_Comprobante1_idx` (`idComprobante` ASC) ,
  CONSTRAINT `fk_T_FacturaDet_T_Servicio1`
    FOREIGN KEY (`cdServicio` )
    REFERENCES `BD_EMCH`.`T_Servicio` (`cdServicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_ComprobanteDet_T_Comprobante1`
    FOREIGN KEY (`idComprobante` )
    REFERENCES `BD_EMCH`.`T_Comprobante` (`idComprobante` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_EstadoLiq`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_EstadoLiq` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_EstadoLiq` (
  `cdEstadoLiq` CHAR(3) NOT NULL ,
  `Nombre` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`cdEstadoLiq`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_EstadoxLiquidacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_EstadoxLiquidacion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_EstadoxLiquidacion` (
  `fechaEstado` DATETIME NOT NULL ,
  `cdEstadoLiq` CHAR(3) NOT NULL ,
  `cdLiq` CHAR(10) NOT NULL ,
  `Obs` VARCHAR(100) NULL ,
  INDEX `fk_T_EstadoxLiquidacion_T_EstadoLiq1_idx` (`cdEstadoLiq` ASC) ,
  PRIMARY KEY (`fechaEstado`, `cdEstadoLiq`, `cdLiq`) ,
  INDEX `fk_T_EstadoxLiquidacion_T_Liquidacion1_idx` (`cdLiq` ASC) ,
  CONSTRAINT `fk_T_EstadoxLiquidacion_T_EstadoLiq1`
    FOREIGN KEY (`cdEstadoLiq` )
    REFERENCES `BD_EMCH`.`T_EstadoLiq` (`cdEstadoLiq` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_EstadoxLiquidacion_T_Liquidacion1`
    FOREIGN KEY (`cdLiq` )
    REFERENCES `BD_EMCH`.`T_Liquidacion` (`cdLiq` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_SOAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_SOAT` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_SOAT` (
  `idSOAT` INT NOT NULL ,
  `nombreSOAT` VARCHAR(30) NOT NULL ,
  `telf` VARCHAR(15) NULL ,
  PRIMARY KEY (`idSOAT`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Seguro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Seguro` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Seguro` (
  `idSeguro` CHAR(5) NOT NULL ,
  `nombreSeguro` VARCHAR(45) NOT NULL ,
  `Descripcion` VARCHAR(45) NULL ,
  `telf` VARCHAR(15) NULL ,
  PRIMARY KEY (`idSeguro`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_SeguroXCamion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_SeguroXCamion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_SeguroXCamion` (
  `fechaVec` DATETIME NOT NULL ,
  `idSeguro` CHAR(5) NOT NULL ,
  `cdCamion` CHAR(6) NOT NULL ,
  `nroPoliza` INT NOT NULL ,
  `obs` VARCHAR(50) NULL ,
  PRIMARY KEY (`fechaVec`, `idSeguro`, `cdCamion`) ,
  INDEX `fk_T_SeguroXCamion_T_Seguro1_idx` (`idSeguro` ASC) ,
  INDEX `fk_T_SeguroXCamion_T_Camion1_idx` (`cdCamion` ASC) ,
  CONSTRAINT `fk_T_SeguroXCamion_T_Seguro1`
    FOREIGN KEY (`idSeguro` )
    REFERENCES `BD_EMCH`.`T_Seguro` (`idSeguro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_SeguroXCamion_T_Camion1`
    FOREIGN KEY (`cdCamion` )
    REFERENCES `BD_EMCH`.`T_Camion` (`cdCamion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_SOATxCamion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_SOATxCamion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_SOATxCamion` (
  `fechaVecS` DATETIME NOT NULL ,
  `idSOAT` INT NOT NULL ,
  `cdCamion` CHAR(6) NOT NULL ,
  `obs` VARCHAR(50) NULL ,
  PRIMARY KEY (`fechaVecS`, `idSOAT`, `cdCamion`) ,
  INDEX `fk_T_SOATxCamion_T_SOAT1_idx` (`idSOAT` ASC) ,
  INDEX `fk_T_SOATxCamion_T_Camion1_idx` (`cdCamion` ASC) ,
  CONSTRAINT `fk_T_SOATxCamion_T_SOAT1`
    FOREIGN KEY (`idSOAT` )
    REFERENCES `BD_EMCH`.`T_SOAT` (`idSOAT` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_SOATxCamion_T_Camion1`
    FOREIGN KEY (`cdCamion` )
    REFERENCES `BD_EMCH`.`T_Camion` (`cdCamion` )
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
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF01', 'Administrador', 'Todos los permisos', 1);
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF02', 'Supervisor', 'Todos los permisos menos seguridad', 1);
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF03', 'Despachador', 'Perfil para el control de servicio', 1);
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF04', 'Contador', 'Perfil para cumplir el rol de contador', 1);
INSERT INTO `BD_EMCH`.`T_Perfil` (`cdPerfil`, `nombrePrf`, `descripPrf`, `estado`) VALUES ('PF05', 'Cliente', 'Acceso solo a sus liquidaciones', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('coropeza', 'PF01', '12345', 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('mvalois', 'PF01', '12345', 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('dparraga', 'PF01', '12345', 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('mrobles', 'PF01', '12345', 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('ecardenas', 'PF01', '12345', 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('vnunez', 'PF01', '12345', 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('rcisneros', 'PF01', '12345', 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('cmiranda', 'PF05', '12345', 1);
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('aperez', 'PF05', '12345', 1);

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
INSERT INTO `BD_EMCH`.`T_Empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0001', '150134', '20131378115', 'MUNICIPALIDAD DISTRITAL DE SAN LUIS', '04/05/1993', 'Av. del Aire  Nro. 1540 URB. Villa Jardin', '365027', NULL);
INSERT INTO `BD_EMCH`.`T_Empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0002', '150115', '20131368071', 'MUNICIPALIDAD DISTRITAL DE LA VICTORIA', '04/05/1993', 'AV. IQUITOS NRO. 500', '315766', NULL);
INSERT INTO `BD_EMCH`.`T_Empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0003', '150103', '20131378620', 'MUNICIPALIDAD DISTRITAL DE ATE', '04/05/1993', 'CAR. CARRETERA CENTRAL KM 7.5', '4941428', NULL);
INSERT INTO `BD_EMCH`.`T_Empresa` (`cdRuc`, `cdUbig`, `rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`) VALUES ('RC0004', '150130', '20131373741', 'MUNICIPALIDAD DE SAN BORJA', '01/01/1984', 'AV. AVENIDA JOAQUIN MADRID NRO.200', '6125555', NULL);

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
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0013', NULL, 'TP4', '150140', 'Cesar Augusto', 'Oropeza Sanchez', '47358236', NULL, '989893374', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0001', NULL, 'TP1', '150140', 'Lilian Eugenia', 'Gomez Alvarez', '57736310', NULL, '994587411', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0002', NULL, 'TP1', '150140', 'Beatriz Elena', 'Osorio Laverde', '72323122', NULL, '996323814', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0003', NULL, 'TP1', '150140', 'Gloria', 'Sanclemente', '945784199', NULL, '945784199', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0004', NULL, 'TP2', '150114', 'Carlos Augusto', 'Montoya Serna', '33651713', NULL, '994686157', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0005', NULL, 'TP2', '150133', 'Herman', 'Correa Ramirez', '14268665', NULL, '945478137', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0006', NULL, 'TP2', '150123', 'Gerardo Emilio', 'Duque Gutierrez', '43920843', NULL, '965689134', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0007', NULL, 'TP3', '150118', 'Pablo', 'Osorno Mejia', '945874579', NULL, '945874579', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0008', NULL, 'TP5', '150117', 'Arturo', 'Tabares Mora', '965873231', NULL, '965873231', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0009', NULL, 'TP5', '150136', 'Jaime', 'Lopez Tobon', '987548751', NULL, '987548751', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0010', NULL, 'TP6', '150116', 'Julio Cesar', 'Rodas Monsalve', '38877943', NULL, '995625487', 'cesar20991@hotmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0011', NULL, 'TP5', '150135', 'Gustavo', 'Rodriguez Vallejo', '4431891', NULL, '923654587', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0012', NULL, 'TP5', '150122', 'Maria VIctoria', 'Arias Gomez', '60388222', NULL, '994568788', 'cesar20991@gmail.com', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Clase`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Clase` (`idClase`, `Nombre`, `Descripcion`) VALUES (1, 'COMPACTADORA', NULL);
INSERT INTO `BD_EMCH`.`T_Clase` (`idClase`, `Nombre`, `Descripcion`) VALUES (2, 'BARANDA', NULL);
INSERT INTO `BD_EMCH`.`T_Clase` (`idClase`, `Nombre`, `Descripcion`) VALUES (3, 'BARREDORA', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Marca`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (1, 'SCANIA', NULL);
INSERT INTO `BD_EMCH`.`T_Marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (2, 'IVECO', NULL);
INSERT INTO `BD_EMCH`.`T_Marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (3, 'INTERNATIONAL', NULL);
INSERT INTO `BD_EMCH`.`T_Marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (4, 'KIA', NULL);
INSERT INTO `BD_EMCH`.`T_Marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (5, 'HUINDAY', NULL);
INSERT INTO `BD_EMCH`.`T_Marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (6, 'DONG FENG', NULL);
INSERT INTO `BD_EMCH`.`T_Marca` (`idMarca`, `nombreMarca`, `descripcion`) VALUES (7, 'VOLKSWAGEN', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Camion`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0001', 1, 7, 1, 'XO-5784', '2003', '2007', '30771206', 6, 'd2', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0002', 1, 7, 2, 'XO-5782', '2003', '2007', '30770835', 8, 'gasolina', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0003', 1, 7, 3, 'XO-6048', '2003', '2007', '307712044', 7, 'd2', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0004', 1, 7, 4, 'XO-6400', '2003', '2007', '30771950', 7, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0005', 1, 7, 5, 'XO-6401', '2003', '2005', '30771947', 6, 'd2', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0006', 1, 7, 6, 'XO-6955', '2004', '2005', '30500442', 8, 'd3', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0007', 1, 1, 7, 'XO-7815', '2004', '2005', '8028902', 7, 'gasolina', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0008', 1, 7, 8, 'XO-7858', '2005', '2005', '30789953', 8, 'd3', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0009', 1, 7, 9, 'XO-7881', '2005', '2005', '6076193', 8, 'gasolina', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0010', 1, 1, 10, 'XO-8624', '2005', '2005', '8048749', 6, 'd3', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0011', 1, 1, 11, 'XO-8563', '2005', '2005', '8048703', 8, 'd4', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0012', 1, 1, 12, 'C-12454', '2005', '2005', '8058489', 7, 'gasolina', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0013', 1, 1, 13, 'C-1454', '2005', '2005', '8058493', 7, 'd4', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0014', 1, 7, 14, 'WGE-356', '2006', '2005', '30566904', 6, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0015', 1, 7, 15, 'WGE-409', '2006', '2005', '30565819', 8, 'd4', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0016', 1, 7, 16, 'WGE-535', '2006', '2005', '30566900', 8, 'd5', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0017', 1, 7, 17, 'WGE-357', '2006', '2005', '30566545', 6, 'gasolina', 1700, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0018', 1, 2, 18, 'WGH-667', '2007', '2005', 'F4AE0681D681D6000087', 8, 'd5', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0019', 1, 2, 19, 'WGH-668', '2007', '2005', 'F4AE0681D681D6000085', 6, 'gasolina', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0020', 1, 2, 20, 'WGH-461', '2007', '2007', 'F4AE0681D681D6001659', 6, 'd5', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0021', 1, 2, 21, 'WGH-460', '2007', '2007', 'F4AE0681D681D6001685', 6, 'd6', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0022', 1, 3, 22, 'WGJ-293', '2006', '2007', '470HM2U1492450', 6, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0023', 1, 3, 23, 'WGI-601', '2006', '2007', '470HM2U1492451', 8, 'd6', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0024', 2, 4, 24, 'XI-5417', '1996', '2006', 'SH021925', 7, 'gasolina', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0025', 2, 5, 25, 'XO-3515', '2000', '2006', 'D4DAY094833', 7, 'd6', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0026', 2, 7, 26, 'XO-7859', '2005', '2006', '4123022', 6, 'd7', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0027', 2, 7, 27, 'XO-8116', '2005', '2006', '4123206', 7, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0028', 2, 7, 28, 'C-35- EN TRAMITE', '2006', '2006', 'E1T134243', 6, 'd7', 1400, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0029', 2, 6, 29, 'WGF-071', '2007', '2006', '69465223', 7, 'gasolina', 2000, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0030', 2, 6, 30, 'WGF-088', '2007', '2006', '69478119', 7, 'd7', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0031', 1, 7, 31, 'XQ-6729', '1992', '2000', 'D2366T200703', 7, 'd8', 1234, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0032', 1, 7, 32, 'XQ-6807', '1992', '2000', 'D2366T200757CA', 8, 'gasolina', 1849, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0033', 1, 7, 33, 'XQ-6806', '1992', '2000', 'D2366T200750', 7, 'd8', 1298, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0034', 1, 7, 34, 'XQ-6967', '1992', '2000', 'D2366T200735', 7, 'gasolina', 1290, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `idClase`, `idMarca`, `unidad`, `placa`, `anioFab`, `anioAdq`, `nroMotor`, `pesoBruto`, `tipoCombustible`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0035', 1, 7, 35, 'XQ-6966', '1992', '2000', 'D2366T200699', 6, 'd8', 1800, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Turno`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Turno` (`cdTurno`, `nombTurno`, `Obs`) VALUES ('TN01', 'Mañana', NULL);
INSERT INTO `BD_EMCH`.`T_Turno` (`cdTurno`, `nombTurno`, `Obs`) VALUES ('TN02', 'Noche', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Despacho`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000001', 'RC0001', '150115', 'TN02', 'NDP0000001', '2013-01-01 01:38:54', 'zona de gamarra', NULL, NULL, NULL, 'coropeza', '2013-01-01 01:41:24', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000002', 'RC0001', '150115', 'TN02', 'NDP0000002', '2013-01-02 01:38:54', 'zona aviacion', NULL, NULL, NULL, 'coropeza', '2013-01-02 01:41:24', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000003', 'RC0001', '150115', 'TN02', 'NDP0000003', '2013-01-03 01:38:54', 'zona B', NULL, NULL, NULL, 'coropeza', '2013-01-03 01:41:24', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000004', 'RC0001', '150115', 'TN02', 'NDP0000004', '2013-01-04 01:38:54', 'zona J', 400.0000, NULL, NULL, 'coropeza', '2013-01-04 01:41:24', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Despacho` (`cdDespacho`, `cdRuc`, `cdUbig`, `cdTurno`, `nroDespacho`, `fechaEmi`, `zona`, `dineroEnviado`, `totalDineroUso`, `totalDineroSinUso`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `evaluacion`, `obs`) VALUES ('DP00000005', 'RC0001', '150115', 'TN02', 'NDP0000005', '2013-01-05 01:38:54', 'zona Q', 390.0000, NULL, NULL, 'coropeza', '2013-01-05 01:41:24', NULL, NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_TrabajadorXCamion`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000001', 'CA0004', 'TR0008', 'TN02', '2013-05-02 06:06:49', 1, NULL);
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000002', 'CA0005', 'TR0009', 'TN02', '2013-05-02 06:06:52', 1, NULL);
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000003', 'CA0003', 'TR0011', 'TN02', '2013-05-01 06:06:52', 1, NULL);
INSERT INTO `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion`, `cdCamion`, `cdTrabajador`, `cdTurno`, `fechaAsig`, `estado`, `observacion`) VALUES ('ATC0000004', 'CA0002', 'TR0012', 'TN02', '2013-05-01 06:06:52', 1, NULL);

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
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (1, 'DP00000002', 'RC0001', 'ATC0000001', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (2, 'DP00000002', 'RC0001', 'ATC0000002', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (3, 'DP00000002', 'RC0001', 'ATC0000003', 2, NULL);
INSERT INTO `BD_EMCH`.`T_DespachoDet` (`Nro`, `cdDespacho`, `cdRuc`, `cdAsigCamion`, `cantViaje`, `evaluacion`) VALUES (4, 'DP00000002', 'RC0001', 'ATC0000004', 2, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_ControlViaje`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000001', 1, 1, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '03:00', '02:00', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000002', 2, 1, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '03:00', '02:00', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000003', 1, 2, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '02:00', '02:00', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000004', 2, 2, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '02:00', '02:00', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000005', 1, 3, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '01:30', '01:30', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000006', 2, 3, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '01:30', '01:30', 'En mi segundo viaje el Motor tiene problemas');
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000007', 1, 4, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '02:00', '02:00', NULL);
INSERT INTO `BD_EMCH`.`T_ControlViaje` (`cdControlViaje`, `nroViaje`, `Nro`, `cdDespacho`, `cdRuc`, `fechaEmi`, `horaEstimada`, `horaReal`, `Obs`) VALUES ('CV00000008', 2, 4, 'DP00000001', 'RC0001', '2013-01-01 02:38:54', '02:00', '02:00', 'revisar frenos antes de fin de mes...');

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_GrupoAcceso`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_GrupoAcceso` (`cdGA`, `descrip`, `estado`) VALUES (1, 'Administracion', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_AccesoE`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_AccesoE` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (1, 'PF01', 1, 'RC0001');
INSERT INTO `BD_EMCH`.`T_AccesoE` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (2, 'PF02', 1, 'RC0001');
INSERT INTO `BD_EMCH`.`T_AccesoE` (`idAe`, `cdPerfil`, `cdGA`, `cdRuc`) VALUES (3, 'PF03', 1, 'RC0001');

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Menu`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM001', 'Trabajador', '../faces/emch-administracion/trabajador.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM002', 'Empresa', '../faces/emch-administracion/empresa.xhtml', 1);
INSERT INTO `BD_EMCH`.`T_Menu` (`cdMenu`, `Nombre`, `ruta`, `estado`) VALUES ('ADM003', 'Camion', '../faces/emch-administracion/camion.xhtml', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_AccesoM`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (1, 1, 'ADM001', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (2, 1, 'ADM002', 1);
INSERT INTO `BD_EMCH`.`T_AccesoM` (`idAm`, `cdGA`, `cdMenu`, `estado`) VALUES (3, 1, 'ADM003', 1);

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
INSERT INTO `BD_EMCH`.`T_Liquidacion` (`cdLiq`, `cdRuc`, `cdTipoLiq`, `fechaApertura`, `fechaInicio`, `fechaFin`, `totalTN`, `asunto`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`) VALUES ('LQ00000001', 'RC0001', 'TL01', '2013-02-02 14:38:54', '2013-01-01 00:00:00', '2013-01-31 00:00:00', NULL, NULL, 'coropeza', '2013-02-02 14:38:54', NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Pesaje`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000001', 'CV00000001', 1, NULL, 521747, '2013-01-01 00:00:00', 19.19, 12.64, 6.55, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000002', 'CV00000002', 2, NULL, 521810, '2013-01-01 00:00:00', 22.55, 14.13, 8.42, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000003', 'CV00000003', 1, NULL, 522063, '2013-01-01 00:00:00', 24.36, 12.49, 11.87, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000004', 'CV00000004', 2, NULL, 522080, '2013-01-01 00:00:00', 24.98, 12.53, 12.45, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000005', 'CV00000005', 1, NULL, 522082, '2013-01-01 00:00:00', 25.36, 12.78, 12.58, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000006', 'CV00000006', 2, NULL, 522098, '2013-01-01 00:00:00', 27.44, 14.07, 13.37, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000007', 'CV00000007', 1, NULL, 522196, '2013-01-01 00:00:00', 24.28, 12.66, 11.62, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Pesaje` (`cdPesaje`, `cdControlViaje`, `nroViaje`, `cdLiq`, `nroPesaje`, `fechaPesaje`, `pesoBruto`, `tara`, `pesoTN`, `estadoPesaje`, `usuCrea`, `fechaReg`, `usuModf`, `fechaModf`, `Obs`, `imagenP`) VALUES ('PS00000008', 'CV00000008', 2, NULL, 522320, '2013-01-01 00:00:00', 25.46, 14.12, 11.34, 'P', 'coropeza', '2013-01-01 00:00:00', NULL, NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Moneda`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Moneda` (`cdMda`, `nombre`, `simbolo`, `estado`) VALUES ('01', 'Soles', 'S/.', 1);
INSERT INTO `BD_EMCH`.`T_Moneda` (`cdMda`, `nombre`, `simbolo`, `estado`) VALUES ('02', 'Dolares', '$.', 1);

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
-- Data for table `BD_EMCH`.`T_SOAT`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_SOAT` (`idSOAT`, `nombreSOAT`, `telf`) VALUES (1, 'Rimac Seguros', NULL);
INSERT INTO `BD_EMCH`.`T_SOAT` (`idSOAT`, `nombreSOAT`, `telf`) VALUES (2, 'MAPFRE', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Seguro`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Seguro` (`idSeguro`, `nombreSeguro`, `Descripcion`, `telf`) VALUES ('SEG01', 'MAPFRE', NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Seguro` (`idSeguro`, `nombreSeguro`, `Descripcion`, `telf`) VALUES ('SEG02', 'Rimac Seguros', NULL, NULL);
INSERT INTO `BD_EMCH`.`T_Seguro` (`idSeguro`, `nombreSeguro`, `Descripcion`, `telf`) VALUES ('SEG03', 'Pacifico ', NULL, NULL);

COMMIT;
