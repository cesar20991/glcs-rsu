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
  `nomUsu` VARCHAR(10) NOT NULL ,
  `cdPerfil` VARCHAR(4) NOT NULL ,
  `pass` VARCHAR(45) NOT NULL ,
  `estado` VARCHAR(45) NOT NULL ,
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
  `rucE` CHAR(11) NOT NULL ,
  `rSocial` VARCHAR(150) NOT NULL ,
  `fechaIni` DATETIME NOT NULL ,
  `direccion` VARCHAR(200) NOT NULL ,
  `telef` VARCHAR(15) NOT NULL ,
  `logo` BLOB NULL ,
  `cdUbig` CHAR(6) NOT NULL ,
  PRIMARY KEY (`rucE`) ,
  INDEX `fk_T_Empresa_T_Ubigeo1_idx` (`cdUbig` ASC) ,
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
  `cdCliente` CHAR(10) NOT NULL ,
  `nomUsu` VARCHAR(10) NOT NULL ,
  `cdUbig` CHAR(6) NOT NULL ,
  `rucE` CHAR(11) NOT NULL ,
  `nombreComp` VARCHAR(45) NOT NULL ,
  `TipoDocI` CHAR(1) NOT NULL ,
  `NroDocI` VARCHAR(15) NOT NULL ,
  `Domicilio` VARCHAR(50) NOT NULL ,
  `Telefono` VARCHAR(15) NULL ,
  `celular` VARCHAR(15) NULL ,
  `email` VARCHAR(45) NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdCliente`) ,
  INDEX `fk_T_Cliente_T_Ubigeo1_idx` (`cdUbig` ASC) ,
  INDEX `fk_T_Cliente_T_Empresa1_idx` (`rucE` ASC) ,
  INDEX `fk_T_Cliente_T_Usuario1_idx` (`nomUsu` ASC) ,
  CONSTRAINT `fk_T_Cliente_T_Ubigeo1`
    FOREIGN KEY (`cdUbig` )
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_T_Empresa1`
    FOREIGN KEY (`rucE` )
    REFERENCES `BD_EMCH`.`T_Empresa` (`rucE` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_T_Usuario1`
    FOREIGN KEY (`nomUsu` )
    REFERENCES `BD_EMCH`.`T_Usuario` (`nomUsu` )
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
-- Table `BD_EMCH`.`T_Camion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Camion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Camion` (
  `cdCamion` CHAR(6) NOT NULL ,
  `placa` VARCHAR(45) NOT NULL ,
  `modelo` VARCHAR(45) NOT NULL ,
  `marca` VARCHAR(45) NOT NULL ,
  `anio` VARCHAR(45) NOT NULL ,
  `pesoBruto` VARCHAR(45) NOT NULL ,
  `tipoCombustible` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  `cajaCambios` VARCHAR(45) NOT NULL ,
  `velocMax` VARCHAR(45) NOT NULL ,
  `kilometraje` VARCHAR(45) NOT NULL ,
  `imagen` BLOB NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdCamion`) )
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
  `rucE` CHAR(11) NOT NULL ,
  `fechaEmi` DATETIME NOT NULL ,
  `cdUbig` CHAR(6) NOT NULL ,
  `cdTurno` CHAR(4) NOT NULL ,
  `nroDespacho` CHAR(10) NOT NULL ,
  `zona` VARCHAR(50) NOT NULL ,
  `dineroEnviado` DECIMAL(13,4) NOT NULL ,
  `totalDineroUso` DECIMAL(13,4) NULL ,
  `totalDineroSinUso` DECIMAL(13,4) NULL ,
  `usuCrea` VARCHAR(10) NOT NULL ,
  `fechaReg` DATETIME NOT NULL ,
  `usuModf` VARCHAR(10) NULL ,
  `fechaModf` DATETIME NULL ,
  `evaluacion` CHAR(1) NULL ,
  `obs` VARCHAR(200) NULL ,
  PRIMARY KEY (`cdDespacho`, `rucE`) ,
  INDEX `fk_T_Despacho_T_Ubigeo1_idx` (`cdUbig` ASC) ,
  INDEX `fk_T_Despacho_T_Empresa1_idx` (`rucE` ASC) ,
  INDEX `fk_T_Despacho_T_Turno1_idx` (`cdTurno` ASC) ,
  CONSTRAINT `fk_T_Despacho_T_Ubigeo1`
    FOREIGN KEY (`cdUbig` )
    REFERENCES `BD_EMCH`.`T_Ubigeo` (`cdUbig` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Despacho_T_Empresa1`
    FOREIGN KEY (`rucE` )
    REFERENCES `BD_EMCH`.`T_Empresa` (`rucE` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Despacho_T_Turno1`
    FOREIGN KEY (`cdTurno` )
    REFERENCES `BD_EMCH`.`T_Turno` (`cdTurno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_TrabajadorXCamion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_TrabajadorXCamion` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_TrabajadorXCamion` (
  `cdAsigCamion` CHAR(10) NOT NULL ,
  `cdCamion` CHAR(6) NOT NULL ,
  `cdTrabajador` CHAR(6) NOT NULL ,
  `fechaAsig` DATETIME NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  `observacion` VARCHAR(200) NULL ,
  PRIMARY KEY (`cdAsigCamion`) ,
  INDEX `fk_T_TrabajadorXCamion_T_Camion1_idx` (`cdCamion` ASC) ,
  INDEX `fk_T_TrabajadorXCamion_T_Trabajador1_idx` (`cdTrabajador` ASC) ,
  CONSTRAINT `fk_T_TrabajadorXCamion_T_Camion1`
    FOREIGN KEY (`cdCamion` )
    REFERENCES `BD_EMCH`.`T_Camion` (`cdCamion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_TrabajadorXCamion_T_Trabajador1`
    FOREIGN KEY (`cdTrabajador` )
    REFERENCES `BD_EMCH`.`T_Trabajador` (`cdTrabajador` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_DespachoDet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_DespachoDet` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_DespachoDet` (
  `Nro` INT NOT NULL ,
  `cdDespacho` CHAR(10) NOT NULL ,
  `rucE` CHAR(11) NOT NULL ,
  `cdAsigCamion` CHAR(10) NOT NULL ,
  `cantViaje` VARCHAR(45) NOT NULL ,
  INDEX `fk_T_DespachoDet_T_TrabajadorXCamion1_idx` (`cdAsigCamion` ASC) ,
  PRIMARY KEY (`Nro`, `rucE`, `cdDespacho`) ,
  INDEX `fk_T_DespachoDet_T_Despacho1_idx` (`cdDespacho` ASC, `rucE` ASC) ,
  CONSTRAINT `fk_T_DespachoDet_T_TrabajadorXCamion1`
    FOREIGN KEY (`cdAsigCamion` )
    REFERENCES `BD_EMCH`.`T_TrabajadorXCamion` (`cdAsigCamion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_DespachoDet_T_Despacho1`
    FOREIGN KEY (`cdDespacho` , `rucE` )
    REFERENCES `BD_EMCH`.`T_Despacho` (`cdDespacho` , `rucE` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_ControlViaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_ControlViaje` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_ControlViaje` (
  `cdControlViaje` CHAR(10) NOT NULL ,
  `cdDespacho` CHAR(10) NOT NULL ,
  `rucE` CHAR(11) NOT NULL ,
  `fechaEmi` DATETIME NOT NULL ,
  `horaEstimada` VARCHAR(45) NOT NULL ,
  `horaReal` VARCHAR(45) NOT NULL ,
  `nroViaje` INT NULL ,
  `Obs` VARCHAR(200) NULL ,
  PRIMARY KEY (`cdControlViaje`) ,
  INDEX `fk_T_ControlViaje_T_Despacho1_idx` (`cdDespacho` ASC, `rucE` ASC) ,
  CONSTRAINT `fk_T_ControlViaje_T_Despacho1`
    FOREIGN KEY (`cdDespacho` , `rucE` )
    REFERENCES `BD_EMCH`.`T_Despacho` (`cdDespacho` , `rucE` )
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
  `rucE` CHAR(11) NOT NULL ,
  `cdDespacho` CHAR(10) NOT NULL ,
  `center` VARCHAR(45) NOT NULL ,
  `latitud` VARCHAR(45) NOT NULL ,
  `longitud` VARCHAR(45) NOT NULL ,
  `tipo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`CdRuta`) ,
  INDEX `fk_T_AsignarRuta_T_DespachoDet1_idx` (`Nro` ASC, `rucE` ASC, `cdDespacho` ASC) ,
  CONSTRAINT `fk_T_AsignarRuta_T_DespachoDet1`
    FOREIGN KEY (`Nro` , `rucE` , `cdDespacho` )
    REFERENCES `BD_EMCH`.`T_DespachoDet` (`Nro` , `rucE` , `cdDespacho` )
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
  `fechaInc` DATETIME NOT NULL ,
  `zona` VARCHAR(100) NOT NULL ,
  `problema` VARCHAR(45) NOT NULL ,
  `horaProb` VARCHAR(5) NOT NULL ,
  `observaciones` VARCHAR(200) NULL ,
  `soluc` VARCHAR(200) NULL ,
  INDEX `fk_T_Incidencia_T_ControlViaje1_idx` (`cdControlViaje` ASC) ,
  PRIMARY KEY (`cdInc`, `cdControlViaje`) ,
  CONSTRAINT `fk_T_Incidencia_T_ControlViaje1`
    FOREIGN KEY (`cdControlViaje` )
    REFERENCES `BD_EMCH`.`T_ControlViaje` (`cdControlViaje` )
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
  `cdPerfil` VARCHAR(3) NOT NULL ,
  `cdGA` INT NOT NULL ,
  `rucE` CHAR(11) NOT NULL ,
  INDEX `fk_T_AccesoE_T_Perfil1_idx` (`cdPerfil` ASC) ,
  INDEX `fk_T_AccesoE_T_GrupoAcceso1_idx` (`cdGA` ASC) ,
  INDEX `fk_T_AccesoE_T_Empresa1_idx` (`rucE` ASC) ,
  PRIMARY KEY (`idAe`) ,
  CONSTRAINT `fk_T_AccesoE_T_Perfil1`
    FOREIGN KEY (`cdPerfil` )
    REFERENCES `BD_EMCH`.`T_Perfil` (`cdPerfil` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_AccesoE_T_GrupoAcceso1`
    FOREIGN KEY (`cdGA` )
    REFERENCES `BD_EMCH`.`T_GrupoAcceso` (`cdGA` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_AccesoE_T_Empresa1`
    FOREIGN KEY (`rucE` )
    REFERENCES `BD_EMCH`.`T_Empresa` (`rucE` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_Menu` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_Menu` (
  `cdMenu` VARCHAR(10) NOT NULL ,
  `Nombre` VARCHAR(50) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`cdMenu`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_EMCH`.`T_AccesoM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_EMCH`.`T_AccesoM` ;

CREATE  TABLE IF NOT EXISTS `BD_EMCH`.`T_AccesoM` (
  `idAm` VARCHAR(45) NOT NULL ,
  `cdGA` INT NOT NULL ,
  `cdMenu` VARCHAR(10) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  INDEX `fk_T_AccesoM_T_GrupoAcceso1_idx` (`cdGA` ASC) ,
  INDEX `fk_T_AccesoM_T_Menu1_idx` (`cdMenu` ASC) ,
  PRIMARY KEY (`idAm`) ,
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
  `Asiste` TINYINT(1) NOT NULL ,
  `Tardanza` TINYINT(1) NOT NULL ,
  `Fustifica` TINYINT(1) NOT NULL ,
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
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('coropeza', 'PF01', '12345', '1');
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('mvalois', 'PF01', '12345', '1');
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('dparraga', 'PF01', '12345', '1');
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('mrobles', 'PF01', '12345', '1');
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('ecardenas', 'PF01', '12345', '1');
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('vnunez', 'PF01', '12345', '1');
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('rcisneros', 'PF01', '12345', '1');
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('cmiranda', 'PF05', '12345', '1');
INSERT INTO `BD_EMCH`.`T_Usuario` (`nomUsu`, `cdPerfil`, `pass`, `estado`) VALUES ('aperez', 'PF05', '12345', '1');

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
INSERT INTO `BD_EMCH`.`T_Empresa` (`rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`, `cdUbig`) VALUES ('20131378115', 'MUNICIPALIDAD DISTRITAL DE SAN LUIS', '04/05/1993', 'Av. del Aire  Nro. 1540 URB. Villa Jardin', '365027', NULL, '150134');
INSERT INTO `BD_EMCH`.`T_Empresa` (`rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`, `cdUbig`) VALUES ('20131368071', 'MUNICIPALIDAD DISTRITAL DE LA VICTORIA', '04/05/1993', 'AV. IQUITOS NRO. 500', '315766', NULL, '150115');
INSERT INTO `BD_EMCH`.`T_Empresa` (`rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`, `cdUbig`) VALUES ('20131378620', 'MUNICIPALIDAD DISTRITAL DE ATE', '04/05/1993', 'CAR. CARRETERA CENTRAL KM 7.5', '4941428', NULL, '150103');
INSERT INTO `BD_EMCH`.`T_Empresa` (`rucE`, `rSocial`, `fechaIni`, `direccion`, `telef`, `logo`, `cdUbig`) VALUES ('20131373741', 'MUNICIPALIDAD DE SAN BORJA', '01/01/1984', 'AV. AVENIDA JOAQUIN MADRID NRO.200', '6125555', NULL, '150130');

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Cliente` (`cdCliente`, `nomUsu`, `cdUbig`, `rucE`, `nombreComp`, `TipoDocI`, `NroDocI`, `Domicilio`, `Telefono`, `celular`, `email`, `estado`) VALUES ('CLT0000001', 'cmiranda', '150134', '20131378115', 'Carlos Miranda', 'N', '29283746', 'av. San Lusi 345', NULL, NULL, NULL, 1);
INSERT INTO `BD_EMCH`.`T_Cliente` (`cdCliente`, `nomUsu`, `cdUbig`, `rucE`, `nombreComp`, `TipoDocI`, `NroDocI`, `Domicilio`, `Telefono`, `celular`, `email`, `estado`) VALUES ('CLT0000002', 'aperez', '150115', '20131368071', 'Angela Perez', 'N', '23245654', 'av. mexico 223', NULL, NULL, NULL, 1);

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
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0008', NULL, 'TP3', '150117', 'Arturo', 'Tabares Mora', '965873231', NULL, '965873231', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0009', NULL, 'TP6', '150136', 'Jaime', 'Lopez Tobon', '987548751', NULL, '987548751', 'erick.cardenas@outlook.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0010', NULL, 'TP6', '150116', 'Julio Cesar', 'Rodas Monsalve', '38877943', NULL, '995625487', 'cesar20991@hotmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0011', NULL, 'TP5', '150135', 'Gustavo', 'Rodriguez Vallejo', '4431891', NULL, '923654587', 'cesar20991@gmail.com', 1);
INSERT INTO `BD_EMCH`.`T_Trabajador` (`cdTrabajador`, `nomUsu`, `cdTipoTrabajador`, `cdUbig`, `nombres`, `apellidos`, `DNI`, `telefono`, `celular`, `email`, `estado`) VALUES ('TR0012', NULL, 'TP5', '150122', 'Maria VIctoria', 'Arias Gomez', '60388222', NULL, '994568788', 'cesar20991@gmail.com', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `BD_EMCH`.`T_Camion`
-- -----------------------------------------------------
START TRANSACTION;
USE `BD_EMCH`;
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `placa`, `modelo`, `marca`, `anio`, `pesoBruto`, `tipoCombustible`, `direccion`, `cajaCambios`, `velocMax`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0001', 'aer123', 'aaa', 'toyota', '1995', '13', 'd2', 'cc', 'mecanica', '180', '1290', NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `placa`, `modelo`, `marca`, `anio`, `pesoBruto`, `tipoCombustible`, `direccion`, `cajaCambios`, `velocMax`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0002', 'dea124', 'bbb', 'nisan', '1998', '12', 'gasolina', 'cc', 'automatica', '180', '1234', NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `placa`, `modelo`, `marca`, `anio`, `pesoBruto`, `tipoCombustible`, `direccion`, `cajaCambios`, `velocMax`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0003', 'oko123', 'ccc', 'toyota', '1997', '15', 'd2', 'cc', 'mecanica', '180', '1849', NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `placa`, `modelo`, `marca`, `anio`, `pesoBruto`, `tipoCombustible`, `direccion`, `cajaCambios`, `velocMax`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0004', 'uhj098', 'ddd', 'nisan', '1997', '12', 'gasolina', 'cc', 'mecanica', '180', '1298', NULL, 1);
INSERT INTO `BD_EMCH`.`T_Camion` (`cdCamion`, `placa`, `modelo`, `marca`, `anio`, `pesoBruto`, `tipoCombustible`, `direccion`, `cajaCambios`, `velocMax`, `kilometraje`, `imagen`, `estado`) VALUES ('CA0005', 'yui787', 'eee', 'toyota', '1993', '12', 'd2', 'cc', 'automatico', '180', '1290', NULL, 1);

COMMIT;
