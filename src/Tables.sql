-- -----------------------------------------------------
-- Table `Platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Platform` ;

CREATE TABLE IF NOT EXISTS `Platform` (
  `idPlatform` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlatform`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Software`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Software` ;

CREATE TABLE IF NOT EXISTS `Software` (
  `SoftwareId` INT NOT NULL,
  `Name` VARCHAR(200) NULL,
  `CurrentVersion` INT NOT NULL,
  `Price` DECIMAL(6,2) NULL,
  `DistributionCost` DECIMAL(6,2) NULL,
  `idPlatform` INT NULL,
  `Description` BLOB NULL,
  `YearOfRelease` YEAR NULL,
  `Website` VARCHAR(300) NULL,
  PRIMARY KEY (`SoftwareId`),
  INDEX `fk_Software_Platform1_idx` (`idPlatform` ASC),
  CONSTRAINT `fk_Software_Platform1`
    FOREIGN KEY (`idPlatform`)
    REFERENCES `Platform` (`idPlatform`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Staff` ;

CREATE TABLE IF NOT EXISTS `Staff` (
  `idStaff` INT NOT NULL,
  `FirstName` VARCHAR(50) NULL,
  `LastName` VARCHAR(50) NULL,
  PRIMARY KEY (`idStaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `JobTitle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `JobTitle` ;

CREATE TABLE IF NOT EXISTS `JobTitle` (
  `idJobTitle` INT NOT NULL,
  `OfficialJobTitle` VARCHAR(50) NOT NULL,
  `PayRatePerHour` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idJobTitle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Development`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Development` ;

CREATE TABLE IF NOT EXISTS `Development` (
  `SoftwareId` INT NOT NULL,
  `idStaff` INT NOT NULL,
  `idJobTitle` INT NOT NULL,
  PRIMARY KEY (`SoftwareId`, `idStaff`, `idJobTitle`),
  INDEX `fk_Development_Software1_idx` (`SoftwareId` ASC),
  INDEX `fk_Development_Staff1_idx` (`idStaff` ASC),
  INDEX `fk_Development_JobTitle1_idx` (`idJobTitle` ASC),
  CONSTRAINT `fk_Development_Software1`
    FOREIGN KEY (`SoftwareId`)
    REFERENCES `Software` (`SoftwareId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Development_Staff1`
    FOREIGN KEY (`idStaff`)
    REFERENCES `Staff` (`idStaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Development_JobTitle1`
    FOREIGN KEY (`idJobTitle`)
    REFERENCES `JobTitle` (`idJobTitle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
