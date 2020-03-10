-- -----------------------------------------------------
-- Question 1
-- -----------------------------------------------------
-- Table `Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Location`;

CREATE TABLE IF NOT EXISTS `Location` (
	`idLocation` INT NOT NULL AUTO_INCREMENT,
	`StreetNumber` SMALLINT NULL,
	`StreetNumberSuffix` VARCHAR(20) NULL,
    `StreetName` VARCHAR(50) NULL,
    `StreetType` VARCHAR(20) NULL,
    `MinorMunicipality` VARCHAR(50) NULL,
    `MajorMunicipality` VARCHAR(50) NULL,
    `GoverningDistrict` VARCHAR(50) NULL,
    `PostalArea` VARCHAR(4) NULL,
    `Country` VARCHAR(50) NULL,
    PRIMARY KEY (`idLocation`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Consumer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Consumer`;

CREATE TABLE IF NOT EXISTS `Consumer` (
	`UserName` VARCHAR(50) NOT NULL,
    `FirstName` VARCHAR(45) NULL,
    `LastName` VARCHAR(45) NULL,
    `email` VARCHAR(100) NULL,
    PRIMARY KEY (`UserName`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsumerLocation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConsumerLocation`;

CREATE TABLE IF NOT EXISTS `ConsumerLocation` (
	`UserName` VARCHAR(50) NOT NULL,
    `idLocation` INT NOT NULL,
	`ValidFrom` DATE NOT NULL,
    `ValidTo` DATE NULL,
    PRIMARY KEY (`UserName`, `idLocation`, `ValidFrom`),
    INDEX `fk_ConsumerLocation_Consumer1_idx` (`UserName` ASC),
    INDEX `fk_ConsumerLocation_Location1_idx` (`idLocation` ASC),
    CONSTRAINT `fk_ConsumerLocation_Consumer1`
		FOREIGN KEY (`UserName`)
        REFERENCES `Consumer` (`UserName`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
	CONSTRAINT `fk_ConsumerLocation_Location1`
		FOREIGN KEY (`idLocation`)
        REFERENCES `Location` (`idLocation`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ConsumerLocation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Licence`;

CREATE TABLE IF NOT EXISTS `Licence` (
    `SoftwareId` INT NOT NULL AUTO_INCREMENT,
    `UserName` VARCHAR(50) NOT NULL,
    `PurchaseTime` DATETIME NOT NULL,
    `Installed` BOOLEAN NOT NULL,
    PRIMARY KEY (`SoftwareId` , `UserName` , `PurchaseTime`),
    INDEX `fk_Licence_Software1_idx` (`SoftwareId` ASC),
    INDEX `fk_Licence_Consumer1_idx` (`UserName` ASC),
    CONSTRAINT `fk_Licence_Software1` FOREIGN KEY (`SoftwareId`)
        REFERENCES `Software` (`SoftwareId`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_Licence_Consumer1` FOREIGN KEY (`UserName`)
        REFERENCES `Consumer` (`UserName`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
)  ENGINE = InnoDB;
