-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.15 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table asm.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Archived` int(11) DEFAULT NULL,
  `AccountType` int(11) NOT NULL,
  `CostTypeID` int(11) DEFAULT NULL,
  `DonationTypeID` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `accounts_Code` (`Code`),
  KEY `accounts_Archived` (`Archived`),
  KEY `accounts_CostTypeID` (`CostTypeID`),
  KEY `accounts_DonationTypeID` (`DonationTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.accountsrole
CREATE TABLE IF NOT EXISTS `accountsrole` (
  `AccountID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `CanView` int(11) NOT NULL,
  `CanEdit` int(11) NOT NULL,
  KEY `accountsrole_AccountIDRoleID` (`AccountID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.accountstrx
CREATE TABLE IF NOT EXISTS `accountstrx` (
  `ID` int(11) NOT NULL,
  `TrxDate` datetime NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Reconciled` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `SourceAccountID` int(11) NOT NULL,
  `DestinationAccountID` int(11) NOT NULL,
  `AnimalCostID` int(11) DEFAULT NULL,
  `OwnerDonationID` int(11) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `accountstrx_TrxDate` (`TrxDate`),
  KEY `accountstrx_Source` (`SourceAccountID`),
  KEY `accountstrx_Dest` (`DestinationAccountID`),
  KEY `accountstrx_Cost` (`AnimalCostID`),
  KEY `accountstrx_Donation` (`OwnerDonationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.additional
CREATE TABLE IF NOT EXISTS `additional` (
  `LinkType` int(11) NOT NULL,
  `LinkID` int(11) NOT NULL,
  `AdditionalFieldID` int(11) NOT NULL,
  `Value` longtext,
  UNIQUE KEY `additional_LinkTypeIDAdd` (`LinkType`,`LinkID`,`AdditionalFieldID`),
  KEY `additional_LinkTypeID` (`LinkType`,`LinkID`),
  KEY `additional_LinkID` (`LinkID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.additionalfield
CREATE TABLE IF NOT EXISTS `additionalfield` (
  `ID` int(11) NOT NULL,
  `LinkType` int(11) NOT NULL,
  `FieldName` varchar(255) NOT NULL,
  `FieldLabel` varchar(255) NOT NULL,
  `ToolTip` varchar(255) NOT NULL,
  `LookupValues` longtext,
  `DefaultValue` longtext,
  `FieldType` int(11) NOT NULL,
  `DisplayIndex` int(11) NOT NULL,
  `Mandatory` int(11) NOT NULL,
  `NewRecord` int(11) NOT NULL,
  `Searchable` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `additionalfield_LinkType` (`LinkType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.adoption
CREATE TABLE IF NOT EXISTS `adoption` (
  `ID` int(11) NOT NULL,
  `AdoptionNumber` varchar(255) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  `RetailerID` int(11) DEFAULT NULL,
  `OriginalRetailerMovementID` int(11) DEFAULT NULL,
  `MovementDate` datetime DEFAULT NULL,
  `MovementType` int(11) NOT NULL,
  `ReturnDate` datetime DEFAULT NULL,
  `ReturnedReasonID` int(11) NOT NULL,
  `InsuranceNumber` varchar(255) DEFAULT NULL,
  `ReasonForReturn` longtext,
  `ReturnedByOwnerID` int(11) DEFAULT NULL,
  `ReservationDate` datetime DEFAULT NULL,
  `ReservationCancelledDate` datetime DEFAULT NULL,
  `ReservationStatusID` int(11) DEFAULT NULL,
  `Donation` int(11) DEFAULT NULL,
  `IsTrial` int(11) DEFAULT NULL,
  `IsPermanentFoster` int(11) DEFAULT NULL,
  `TrialEndDate` datetime DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `adoption_AdoptionNumber` (`AdoptionNumber`),
  KEY `adoption_AnimalID` (`AnimalID`),
  KEY `adoption_CreatedBy` (`CreatedBy`),
  KEY `adoption_IsPermanentFoster` (`IsPermanentFoster`),
  KEY `adoption_IsTrial` (`IsTrial`),
  KEY `adoption_OwnerID` (`OwnerID`),
  KEY `adoption_RetailerID` (`RetailerID`),
  KEY `adoption_MovementDate` (`MovementDate`),
  KEY `adoption_MovementType` (`MovementType`),
  KEY `adoption_ReservationDate` (`ReservationDate`),
  KEY `adoption_ReservationCancelledDate` (`ReservationCancelledDate`),
  KEY `adoption_ReservationStatusID` (`ReservationStatusID`),
  KEY `adoption_ReturnDate` (`ReturnDate`),
  KEY `adoption_ReturnedReasonID` (`ReturnedReasonID`),
  KEY `adoption_ReturnedByOwnerID` (`ReturnedByOwnerID`),
  KEY `adoption_TrialEndDate` (`TrialEndDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animal
CREATE TABLE IF NOT EXISTS `animal` (
  `ID` int(11) NOT NULL,
  `AnimalTypeID` int(11) NOT NULL,
  `AnimalName` varchar(255) NOT NULL,
  `NonShelterAnimal` int(11) NOT NULL,
  `CrueltyCase` int(11) NOT NULL,
  `BondedAnimalID` int(11) NOT NULL,
  `BondedAnimal2ID` int(11) NOT NULL,
  `BaseColourID` int(11) NOT NULL,
  `SpeciesID` int(11) NOT NULL,
  `BreedID` int(11) NOT NULL,
  `Breed2ID` int(11) NOT NULL,
  `BreedName` varchar(255) DEFAULT NULL,
  `CrossBreed` int(11) NOT NULL,
  `CoatType` int(11) NOT NULL,
  `Markings` longtext,
  `ShelterCode` varchar(255) NOT NULL,
  `ShortCode` varchar(255) NOT NULL,
  `UniqueCodeID` int(11) DEFAULT NULL,
  `SmartTagSentDate` datetime DEFAULT NULL,
  `YearCodeID` int(11) DEFAULT NULL,
  `AcceptanceNumber` varchar(255) NOT NULL,
  `DateOfBirth` datetime NOT NULL,
  `EstimatedDOB` int(11) NOT NULL,
  `AgeGroup` varchar(255) DEFAULT NULL,
  `DeceasedDate` datetime DEFAULT NULL,
  `Sex` int(11) NOT NULL,
  `Fee` int(11) DEFAULT NULL,
  `Identichipped` int(11) NOT NULL,
  `IdentichipNumber` varchar(255) NOT NULL,
  `IdentichipDate` datetime DEFAULT NULL,
  `Identichip2Number` varchar(255) DEFAULT NULL,
  `Identichip2Date` datetime DEFAULT NULL,
  `Tattoo` int(11) NOT NULL,
  `TattooNumber` varchar(255) NOT NULL,
  `TattooDate` datetime DEFAULT NULL,
  `SmartTag` int(11) NOT NULL,
  `SmartTagNumber` varchar(255) DEFAULT NULL,
  `SmartTagDate` datetime DEFAULT NULL,
  `SmartTagType` int(11) NOT NULL,
  `Neutered` int(11) NOT NULL,
  `NeuteredDate` datetime DEFAULT NULL,
  `NeuteredByVetID` int(11) DEFAULT NULL,
  `CombiTested` int(11) NOT NULL,
  `CombiTestDate` datetime DEFAULT NULL,
  `CombiTestResult` int(11) NOT NULL,
  `HeartwormTested` int(11) NOT NULL,
  `HeartwormTestDate` datetime DEFAULT NULL,
  `HeartwormTestResult` int(11) NOT NULL,
  `FLVResult` int(11) NOT NULL,
  `Declawed` int(11) NOT NULL,
  `HiddenAnimalDetails` longtext,
  `AnimalComments` longtext,
  `OwnersVetID` int(11) NOT NULL,
  `CurrentVetID` int(11) NOT NULL,
  `OriginalOwnerID` int(11) NOT NULL,
  `BroughtInByOwnerID` int(11) NOT NULL,
  `AdoptionCoordinatorID` int(11) DEFAULT NULL,
  `ReasonForEntry` longtext,
  `ReasonNO` longtext,
  `DateBroughtIn` datetime NOT NULL,
  `EntryReasonID` int(11) NOT NULL,
  `AsilomarIsTransferExternal` int(11) DEFAULT NULL,
  `AsilomarIntakeCategory` int(11) DEFAULT NULL,
  `AsilomarOwnerRequestedEuthanasia` int(11) DEFAULT NULL,
  `IsPickup` int(11) DEFAULT NULL,
  `PickupLocationID` int(11) DEFAULT NULL,
  `PickupAddress` varchar(255) DEFAULT NULL,
  `HealthProblems` longtext,
  `PutToSleep` int(11) NOT NULL,
  `PTSReason` longtext,
  `PTSReasonID` int(11) NOT NULL,
  `IsCourtesy` int(11) DEFAULT NULL,
  `IsDOA` int(11) NOT NULL,
  `IsTransfer` int(11) NOT NULL,
  `IsGoodWithCats` int(11) NOT NULL,
  `IsGoodWithDogs` int(11) NOT NULL,
  `IsGoodWithChildren` int(11) NOT NULL,
  `IsHouseTrained` int(11) NOT NULL,
  `IsNotAvailableForAdoption` int(11) NOT NULL,
  `IsNotForRegistration` int(11) DEFAULT NULL,
  `IsHold` int(11) DEFAULT NULL,
  `HoldUntilDate` datetime DEFAULT NULL,
  `IsQuarantine` int(11) DEFAULT NULL,
  `HasSpecialNeeds` int(11) NOT NULL,
  `AdditionalFlags` longtext,
  `ShelterLocation` int(11) NOT NULL,
  `ShelterLocationUnit` varchar(255) DEFAULT NULL,
  `DiedOffShelter` int(11) NOT NULL,
  `Size` int(11) NOT NULL,
  `Weight` double DEFAULT NULL,
  `RabiesTag` varchar(255) DEFAULT NULL,
  `Archived` int(11) NOT NULL,
  `ActiveMovementID` int(11) NOT NULL,
  `ActiveMovementType` int(11) DEFAULT NULL,
  `ActiveMovementDate` datetime DEFAULT NULL,
  `ActiveMovementReturn` datetime DEFAULT NULL,
  `HasActiveReserve` int(11) DEFAULT NULL,
  `HasTrialAdoption` int(11) DEFAULT NULL,
  `HasPermanentFoster` int(11) DEFAULT NULL,
  `DisplayLocation` varchar(255) DEFAULT NULL,
  `MostRecentEntryDate` datetime NOT NULL,
  `TimeOnShelter` varchar(255) DEFAULT NULL,
  `TotalTimeOnShelter` varchar(255) DEFAULT NULL,
  `DaysOnShelter` int(11) DEFAULT NULL,
  `TotalDaysOnShelter` int(11) DEFAULT NULL,
  `AgeGroupActiveMovement` varchar(255) DEFAULT NULL,
  `DailyBoardingCost` int(11) DEFAULT NULL,
  `AnimalAge` varchar(255) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `animal_AnimalShelterCode` (`ShelterCode`),
  KEY `animal_AnimalTypeID` (`AnimalTypeID`),
  KEY `animal_AnimalName` (`AnimalName`),
  KEY `animal_AnimalSpecies` (`SpeciesID`),
  KEY `animal_Archived` (`Archived`),
  KEY `animal_ActiveMovementID` (`ActiveMovementID`),
  KEY `animal_ActiveMovementDate` (`ActiveMovementDate`),
  KEY `animal_ActiveMovementReturn` (`ActiveMovementReturn`),
  KEY `animal_AcceptanceNumber` (`AcceptanceNumber`),
  KEY `animal_ActiveMovementType` (`ActiveMovementType`),
  KEY `animal_AdoptionCoordinatorID` (`AdoptionCoordinatorID`),
  KEY `animal_AgeGroup` (`AgeGroup`),
  KEY `animal_BaseColourID` (`BaseColourID`),
  KEY `animal_BondedAnimalID` (`BondedAnimalID`),
  KEY `animal_BondedAnimal2ID` (`BondedAnimal2ID`),
  KEY `animal_BreedID` (`BreedID`),
  KEY `animal_Breed2ID` (`Breed2ID`),
  KEY `animal_BreedName` (`BreedName`),
  KEY `animal_BroughtInByOwnerID` (`BroughtInByOwnerID`),
  KEY `animal_CoatType` (`CoatType`),
  KEY `animal_CreatedBy` (`CreatedBy`),
  KEY `animal_CreatedDate` (`CreatedDate`),
  KEY `animal_CurrentVetID` (`CurrentVetID`),
  KEY `animal_DateBroughtIn` (`DateBroughtIn`),
  KEY `animal_DeceasedDate` (`DeceasedDate`),
  KEY `animal_DiedOffShelter` (`DiedOffShelter`),
  KEY `animal_EntryReasonID` (`EntryReasonID`),
  KEY `animal_IdentichipNumber` (`IdentichipNumber`),
  KEY `animal_Identichip2Number` (`Identichip2Number`),
  KEY `animal_LastChangedDate` (`LastChangedDate`),
  KEY `animal_MostRecentEntryDate` (`MostRecentEntryDate`),
  KEY `animal_Neutered` (`Neutered`),
  KEY `animal_NeuteredByVetID` (`NeuteredByVetID`),
  KEY `animal_NonShelterAnimal` (`NonShelterAnimal`),
  KEY `animal_OriginalOwnerID` (`OriginalOwnerID`),
  KEY `animal_OwnersVetID` (`OwnersVetID`),
  KEY `animal_PickupLocationID` (`PickupLocationID`),
  KEY `animal_PickupAddress` (`PickupAddress`),
  KEY `animal_PutToSleep` (`PutToSleep`),
  KEY `animal_PTSReasonID` (`PTSReasonID`),
  KEY `animal_RabiesTag` (`RabiesTag`),
  KEY `animal_Sex` (`Sex`),
  KEY `animal_Size` (`Size`),
  KEY `animal_ShelterLocation` (`ShelterLocation`),
  KEY `animal_ShelterLocationUnit` (`ShelterLocationUnit`),
  KEY `animal_ShortCode` (`ShortCode`),
  KEY `animal_TattooNumber` (`TattooNumber`),
  KEY `animal_UniqueCodeID` (`UniqueCodeID`),
  KEY `animal_Weight` (`Weight`),
  KEY `animal_YearCodeID` (`YearCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalcontrol
CREATE TABLE IF NOT EXISTS `animalcontrol` (
  `ID` int(11) NOT NULL,
  `IncidentDateTime` datetime NOT NULL,
  `IncidentTypeID` int(11) NOT NULL,
  `CallDateTime` datetime DEFAULT NULL,
  `CallNotes` longtext,
  `CallTaker` varchar(255) DEFAULT NULL,
  `CallerID` int(11) DEFAULT NULL,
  `VictimID` int(11) DEFAULT NULL,
  `DispatchAddress` varchar(255) DEFAULT NULL,
  `DispatchTown` varchar(255) DEFAULT NULL,
  `DispatchCounty` varchar(255) DEFAULT NULL,
  `DispatchPostcode` varchar(255) DEFAULT NULL,
  `DispatchLatLong` varchar(255) DEFAULT NULL,
  `DispatchedACO` varchar(255) DEFAULT NULL,
  `PickupLocationID` int(11) DEFAULT NULL,
  `JurisdictionID` int(11) DEFAULT NULL,
  `DispatchDateTime` datetime DEFAULT NULL,
  `RespondedDateTime` datetime DEFAULT NULL,
  `FollowupDateTime` datetime DEFAULT NULL,
  `FollowupComplete` int(11) DEFAULT NULL,
  `FollowupDateTime2` datetime DEFAULT NULL,
  `FollowupComplete2` int(11) DEFAULT NULL,
  `FollowupDateTime3` datetime DEFAULT NULL,
  `FollowupComplete3` int(11) DEFAULT NULL,
  `CompletedDate` datetime DEFAULT NULL,
  `IncidentCompletedID` int(11) DEFAULT NULL,
  `SiteID` int(11) DEFAULT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  `Owner2ID` int(11) DEFAULT NULL,
  `Owner3ID` int(11) DEFAULT NULL,
  `AnimalID` int(11) DEFAULT NULL,
  `AnimalDescription` longtext,
  `SpeciesID` int(11) DEFAULT NULL,
  `Sex` int(11) DEFAULT NULL,
  `AgeGroup` varchar(255) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalcontrol_IncidentDateTime` (`IncidentDateTime`),
  KEY `animalcontrol_IncidentTypeID` (`IncidentTypeID`),
  KEY `animalcontrol_CallDateTime` (`CallDateTime`),
  KEY `animalcontrol_CallerID` (`CallerID`),
  KEY `animalcontrol_DispatchAddress` (`DispatchAddress`),
  KEY `animalcontrol_DispatchPostcode` (`DispatchPostcode`),
  KEY `animalcontrol_DispatchedACO` (`DispatchedACO`),
  KEY `animalcontrol_DispatchDateTime` (`DispatchDateTime`),
  KEY `animalcontrol_FollowupDateTime` (`FollowupDateTime`),
  KEY `animalcontrol_FollowupComplete` (`FollowupComplete`),
  KEY `animalcontrol_FollowupDateTime2` (`FollowupDateTime2`),
  KEY `animalcontrol_FollowupComplete2` (`FollowupComplete2`),
  KEY `animalcontrol_FollowupDateTime3` (`FollowupDateTime3`),
  KEY `animalcontrol_FollowupComplete3` (`FollowupComplete3`),
  KEY `animalcontrol_CompletedDate` (`CompletedDate`),
  KEY `animalcontrol_IncidentCompletedID` (`IncidentCompletedID`),
  KEY `animalcontrol_JurisdictionID` (`JurisdictionID`),
  KEY `animalcontrol_PickupLocationID` (`PickupLocationID`),
  KEY `animalcontrol_AnimalID` (`AnimalID`),
  KEY `animalcontrol_OwnerID` (`OwnerID`),
  KEY `animalcontrol_Owner2ID` (`Owner2ID`),
  KEY `animalcontrol_Owner3ID` (`Owner3ID`),
  KEY `animalcontrol_SiteID` (`SiteID`),
  KEY `animalcontrol_VictimID` (`VictimID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalcontrolanimal
CREATE TABLE IF NOT EXISTS `animalcontrolanimal` (
  `AnimalControlID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  UNIQUE KEY `animalcontrolanimal_AnimalControlIDAnimalID` (`AnimalControlID`,`AnimalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalcontrolrole
CREATE TABLE IF NOT EXISTS `animalcontrolrole` (
  `AnimalControlID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `CanView` int(11) NOT NULL,
  `CanEdit` int(11) NOT NULL,
  KEY `animalcontrolrole_AnimalControlIDRoleID` (`AnimalControlID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalcost
CREATE TABLE IF NOT EXISTS `animalcost` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `CostTypeID` int(11) NOT NULL,
  `CostDate` datetime NOT NULL,
  `CostPaidDate` datetime DEFAULT NULL,
  `CostAmount` int(11) NOT NULL,
  `Description` longtext NOT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalcost_AnimalID` (`AnimalID`),
  KEY `animalcost_CostTypeID` (`CostTypeID`),
  KEY `animalcost_CostDate` (`CostDate`),
  KEY `animalcost_CostPaidDate` (`CostPaidDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animaldiet
CREATE TABLE IF NOT EXISTS `animaldiet` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `DietID` int(11) NOT NULL,
  `DateStarted` datetime NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animaldiet_AnimalID` (`AnimalID`),
  KEY `animaldiet_DietID` (`DietID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalfigures
CREATE TABLE IF NOT EXISTS `animalfigures` (
  `ID` int(11) NOT NULL,
  `Month` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `OrderIndex` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `AnimalTypeID` int(11) NOT NULL,
  `SpeciesID` int(11) NOT NULL,
  `MaxDaysInMonth` int(11) NOT NULL,
  `Heading` varchar(255) NOT NULL,
  `Bold` int(11) NOT NULL,
  `D1` int(11) NOT NULL,
  `D2` int(11) NOT NULL,
  `D3` int(11) NOT NULL,
  `D4` int(11) NOT NULL,
  `D5` int(11) NOT NULL,
  `D6` int(11) NOT NULL,
  `D7` int(11) NOT NULL,
  `D8` int(11) NOT NULL,
  `D9` int(11) NOT NULL,
  `D10` int(11) NOT NULL,
  `D11` int(11) NOT NULL,
  `D12` int(11) NOT NULL,
  `D13` int(11) NOT NULL,
  `D14` int(11) NOT NULL,
  `D15` int(11) NOT NULL,
  `D16` int(11) NOT NULL,
  `D17` int(11) NOT NULL,
  `D18` int(11) NOT NULL,
  `D19` int(11) NOT NULL,
  `D20` int(11) NOT NULL,
  `D21` int(11) NOT NULL,
  `D22` int(11) NOT NULL,
  `D23` int(11) NOT NULL,
  `D24` int(11) NOT NULL,
  `D25` int(11) NOT NULL,
  `D26` int(11) NOT NULL,
  `D27` int(11) NOT NULL,
  `D28` int(11) NOT NULL,
  `D29` int(11) NOT NULL,
  `D30` int(11) NOT NULL,
  `D31` int(11) NOT NULL,
  `TOTAL` varchar(255) NOT NULL,
  `AVERAGE` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalfigures_AnimalTypeID` (`AnimalTypeID`),
  KEY `animalfigures_SpeciesID` (`SpeciesID`),
  KEY `animalfigures_Month` (`Month`),
  KEY `animalfigures_Year` (`Year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalfiguresannual
CREATE TABLE IF NOT EXISTS `animalfiguresannual` (
  `ID` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `OrderIndex` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `AnimalTypeID` int(11) NOT NULL,
  `SpeciesID` int(11) NOT NULL,
  `EntryReasonID` int(11) NOT NULL,
  `GroupHeading` varchar(255) NOT NULL,
  `Heading` varchar(255) NOT NULL,
  `Bold` int(11) NOT NULL,
  `M1` int(11) NOT NULL,
  `M2` int(11) NOT NULL,
  `M3` int(11) NOT NULL,
  `M4` int(11) NOT NULL,
  `M5` int(11) NOT NULL,
  `M6` int(11) NOT NULL,
  `M7` int(11) NOT NULL,
  `M8` int(11) NOT NULL,
  `M9` int(11) NOT NULL,
  `M10` int(11) NOT NULL,
  `M11` int(11) NOT NULL,
  `M12` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalfiguresannual_AnimalTypeID` (`AnimalTypeID`),
  KEY `animalfiguresannual_SpeciesID` (`SpeciesID`),
  KEY `animalfiguresannual_EntryReasonID` (`EntryReasonID`),
  KEY `animalfiguresannual_Year` (`Year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalfound
CREATE TABLE IF NOT EXISTS `animalfound` (
  `ID` int(11) NOT NULL,
  `AnimalTypeID` int(11) NOT NULL,
  `DateReported` datetime NOT NULL,
  `DateFound` datetime NOT NULL,
  `Sex` int(11) NOT NULL,
  `BreedID` int(11) NOT NULL,
  `AgeGroup` varchar(255) DEFAULT NULL,
  `BaseColourID` int(11) NOT NULL,
  `DistFeat` longtext NOT NULL,
  `AreaFound` varchar(255) NOT NULL,
  `AreaPostcode` varchar(255) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `ReturnToOwnerDate` datetime DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalfound_ReturnToOwnerDate` (`ReturnToOwnerDate`),
  KEY `animalfound_AnimalTypeID` (`AnimalTypeID`),
  KEY `animalfound_AreaFound` (`AreaFound`),
  KEY `animalfound_AreaPostcode` (`AreaPostcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animallitter
CREATE TABLE IF NOT EXISTS `animallitter` (
  `ID` int(11) NOT NULL,
  `ParentAnimalID` int(11) NOT NULL,
  `SpeciesID` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `AcceptanceNumber` varchar(255) DEFAULT NULL,
  `CachedAnimalsLeft` int(11) NOT NULL,
  `InvalidDate` datetime DEFAULT NULL,
  `NumberInLitter` int(11) NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animallost
CREATE TABLE IF NOT EXISTS `animallost` (
  `ID` int(11) NOT NULL,
  `AnimalTypeID` int(11) NOT NULL,
  `DateReported` datetime NOT NULL,
  `DateLost` datetime NOT NULL,
  `DateFound` datetime DEFAULT NULL,
  `Sex` int(11) NOT NULL,
  `BreedID` int(11) NOT NULL,
  `AgeGroup` varchar(255) DEFAULT NULL,
  `BaseColourID` int(11) NOT NULL,
  `DistFeat` longtext NOT NULL,
  `AreaLost` varchar(255) NOT NULL,
  `AreaPostcode` varchar(255) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animallost_DateFound` (`DateFound`),
  KEY `animallost_AnimalTypeID` (`AnimalTypeID`),
  KEY `animallost_AreaLost` (`AreaLost`),
  KEY `animallost_AreaPostcode` (`AreaPostcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animallostfoundmatch
CREATE TABLE IF NOT EXISTS `animallostfoundmatch` (
  `AnimalLostID` int(11) NOT NULL,
  `AnimalFoundID` int(11) DEFAULT NULL,
  `AnimalID` int(11) DEFAULT NULL,
  `LostContactName` varchar(255) DEFAULT NULL,
  `LostContactNumber` varchar(255) DEFAULT NULL,
  `LostArea` varchar(255) DEFAULT NULL,
  `LostPostcode` varchar(255) DEFAULT NULL,
  `LostAgeGroup` varchar(255) DEFAULT NULL,
  `LostSex` int(11) DEFAULT NULL,
  `LostSpeciesID` int(11) DEFAULT NULL,
  `LostBreedID` int(11) DEFAULT NULL,
  `LostFeatures` longtext,
  `LostBaseColourID` int(11) DEFAULT NULL,
  `LostDate` datetime DEFAULT NULL,
  `FoundContactName` varchar(255) DEFAULT NULL,
  `FoundContactNumber` varchar(255) DEFAULT NULL,
  `FoundArea` varchar(255) DEFAULT NULL,
  `FoundPostcode` varchar(255) DEFAULT NULL,
  `FoundAgeGroup` varchar(255) DEFAULT NULL,
  `FoundSex` int(11) DEFAULT NULL,
  `FoundSpeciesID` int(11) DEFAULT NULL,
  `FoundBreedID` int(11) DEFAULT NULL,
  `FoundFeatures` longtext,
  `FoundBaseColourID` int(11) DEFAULT NULL,
  `FoundDate` datetime DEFAULT NULL,
  `MatchPoints` int(11) NOT NULL,
  KEY `animallostfoundmatch_AnimalLostID` (`AnimalLostID`),
  KEY `animallostfoundmatch_AnimalFoundID` (`AnimalFoundID`),
  KEY `animallostfoundmatch_AnimalID` (`AnimalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalmedical
CREATE TABLE IF NOT EXISTS `animalmedical` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `MedicalProfileID` int(11) NOT NULL,
  `TreatmentName` varchar(255) NOT NULL,
  `StartDate` datetime NOT NULL,
  `Dosage` varchar(255) DEFAULT NULL,
  `Cost` int(11) NOT NULL,
  `CostPaidDate` datetime DEFAULT NULL,
  `TimingRule` int(11) NOT NULL,
  `TimingRuleFrequency` int(11) NOT NULL,
  `TimingRuleNoFrequencies` int(11) NOT NULL,
  `TreatmentRule` int(11) NOT NULL,
  `TotalNumberOfTreatments` int(11) NOT NULL,
  `TreatmentsGiven` int(11) NOT NULL,
  `TreatmentsRemaining` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalmedical_AnimalID` (`AnimalID`),
  KEY `animalmedical_MedicalProfileID` (`MedicalProfileID`),
  KEY `animalmedical_CostPaidDate` (`CostPaidDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalmedicaltreatment
CREATE TABLE IF NOT EXISTS `animalmedicaltreatment` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `AnimalMedicalID` int(11) NOT NULL,
  `AdministeringVetID` int(11) DEFAULT NULL,
  `DateRequired` datetime NOT NULL,
  `DateGiven` datetime DEFAULT NULL,
  `TreatmentNumber` int(11) NOT NULL,
  `TotalTreatments` int(11) NOT NULL,
  `GivenBy` varchar(255) NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalmedicaltreatment_AnimalID` (`AnimalID`),
  KEY `animalmedicaltreatment_AnimalMedicalID` (`AnimalMedicalID`),
  KEY `animalmedicaltreatment_AdministeringVetID` (`AdministeringVetID`),
  KEY `animalmedicaltreatment_DateRequired` (`DateRequired`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalname
CREATE TABLE IF NOT EXISTS `animalname` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Sex` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalpublished
CREATE TABLE IF NOT EXISTS `animalpublished` (
  `AnimalID` int(11) NOT NULL,
  `PublishedTo` varchar(255) NOT NULL,
  `SentDate` datetime NOT NULL,
  `Extra` varchar(255) DEFAULT NULL,
  UNIQUE KEY `animalpublished_AnimalIDPublishedTo` (`AnimalID`,`PublishedTo`),
  KEY `animalpublished_SentDate` (`SentDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animaltest
CREATE TABLE IF NOT EXISTS `animaltest` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `TestTypeID` int(11) NOT NULL,
  `TestResultID` int(11) NOT NULL,
  `AdministeringVetID` int(11) DEFAULT NULL,
  `DateOfTest` datetime DEFAULT NULL,
  `DateRequired` datetime NOT NULL,
  `Cost` int(11) NOT NULL,
  `CostPaidDate` datetime DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animaltest_AdministeringVetID` (`AdministeringVetID`),
  KEY `animaltest_AnimalID` (`AnimalID`),
  KEY `animaltest_DateRequired` (`DateRequired`),
  KEY `animaltest_CostPaidDate` (`CostPaidDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animaltransport
CREATE TABLE IF NOT EXISTS `animaltransport` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `TransportTypeID` int(11) NOT NULL,
  `DriverOwnerID` int(11) NOT NULL,
  `PickupOwnerID` int(11) NOT NULL,
  `PickupAddress` varchar(255) DEFAULT NULL,
  `PickupTown` varchar(255) DEFAULT NULL,
  `PickupCounty` varchar(255) DEFAULT NULL,
  `PickupPostcode` varchar(255) DEFAULT NULL,
  `PickupDateTime` datetime NOT NULL,
  `DropoffOwnerID` int(11) NOT NULL,
  `DropoffAddress` varchar(255) DEFAULT NULL,
  `DropoffTown` varchar(255) DEFAULT NULL,
  `DropoffCounty` varchar(255) DEFAULT NULL,
  `DropoffPostcode` varchar(255) DEFAULT NULL,
  `DropoffDateTime` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `Miles` int(11) DEFAULT NULL,
  `Cost` int(11) NOT NULL,
  `CostPaidDate` datetime DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animaltransport_AnimalID` (`AnimalID`),
  KEY `animaltransport_DriverOwnerID` (`DriverOwnerID`),
  KEY `animaltransport_PickupOwnerID` (`PickupOwnerID`),
  KEY `animaltransport_PickupAddress` (`PickupAddress`),
  KEY `animaltransport_DropoffOwnerID` (`DropoffOwnerID`),
  KEY `animaltransport_DropoffAddress` (`DropoffAddress`),
  KEY `animaltransport_PickupDateTime` (`PickupDateTime`),
  KEY `animaltransport_DropoffDateTime` (`DropoffDateTime`),
  KEY `animaltransport_Status` (`Status`),
  KEY `animaltransport_TransportTypeID` (`TransportTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animaltype
CREATE TABLE IF NOT EXISTS `animaltype` (
  `ID` int(11) NOT NULL,
  `AnimalType` varchar(255) NOT NULL,
  `AnimalDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalvaccination
CREATE TABLE IF NOT EXISTS `animalvaccination` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `VaccinationID` int(11) NOT NULL,
  `AdministeringVetID` int(11) DEFAULT NULL,
  `DateOfVaccination` datetime DEFAULT NULL,
  `GivenBy` varchar(255) DEFAULT NULL,
  `DateRequired` datetime NOT NULL,
  `DateExpires` datetime DEFAULT NULL,
  `BatchNumber` varchar(255) DEFAULT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  `Cost` int(11) NOT NULL,
  `CostPaidDate` datetime DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalvaccination_AnimalID` (`AnimalID`),
  KEY `animalvaccination_AdministeringVetID` (`AdministeringVetID`),
  KEY `animalvaccination_DateExpires` (`DateExpires`),
  KEY `animalvaccination_DateRequired` (`DateRequired`),
  KEY `animalvaccination_GivenBy` (`GivenBy`),
  KEY `animalvaccination_CostPaidDate` (`CostPaidDate`),
  KEY `animalvaccination_Manufacturer` (`Manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.animalwaitinglist
CREATE TABLE IF NOT EXISTS `animalwaitinglist` (
  `ID` int(11) NOT NULL,
  `SpeciesID` int(11) NOT NULL,
  `Size` int(11) DEFAULT NULL,
  `DatePutOnList` datetime NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `AnimalDescription` longtext,
  `ReasonForWantingToPart` longtext,
  `CanAffordDonation` int(11) NOT NULL,
  `Urgency` int(11) NOT NULL,
  `DateRemovedFromList` datetime DEFAULT NULL,
  `AutoRemovePolicy` int(11) NOT NULL,
  `DateOfLastOwnerContact` datetime DEFAULT NULL,
  `ReasonForRemoval` longtext,
  `Comments` longtext,
  `UrgencyUpdateDate` datetime DEFAULT NULL,
  `UrgencyLastUpdatedDate` datetime DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `animalwaitinglist_AnimalDescription` (`AnimalDescription`(255)),
  KEY `animalwaitinglist_OwnerID` (`OwnerID`),
  KEY `animalwaitinglist_SpeciesID` (`SpeciesID`),
  KEY `animalwaitinglist_Size` (`Size`),
  KEY `animalwaitinglist_Urgency` (`Urgency`),
  KEY `animalwaitinglist_DatePutOnList` (`DatePutOnList`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.audittrail
CREATE TABLE IF NOT EXISTS `audittrail` (
  `Action` int(11) NOT NULL,
  `AuditDate` datetime NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `TableName` varchar(255) NOT NULL,
  `LinkID` int(11) DEFAULT NULL,
  `Description` longtext NOT NULL,
  KEY `audittrail_Action` (`Action`),
  KEY `audittrail_AuditDate` (`AuditDate`),
  KEY `audittrail_UserName` (`UserName`),
  KEY `audittrail_TableName` (`TableName`),
  KEY `audittrail_LinkID` (`LinkID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.basecolour
CREATE TABLE IF NOT EXISTS `basecolour` (
  `ID` int(11) NOT NULL,
  `BaseColour` varchar(255) NOT NULL,
  `BaseColourDescription` varchar(255) DEFAULT NULL,
  `AdoptAPetColour` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.breed
CREATE TABLE IF NOT EXISTS `breed` (
  `ID` int(11) NOT NULL,
  `BreedName` varchar(255) NOT NULL,
  `BreedDescription` varchar(255) DEFAULT NULL,
  `PetFinderBreed` varchar(255) DEFAULT NULL,
  `SpeciesID` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.citationtype
CREATE TABLE IF NOT EXISTS `citationtype` (
  `ID` int(11) NOT NULL,
  `CitationName` varchar(255) NOT NULL,
  `CitationDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.clinicappointment
CREATE TABLE IF NOT EXISTS `clinicappointment` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `ApptFor` varchar(255) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `ArrivedDateTime` datetime DEFAULT NULL,
  `WithVetDateTime` datetime DEFAULT NULL,
  `CompletedDateTime` datetime DEFAULT NULL,
  `ReasonForAppointment` longtext,
  `Comments` longtext,
  `Amount` int(11) NOT NULL,
  `IsVAT` int(11) NOT NULL,
  `VATRate` double NOT NULL,
  `VATAmount` int(11) NOT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `clinicappointment_AnimalID` (`AnimalID`),
  KEY `clinicappointment_OwnerID` (`OwnerID`),
  KEY `clinicappointment_Status` (`Status`),
  KEY `clinicappointment_ApptFor` (`ApptFor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.clinicinvoiceitem
CREATE TABLE IF NOT EXISTS `clinicinvoiceitem` (
  `ID` int(11) NOT NULL,
  `ClinicAppointmentID` int(11) NOT NULL,
  `Description` longtext,
  `Amount` int(11) NOT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `clinicinvoiceitem_ClinicAppointmentID` (`ClinicAppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.configuration
CREATE TABLE IF NOT EXISTS `configuration` (
  `ItemName` varchar(255) NOT NULL,
  `ItemValue` longtext NOT NULL,
  KEY `configuration_ItemName` (`ItemName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.costtype
CREATE TABLE IF NOT EXISTS `costtype` (
  `ID` int(11) NOT NULL,
  `CostTypeName` varchar(255) NOT NULL,
  `CostTypeDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.customreport
CREATE TABLE IF NOT EXISTS `customreport` (
  `ID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `DailyEmail` longtext,
  `DailyEmailHour` int(11) DEFAULT NULL,
  `DailyEmailFrequency` int(11) DEFAULT NULL,
  `SQLCommand` longtext NOT NULL,
  `HTMLBody` longtext NOT NULL,
  `Description` longtext,
  `OmitHeaderFooter` int(11) NOT NULL,
  `OmitCriteria` int(11) NOT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `customreport_Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.customreportrole
CREATE TABLE IF NOT EXISTS `customreportrole` (
  `ReportID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `CanView` int(11) NOT NULL,
  KEY `customreportrole_ReportIDRoleID` (`ReportID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.dbfs
CREATE TABLE IF NOT EXISTS `dbfs` (
  `ID` int(11) NOT NULL,
  `Path` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `Content` longtext,
  PRIMARY KEY (`ID`),
  KEY `dbfs_Path` (`Path`),
  KEY `dbfs_Name` (`Name`),
  KEY `dbfs_URL` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.deathreason
CREATE TABLE IF NOT EXISTS `deathreason` (
  `ID` int(11) NOT NULL,
  `ReasonName` varchar(255) NOT NULL,
  `ReasonDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.deletion
CREATE TABLE IF NOT EXISTS `deletion` (
  `ID` int(11) NOT NULL,
  `TableName` varchar(255) NOT NULL,
  `DeletedBy` varchar(255) NOT NULL,
  `Date` datetime NOT NULL,
  `IDList` varchar(255) NOT NULL,
  `RestoreSQL` longtext,
  KEY `deletion_IDTablename` (`ID`,`TableName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.diary
CREATE TABLE IF NOT EXISTS `diary` (
  `ID` int(11) NOT NULL,
  `LinkID` int(11) NOT NULL,
  `LinkType` int(11) NOT NULL,
  `DiaryDateTime` datetime NOT NULL,
  `DiaryForName` varchar(255) NOT NULL,
  `Subject` longtext,
  `Note` longtext,
  `Comments` longtext,
  `DateCompleted` datetime DEFAULT NULL,
  `LinkInfo` varchar(255) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `diary_DiaryForName` (`DiaryForName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.diarytaskdetail
CREATE TABLE IF NOT EXISTS `diarytaskdetail` (
  `ID` int(11) NOT NULL,
  `DiaryTaskHeadID` int(11) NOT NULL,
  `OrderIndex` int(11) DEFAULT NULL,
  `DayPivot` int(11) NOT NULL,
  `WhoFor` varchar(255) NOT NULL,
  `Subject` longtext,
  `Note` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `diarytaskdetail_DiaryTaskHeadID` (`DiaryTaskHeadID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.diarytaskhead
CREATE TABLE IF NOT EXISTS `diarytaskhead` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `RecordType` int(11) NOT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.diet
CREATE TABLE IF NOT EXISTS `diet` (
  `ID` int(11) NOT NULL,
  `DietName` varchar(255) NOT NULL,
  `DietDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.donationpayment
CREATE TABLE IF NOT EXISTS `donationpayment` (
  `ID` int(11) NOT NULL,
  `PaymentName` varchar(255) NOT NULL,
  `PaymentDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.donationtype
CREATE TABLE IF NOT EXISTS `donationtype` (
  `ID` int(11) NOT NULL,
  `DonationName` varchar(255) NOT NULL,
  `DonationDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.entryreason
CREATE TABLE IF NOT EXISTS `entryreason` (
  `ID` int(11) NOT NULL,
  `ReasonName` varchar(255) NOT NULL,
  `ReasonDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.incidentcompleted
CREATE TABLE IF NOT EXISTS `incidentcompleted` (
  `ID` int(11) NOT NULL,
  `CompletedName` varchar(255) NOT NULL,
  `CompletedDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.incidenttype
CREATE TABLE IF NOT EXISTS `incidenttype` (
  `ID` int(11) NOT NULL,
  `IncidentName` varchar(255) NOT NULL,
  `IncidentDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.internallocation
CREATE TABLE IF NOT EXISTS `internallocation` (
  `ID` int(11) NOT NULL,
  `LocationName` varchar(255) NOT NULL,
  `LocationDescription` varchar(255) DEFAULT NULL,
  `Units` longtext,
  `SiteID` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.jurisdiction
CREATE TABLE IF NOT EXISTS `jurisdiction` (
  `ID` int(11) NOT NULL,
  `JurisdictionName` varchar(255) NOT NULL,
  `JurisdictionDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.licencetype
CREATE TABLE IF NOT EXISTS `licencetype` (
  `ID` int(11) NOT NULL,
  `LicenceTypeName` varchar(255) NOT NULL,
  `LicenceTypeDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lkanimalflags
CREATE TABLE IF NOT EXISTS `lkanimalflags` (
  `ID` int(11) NOT NULL,
  `Flag` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lkcoattype
CREATE TABLE IF NOT EXISTS `lkcoattype` (
  `ID` int(11) NOT NULL,
  `CoatType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lkownerflags
CREATE TABLE IF NOT EXISTS `lkownerflags` (
  `ID` int(11) NOT NULL,
  `Flag` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksaccounttype
CREATE TABLE IF NOT EXISTS `lksaccounttype` (
  `ID` int(11) NOT NULL,
  `AccountType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksclinicstatus
CREATE TABLE IF NOT EXISTS `lksclinicstatus` (
  `ID` int(11) NOT NULL,
  `Status` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksdiarylink
CREATE TABLE IF NOT EXISTS `lksdiarylink` (
  `ID` int(11) NOT NULL,
  `LinkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksdonationfreq
CREATE TABLE IF NOT EXISTS `lksdonationfreq` (
  `ID` int(11) NOT NULL,
  `Frequency` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksex
CREATE TABLE IF NOT EXISTS `lksex` (
  `ID` int(11) NOT NULL,
  `Sex` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksfieldlink
CREATE TABLE IF NOT EXISTS `lksfieldlink` (
  `ID` int(11) NOT NULL,
  `LinkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksfieldtype
CREATE TABLE IF NOT EXISTS `lksfieldtype` (
  `ID` int(11) NOT NULL,
  `FieldType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksize
CREATE TABLE IF NOT EXISTS `lksize` (
  `ID` int(11) NOT NULL,
  `Size` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksloglink
CREATE TABLE IF NOT EXISTS `lksloglink` (
  `ID` int(11) NOT NULL,
  `LinkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksmedialink
CREATE TABLE IF NOT EXISTS `lksmedialink` (
  `ID` int(11) NOT NULL,
  `LinkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksmediatype
CREATE TABLE IF NOT EXISTS `lksmediatype` (
  `ID` int(11) NOT NULL,
  `MediaType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksmovementtype
CREATE TABLE IF NOT EXISTS `lksmovementtype` (
  `ID` int(11) NOT NULL,
  `MovementType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksposneg
CREATE TABLE IF NOT EXISTS `lksposneg` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksrotatype
CREATE TABLE IF NOT EXISTS `lksrotatype` (
  `ID` int(11) NOT NULL,
  `RotaType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksyesno
CREATE TABLE IF NOT EXISTS `lksyesno` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lksynun
CREATE TABLE IF NOT EXISTS `lksynun` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lkurgency
CREATE TABLE IF NOT EXISTS `lkurgency` (
  `ID` int(11) NOT NULL,
  `Urgency` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.lkworktype
CREATE TABLE IF NOT EXISTS `lkworktype` (
  `ID` int(11) NOT NULL,
  `WorkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.log
CREATE TABLE IF NOT EXISTS `log` (
  `ID` int(11) NOT NULL,
  `LogTypeID` int(11) NOT NULL,
  `LinkID` int(11) NOT NULL,
  `LinkType` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `log_LogTypeID` (`LogTypeID`),
  KEY `log_LinkID` (`LinkID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.logtype
CREATE TABLE IF NOT EXISTS `logtype` (
  `ID` int(11) NOT NULL,
  `LogTypeName` varchar(255) NOT NULL,
  `LogTypeDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.media
CREATE TABLE IF NOT EXISTS `media` (
  `ID` int(11) NOT NULL,
  `DBFSID` int(11) DEFAULT NULL,
  `MediaSize` int(11) DEFAULT NULL,
  `MediaType` int(11) DEFAULT NULL,
  `MediaName` varchar(255) NOT NULL,
  `MediaMimeType` varchar(255) DEFAULT NULL,
  `MediaNotes` longtext,
  `WebsitePhoto` int(11) NOT NULL,
  `WebsiteVideo` int(11) DEFAULT NULL,
  `DocPhoto` int(11) NOT NULL,
  `ExcludeFromPublish` int(11) DEFAULT NULL,
  `SignatureHash` varchar(255) DEFAULT NULL,
  `NewSinceLastPublish` int(11) NOT NULL,
  `UpdatedSinceLastPublish` int(11) NOT NULL,
  `LastPublished` datetime DEFAULT NULL,
  `LastPublishedPF` datetime DEFAULT NULL,
  `LastPublishedAP` datetime DEFAULT NULL,
  `LastPublishedP911` datetime DEFAULT NULL,
  `LastPublishedRG` datetime DEFAULT NULL,
  `LinkID` int(11) NOT NULL,
  `LinkTypeID` int(11) NOT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `RetainUntil` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `media_DBFSID` (`DBFSID`),
  KEY `media_MediaMimeType` (`MediaMimeType`),
  KEY `media_LinkID` (`LinkID`),
  KEY `media_LinkTypeID` (`LinkTypeID`),
  KEY `media_WebsitePhoto` (`WebsitePhoto`),
  KEY `media_WebsiteVideo` (`WebsiteVideo`),
  KEY `media_DocPhoto` (`DocPhoto`),
  KEY `media_Date` (`Date`),
  KEY `media_RetainUntil` (`RetainUntil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.medicalprofile
CREATE TABLE IF NOT EXISTS `medicalprofile` (
  `ID` int(11) NOT NULL,
  `ProfileName` varchar(255) NOT NULL,
  `TreatmentName` varchar(255) NOT NULL,
  `Dosage` varchar(255) NOT NULL,
  `Cost` int(11) NOT NULL,
  `TimingRule` int(11) NOT NULL,
  `TimingRuleFrequency` int(11) NOT NULL,
  `TimingRuleNoFrequencies` int(11) NOT NULL,
  `TreatmentRule` int(11) NOT NULL,
  `TotalNumberOfTreatments` int(11) NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `ID` int(11) NOT NULL,
  `Added` datetime NOT NULL,
  `Expires` datetime NOT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `ForName` varchar(255) NOT NULL,
  `Priority` int(11) NOT NULL,
  `Message` longtext,
  PRIMARY KEY (`ID`),
  KEY `messages_Expires` (`Expires`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.onlineform
CREATE TABLE IF NOT EXISTS `onlineform` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `RedirectUrlAfterPOST` varchar(255) DEFAULT NULL,
  `SetOwnerFlags` varchar(255) DEFAULT NULL,
  `EmailSubmitter` int(11) DEFAULT NULL,
  `EmailAddress` longtext,
  `EmailMessage` longtext,
  `Header` longtext,
  `Footer` longtext,
  `Description` longtext,
  PRIMARY KEY (`ID`),
  KEY `onlineform_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.onlineformfield
CREATE TABLE IF NOT EXISTS `onlineformfield` (
  `ID` int(11) NOT NULL,
  `OnlineFormID` int(11) NOT NULL,
  `FieldName` varchar(255) NOT NULL,
  `FieldType` int(11) NOT NULL,
  `DisplayIndex` int(11) DEFAULT NULL,
  `Mandatory` int(11) DEFAULT NULL,
  `Label` varchar(255) NOT NULL,
  `Lookups` longtext,
  `Tooltip` longtext,
  PRIMARY KEY (`ID`),
  KEY `onlineformfield_OnlineFormID` (`OnlineFormID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.onlineformincoming
CREATE TABLE IF NOT EXISTS `onlineformincoming` (
  `CollationID` int(11) NOT NULL,
  `FormName` varchar(255) NOT NULL,
  `PostedDate` datetime NOT NULL,
  `Flags` varchar(255) DEFAULT NULL,
  `FieldName` varchar(255) NOT NULL,
  `Label` varchar(255) DEFAULT NULL,
  `DisplayIndex` int(11) DEFAULT NULL,
  `Host` varchar(255) DEFAULT NULL,
  `Preview` longtext,
  `Value` longtext,
  KEY `onlineformincoming_CollationID` (`CollationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.owner
CREATE TABLE IF NOT EXISTS `owner` (
  `ID` int(11) NOT NULL,
  `OwnerType` int(11) DEFAULT NULL,
  `OwnerCode` varchar(255) DEFAULT NULL,
  `OwnerTitle` varchar(255) DEFAULT NULL,
  `OwnerInitials` varchar(255) DEFAULT NULL,
  `OwnerForeNames` varchar(255) DEFAULT NULL,
  `OwnerSurname` varchar(255) NOT NULL,
  `OwnerName` varchar(255) NOT NULL,
  `IsDeceased` int(11) DEFAULT NULL,
  `OwnerAddress` varchar(255) DEFAULT NULL,
  `OwnerTown` varchar(255) DEFAULT NULL,
  `OwnerCounty` varchar(255) DEFAULT NULL,
  `OwnerPostcode` varchar(255) DEFAULT NULL,
  `LatLong` varchar(255) DEFAULT NULL,
  `HomeTelephone` varchar(255) DEFAULT NULL,
  `WorkTelephone` varchar(255) DEFAULT NULL,
  `MobileTelephone` varchar(255) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `ExcludeFromBulkEmail` int(11) DEFAULT NULL,
  `GDPRContactOptIn` varchar(255) DEFAULT NULL,
  `JurisdictionID` int(11) DEFAULT NULL,
  `IDCheck` int(11) DEFAULT NULL,
  `Comments` longtext,
  `SiteID` int(11) DEFAULT NULL,
  `IsBanned` int(11) DEFAULT NULL,
  `IsVolunteer` int(11) DEFAULT NULL,
  `IsHomeChecker` int(11) DEFAULT NULL,
  `IsMember` int(11) DEFAULT NULL,
  `MembershipExpiryDate` datetime DEFAULT NULL,
  `MembershipNumber` varchar(255) DEFAULT NULL,
  `IsAdoptionCoordinator` int(11) DEFAULT NULL,
  `IsDonor` int(11) DEFAULT NULL,
  `IsDriver` int(11) DEFAULT NULL,
  `IsShelter` int(11) DEFAULT NULL,
  `IsACO` int(11) DEFAULT NULL,
  `IsStaff` int(11) DEFAULT NULL,
  `IsFosterer` int(11) DEFAULT NULL,
  `FosterCapacity` int(11) DEFAULT NULL,
  `IsRetailer` int(11) DEFAULT NULL,
  `IsVet` int(11) DEFAULT NULL,
  `IsGiftAid` int(11) DEFAULT NULL,
  `AdditionalFlags` longtext,
  `HomeCheckAreas` longtext,
  `DateLastHomeChecked` datetime DEFAULT NULL,
  `HomeCheckedBy` int(11) DEFAULT NULL,
  `MatchAdded` datetime DEFAULT NULL,
  `MatchExpires` datetime DEFAULT NULL,
  `MatchActive` int(11) DEFAULT NULL,
  `MatchSex` int(11) DEFAULT NULL,
  `MatchSize` int(11) DEFAULT NULL,
  `MatchColour` int(11) DEFAULT NULL,
  `MatchAgeFrom` double DEFAULT NULL,
  `MatchAgeTo` double DEFAULT NULL,
  `MatchAnimalType` int(11) DEFAULT NULL,
  `MatchSpecies` int(11) DEFAULT NULL,
  `MatchBreed` int(11) DEFAULT NULL,
  `MatchBreed2` int(11) DEFAULT NULL,
  `MatchGoodWithCats` int(11) DEFAULT NULL,
  `MatchGoodWithDogs` int(11) DEFAULT NULL,
  `MatchGoodWithChildren` int(11) DEFAULT NULL,
  `MatchHouseTrained` int(11) DEFAULT NULL,
  `MatchCommentsContain` varchar(255) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `owner_CreatedBy` (`CreatedBy`),
  KEY `owner_CreatedDate` (`CreatedDate`),
  KEY `owner_GDPRContactOptIn` (`GDPRContactOptIn`),
  KEY `owner_MembershipNumber` (`MembershipNumber`),
  KEY `owner_OwnerCode` (`OwnerCode`),
  KEY `owner_OwnerName` (`OwnerName`),
  KEY `owner_OwnerAddress` (`OwnerAddress`),
  KEY `owner_OwnerCounty` (`OwnerCounty`),
  KEY `owner_EmailAddress` (`EmailAddress`),
  KEY `owner_OwnerForeNames` (`OwnerForeNames`),
  KEY `owner_HomeTelephone` (`HomeTelephone`),
  KEY `owner_MobileTelephone` (`MobileTelephone`),
  KEY `owner_WorkTelephone` (`WorkTelephone`),
  KEY `owner_JurisdictionID` (`JurisdictionID`),
  KEY `owner_OwnerInitials` (`OwnerInitials`),
  KEY `owner_OwnerPostcode` (`OwnerPostcode`),
  KEY `owner_OwnerSurname` (`OwnerSurname`),
  KEY `owner_OwnerTitle` (`OwnerTitle`),
  KEY `owner_OwnerTown` (`OwnerTown`),
  KEY `owner_SiteID` (`SiteID`),
  KEY `owner_IDCheck` (`IDCheck`),
  KEY `owner_IsACO` (`IsACO`),
  KEY `owner_IsAdoptionCoordinator` (`IsAdoptionCoordinator`),
  KEY `owner_IsFosterer` (`IsFosterer`),
  KEY `owner_IsRetailer` (`IsRetailer`),
  KEY `owner_IsStaff` (`IsStaff`),
  KEY `owner_IsVet` (`IsVet`),
  KEY `owner_IsVolunteer` (`IsVolunteer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.ownercitation
CREATE TABLE IF NOT EXISTS `ownercitation` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `AnimalControlID` int(11) DEFAULT NULL,
  `CitationTypeID` int(11) NOT NULL,
  `CitationDate` datetime NOT NULL,
  `FineAmount` int(11) DEFAULT NULL,
  `FineDueDate` datetime DEFAULT NULL,
  `FinePaidDate` datetime DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ownercitation_OwnerID` (`OwnerID`),
  KEY `ownercitation_CitationTypeID` (`CitationTypeID`),
  KEY `ownercitation_CitationDate` (`CitationDate`),
  KEY `ownercitation_FineDueDate` (`FineDueDate`),
  KEY `ownercitation_FinePaidDate` (`FinePaidDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.ownerdonation
CREATE TABLE IF NOT EXISTS `ownerdonation` (
  `ID` int(11) NOT NULL,
  `AnimalID` int(11) DEFAULT NULL,
  `OwnerID` int(11) NOT NULL,
  `MovementID` int(11) DEFAULT NULL,
  `DonationTypeID` int(11) NOT NULL,
  `DonationPaymentID` int(11) DEFAULT NULL,
  `ChequeNumber` varchar(255) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `DateDue` datetime DEFAULT NULL,
  `Donation` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` int(11) DEFAULT NULL,
  `IsGiftAid` int(11) NOT NULL,
  `IsVAT` int(11) DEFAULT NULL,
  `VATRate` double DEFAULT NULL,
  `VATAmount` int(11) DEFAULT NULL,
  `Frequency` int(11) NOT NULL,
  `NextCreated` int(11) DEFAULT NULL,
  `ReceiptNumber` varchar(255) DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ownerdonation_OwnerID` (`OwnerID`),
  KEY `ownerdonation_ReceiptNumber` (`ReceiptNumber`),
  KEY `ownerdonation_ChequeNumber` (`ChequeNumber`),
  KEY `ownerdonation_Date` (`Date`),
  KEY `ownerdonation_DateDue` (`DateDue`),
  KEY `ownerdonation_IsVAT` (`IsVAT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.ownerinvestigation
CREATE TABLE IF NOT EXISTS `ownerinvestigation` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Notes` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ownerinvestigation_OwnerID` (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.ownerlicence
CREATE TABLE IF NOT EXISTS `ownerlicence` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `LicenceTypeID` int(11) NOT NULL,
  `LicenceNumber` varchar(255) NOT NULL,
  `LicenceFee` int(11) DEFAULT NULL,
  `IssueDate` datetime NOT NULL,
  `ExpiryDate` datetime NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ownerlicence_OwnerID` (`OwnerID`),
  KEY `ownerlicence_AnimalID` (`AnimalID`),
  KEY `ownerlicence_LicenceTypeID` (`LicenceTypeID`),
  KEY `ownerlicence_LicenceNumber` (`LicenceNumber`),
  KEY `ownerlicence_IssueDate` (`IssueDate`),
  KEY `ownerlicence_ExpiryDate` (`ExpiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.ownerlookingfor
CREATE TABLE IF NOT EXISTS `ownerlookingfor` (
  `OwnerID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `MatchSummary` longtext,
  KEY `ownerlookingfor_OwnerID` (`OwnerID`),
  KEY `ownerlookingfor_AnimalID` (`AnimalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.ownerrota
CREATE TABLE IF NOT EXISTS `ownerrota` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `StartDateTime` datetime NOT NULL,
  `EndDateTime` datetime NOT NULL,
  `RotaTypeID` int(11) NOT NULL,
  `WorkTypeID` int(11) DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ownerrota_OwnerID` (`OwnerID`),
  KEY `ownerrota_StartDateTime` (`StartDateTime`),
  KEY `ownerrota_EndDateTime` (`EndDateTime`),
  KEY `ownerrota_RotaTypeID` (`RotaTypeID`),
  KEY `ownerrota_WorkTypeID` (`WorkTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.ownertraploan
CREATE TABLE IF NOT EXISTS `ownertraploan` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `TrapTypeID` int(11) NOT NULL,
  `LoanDate` datetime NOT NULL,
  `DepositAmount` int(11) DEFAULT NULL,
  `DepositReturnDate` datetime DEFAULT NULL,
  `TrapNumber` varchar(255) DEFAULT NULL,
  `ReturnDueDate` datetime DEFAULT NULL,
  `ReturnDate` datetime DEFAULT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ownertraploan_OwnerID` (`OwnerID`),
  KEY `ownertraploan_TrapTypeID` (`TrapTypeID`),
  KEY `ownertraploan_ReturnDueDate` (`ReturnDueDate`),
  KEY `ownertraploan_ReturnDate` (`ReturnDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.ownervoucher
CREATE TABLE IF NOT EXISTS `ownervoucher` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `VoucherID` int(11) NOT NULL,
  `DateIssued` datetime NOT NULL,
  `DateExpired` datetime NOT NULL,
  `Value` int(11) NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ownervoucher_OwnerID` (`OwnerID`),
  KEY `ownervoucher_VoucherID` (`VoucherID`),
  KEY `ownervoucher_DateExpired` (`DateExpired`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.pickuplocation
CREATE TABLE IF NOT EXISTS `pickuplocation` (
  `ID` int(11) NOT NULL,
  `LocationName` varchar(255) NOT NULL,
  `LocationDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.primarykey
CREATE TABLE IF NOT EXISTS `primarykey` (
  `TableName` varchar(255) NOT NULL,
  `NextID` int(11) NOT NULL,
  KEY `primarykey_TableName` (`TableName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.publishlog
CREATE TABLE IF NOT EXISTS `publishlog` (
  `ID` int(11) NOT NULL,
  `PublishDateTime` datetime NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Success` int(11) NOT NULL,
  `Alerts` int(11) NOT NULL,
  `LogData` longtext,
  PRIMARY KEY (`ID`),
  KEY `publishlog_PublishDateTime` (`PublishDateTime`),
  KEY `publishlog_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.reservationstatus
CREATE TABLE IF NOT EXISTS `reservationstatus` (
  `ID` int(11) NOT NULL,
  `StatusName` varchar(255) NOT NULL,
  `StatusDescription` longtext,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.role
CREATE TABLE IF NOT EXISTS `role` (
  `ID` int(11) NOT NULL,
  `Rolename` varchar(255) NOT NULL,
  `SecurityMap` longtext,
  PRIMARY KEY (`ID`),
  KEY `role_Rolename` (`Rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.site
CREATE TABLE IF NOT EXISTS `site` (
  `ID` int(11) NOT NULL,
  `SiteName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.species
CREATE TABLE IF NOT EXISTS `species` (
  `ID` int(11) NOT NULL,
  `SpeciesName` varchar(255) NOT NULL,
  `SpeciesDescription` varchar(255) DEFAULT NULL,
  `PetFinderSpecies` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.stocklevel
CREATE TABLE IF NOT EXISTS `stocklevel` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` longtext,
  `StockLocationID` int(11) NOT NULL,
  `UnitName` varchar(255) NOT NULL,
  `Total` double DEFAULT NULL,
  `Balance` double NOT NULL,
  `Expiry` datetime DEFAULT NULL,
  `BatchNumber` varchar(255) DEFAULT NULL,
  `Cost` int(11) DEFAULT NULL,
  `UnitPrice` int(11) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `stocklevel_Name` (`Name`),
  KEY `stocklevel_UnitName` (`UnitName`),
  KEY `stocklevel_StockLocationID` (`StockLocationID`),
  KEY `stocklevel_Expiry` (`Expiry`),
  KEY `stocklevel_BatchNumber` (`BatchNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.stocklocation
CREATE TABLE IF NOT EXISTS `stocklocation` (
  `ID` int(11) NOT NULL,
  `LocationName` varchar(255) NOT NULL,
  `LocationDescription` longtext,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `stocklocation_LocationName` (`LocationName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.stockusage
CREATE TABLE IF NOT EXISTS `stockusage` (
  `ID` int(11) NOT NULL,
  `StockUsageTypeID` int(11) NOT NULL,
  `StockLevelID` int(11) NOT NULL,
  `UsageDate` datetime NOT NULL,
  `Quantity` double NOT NULL,
  `Comments` longtext,
  `RecordVersion` int(11) DEFAULT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `LastChangedBy` varchar(255) NOT NULL,
  `LastChangedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `stockusage_StockUsageTypeID` (`StockUsageTypeID`),
  KEY `stockusage_StockLevelID` (`StockLevelID`),
  KEY `stockusage_UsageDate` (`UsageDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.stockusagetype
CREATE TABLE IF NOT EXISTS `stockusagetype` (
  `ID` int(11) NOT NULL,
  `UsageTypeName` varchar(255) NOT NULL,
  `UsageTypeDescription` longtext,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `stockusagetype_UsageTypeName` (`UsageTypeName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.templatedocument
CREATE TABLE IF NOT EXISTS `templatedocument` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Path` varchar(255) NOT NULL,
  `Content` longtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `templatedocument_NamePath` (`Name`,`Path`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.templatehtml
CREATE TABLE IF NOT EXISTS `templatehtml` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Header` longtext,
  `Body` longtext,
  `Footer` longtext,
  `IsBuiltIn` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `templatehtml_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.testresult
CREATE TABLE IF NOT EXISTS `testresult` (
  `ID` int(11) NOT NULL,
  `ResultName` varchar(255) NOT NULL,
  `ResultDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.testtype
CREATE TABLE IF NOT EXISTS `testtype` (
  `ID` int(11) NOT NULL,
  `TestName` varchar(255) NOT NULL,
  `TestDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.transporttype
CREATE TABLE IF NOT EXISTS `transporttype` (
  `ID` int(11) NOT NULL,
  `TransportTypeName` varchar(255) NOT NULL,
  `TransportTypeDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.traptype
CREATE TABLE IF NOT EXISTS `traptype` (
  `ID` int(11) NOT NULL,
  `TrapTypeName` varchar(255) NOT NULL,
  `TrapTypeDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.userrole
CREATE TABLE IF NOT EXISTS `userrole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  UNIQUE KEY `userrole_UserIDRoleID` (`UserID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `RealName` varchar(255) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `SuperUser` int(11) NOT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  `SecurityMap` longtext,
  `IPRestriction` longtext,
  `Signature` longtext,
  `LocaleOverride` varchar(255) DEFAULT NULL,
  `ThemeOverride` varchar(255) DEFAULT NULL,
  `SiteID` int(11) DEFAULT NULL,
  `DisableLogin` int(11) DEFAULT NULL,
  `LocationFilter` varchar(255) DEFAULT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `users_UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.vaccinationtype
CREATE TABLE IF NOT EXISTS `vaccinationtype` (
  `ID` int(11) NOT NULL,
  `VaccinationType` varchar(255) NOT NULL,
  `VaccinationDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table asm.voucher
CREATE TABLE IF NOT EXISTS `voucher` (
  `ID` int(11) NOT NULL,
  `VoucherName` varchar(255) NOT NULL,
  `VoucherDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for view asm.v_adoption
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_adoption` (
	`ActiveMovementType` INT(11) NULL,
	`AdoptionNumber` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`AgeGroup` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalAge` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalID` INT(11) NOT NULL,
	`AnimalName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`Archived` INT(11) NOT NULL,
	`BreedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CombiTestResult` INT(11) NOT NULL,
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`CrueltyCase` INT(11) NOT NULL,
	`CurrentOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DeceasedDate` DATETIME NULL,
	`DisplayLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Donation` INT(11) NULL,
	`FLVResult` INT(11) NOT NULL,
	`HasActiveReserve` INT(11) NULL,
	`HasTrialAdoption` INT(11) NULL,
	`HeartwormTestResult` INT(11) NOT NULL,
	`HoldUntilDate` DATETIME NULL,
	`HomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ID` INT(11) NOT NULL,
	`InsuranceNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsHold` INT(11) NULL,
	`IsNotAvailableForAdoption` INT(11) NOT NULL,
	`IsPermanentFoster` INT(11) NULL,
	`IsQuarantine` INT(11) NULL,
	`IsTrial` INT(11) NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`MobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`MovementDate` DATETIME NULL,
	`MovementName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`MovementType` INT(11) NOT NULL,
	`Neutered` INT(11) NOT NULL,
	`NonShelterAnimal` INT(11) NOT NULL,
	`OriginalRetailerMovementID` INT(11) NULL,
	`OwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerForenames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NULL,
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReasonForReturn` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`RecordVersion` INT(11) NULL,
	`ReservationCancelledDate` DATETIME NULL,
	`ReservationDate` DATETIME NULL,
	`ReservationStatusID` INT(11) NULL,
	`ReservationStatusName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`RetailerID` INT(11) NULL,
	`RetailerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReturnDate` DATETIME NULL,
	`ReturnedByOwnerID` INT(11) NULL,
	`ReturnedReasonID` INT(11) NOT NULL,
	`ReturnedReasonName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Sex` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ShelterCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShortCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`SpeciesName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`TrialEndDate` DATETIME NULL,
	`WebsiteMediaDate` DATETIME NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_animal
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_animal` (
	`AcceptanceNumber` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementAdoptionNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementComments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementCreatedBy` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementCreatedByName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementCreatedDate` DATETIME NULL,
	`ActiveMovementDate` DATETIME NULL,
	`ActiveMovementDonation` INT(11) NULL,
	`ActiveMovementID` INT(11) NOT NULL,
	`ActiveMovementInsuranceNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementLastChangedBy` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementLastChangedDate` DATETIME NULL,
	`ActiveMovementReasonForReturn` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementReservationDate` DATETIME NULL,
	`ActiveMovementReturn` DATETIME NULL,
	`ActiveMovementReturnDate` DATETIME NULL,
	`ActiveMovementTrialEndDate` DATETIME NULL,
	`ActiveMovementType` INT(11) NULL,
	`ActiveMovementTypeName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdditionalFlags` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`AdoptAPetColour` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdoptionCoordinatorEmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdoptionCoordinatorHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdoptionCoordinatorID` INT(11) NULL,
	`AdoptionCoordinatorMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdoptionCoordinatorName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdoptionCoordinatorWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AgeGroup` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AgeGroupActiveMovement` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalAge` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalComments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`AnimalControlIncidentDate` DATETIME NULL,
	`AnimalControlIncidentID` INT(11) NULL,
	`AnimalControlIncidentName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`AnimalTypeID` INT(11) NOT NULL,
	`AnimalTypeName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Archived` INT(11) NOT NULL,
	`AsilomarIntakeCategory` INT(11) NULL,
	`AsilomarIsTransferExternal` INT(11) NULL,
	`AsilomarOwnerRequestedEuthanasia` INT(11) NULL,
	`BaseColourID` INT(11) NOT NULL,
	`BaseColourName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BondedAnimal1Archived` INT(11) NULL,
	`BondedAnimal1Code` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BondedAnimal1Name` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BondedAnimal2Archived` INT(11) NULL,
	`BondedAnimal2Code` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BondedAnimal2ID` INT(11) NOT NULL,
	`BondedAnimal2Name` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BondedAnimalID` INT(11) NOT NULL,
	`Breed2ID` INT(11) NOT NULL,
	`BreedID` INT(11) NOT NULL,
	`BreedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BreedName1` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BreedName2` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByEmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByOwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByOwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByOwnerID` INT(11) NOT NULL,
	`BroughtInByOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByOwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByOwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BroughtInByWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CoatType` INT(11) NOT NULL,
	`CoatTypeName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Code` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CombiTestDate` DATETIME NULL,
	`CombiTested` INT(11) NOT NULL,
	`CombiTestedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CombiTestResult` INT(11) NOT NULL,
	`CombiTestResultName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`CrossBreed` INT(11) NOT NULL,
	`CrossBreedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CrueltyCase` INT(11) NOT NULL,
	`CrueltyCaseName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerEmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerForeNames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerID` INT(11) NULL,
	`CurrentOwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerSurname` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentOwnerWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentVetAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentVetCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentVetEmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentVetID` INT(11) NOT NULL,
	`CurrentVetLicenceNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentVetName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentVetPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentVetTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CurrentVetWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DailyBoardingCost` INT(11) NULL,
	`DateBroughtIn` DATETIME NOT NULL,
	`DateOfBirth` DATETIME NOT NULL,
	`DaysOnShelter` INT(11) NULL,
	`DeceasedDate` DATETIME NULL,
	`Declawed` INT(11) NOT NULL,
	`DeclawedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DiedOffShelter` INT(11) NOT NULL,
	`DiedOffShelterName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DisplayLocation` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DisplayLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DocMediaDate` DATETIME NULL,
	`DocMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`EntryReasonID` INT(11) NOT NULL,
	`EntryReasonName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`EstimatedDOB` INT(11) NOT NULL,
	`EstimatedDOBName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Fee` INT(11) NULL,
	`FLVResult` INT(11) NOT NULL,
	`FLVResultName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HasActiveReserve` INT(11) NULL,
	`HasActiveReserveName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HasFutureAdoption` INT(1) NOT NULL,
	`HasPermanentFoster` INT(11) NULL,
	`HasSpecialNeeds` INT(11) NOT NULL,
	`HasSpecialNeedsName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HasTrialAdoption` INT(11) NULL,
	`HasTrialAdoptionName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HealthProblems` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`HeartwormTestDate` DATETIME NULL,
	`HeartwormTested` INT(11) NOT NULL,
	`HeartwormTestedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HeartwormTestResult` INT(11) NOT NULL,
	`HeartwormTestResultName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HiddenAnimalDetails` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`HoldUntilDate` DATETIME NULL,
	`ID` INT(11) NOT NULL,
	`Identichip2Date` DATETIME NULL,
	`Identichip2Number` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IdentichipDate` DATETIME NULL,
	`IdentichipNumber` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`Identichipped` INT(11) NOT NULL,
	`IdentichippedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsCourtesy` INT(11) NULL,
	`IsDOA` INT(11) NOT NULL,
	`IsDOAName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsGoodWithCats` INT(11) NOT NULL,
	`IsGoodWithCatsName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsGoodWithChildren` INT(11) NOT NULL,
	`IsGoodWithChildrenName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsGoodWithDogs` INT(11) NOT NULL,
	`IsGoodWithDogsName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsHold` INT(11) NULL,
	`IsHouseTrained` INT(11) NOT NULL,
	`IsHouseTrainedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsNotAvailableForAdoption` INT(11) NOT NULL,
	`IsNotAvailableForAdoptionName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsNotForRegistration` INT(11) NULL,
	`IsNotForRegistrationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsPickup` INT(11) NULL,
	`IsPickupName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsQuarantine` INT(11) NULL,
	`IsTransfer` INT(11) NOT NULL,
	`IsTransferName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`Markings` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`MostRecentEntryDate` DATETIME NOT NULL,
	`Neutered` INT(11) NOT NULL,
	`NeuteredByVetID` INT(11) NULL,
	`NeuteredDate` DATETIME NULL,
	`NeuteredName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NeuteringVetAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NeuteringVetCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NeuteringVetEmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NeuteringVetLicenceNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NeuteringVetName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NeuteringVetPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NeuteringVetTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NeuteringVetWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`NonShelterAnimal` INT(11) NOT NULL,
	`NonShelterAnimalName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerEmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerForeNames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerID` INT(11) NOT NULL,
	`OriginalOwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerSurname` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OriginalOwnerWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnersVetAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnersVetCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnersVetEmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnersVetID` INT(11) NOT NULL,
	`OwnersVetLicenceNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnersVetName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnersVetPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnersVetTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnersVetWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PetFinderBreed` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PetFinderBreed2` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PetFinderSpecies` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PickupAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PickupLocationID` INT(11) NULL,
	`PickupLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PTSReason` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`PTSReasonID` INT(11) NOT NULL,
	`PTSReasonName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PutToSleep` INT(11) NOT NULL,
	`PutToSleepName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`RabiesTag` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReasonForEntry` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`ReasonNO` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`RecentlyChangedImages` BIGINT(21) NULL,
	`RecordVersion` INT(11) NULL,
	`ReservationStatusName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerEmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerID` INT(11) NULL,
	`ReservedOwnerMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReservedOwnerWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Sex` INT(11) NOT NULL,
	`SexName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocation` INT(11) NOT NULL,
	`ShelterLocationDescription` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShortCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`SiteID` INT(11) NULL,
	`SiteName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Size` INT(11) NOT NULL,
	`SizeName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SmartTag` INT(11) NOT NULL,
	`SmartTagDate` DATETIME NULL,
	`SmartTagNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SmartTagSentDate` DATETIME NULL,
	`SmartTagType` INT(11) NOT NULL,
	`SpeciesID` INT(11) NOT NULL,
	`SpeciesName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Tattoo` INT(11) NOT NULL,
	`TattooDate` DATETIME NULL,
	`TattooName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`TattooNumber` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`TimeOnShelter` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`TotalDaysOnShelter` INT(11) NULL,
	`TotalTimeOnShelter` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`UniqueCodeID` INT(11) NULL,
	`WebsiteImageCount` BIGINT(21) NULL,
	`WebsiteMediaDate` DATETIME NULL,
	`WebsiteMediaID` INT(11) NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaNotes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`WebsiteVideoNotes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`WebsiteVideoURL` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Weight` DOUBLE NULL,
	`YearCodeID` INT(11) NULL
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_animalcontrol
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_animalcontrol` (
	`ACID` INT(11) NOT NULL,
	`AgeGroup` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalDescription` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`AnimalID` INT(11) NULL,
	`CallDateTime` DATETIME NULL,
	`CallerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CallerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CallerHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CallerID` INT(11) NULL,
	`CallerMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CallerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CallerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CallerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CallerWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CallNotes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CallTaker` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CompletedDate` DATETIME NULL,
	`CompletedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`DispatchAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DispatchCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DispatchDateTime` DATETIME NULL,
	`DispatchedACO` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DispatchLatLong` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DispatchPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DispatchTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DocMediaDate` DATETIME NULL,
	`DocMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`FollowupComplete` INT(11) NULL,
	`FollowupComplete2` INT(11) NULL,
	`FollowupComplete3` INT(11) NULL,
	`FollowupDateTime` DATETIME NULL,
	`FollowupDateTime2` DATETIME NULL,
	`FollowupDateTime3` DATETIME NULL,
	`ID` INT(11) NOT NULL,
	`IncidentCompletedID` INT(11) NULL,
	`IncidentDateTime` DATETIME NOT NULL,
	`IncidentName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IncidentTypeID` INT(11) NOT NULL,
	`JurisdictionID` INT(11) NULL,
	`JurisdictionName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Owner2ID` INT(11) NULL,
	`Owner3ID` INT(11) NULL,
	`OwnerID` INT(11) NULL,
	`OwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName1` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName2` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName3` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PickupLocationID` INT(11) NULL,
	`RecordVersion` INT(11) NULL,
	`RespondedDateTime` DATETIME NULL,
	`Sex` INT(11) NULL,
	`SexName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SiteID` INT(11) NULL,
	`SpeciesID` INT(11) NULL,
	`SpeciesName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SuspectAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SuspectCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SuspectHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SuspectMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SuspectName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SuspectPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SuspectTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SuspectWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VictimAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VictimCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VictimHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VictimID` INT(11) NULL,
	`VictimMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VictimName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VictimPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VictimTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VictimWorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaDate` DATETIME NULL,
	`WebsiteMediaID` INT(11) NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaNotes` LONGTEXT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_animalfound
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_animalfound` (
	`AdoptAPetColour` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AgeGroup` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalTypeID` INT(11) NOT NULL,
	`AreaFound` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`AreaPostcode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`BaseColourID` INT(11) NOT NULL,
	`BaseColourName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BreedID` INT(11) NOT NULL,
	`BreedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`DateFound` DATETIME NOT NULL,
	`DateReported` DATETIME NOT NULL,
	`DistFeat` LONGTEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`DocMediaDate` DATETIME NULL,
	`DocMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ID` INT(11) NOT NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LFID` INT(11) NOT NULL,
	`MobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerForeNames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NOT NULL,
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`RecordVersion` INT(11) NULL,
	`ReturnToOwnerDate` DATETIME NULL,
	`Sex` INT(11) NOT NULL,
	`SexName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SpeciesName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaDate` DATETIME NULL,
	`WebsiteMediaID` INT(11) NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaNotes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`WorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_animallost
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_animallost` (
	`AdoptAPetColour` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AgeGroup` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalTypeID` INT(11) NOT NULL,
	`AreaLost` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`AreaPostcode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`BaseColourID` INT(11) NOT NULL,
	`BaseColourName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`BreedID` INT(11) NOT NULL,
	`BreedName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`DateFound` DATETIME NULL,
	`DateLost` DATETIME NOT NULL,
	`DateReported` DATETIME NOT NULL,
	`DistFeat` LONGTEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`DocMediaDate` DATETIME NULL,
	`DocMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ID` INT(11) NOT NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LFID` INT(11) NOT NULL,
	`MobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerForeNames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NOT NULL,
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`RecordVersion` INT(11) NULL,
	`Sex` INT(11) NOT NULL,
	`SexName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SpeciesName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaDate` DATETIME NULL,
	`WebsiteMediaID` INT(11) NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaNotes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`WorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_animalmedicaltreatment
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_animalmedicaltreatment` (
	`AcceptanceNumber` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementID` INT(11) NOT NULL,
	`ActiveMovementType` INT(11) NULL,
	`AdministeringVetAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetEmail` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetID` INT(11) NULL,
	`AdministeringVetLicence` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalID` INT(11) NOT NULL,
	`AnimalName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`Archived` INT(11) NOT NULL,
	`CombiTestResult` INT(11) NOT NULL,
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CompositeID` VARCHAR(23) NOT NULL COLLATE 'utf8_general_ci',
	`Cost` INT(11) NOT NULL,
	`CostPaidDate` DATETIME NULL,
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`CrueltyCase` INT(11) NOT NULL,
	`CurrentOwnerID` INT(11) NULL,
	`CurrentOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DateGiven` DATETIME NULL,
	`DateRequired` DATETIME NOT NULL,
	`DeceasedDate` DATETIME NULL,
	`DisplayLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Dosage` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`FLVResult` INT(11) NOT NULL,
	`GivenBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`HasActiveReserve` INT(11) NULL,
	`HasTrialAdoption` INT(11) NULL,
	`HeartwormTestResult` INT(11) NOT NULL,
	`ID` INT(11) NOT NULL,
	`IsHold` INT(11) NULL,
	`IsNotAvailableForAdoption` INT(11) NOT NULL,
	`IsQuarantine` INT(11) NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`LocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`MedicalProfileID` INT(11) NOT NULL,
	`NamedFrequency` VARCHAR(47) NULL COLLATE 'utf8_general_ci',
	`NamedNumberOfTreatments` VARCHAR(32) NOT NULL COLLATE 'utf8_general_ci',
	`NamedStatus` VARCHAR(9) NULL COLLATE 'utf8_general_ci',
	`Neutered` INT(11) NOT NULL,
	`NonShelterAnimal` INT(11) NOT NULL,
	`RecordVersion` INT(11) NULL,
	`RegimenComments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`RegimenID` INT(11) NOT NULL,
	`ShelterCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocation` INT(11) NOT NULL,
	`ShelterLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShortCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`SpeciesName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`StartDate` DATETIME NOT NULL,
	`Status` INT(11) NOT NULL,
	`TimingRule` INT(11) NOT NULL,
	`TimingRuleFrequency` INT(11) NOT NULL,
	`TimingRuleNoFrequencies` INT(11) NOT NULL,
	`TotalNumberOfTreatments` INT(11) NOT NULL,
	`TotalTreatments` INT(11) NOT NULL,
	`TreatmentComments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`TreatmentID` INT(11) NOT NULL,
	`TreatmentName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`TreatmentNumber` INT(11) NOT NULL,
	`TreatmentRule` INT(11) NOT NULL,
	`TreatmentsGiven` INT(11) NOT NULL,
	`TreatmentsRemaining` INT(11) NOT NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_animaltest
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_animaltest` (
	`AcceptanceNumber` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementID` INT(11) NOT NULL,
	`ActiveMovementType` INT(11) NULL,
	`AdministeringVetAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetEmail` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetID` INT(11) NULL,
	`AdministeringVetLicence` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalID` INT(11) NOT NULL,
	`AnimalName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`Archived` INT(11) NOT NULL,
	`CombiTestResult` INT(11) NOT NULL,
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`Cost` INT(11) NOT NULL,
	`CostPaidDate` DATETIME NULL,
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`CrueltyCase` INT(11) NOT NULL,
	`CurrentOwnerID` INT(11) NULL,
	`CurrentOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DateOfTest` DATETIME NULL,
	`DateRequired` DATETIME NOT NULL,
	`DeceasedDate` DATETIME NULL,
	`DisplayLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`FLVResult` INT(11) NOT NULL,
	`HasActiveReserve` INT(11) NULL,
	`HasTrialAdoption` INT(11) NULL,
	`HeartwormTestResult` INT(11) NOT NULL,
	`ID` INT(11) NOT NULL,
	`IsHold` INT(11) NULL,
	`IsNotAvailableForAdoption` INT(11) NOT NULL,
	`IsQuarantine` INT(11) NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`LocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Neutered` INT(11) NOT NULL,
	`NonShelterAnimal` INT(11) NOT NULL,
	`RecordVersion` INT(11) NULL,
	`ResultName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocation` INT(11) NOT NULL,
	`ShelterLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShortCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`SpeciesName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`TestDescription` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`TestName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`TestResultID` INT(11) NOT NULL,
	`TestTypeID` INT(11) NOT NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_animalvaccination
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_animalvaccination` (
	`AcceptanceNumber` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ActiveMovementID` INT(11) NOT NULL,
	`ActiveMovementType` INT(11) NULL,
	`AdministeringVetAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetEmail` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetID` INT(11) NULL,
	`AdministeringVetLicence` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AdministeringVetTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`AnimalID` INT(11) NOT NULL,
	`AnimalName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`Archived` INT(11) NOT NULL,
	`BatchNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CombiTestResult` INT(11) NOT NULL,
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`Cost` INT(11) NOT NULL,
	`CostPaidDate` DATETIME NULL,
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`CrueltyCase` INT(11) NOT NULL,
	`CurrentOwnerID` INT(11) NULL,
	`CurrentOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`DateExpires` DATETIME NULL,
	`DateOfVaccination` DATETIME NULL,
	`DateRequired` DATETIME NOT NULL,
	`DeceasedDate` DATETIME NULL,
	`DisplayLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`FLVResult` INT(11) NOT NULL,
	`GivenBy` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HasActiveReserve` INT(11) NULL,
	`HasTrialAdoption` INT(11) NULL,
	`HeartwormTestResult` INT(11) NOT NULL,
	`ID` INT(11) NOT NULL,
	`IsHold` INT(11) NULL,
	`IsNotAvailableForAdoption` INT(11) NOT NULL,
	`IsQuarantine` INT(11) NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`LocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Manufacturer` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Neutered` INT(11) NOT NULL,
	`NonShelterAnimal` INT(11) NOT NULL,
	`RecordVersion` INT(11) NULL,
	`ShelterCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocation` INT(11) NOT NULL,
	`ShelterLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShortCode` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`SpeciesName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VaccinationDescription` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`VaccinationID` INT(11) NOT NULL,
	`VaccinationType` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_animalwaitinglist
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_animalwaitinglist` (
	`AnimalDescription` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`AutoRemovePolicy` INT(11) NOT NULL,
	`CanAffordDonation` INT(11) NOT NULL,
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`DateOfLastOwnerContact` DATETIME NULL,
	`DatePutOnList` DATETIME NOT NULL,
	`DateRemovedFromList` DATETIME NULL,
	`DocMediaDate` DATETIME NULL,
	`DocMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`EmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ID` INT(11) NOT NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`MobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerForeNames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NOT NULL,
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReasonForRemoval` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`ReasonForWantingToPart` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`RecordVersion` INT(11) NULL,
	`Size` INT(11) NULL,
	`SizeName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`SpeciesID` INT(11) NOT NULL,
	`SpeciesName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`Urgency` INT(11) NOT NULL,
	`UrgencyLastUpdatedDate` DATETIME NULL,
	`UrgencyName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`UrgencyUpdateDate` DATETIME NULL,
	`WebsiteMediaDate` DATETIME NULL,
	`WebsiteMediaID` INT(11) NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaNotes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`WLID` INT(11) NOT NULL,
	`WorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_owner
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_owner` (
	`AdditionalFlags` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`DateLastHomeChecked` DATETIME NULL,
	`DocMediaDate` DATETIME NULL,
	`DocMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`EmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ExcludeFromBulkEmail` INT(11) NULL,
	`FosterCapacity` INT(11) NULL,
	`GDPRContactOptIn` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeCheckAreas` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`HomeCheckedBy` INT(11) NULL,
	`HomeCheckedByEmail` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeCheckedByHomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeCheckedByMobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeCheckedByName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ID` INT(11) NOT NULL,
	`IDCheck` INT(11) NULL,
	`IsACO` INT(11) NULL,
	`IsAdoptionCoordinator` INT(11) NULL,
	`IsBanned` INT(11) NULL,
	`IsDeceased` INT(11) NULL,
	`IsDonor` INT(11) NULL,
	`IsDriver` INT(11) NULL,
	`IsFosterer` INT(11) NULL,
	`IsGiftAid` INT(11) NULL,
	`IsHomeChecker` INT(11) NULL,
	`IsMember` INT(11) NULL,
	`IsRetailer` INT(11) NULL,
	`IsShelter` INT(11) NULL,
	`IsStaff` INT(11) NULL,
	`IsVet` INT(11) NULL,
	`IsVolunteer` INT(11) NULL,
	`JurisdictionID` INT(11) NULL,
	`JurisdictionName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LatLong` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`MatchActive` INT(11) NULL,
	`MatchAdded` DATETIME NULL,
	`MatchAgeFrom` DOUBLE NULL,
	`MatchAgeTo` DOUBLE NULL,
	`MatchAnimalType` INT(11) NULL,
	`MatchBreed` INT(11) NULL,
	`MatchBreed2` INT(11) NULL,
	`MatchColour` INT(11) NULL,
	`MatchCommentsContain` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`MatchExpires` DATETIME NULL,
	`MatchGoodWithCats` INT(11) NULL,
	`MatchGoodWithChildren` INT(11) NULL,
	`MatchGoodWithDogs` INT(11) NULL,
	`MatchHouseTrained` INT(11) NULL,
	`MatchSex` INT(11) NULL,
	`MatchSize` INT(11) NULL,
	`MatchSpecies` INT(11) NULL,
	`MembershipExpiryDate` DATETIME NULL,
	`MembershipNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`MobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerCode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerForeNames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerType` INT(11) NULL,
	`PersonID` INT(11) NOT NULL,
	`RecordVersion` INT(11) NULL,
	`SiteID` INT(11) NULL,
	`WebsiteMediaDate` DATETIME NULL,
	`WebsiteMediaID` INT(11) NULL,
	`WebsiteMediaName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WebsiteMediaNotes` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`WorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_ownercitation
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_ownercitation` (
	`AnimalControlID` INT(11) NULL,
	`CitationDate` DATETIME NOT NULL,
	`CitationName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CitationTypeID` INT(11) NOT NULL,
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`FineAmount` INT(11) NULL,
	`FineDueDate` DATETIME NULL,
	`FinePaidDate` DATETIME NULL,
	`ID` INT(11) NOT NULL,
	`IncidentName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`OwnerForenames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NOT NULL,
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_ownerdonation
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_ownerdonation` (
	`AdditionalFlags` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`AnimalID` INT(11) NULL,
	`AnimalName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ChequeNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`CombiTestResult` INT(11) NULL,
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`CrueltyCase` INT(11) NULL,
	`CurrentOwnerName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Date` DATETIME NULL,
	`DateDue` DATETIME NULL,
	`DisplayLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Donation` INT(11) NOT NULL,
	`DonationName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`DonationPaymentID` INT(11) NULL,
	`DonationTypeID` INT(11) NOT NULL,
	`EmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`FLVResult` INT(11) NULL,
	`Frequency` INT(11) NOT NULL,
	`FrequencyName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`HasActiveReserve` INT(11) NULL,
	`HasTrialAdoption` INT(11) NULL,
	`HeartwormTestResult` INT(11) NULL,
	`HomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ID` INT(11) NOT NULL,
	`IsGiftAid` INT(11) NOT NULL,
	`IsGiftAidName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`IsHold` INT(11) NULL,
	`IsNotAvailableForAdoption` INT(11) NULL,
	`IsQuarantine` INT(11) NULL,
	`IsVAT` INT(11) NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`MobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`MovementID` INT(11) NULL,
	`Neutered` INT(11) NULL,
	`NextCreated` INT(11) NULL,
	`NonShelterAnimal` INT(11) NULL,
	`OwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerForenames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NOT NULL,
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`PaymentName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Quantity` INT(11) NULL,
	`ReceiptNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterCode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterLocationUnit` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShortCode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`UnitPrice` INT(11) NULL,
	`VATAmount` INT(11) NULL,
	`VATRate` DOUBLE NULL,
	`WorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_ownerlicence
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_ownerlicence` (
	`AnimalID` INT(11) NOT NULL,
	`AnimalName` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`ExpiryDate` DATETIME NOT NULL,
	`HomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ID` INT(11) NOT NULL,
	`IssueDate` DATETIME NOT NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LicenceFee` INT(11) NULL,
	`LicenceNumber` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LicenceTypeID` INT(11) NOT NULL,
	`LicenceTypeName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`MobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerForenames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NOT NULL,
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShelterCode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ShortCode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`WorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_ownertraploan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_ownertraploan` (
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`DepositAmount` INT(11) NULL,
	`DepositReturnDate` DATETIME NULL,
	`ID` INT(11) NOT NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`LoanDate` DATETIME NOT NULL,
	`OwnerForenames` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NOT NULL,
	`OwnerInitials` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerSurname` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerTitle` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ReturnDate` DATETIME NULL,
	`ReturnDueDate` DATETIME NULL,
	`TrapNumber` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`TrapTypeID` INT(11) NOT NULL,
	`TrapTypeName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_ownervoucher
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_ownervoucher` (
	`AdditionalFlags` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`Comments` LONGTEXT NULL COLLATE 'latin1_swedish_ci',
	`CreatedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`CreatedDate` DATETIME NOT NULL,
	`DateExpired` DATETIME NOT NULL,
	`DateIssued` DATETIME NOT NULL,
	`EmailAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`HomeTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`ID` INT(11) NOT NULL,
	`LastChangedBy` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`LastChangedDate` DATETIME NOT NULL,
	`MobileTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerAddress` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerCounty` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerID` INT(11) NOT NULL,
	`OwnerName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`OwnerPostcode` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`OwnerTown` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci',
	`RecordVersion` INT(11) NULL,
	`Value` INT(11) NOT NULL,
	`VoucherID` INT(11) NOT NULL,
	`VoucherName` VARCHAR(255) NOT NULL COLLATE 'latin1_swedish_ci',
	`WorkTelephone` VARCHAR(255) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view asm.v_adoption
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_adoption`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_adoption` AS select `m`.`ID` AS `ID`,`m`.`AdoptionNumber` AS `AdoptionNumber`,`m`.`AnimalID` AS `AnimalID`,`m`.`OwnerID` AS `OwnerID`,`m`.`RetailerID` AS `RetailerID`,`m`.`OriginalRetailerMovementID` AS `OriginalRetailerMovementID`,`m`.`MovementDate` AS `MovementDate`,`m`.`MovementType` AS `MovementType`,`m`.`ReturnDate` AS `ReturnDate`,`m`.`ReturnedReasonID` AS `ReturnedReasonID`,`m`.`InsuranceNumber` AS `InsuranceNumber`,`m`.`ReasonForReturn` AS `ReasonForReturn`,`m`.`ReturnedByOwnerID` AS `ReturnedByOwnerID`,`m`.`ReservationDate` AS `ReservationDate`,`m`.`ReservationCancelledDate` AS `ReservationCancelledDate`,`m`.`ReservationStatusID` AS `ReservationStatusID`,`m`.`Donation` AS `Donation`,`m`.`IsTrial` AS `IsTrial`,`m`.`IsPermanentFoster` AS `IsPermanentFoster`,`m`.`TrialEndDate` AS `TrialEndDate`,`m`.`Comments` AS `Comments`,`m`.`RecordVersion` AS `RecordVersion`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`CreatedDate` AS `CreatedDate`,`m`.`LastChangedBy` AS `LastChangedBy`,`m`.`LastChangedDate` AS `LastChangedDate`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`rs`.`StatusName` AS `ReservationStatusName`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`AnimalAge` AS `AnimalAge`,`a`.`AgeGroup` AS `AgeGroup`,`a`.`AnimalName` AS `AnimalName`,`a`.`BreedName` AS `BreedName`,`a`.`Neutered` AS `Neutered`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`HoldUntilDate` AS `HoldUntilDate`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`Archived` AS `Archived`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,`il`.`LocationName` AS `ShelterLocationName`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`r`.`OwnerName` AS `RetailerName`,`ma`.`MediaName` AS `WebsiteMediaName`,`ma`.`Date` AS `WebsiteMediaDate`,`sx`.`Sex` AS `Sex`,`s`.`SpeciesName` AS `SpeciesName`,`rr`.`ReasonName` AS `ReturnedReasonName`,(case when ((`m`.`MovementType` = 2) and (`m`.`IsPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`m`.`MovementType` = 1) and (`m`.`IsTrial` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when (isnull(`m`.`MovementDate`) and (`m`.`ReservationDate` is not null) and (`m`.`ReservationCancelledDate` is not null)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 10)) when (isnull(`m`.`MovementDate`) and (`m`.`ReservationDate` is not null)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 9)) else `l`.`MovementType` end) AS `MovementName`,(case when ((`m`.`MovementType` = 2) and (`m`.`IsPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`m`.`MovementType` = 1) and (`m`.`IsTrial` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when (isnull(`m`.`MovementDate`) and (`m`.`ReservationDate` is not null) and (`m`.`ReservationCancelledDate` is not null)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 10)) when (isnull(`m`.`MovementDate`) and (`m`.`ReservationDate` is not null)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 9)) else `l`.`MovementType` end) AS `DisplayLocationName`,`co`.`OwnerName` AS `CurrentOwnerName` from ((((((((((((`adoption` `m` left join `reservationstatus` `rs` on((`rs`.`ID` = `m`.`ReservationStatusID`))) left join `lksmovementtype` `l` on((`l`.`ID` = `m`.`MovementType`))) join `animal` `a` on((`m`.`AnimalID` = `a`.`ID`))) left join `adoption` `ad` on((`a`.`ActiveMovementID` = `ad`.`ID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`))) left join `media` `ma` on(((`ma`.`LinkID` = `a`.`ID`) and (`ma`.`LinkTypeID` = 0) and (`ma`.`WebsitePhoto` = 1)))) left join `entryreason` `rr` on((`m`.`ReturnedReasonID` = `rr`.`ID`))) join `species` `s` on((`a`.`SpeciesID` = `s`.`ID`))) join `lksex` `sx` on((`sx`.`ID` = `a`.`Sex`))) left join `owner` `o` on((`m`.`OwnerID` = `o`.`ID`))) left join `owner` `r` on((`m`.`RetailerID` = `r`.`ID`)));

-- Dumping structure for view asm.v_animal
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_animal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_animal` AS select `a`.`ID` AS `ID`,`a`.`AnimalTypeID` AS `AnimalTypeID`,`a`.`AnimalName` AS `AnimalName`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`BondedAnimalID` AS `BondedAnimalID`,`a`.`BondedAnimal2ID` AS `BondedAnimal2ID`,`a`.`BaseColourID` AS `BaseColourID`,`a`.`SpeciesID` AS `SpeciesID`,`a`.`BreedID` AS `BreedID`,`a`.`Breed2ID` AS `Breed2ID`,`a`.`BreedName` AS `BreedName`,`a`.`CrossBreed` AS `CrossBreed`,`a`.`CoatType` AS `CoatType`,`a`.`Markings` AS `Markings`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`UniqueCodeID` AS `UniqueCodeID`,`a`.`SmartTagSentDate` AS `SmartTagSentDate`,`a`.`YearCodeID` AS `YearCodeID`,`a`.`AcceptanceNumber` AS `AcceptanceNumber`,`a`.`DateOfBirth` AS `DateOfBirth`,`a`.`EstimatedDOB` AS `EstimatedDOB`,`a`.`AgeGroup` AS `AgeGroup`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`Sex` AS `Sex`,`a`.`Fee` AS `Fee`,`a`.`Identichipped` AS `Identichipped`,`a`.`IdentichipNumber` AS `IdentichipNumber`,`a`.`IdentichipDate` AS `IdentichipDate`,`a`.`Identichip2Number` AS `Identichip2Number`,`a`.`Identichip2Date` AS `Identichip2Date`,`a`.`Tattoo` AS `Tattoo`,`a`.`TattooNumber` AS `TattooNumber`,`a`.`TattooDate` AS `TattooDate`,`a`.`SmartTag` AS `SmartTag`,`a`.`SmartTagNumber` AS `SmartTagNumber`,`a`.`SmartTagDate` AS `SmartTagDate`,`a`.`SmartTagType` AS `SmartTagType`,`a`.`Neutered` AS `Neutered`,`a`.`NeuteredDate` AS `NeuteredDate`,`a`.`NeuteredByVetID` AS `NeuteredByVetID`,`a`.`CombiTested` AS `CombiTested`,`a`.`CombiTestDate` AS `CombiTestDate`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`HeartwormTested` AS `HeartwormTested`,`a`.`HeartwormTestDate` AS `HeartwormTestDate`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`Declawed` AS `Declawed`,`a`.`HiddenAnimalDetails` AS `HiddenAnimalDetails`,`a`.`AnimalComments` AS `AnimalComments`,`a`.`OwnersVetID` AS `OwnersVetID`,`a`.`CurrentVetID` AS `CurrentVetID`,`a`.`OriginalOwnerID` AS `OriginalOwnerID`,`a`.`BroughtInByOwnerID` AS `BroughtInByOwnerID`,`a`.`AdoptionCoordinatorID` AS `AdoptionCoordinatorID`,`a`.`ReasonForEntry` AS `ReasonForEntry`,`a`.`ReasonNO` AS `ReasonNO`,`a`.`DateBroughtIn` AS `DateBroughtIn`,`a`.`EntryReasonID` AS `EntryReasonID`,`a`.`AsilomarIsTransferExternal` AS `AsilomarIsTransferExternal`,`a`.`AsilomarIntakeCategory` AS `AsilomarIntakeCategory`,`a`.`AsilomarOwnerRequestedEuthanasia` AS `AsilomarOwnerRequestedEuthanasia`,`a`.`IsPickup` AS `IsPickup`,`a`.`PickupLocationID` AS `PickupLocationID`,`a`.`PickupAddress` AS `PickupAddress`,`a`.`HealthProblems` AS `HealthProblems`,`a`.`PutToSleep` AS `PutToSleep`,`a`.`PTSReason` AS `PTSReason`,`a`.`PTSReasonID` AS `PTSReasonID`,`a`.`IsCourtesy` AS `IsCourtesy`,`a`.`IsDOA` AS `IsDOA`,`a`.`IsTransfer` AS `IsTransfer`,`a`.`IsGoodWithCats` AS `IsGoodWithCats`,`a`.`IsGoodWithDogs` AS `IsGoodWithDogs`,`a`.`IsGoodWithChildren` AS `IsGoodWithChildren`,`a`.`IsHouseTrained` AS `IsHouseTrained`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsNotForRegistration` AS `IsNotForRegistration`,`a`.`IsHold` AS `IsHold`,`a`.`HoldUntilDate` AS `HoldUntilDate`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`HasSpecialNeeds` AS `HasSpecialNeeds`,`a`.`AdditionalFlags` AS `AdditionalFlags`,`a`.`ShelterLocation` AS `ShelterLocation`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`a`.`DiedOffShelter` AS `DiedOffShelter`,`a`.`Size` AS `Size`,`a`.`Weight` AS `Weight`,`a`.`RabiesTag` AS `RabiesTag`,`a`.`Archived` AS `Archived`,`a`.`ActiveMovementID` AS `ActiveMovementID`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`ActiveMovementDate` AS `ActiveMovementDate`,`a`.`ActiveMovementReturn` AS `ActiveMovementReturn`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`HasPermanentFoster` AS `HasPermanentFoster`,`a`.`DisplayLocation` AS `DisplayLocation`,`a`.`MostRecentEntryDate` AS `MostRecentEntryDate`,`a`.`TimeOnShelter` AS `TimeOnShelter`,`a`.`TotalTimeOnShelter` AS `TotalTimeOnShelter`,`a`.`DaysOnShelter` AS `DaysOnShelter`,`a`.`TotalDaysOnShelter` AS `TotalDaysOnShelter`,`a`.`AgeGroupActiveMovement` AS `AgeGroupActiveMovement`,`a`.`DailyBoardingCost` AS `DailyBoardingCost`,`a`.`AnimalAge` AS `AnimalAge`,`a`.`RecordVersion` AS `RecordVersion`,`a`.`CreatedBy` AS `CreatedBy`,`a`.`CreatedDate` AS `CreatedDate`,`a`.`LastChangedBy` AS `LastChangedBy`,`a`.`LastChangedDate` AS `LastChangedDate`,`at`.`AnimalType` AS `AnimalTypeName`,`ba1`.`AnimalName` AS `BondedAnimal1Name`,`ba1`.`ShelterCode` AS `BondedAnimal1Code`,`ba1`.`Archived` AS `BondedAnimal1Archived`,`ba2`.`AnimalName` AS `BondedAnimal2Name`,`ba2`.`ShelterCode` AS `BondedAnimal2Code`,`ba2`.`Archived` AS `BondedAnimal2Archived`,`bc`.`BaseColour` AS `BaseColourName`,`bc`.`AdoptAPetColour` AS `AdoptAPetColour`,`sp`.`SpeciesName` AS `SpeciesName`,`sp`.`PetFinderSpecies` AS `PetFinderSpecies`,`bd`.`BreedName` AS `BreedName1`,`bd2`.`BreedName` AS `BreedName2`,`bd`.`PetFinderBreed` AS `PetFinderBreed`,`bd2`.`PetFinderBreed` AS `PetFinderBreed2`,`ct`.`CoatType` AS `CoatTypeName`,`sx`.`Sex` AS `SexName`,`sz`.`Size` AS `SizeName`,`ov`.`OwnerName` AS `OwnersVetName`,`ov`.`OwnerAddress` AS `OwnersVetAddress`,`ov`.`OwnerTown` AS `OwnersVetTown`,`ov`.`OwnerCounty` AS `OwnersVetCounty`,`ov`.`OwnerPostcode` AS `OwnersVetPostcode`,`ov`.`WorkTelephone` AS `OwnersVetWorkTelephone`,`ov`.`EmailAddress` AS `OwnersVetEmailAddress`,`ov`.`MembershipNumber` AS `OwnersVetLicenceNumber`,`cv`.`OwnerName` AS `CurrentVetName`,`cv`.`OwnerAddress` AS `CurrentVetAddress`,`cv`.`OwnerTown` AS `CurrentVetTown`,`cv`.`OwnerCounty` AS `CurrentVetCounty`,`cv`.`OwnerPostcode` AS `CurrentVetPostcode`,`cv`.`WorkTelephone` AS `CurrentVetWorkTelephone`,`cv`.`EmailAddress` AS `CurrentVetEmailAddress`,`cv`.`MembershipNumber` AS `CurrentVetLicenceNumber`,`nv`.`OwnerName` AS `NeuteringVetName`,`nv`.`OwnerAddress` AS `NeuteringVetAddress`,`nv`.`OwnerTown` AS `NeuteringVetTown`,`nv`.`OwnerCounty` AS `NeuteringVetCounty`,`nv`.`OwnerPostcode` AS `NeuteringVetPostcode`,`nv`.`WorkTelephone` AS `NeuteringVetWorkTelephone`,`nv`.`EmailAddress` AS `NeuteringVetEmailAddress`,`nv`.`MembershipNumber` AS `NeuteringVetLicenceNumber`,`oo`.`OwnerName` AS `OriginalOwnerName`,`oo`.`OwnerTitle` AS `OriginalOwnerTitle`,`oo`.`OwnerInitials` AS `OriginalOwnerInitials`,`oo`.`OwnerForeNames` AS `OriginalOwnerForeNames`,`oo`.`OwnerSurname` AS `OriginalOwnerSurname`,`oo`.`OwnerAddress` AS `OriginalOwnerAddress`,`oo`.`OwnerTown` AS `OriginalOwnerTown`,`oo`.`OwnerCounty` AS `OriginalOwnerCounty`,`oo`.`OwnerPostcode` AS `OriginalOwnerPostcode`,`oo`.`HomeTelephone` AS `OriginalOwnerHomeTelephone`,`oo`.`WorkTelephone` AS `OriginalOwnerWorkTelephone`,`oo`.`MobileTelephone` AS `OriginalOwnerMobileTelephone`,`oo`.`EmailAddress` AS `OriginalOwnerEmailAddress`,`co`.`ID` AS `CurrentOwnerID`,`co`.`OwnerName` AS `CurrentOwnerName`,`co`.`OwnerTitle` AS `CurrentOwnerTitle`,`co`.`OwnerInitials` AS `CurrentOwnerInitials`,`co`.`OwnerForeNames` AS `CurrentOwnerForeNames`,`co`.`OwnerSurname` AS `CurrentOwnerSurname`,`co`.`OwnerAddress` AS `CurrentOwnerAddress`,`co`.`OwnerTown` AS `CurrentOwnerTown`,`co`.`OwnerCounty` AS `CurrentOwnerCounty`,`co`.`OwnerPostcode` AS `CurrentOwnerPostcode`,`co`.`HomeTelephone` AS `CurrentOwnerHomeTelephone`,`co`.`WorkTelephone` AS `CurrentOwnerWorkTelephone`,`co`.`MobileTelephone` AS `CurrentOwnerMobileTelephone`,`co`.`EmailAddress` AS `CurrentOwnerEmailAddress`,`bo`.`OwnerName` AS `BroughtInByOwnerName`,`bo`.`OwnerAddress` AS `BroughtInByOwnerAddress`,`bo`.`OwnerTown` AS `BroughtInByOwnerTown`,`bo`.`OwnerCounty` AS `BroughtInByOwnerCounty`,`bo`.`OwnerPostcode` AS `BroughtInByOwnerPostcode`,`bo`.`HomeTelephone` AS `BroughtInByHomeTelephone`,`bo`.`WorkTelephone` AS `BroughtInByWorkTelephone`,`bo`.`MobileTelephone` AS `BroughtInByMobileTelephone`,`bo`.`EmailAddress` AS `BroughtInByEmailAddress`,`ro`.`ID` AS `ReservedOwnerID`,`ro`.`OwnerName` AS `ReservedOwnerName`,`ro`.`OwnerAddress` AS `ReservedOwnerAddress`,`ro`.`OwnerTown` AS `ReservedOwnerTown`,`ro`.`OwnerCounty` AS `ReservedOwnerCounty`,`ro`.`OwnerPostcode` AS `ReservedOwnerPostcode`,`ro`.`HomeTelephone` AS `ReservedOwnerHomeTelephone`,`ro`.`WorkTelephone` AS `ReservedOwnerWorkTelephone`,`ro`.`MobileTelephone` AS `ReservedOwnerMobileTelephone`,`ro`.`EmailAddress` AS `ReservedOwnerEmailAddress`,`ao`.`OwnerName` AS `AdoptionCoordinatorName`,`ao`.`HomeTelephone` AS `AdoptionCoordinatorHomeTelephone`,`ao`.`WorkTelephone` AS `AdoptionCoordinatorWorkTelephone`,`ao`.`MobileTelephone` AS `AdoptionCoordinatorMobileTelephone`,`ao`.`EmailAddress` AS `AdoptionCoordinatorEmailAddress`,`ars`.`StatusName` AS `ReservationStatusName`,`er`.`ReasonName` AS `EntryReasonName`,`dr`.`ReasonName` AS `PTSReasonName`,`il`.`LocationName` AS `ShelterLocationName`,`il`.`LocationDescription` AS `ShelterLocationDescription`,`il`.`SiteID` AS `SiteID`,`se`.`SiteName` AS `SiteName`,`pl`.`LocationName` AS `PickupLocationName`,`ac`.`ID` AS `AnimalControlIncidentID`,`itn`.`IncidentName` AS `AnimalControlIncidentName`,`ac`.`IncidentDateTime` AS `AnimalControlIncidentDate`,`mt`.`MovementType` AS `ActiveMovementTypeName`,`am`.`AdoptionNumber` AS `ActiveMovementAdoptionNumber`,`am`.`ReturnDate` AS `ActiveMovementReturnDate`,`am`.`InsuranceNumber` AS `ActiveMovementInsuranceNumber`,`am`.`ReasonForReturn` AS `ActiveMovementReasonForReturn`,`am`.`TrialEndDate` AS `ActiveMovementTrialEndDate`,`am`.`Comments` AS `ActiveMovementComments`,`am`.`ReservationDate` AS `ActiveMovementReservationDate`,`am`.`Donation` AS `ActiveMovementDonation`,`am`.`CreatedBy` AS `ActiveMovementCreatedBy`,`au`.`RealName` AS `ActiveMovementCreatedByName`,`am`.`CreatedDate` AS `ActiveMovementCreatedDate`,`am`.`LastChangedBy` AS `ActiveMovementLastChangedBy`,`am`.`LastChangedDate` AS `ActiveMovementLastChangedDate`,(case when exists(select `configuration`.`ItemValue` from `configuration` where ((`configuration`.`ItemName` like 'UseShortShelterCodes') and (`configuration`.`ItemValue` = 'Yes'))) then `a`.`ShortCode` else `a`.`ShelterCode` end) AS `Code`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` in (2,8,13))) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes`,(select count(0) from `media` `mtc` where ((`mtc`.`MediaMimeType` = 'image/jpeg') and (`mtc`.`LinkTypeID` = 0) and (`mtc`.`LinkID` = `a`.`ID`) and (`mtc`.`ExcludeFromPublish` = 0))) AS `WebsiteImageCount`,`doc`.`MediaName` AS `DocMediaName`,`doc`.`Date` AS `DocMediaDate`,`vid`.`MediaName` AS `WebsiteVideoURL`,`vid`.`MediaNotes` AS `WebsiteVideoNotes`,(case when exists(select `adoption`.`ID` from `adoption` where ((`adoption`.`AnimalID` = `a`.`ID`) and (`adoption`.`MovementType` = 1) and (`adoption`.`MovementDate` > '2019-03-02 00:00:00'))) then 1 else 0 end) AS `HasFutureAdoption`,(select count(0) from `media` where ((`media`.`MediaMimeType` = 'image/jpeg') and (`media`.`Date` >= '2019-02-28 00:00:00') and (`media`.`LinkID` = `a`.`ID`) and (`media`.`LinkTypeID` = 0))) AS `RecentlyChangedImages`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`NonShelterAnimal`)) AS `NonShelterAnimalName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`CrueltyCase`)) AS `CrueltyCaseName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`CrossBreed`)) AS `CrossBreedName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`EstimatedDOB`)) AS `EstimatedDOBName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`Identichipped`)) AS `IdentichippedName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`Tattoo`)) AS `TattooName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`Neutered`)) AS `NeuteredName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`CombiTested`)) AS `CombiTestedName`,(select `l`.`Name` from `lksposneg` `l` where (`l`.`ID` = `a`.`CombiTestResult`)) AS `CombiTestResultName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`HeartwormTested`)) AS `HeartwormTestedName`,(select `l`.`Name` from `lksposneg` `l` where (`l`.`ID` = `a`.`HeartwormTestResult`)) AS `HeartwormTestResultName`,(select `l`.`Name` from `lksposneg` `l` where (`l`.`ID` = `a`.`FLVResult`)) AS `FLVResultName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`Declawed`)) AS `DeclawedName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`PutToSleep`)) AS `PutToSleepName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsDOA`)) AS `IsDOAName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsTransfer`)) AS `IsTransferName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsPickup`)) AS `IsPickupName`,(select `l`.`Name` from `lksynun` `l` where (`l`.`ID` = `a`.`IsGoodWithChildren`)) AS `IsGoodWithChildrenName`,(select `l`.`Name` from `lksynun` `l` where (`l`.`ID` = `a`.`IsGoodWithCats`)) AS `IsGoodWithCatsName`,(select `l`.`Name` from `lksynun` `l` where (`l`.`ID` = `a`.`IsGoodWithDogs`)) AS `IsGoodWithDogsName`,(select `l`.`Name` from `lksynun` `l` where (`l`.`ID` = `a`.`IsHouseTrained`)) AS `IsHouseTrainedName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsNotAvailableForAdoption`)) AS `IsNotAvailableForAdoptionName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsNotForRegistration`)) AS `IsNotForRegistrationName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`HasSpecialNeeds`)) AS `HasSpecialNeedsName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`DiedOffShelter`)) AS `DiedOffShelterName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`HasActiveReserve`)) AS `HasActiveReserveName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`HasTrialAdoption`)) AS `HasTrialAdoptionName` from ((((((((((((((((((((((((((((((((((`animal` `a` left join `animal` `ba1` on((`ba1`.`ID` = `a`.`BondedAnimalID`))) left join `animal` `ba2` on((`ba2`.`ID` = `a`.`BondedAnimal2ID`))) left join `animaltype` `at` on((`at`.`ID` = `a`.`AnimalTypeID`))) left join `basecolour` `bc` on((`bc`.`ID` = `a`.`BaseColourID`))) left join `species` `sp` on((`sp`.`ID` = `a`.`SpeciesID`))) left join `lksex` `sx` on((`sx`.`ID` = `a`.`Sex`))) left join `lksize` `sz` on((`sz`.`ID` = `a`.`Size`))) left join `entryreason` `er` on((`er`.`ID` = `a`.`EntryReasonID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`))) left join `site` `se` on((`se`.`ID` = `il`.`SiteID`))) left join `pickuplocation` `pl` on((`pl`.`ID` = `a`.`PickupLocationID`))) left join `media` `web` on(((`web`.`LinkID` = `a`.`ID`) and (`web`.`LinkTypeID` = 0) and (`web`.`WebsitePhoto` = 1)))) left join `media` `vid` on(((`vid`.`LinkID` = `a`.`ID`) and (`vid`.`LinkTypeID` = 0) and (`vid`.`WebsiteVideo` = 1)))) left join `media` `doc` on(((`doc`.`LinkID` = `a`.`ID`) and (`doc`.`LinkTypeID` = 0) and (`doc`.`DocPhoto` = 1)))) left join `breed` `bd` on((`bd`.`ID` = `a`.`BreedID`))) left join `breed` `bd2` on((`bd2`.`ID` = `a`.`Breed2ID`))) left join `lkcoattype` `ct` on((`ct`.`ID` = `a`.`CoatType`))) left join `deathreason` `dr` on((`dr`.`ID` = `a`.`PTSReasonID`))) left join `lksmovementtype` `mt` on((`mt`.`ID` = `a`.`ActiveMovementType`))) left join `owner` `ov` on((`ov`.`ID` = `a`.`OwnersVetID`))) left join `owner` `cv` on((`cv`.`ID` = `a`.`CurrentVetID`))) left join `owner` `nv` on((`nv`.`ID` = `a`.`NeuteredByVetID`))) left join `owner` `oo` on((`oo`.`ID` = `a`.`OriginalOwnerID`))) left join `owner` `bo` on((`bo`.`ID` = `a`.`BroughtInByOwnerID`))) left join `owner` `ao` on((`ao`.`ID` = `a`.`AdoptionCoordinatorID`))) left join `adoption` `am` on((`am`.`ID` = `a`.`ActiveMovementID`))) left join `users` `au` on((`au`.`UserName` = `am`.`CreatedBy`))) left join `owner` `co` on((`co`.`ID` = `am`.`OwnerID`))) left join `animalcontrolanimal` `aca` on(((`a`.`ID` = `aca`.`AnimalID`) and (`aca`.`AnimalControlID` = (select max(`saca`.`AnimalControlID`) from `animalcontrolanimal` `saca` where (`saca`.`AnimalID` = `a`.`ID`)))))) left join `animalcontrol` `ac` on((`ac`.`ID` = `aca`.`AnimalControlID`))) left join `incidenttype` `itn` on((`itn`.`ID` = `ac`.`IncidentTypeID`))) left join `adoption` `ar` on(((`ar`.`AnimalID` = `a`.`ID`) and (`ar`.`MovementType` = 0) and isnull(`ar`.`MovementDate`) and (`ar`.`ReservationDate` is not null) and isnull(`ar`.`ReservationCancelledDate`) and (`ar`.`ID` = (select max(`sar`.`ID`) from `adoption` `sar` where ((`sar`.`AnimalID` = `a`.`ID`) and (`sar`.`MovementType` = 0) and isnull(`sar`.`MovementDate`) and (`sar`.`ReservationDate` is not null) and isnull(`sar`.`ReservationCancelledDate`))))))) left join `reservationstatus` `ars` on((`ars`.`ID` = `ar`.`ReservationStatusID`))) left join `owner` `ro` on((`ro`.`ID` = `ar`.`OwnerID`)));

-- Dumping structure for view asm.v_animalcontrol
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_animalcontrol`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_animalcontrol` AS select `ac`.`ID` AS `ID`,`ac`.`IncidentDateTime` AS `IncidentDateTime`,`ac`.`IncidentTypeID` AS `IncidentTypeID`,`ac`.`CallDateTime` AS `CallDateTime`,`ac`.`CallNotes` AS `CallNotes`,`ac`.`CallTaker` AS `CallTaker`,`ac`.`CallerID` AS `CallerID`,`ac`.`VictimID` AS `VictimID`,`ac`.`DispatchAddress` AS `DispatchAddress`,`ac`.`DispatchTown` AS `DispatchTown`,`ac`.`DispatchCounty` AS `DispatchCounty`,`ac`.`DispatchPostcode` AS `DispatchPostcode`,`ac`.`DispatchLatLong` AS `DispatchLatLong`,`ac`.`DispatchedACO` AS `DispatchedACO`,`ac`.`PickupLocationID` AS `PickupLocationID`,`ac`.`JurisdictionID` AS `JurisdictionID`,`ac`.`DispatchDateTime` AS `DispatchDateTime`,`ac`.`RespondedDateTime` AS `RespondedDateTime`,`ac`.`FollowupDateTime` AS `FollowupDateTime`,`ac`.`FollowupComplete` AS `FollowupComplete`,`ac`.`FollowupDateTime2` AS `FollowupDateTime2`,`ac`.`FollowupComplete2` AS `FollowupComplete2`,`ac`.`FollowupDateTime3` AS `FollowupDateTime3`,`ac`.`FollowupComplete3` AS `FollowupComplete3`,`ac`.`CompletedDate` AS `CompletedDate`,`ac`.`IncidentCompletedID` AS `IncidentCompletedID`,`ac`.`SiteID` AS `SiteID`,`ac`.`OwnerID` AS `OwnerID`,`ac`.`Owner2ID` AS `Owner2ID`,`ac`.`Owner3ID` AS `Owner3ID`,`ac`.`AnimalID` AS `AnimalID`,`ac`.`AnimalDescription` AS `AnimalDescription`,`ac`.`SpeciesID` AS `SpeciesID`,`ac`.`Sex` AS `Sex`,`ac`.`AgeGroup` AS `AgeGroup`,`ac`.`RecordVersion` AS `RecordVersion`,`ac`.`CreatedBy` AS `CreatedBy`,`ac`.`CreatedDate` AS `CreatedDate`,`ac`.`LastChangedBy` AS `LastChangedBy`,`ac`.`LastChangedDate` AS `LastChangedDate`,`ac`.`ID` AS `ACID`,`s`.`SpeciesName` AS `SpeciesName`,`x`.`Sex` AS `SexName`,`co`.`OwnerName` AS `CallerName`,`co`.`OwnerAddress` AS `CallerAddress`,`co`.`OwnerTown` AS `CallerTown`,`co`.`OwnerCounty` AS `CallerCounty`,`co`.`OwnerPostcode` AS `CallerPostcode`,`co`.`HomeTelephone` AS `CallerHomeTelephone`,`co`.`WorkTelephone` AS `CallerWorkTelephone`,`co`.`MobileTelephone` AS `CallerMobileTelephone`,`o1`.`OwnerName` AS `OwnerName`,`o1`.`OwnerName` AS `OwnerName1`,`o2`.`OwnerName` AS `OwnerName2`,`o3`.`OwnerName` AS `OwnerName3`,`o1`.`OwnerName` AS `SuspectName`,`o1`.`OwnerAddress` AS `SuspectAddress`,`o1`.`OwnerTown` AS `SuspectTown`,`o1`.`OwnerCounty` AS `SuspectCounty`,`o1`.`OwnerPostcode` AS `SuspectPostcode`,`o1`.`HomeTelephone` AS `SuspectHomeTelephone`,`o1`.`WorkTelephone` AS `SuspectWorkTelephone`,`o1`.`MobileTelephone` AS `SuspectMobileTelephone`,`vo`.`OwnerName` AS `VictimName`,`vo`.`OwnerAddress` AS `VictimAddress`,`vo`.`OwnerTown` AS `VictimTown`,`vo`.`OwnerCounty` AS `VictimCounty`,`vo`.`OwnerPostcode` AS `VictimPostcode`,`vo`.`HomeTelephone` AS `VictimHomeTelephone`,`vo`.`WorkTelephone` AS `VictimWorkTelephone`,`vo`.`MobileTelephone` AS `VictimMobileTelephone`,`ti`.`IncidentName` AS `IncidentName`,`ci`.`CompletedName` AS `CompletedName`,`pl`.`LocationName` AS `LocationName`,`j`.`JurisdictionName` AS `JurisdictionName`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes`,`doc`.`MediaName` AS `DocMediaName`,`doc`.`Date` AS `DocMediaDate` from (((((((((((((`animalcontrol` `ac` left join `species` `s` on((`s`.`ID` = `ac`.`SpeciesID`))) left join `lksex` `x` on((`x`.`ID` = `ac`.`Sex`))) left join `jurisdiction` `j` on((`j`.`ID` = `ac`.`JurisdictionID`))) left join `owner` `co` on((`co`.`ID` = `ac`.`CallerID`))) left join `owner` `o1` on((`o1`.`ID` = `ac`.`OwnerID`))) left join `owner` `o2` on((`o2`.`ID` = `ac`.`Owner2ID`))) left join `owner` `o3` on((`o3`.`ID` = `ac`.`Owner3ID`))) left join `owner` `vo` on((`vo`.`ID` = `ac`.`VictimID`))) left join `media` `web` on(((`web`.`LinkID` = `ac`.`ID`) and (`web`.`LinkTypeID` = 6) and (`web`.`WebsitePhoto` = 1)))) left join `media` `doc` on(((`doc`.`LinkID` = `ac`.`ID`) and (`doc`.`LinkTypeID` = 6) and (`doc`.`DocPhoto` = 1)))) left join `pickuplocation` `pl` on((`pl`.`ID` = `ac`.`PickupLocationID`))) left join `incidenttype` `ti` on((`ti`.`ID` = `ac`.`IncidentTypeID`))) left join `incidentcompleted` `ci` on((`ci`.`ID` = `ac`.`IncidentCompletedID`)));

-- Dumping structure for view asm.v_animalfound
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_animalfound`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_animalfound` AS select `a`.`ID` AS `ID`,`a`.`AnimalTypeID` AS `AnimalTypeID`,`a`.`DateReported` AS `DateReported`,`a`.`DateFound` AS `DateFound`,`a`.`Sex` AS `Sex`,`a`.`BreedID` AS `BreedID`,`a`.`AgeGroup` AS `AgeGroup`,`a`.`BaseColourID` AS `BaseColourID`,`a`.`DistFeat` AS `DistFeat`,`a`.`AreaFound` AS `AreaFound`,`a`.`AreaPostcode` AS `AreaPostcode`,`a`.`OwnerID` AS `OwnerID`,`a`.`ReturnToOwnerDate` AS `ReturnToOwnerDate`,`a`.`Comments` AS `Comments`,`a`.`RecordVersion` AS `RecordVersion`,`a`.`CreatedBy` AS `CreatedBy`,`a`.`CreatedDate` AS `CreatedDate`,`a`.`LastChangedBy` AS `LastChangedBy`,`a`.`LastChangedDate` AS `LastChangedDate`,`a`.`ID` AS `LFID`,`s`.`SpeciesName` AS `SpeciesName`,`b`.`BreedName` AS `BreedName`,`c`.`BaseColour` AS `BaseColourName`,`c`.`AdoptAPetColour` AS `AdoptAPetColour`,`x`.`Sex` AS `SexName`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForeNames`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `DocMediaName`,`web`.`Date` AS `DocMediaDate`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes` from ((((((`animalfound` `a` left join `breed` `b` on((`a`.`BreedID` = `b`.`ID`))) left join `species` `s` on((`a`.`AnimalTypeID` = `s`.`ID`))) left join `basecolour` `c` on((`a`.`BaseColourID` = `c`.`ID`))) left join `lksex` `x` on((`a`.`Sex` = `x`.`ID`))) left join `media` `web` on(((`web`.`LinkID` = `a`.`ID`) and (`web`.`LinkTypeID` = 2) and (`web`.`WebsitePhoto` = 1)))) left join `owner` `o` on((`a`.`OwnerID` = `o`.`ID`)));

-- Dumping structure for view asm.v_animallost
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_animallost`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_animallost` AS select `a`.`ID` AS `ID`,`a`.`AnimalTypeID` AS `AnimalTypeID`,`a`.`DateReported` AS `DateReported`,`a`.`DateLost` AS `DateLost`,`a`.`DateFound` AS `DateFound`,`a`.`Sex` AS `Sex`,`a`.`BreedID` AS `BreedID`,`a`.`AgeGroup` AS `AgeGroup`,`a`.`BaseColourID` AS `BaseColourID`,`a`.`DistFeat` AS `DistFeat`,`a`.`AreaLost` AS `AreaLost`,`a`.`AreaPostcode` AS `AreaPostcode`,`a`.`OwnerID` AS `OwnerID`,`a`.`Comments` AS `Comments`,`a`.`RecordVersion` AS `RecordVersion`,`a`.`CreatedBy` AS `CreatedBy`,`a`.`CreatedDate` AS `CreatedDate`,`a`.`LastChangedBy` AS `LastChangedBy`,`a`.`LastChangedDate` AS `LastChangedDate`,`a`.`ID` AS `LFID`,`s`.`SpeciesName` AS `SpeciesName`,`b`.`BreedName` AS `BreedName`,`c`.`BaseColour` AS `BaseColourName`,`c`.`AdoptAPetColour` AS `AdoptAPetColour`,`x`.`Sex` AS `SexName`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForeNames`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `DocMediaName`,`web`.`Date` AS `DocMediaDate`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes` from ((((((`animallost` `a` left join `breed` `b` on((`a`.`BreedID` = `b`.`ID`))) left join `species` `s` on((`a`.`AnimalTypeID` = `s`.`ID`))) left join `basecolour` `c` on((`a`.`BaseColourID` = `c`.`ID`))) left join `lksex` `x` on((`a`.`Sex` = `x`.`ID`))) left join `media` `web` on(((`web`.`LinkID` = `a`.`ID`) and (`web`.`LinkTypeID` = 1) and (`web`.`WebsitePhoto` = 1)))) left join `owner` `o` on((`a`.`OwnerID` = `o`.`ID`)));

-- Dumping structure for view asm.v_animalmedicaltreatment
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_animalmedicaltreatment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_animalmedicaltreatment` AS select `a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`AnimalName` AS `AnimalName`,`a`.`Archived` AS `Archived`,`a`.`ActiveMovementID` AS `ActiveMovementID`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`AcceptanceNumber` AS `AcceptanceNumber`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`ShelterLocation` AS `ShelterLocation`,`a`.`Neutered` AS `Neutered`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,(select `species`.`SpeciesName` from `species` where (`species`.`ID` = `a`.`SpeciesID`)) AS `SpeciesName`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 8)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 8)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` = 0)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,`co`.`ID` AS `CurrentOwnerID`,`co`.`OwnerName` AS `CurrentOwnerName`,`am`.`ID` AS `ID`,`am`.`AnimalID` AS `AnimalID`,`am`.`MedicalProfileID` AS `MedicalProfileID`,`am`.`TreatmentName` AS `TreatmentName`,`am`.`StartDate` AS `StartDate`,`am`.`Dosage` AS `Dosage`,`am`.`Cost` AS `Cost`,`am`.`CostPaidDate` AS `CostPaidDate`,`am`.`TimingRule` AS `TimingRule`,`am`.`TimingRuleFrequency` AS `TimingRuleFrequency`,`am`.`TimingRuleNoFrequencies` AS `TimingRuleNoFrequencies`,`am`.`TreatmentRule` AS `TreatmentRule`,`am`.`TotalNumberOfTreatments` AS `TotalNumberOfTreatments`,`am`.`TreatmentsGiven` AS `TreatmentsGiven`,`am`.`TreatmentsRemaining` AS `TreatmentsRemaining`,`am`.`Status` AS `Status`,`am`.`Comments` AS `Comments`,`am`.`RecordVersion` AS `RecordVersion`,`am`.`CreatedBy` AS `CreatedBy`,`am`.`CreatedDate` AS `CreatedDate`,`am`.`LastChangedBy` AS `LastChangedBy`,`am`.`LastChangedDate` AS `LastChangedDate`,`amt`.`DateRequired` AS `DateRequired`,`amt`.`DateGiven` AS `DateGiven`,`amt`.`Comments` AS `TreatmentComments`,`amt`.`TreatmentNumber` AS `TreatmentNumber`,`amt`.`TotalTreatments` AS `TotalTreatments`,`ma`.`MediaName` AS `WebsiteMediaName`,`am`.`ID` AS `RegimenID`,`amt`.`ID` AS `TreatmentID`,`amt`.`GivenBy` AS `GivenBy`,`amt`.`AdministeringVetID` AS `AdministeringVetID`,`adv`.`OwnerName` AS `AdministeringVetName`,`adv`.`OwnerAddress` AS `AdministeringVetAddress`,`adv`.`OwnerTown` AS `AdministeringVetTown`,`adv`.`OwnerCounty` AS `AdministeringVetCounty`,`adv`.`OwnerPostcode` AS `AdministeringVetPostcode`,`adv`.`EmailAddress` AS `AdministeringVetEmail`,`adv`.`MembershipNumber` AS `AdministeringVetLicence`,`am`.`Comments` AS `RegimenComments`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then (select `mt`.`MovementType` from `lksmovementtype` `mt` where (`mt`.`ID` = `a`.`ActiveMovementType`)) else `il`.`LocationName` end) AS `LocationName`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then '' else `a`.`ShelterLocationUnit` end) AS `LocationUnit`,`il`.`LocationName` AS `ShelterLocationName`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,concat(`am`.`ID`,'_',`amt`.`ID`) AS `CompositeID`,(case when (`am`.`TimingRule` = 0) then 'One Off' when (`am`.`TimingRuleFrequency` = 0) then concat(`am`.`TimingRule`,' treatments every ',`am`.`TimingRuleNoFrequencies`,' days') when (`am`.`TimingRuleFrequency` = 1) then concat(`am`.`TimingRule`,' treatments every ',`am`.`TimingRuleNoFrequencies`,' weeks') when (`am`.`TimingRuleFrequency` = 2) then concat(`am`.`TimingRule`,' treatments every ',`am`.`TimingRuleNoFrequencies`,' months') when (`am`.`TimingRuleFrequency` = 3) then concat(`am`.`TimingRule`,' treatments every ',`am`.`TimingRuleNoFrequencies`,' years') end) AS `NamedFrequency`,(case when (`am`.`TimingRule` = 0) then '1 treatment' when (`am`.`TreatmentRule` = 1) then 'Unspecified' else concat((`am`.`TimingRule` * `am`.`TotalNumberOfTreatments`),' treatments') end) AS `NamedNumberOfTreatments`,(case when (`am`.`Status` = 0) then 'Active' when (`am`.`Status` = 1) then 'Held' when (`am`.`Status` = 2) then 'Completed' end) AS `NamedStatus` from (((((((`animal` `a` left join `adoption` `ad` on((`ad`.`ID` = `a`.`ActiveMovementID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `media` `ma` on(((`ma`.`LinkID` = `a`.`ID`) and (`ma`.`LinkTypeID` = 0) and (`ma`.`WebsitePhoto` = 1)))) join `animalmedical` `am` on((`a`.`ID` = `am`.`AnimalID`))) join `animalmedicaltreatment` `amt` on((`amt`.`AnimalMedicalID` = `am`.`ID`))) left join `owner` `adv` on((`adv`.`ID` = `amt`.`AdministeringVetID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`)));

-- Dumping structure for view asm.v_animaltest
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_animaltest`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_animaltest` AS select `at`.`ID` AS `ID`,`at`.`AnimalID` AS `AnimalID`,`at`.`TestTypeID` AS `TestTypeID`,`at`.`TestResultID` AS `TestResultID`,`at`.`AdministeringVetID` AS `AdministeringVetID`,`at`.`DateOfTest` AS `DateOfTest`,`at`.`DateRequired` AS `DateRequired`,`at`.`Cost` AS `Cost`,`at`.`CostPaidDate` AS `CostPaidDate`,`at`.`Comments` AS `Comments`,`at`.`RecordVersion` AS `RecordVersion`,`at`.`CreatedBy` AS `CreatedBy`,`at`.`CreatedDate` AS `CreatedDate`,`at`.`LastChangedBy` AS `LastChangedBy`,`at`.`LastChangedDate` AS `LastChangedDate`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`Archived` AS `Archived`,`a`.`ActiveMovementID` AS `ActiveMovementID`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`AcceptanceNumber` AS `AcceptanceNumber`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`ShelterLocation` AS `ShelterLocation`,`a`.`Neutered` AS `Neutered`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,(select `species`.`SpeciesName` from `species` where (`species`.`ID` = `a`.`SpeciesID`)) AS `SpeciesName`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 8)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 8)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` = 0)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,`co`.`ID` AS `CurrentOwnerID`,`co`.`OwnerName` AS `CurrentOwnerName`,`a`.`AnimalName` AS `AnimalName`,`ma`.`MediaName` AS `WebsiteMediaName`,`tt`.`TestName` AS `TestName`,`tt`.`TestDescription` AS `TestDescription`,`tr`.`ResultName` AS `ResultName`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then (select `mt`.`MovementType` from `lksmovementtype` `mt` where (`mt`.`ID` = `a`.`ActiveMovementType`)) else `il`.`LocationName` end) AS `LocationName`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then '' else `a`.`ShelterLocationUnit` end) AS `LocationUnit`,`il`.`LocationName` AS `ShelterLocationName`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`adv`.`OwnerName` AS `AdministeringVetName`,`adv`.`OwnerAddress` AS `AdministeringVetAddress`,`adv`.`OwnerTown` AS `AdministeringVetTown`,`adv`.`OwnerCounty` AS `AdministeringVetCounty`,`adv`.`OwnerPostcode` AS `AdministeringVetPostcode`,`adv`.`EmailAddress` AS `AdministeringVetEmail`,`adv`.`MembershipNumber` AS `AdministeringVetLicence` from ((((((((`animal` `a` left join `adoption` `ad` on((`ad`.`ID` = `a`.`ActiveMovementID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `media` `ma` on(((`ma`.`LinkID` = `a`.`ID`) and (`ma`.`LinkTypeID` = 0) and (`ma`.`WebsitePhoto` = 1)))) join `animaltest` `at` on((`a`.`ID` = `at`.`AnimalID`))) join `testtype` `tt` on((`tt`.`ID` = `at`.`TestTypeID`))) left join `testresult` `tr` on((`tr`.`ID` = `at`.`TestResultID`))) left join `owner` `adv` on((`adv`.`ID` = `at`.`AdministeringVetID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`)));

-- Dumping structure for view asm.v_animalvaccination
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_animalvaccination`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_animalvaccination` AS select `av`.`ID` AS `ID`,`av`.`AnimalID` AS `AnimalID`,`av`.`VaccinationID` AS `VaccinationID`,`av`.`AdministeringVetID` AS `AdministeringVetID`,`av`.`DateOfVaccination` AS `DateOfVaccination`,`av`.`GivenBy` AS `GivenBy`,`av`.`DateRequired` AS `DateRequired`,`av`.`DateExpires` AS `DateExpires`,`av`.`BatchNumber` AS `BatchNumber`,`av`.`Manufacturer` AS `Manufacturer`,`av`.`Cost` AS `Cost`,`av`.`CostPaidDate` AS `CostPaidDate`,`av`.`Comments` AS `Comments`,`av`.`RecordVersion` AS `RecordVersion`,`av`.`CreatedBy` AS `CreatedBy`,`av`.`CreatedDate` AS `CreatedDate`,`av`.`LastChangedBy` AS `LastChangedBy`,`av`.`LastChangedDate` AS `LastChangedDate`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`Archived` AS `Archived`,`a`.`ActiveMovementID` AS `ActiveMovementID`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`AcceptanceNumber` AS `AcceptanceNumber`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`ShelterLocation` AS `ShelterLocation`,`a`.`Neutered` AS `Neutered`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,(select `species`.`SpeciesName` from `species` where (`species`.`ID` = `a`.`SpeciesID`)) AS `SpeciesName`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 8)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 8)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` = 0)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,`co`.`ID` AS `CurrentOwnerID`,`co`.`OwnerName` AS `CurrentOwnerName`,`a`.`AnimalName` AS `AnimalName`,`ma`.`MediaName` AS `WebsiteMediaName`,`vt`.`VaccinationType` AS `VaccinationType`,`vt`.`VaccinationDescription` AS `VaccinationDescription`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then (select `mt`.`MovementType` from `lksmovementtype` `mt` where (`mt`.`ID` = `a`.`ActiveMovementType`)) else `il`.`LocationName` end) AS `LocationName`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then '' else `a`.`ShelterLocationUnit` end) AS `LocationUnit`,`il`.`LocationName` AS `ShelterLocationName`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`adv`.`OwnerName` AS `AdministeringVetName`,`adv`.`OwnerAddress` AS `AdministeringVetAddress`,`adv`.`OwnerTown` AS `AdministeringVetTown`,`adv`.`OwnerCounty` AS `AdministeringVetCounty`,`adv`.`OwnerPostcode` AS `AdministeringVetPostcode`,`adv`.`EmailAddress` AS `AdministeringVetEmail`,`adv`.`MembershipNumber` AS `AdministeringVetLicence` from (((((((`animal` `a` left join `adoption` `ad` on((`ad`.`ID` = `a`.`ActiveMovementID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `media` `ma` on(((`ma`.`LinkID` = `a`.`ID`) and (`ma`.`LinkTypeID` = 0) and (`ma`.`WebsitePhoto` = 1)))) join `animalvaccination` `av` on((`a`.`ID` = `av`.`AnimalID`))) left join `owner` `adv` on((`adv`.`ID` = `av`.`AdministeringVetID`))) left join `vaccinationtype` `vt` on((`vt`.`ID` = `av`.`VaccinationID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`)));

-- Dumping structure for view asm.v_animalwaitinglist
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_animalwaitinglist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_animalwaitinglist` AS select `a`.`ID` AS `ID`,`a`.`SpeciesID` AS `SpeciesID`,`a`.`Size` AS `Size`,`a`.`DatePutOnList` AS `DatePutOnList`,`a`.`OwnerID` AS `OwnerID`,`a`.`AnimalDescription` AS `AnimalDescription`,`a`.`ReasonForWantingToPart` AS `ReasonForWantingToPart`,`a`.`CanAffordDonation` AS `CanAffordDonation`,`a`.`Urgency` AS `Urgency`,`a`.`DateRemovedFromList` AS `DateRemovedFromList`,`a`.`AutoRemovePolicy` AS `AutoRemovePolicy`,`a`.`DateOfLastOwnerContact` AS `DateOfLastOwnerContact`,`a`.`ReasonForRemoval` AS `ReasonForRemoval`,`a`.`Comments` AS `Comments`,`a`.`UrgencyUpdateDate` AS `UrgencyUpdateDate`,`a`.`UrgencyLastUpdatedDate` AS `UrgencyLastUpdatedDate`,`a`.`RecordVersion` AS `RecordVersion`,`a`.`CreatedBy` AS `CreatedBy`,`a`.`CreatedDate` AS `CreatedDate`,`a`.`LastChangedBy` AS `LastChangedBy`,`a`.`LastChangedDate` AS `LastChangedDate`,`a`.`ID` AS `WLID`,`s`.`SpeciesName` AS `SpeciesName`,`sz`.`Size` AS `SizeName`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForeNames`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`o`.`EmailAddress` AS `EmailAddress`,`u`.`Urgency` AS `UrgencyName`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `DocMediaName`,`web`.`Date` AS `DocMediaDate`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes` from (((((`animalwaitinglist` `a` left join `lksize` `sz` on((`sz`.`ID` = `a`.`Size`))) left join `media` `web` on(((`web`.`LinkID` = `a`.`ID`) and (`web`.`LinkTypeID` = 5) and (`web`.`WebsitePhoto` = 1)))) join `species` `s` on((`s`.`ID` = `a`.`SpeciesID`))) join `owner` `o` on((`o`.`ID` = `a`.`OwnerID`))) join `lkurgency` `u` on((`u`.`ID` = `a`.`Urgency`)));

-- Dumping structure for view asm.v_owner
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_owner`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_owner` AS select `o`.`ID` AS `ID`,`o`.`OwnerType` AS `OwnerType`,`o`.`OwnerCode` AS `OwnerCode`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerForeNames` AS `OwnerForeNames`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerName` AS `OwnerName`,`o`.`IsDeceased` AS `IsDeceased`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`LatLong` AS `LatLong`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`o`.`EmailAddress` AS `EmailAddress`,`o`.`ExcludeFromBulkEmail` AS `ExcludeFromBulkEmail`,`o`.`GDPRContactOptIn` AS `GDPRContactOptIn`,`o`.`JurisdictionID` AS `JurisdictionID`,`o`.`IDCheck` AS `IDCheck`,`o`.`Comments` AS `Comments`,`o`.`SiteID` AS `SiteID`,`o`.`IsBanned` AS `IsBanned`,`o`.`IsVolunteer` AS `IsVolunteer`,`o`.`IsHomeChecker` AS `IsHomeChecker`,`o`.`IsMember` AS `IsMember`,`o`.`MembershipExpiryDate` AS `MembershipExpiryDate`,`o`.`MembershipNumber` AS `MembershipNumber`,`o`.`IsAdoptionCoordinator` AS `IsAdoptionCoordinator`,`o`.`IsDonor` AS `IsDonor`,`o`.`IsDriver` AS `IsDriver`,`o`.`IsShelter` AS `IsShelter`,`o`.`IsACO` AS `IsACO`,`o`.`IsStaff` AS `IsStaff`,`o`.`IsFosterer` AS `IsFosterer`,`o`.`FosterCapacity` AS `FosterCapacity`,`o`.`IsRetailer` AS `IsRetailer`,`o`.`IsVet` AS `IsVet`,`o`.`IsGiftAid` AS `IsGiftAid`,`o`.`AdditionalFlags` AS `AdditionalFlags`,`o`.`HomeCheckAreas` AS `HomeCheckAreas`,`o`.`DateLastHomeChecked` AS `DateLastHomeChecked`,`o`.`HomeCheckedBy` AS `HomeCheckedBy`,`o`.`MatchAdded` AS `MatchAdded`,`o`.`MatchExpires` AS `MatchExpires`,`o`.`MatchActive` AS `MatchActive`,`o`.`MatchSex` AS `MatchSex`,`o`.`MatchSize` AS `MatchSize`,`o`.`MatchColour` AS `MatchColour`,`o`.`MatchAgeFrom` AS `MatchAgeFrom`,`o`.`MatchAgeTo` AS `MatchAgeTo`,`o`.`MatchAnimalType` AS `MatchAnimalType`,`o`.`MatchSpecies` AS `MatchSpecies`,`o`.`MatchBreed` AS `MatchBreed`,`o`.`MatchBreed2` AS `MatchBreed2`,`o`.`MatchGoodWithCats` AS `MatchGoodWithCats`,`o`.`MatchGoodWithDogs` AS `MatchGoodWithDogs`,`o`.`MatchGoodWithChildren` AS `MatchGoodWithChildren`,`o`.`MatchHouseTrained` AS `MatchHouseTrained`,`o`.`MatchCommentsContain` AS `MatchCommentsContain`,`o`.`RecordVersion` AS `RecordVersion`,`o`.`CreatedBy` AS `CreatedBy`,`o`.`CreatedDate` AS `CreatedDate`,`o`.`LastChangedBy` AS `LastChangedBy`,`o`.`LastChangedDate` AS `LastChangedDate`,`o`.`ID` AS `PersonID`,`ho`.`OwnerName` AS `HomeCheckedByName`,`ho`.`HomeTelephone` AS `HomeCheckedByHomeTelephone`,`ho`.`MobileTelephone` AS `HomeCheckedByMobileTelephone`,`ho`.`EmailAddress` AS `HomeCheckedByEmail`,`j`.`JurisdictionName` AS `JurisdictionName`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes`,`doc`.`MediaName` AS `DocMediaName`,`doc`.`Date` AS `DocMediaDate` from ((((`owner` `o` left join `owner` `ho` on((`ho`.`ID` = `o`.`HomeCheckedBy`))) left join `media` `web` on(((`web`.`LinkID` = `o`.`ID`) and (`web`.`LinkTypeID` = 3) and (`web`.`WebsitePhoto` = 1)))) left join `media` `doc` on(((`doc`.`LinkID` = `o`.`ID`) and (`doc`.`LinkTypeID` = 3) and (`doc`.`DocPhoto` = 1)))) left join `jurisdiction` `j` on((`j`.`ID` = `o`.`JurisdictionID`)));

-- Dumping structure for view asm.v_ownercitation
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_ownercitation`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ownercitation` AS select `oc`.`ID` AS `ID`,`oc`.`CitationTypeID` AS `CitationTypeID`,`oc`.`CitationDate` AS `CitationDate`,`oc`.`Comments` AS `Comments`,`ct`.`CitationName` AS `CitationName`,`oc`.`FineAmount` AS `FineAmount`,`oc`.`FineDueDate` AS `FineDueDate`,`oc`.`FinePaidDate` AS `FinePaidDate`,`oc`.`AnimalControlID` AS `AnimalControlID`,`oc`.`OwnerID` AS `OwnerID`,`ti`.`IncidentName` AS `IncidentName`,`oc`.`CreatedBy` AS `CreatedBy`,`oc`.`CreatedDate` AS `CreatedDate`,`oc`.`LastChangedBy` AS `LastChangedBy`,`oc`.`LastChangedDate` AS `LastChangedDate`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName` from ((((`ownercitation` `oc` join `citationtype` `ct` on((`ct`.`ID` = `oc`.`CitationTypeID`))) join `owner` `o` on((`o`.`ID` = `oc`.`OwnerID`))) left join `animalcontrol` `ac` on((`ac`.`ID` = `oc`.`AnimalControlID`))) left join `incidenttype` `ti` on((`ti`.`ID` = `ac`.`IncidentTypeID`)));

-- Dumping structure for view asm.v_ownerdonation
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_ownerdonation`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ownerdonation` AS select `od`.`ID` AS `ID`,`od`.`DonationTypeID` AS `DonationTypeID`,`od`.`DonationPaymentID` AS `DonationPaymentID`,`dt`.`DonationName` AS `DonationName`,`od`.`Date` AS `Date`,`od`.`DateDue` AS `DateDue`,`od`.`Donation` AS `Donation`,`p`.`PaymentName` AS `PaymentName`,`od`.`IsGiftAid` AS `IsGiftAid`,`lk`.`Name` AS `IsGiftAidName`,`od`.`Frequency` AS `Frequency`,`od`.`Quantity` AS `Quantity`,`od`.`UnitPrice` AS `UnitPrice`,`fr`.`Frequency` AS `FrequencyName`,`od`.`NextCreated` AS `NextCreated`,`od`.`ReceiptNumber` AS `ReceiptNumber`,`od`.`ChequeNumber` AS `ChequeNumber`,`od`.`IsVAT` AS `IsVAT`,`od`.`VATRate` AS `VATRate`,`od`.`VATAmount` AS `VATAmount`,`od`.`CreatedBy` AS `CreatedBy`,`od`.`CreatedDate` AS `CreatedDate`,`od`.`LastChangedBy` AS `LastChangedBy`,`od`.`LastChangedDate` AS `LastChangedDate`,`od`.`Comments` AS `Comments`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName`,`a`.`AnimalName` AS `AnimalName`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`ID` AS `AnimalID`,`o`.`ID` AS `OwnerID`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`Neutered` AS `Neutered`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 8)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 8)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` = 0)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,(select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) AS `ShelterLocationName`,`co`.`OwnerName` AS `CurrentOwnerName`,`od`.`MovementID` AS `MovementID`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`o`.`EmailAddress` AS `EmailAddress`,`o`.`AdditionalFlags` AS `AdditionalFlags` from ((((((((`ownerdonation` `od` left join `animal` `a` on((`a`.`ID` = `od`.`AnimalID`))) left join `adoption` `ad` on((`ad`.`ID` = `a`.`ActiveMovementID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `donationpayment` `p` on((`od`.`DonationPaymentID` = `p`.`ID`))) left join `lksyesno` `lk` on((`lk`.`ID` = `od`.`IsGiftAid`))) join `owner` `o` on((`o`.`ID` = `od`.`OwnerID`))) join `donationtype` `dt` on((`dt`.`ID` = `od`.`DonationTypeID`))) join `lksdonationfreq` `fr` on((`fr`.`ID` = `od`.`Frequency`)));

-- Dumping structure for view asm.v_ownerlicence
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_ownerlicence`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ownerlicence` AS select `ol`.`ID` AS `ID`,`ol`.`LicenceTypeID` AS `LicenceTypeID`,`ol`.`IssueDate` AS `IssueDate`,`ol`.`ExpiryDate` AS `ExpiryDate`,`lt`.`LicenceTypeName` AS `LicenceTypeName`,`ol`.`LicenceNumber` AS `LicenceNumber`,`ol`.`LicenceFee` AS `LicenceFee`,`ol`.`Comments` AS `Comments`,`ol`.`OwnerID` AS `OwnerID`,`ol`.`AnimalID` AS `AnimalID`,`ol`.`CreatedBy` AS `CreatedBy`,`ol`.`CreatedDate` AS `CreatedDate`,`ol`.`LastChangedBy` AS `LastChangedBy`,`ol`.`LastChangedDate` AS `LastChangedDate`,`a`.`AnimalName` AS `AnimalName`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone` from (((`ownerlicence` `ol` join `licencetype` `lt` on((`lt`.`ID` = `ol`.`LicenceTypeID`))) join `owner` `o` on((`o`.`ID` = `ol`.`OwnerID`))) left join `animal` `a` on((`a`.`ID` = `ol`.`AnimalID`)));

-- Dumping structure for view asm.v_ownertraploan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_ownertraploan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ownertraploan` AS select `ot`.`ID` AS `ID`,`ot`.`TrapTypeID` AS `TrapTypeID`,`ot`.`LoanDate` AS `LoanDate`,`tt`.`TrapTypeName` AS `TrapTypeName`,`ot`.`TrapNumber` AS `TrapNumber`,`ot`.`DepositAmount` AS `DepositAmount`,`ot`.`DepositReturnDate` AS `DepositReturnDate`,`ot`.`ReturnDueDate` AS `ReturnDueDate`,`ot`.`ReturnDate` AS `ReturnDate`,`ot`.`OwnerID` AS `OwnerID`,`ot`.`Comments` AS `Comments`,`ot`.`CreatedBy` AS `CreatedBy`,`ot`.`CreatedDate` AS `CreatedDate`,`ot`.`LastChangedBy` AS `LastChangedBy`,`ot`.`LastChangedDate` AS `LastChangedDate`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName` from ((`ownertraploan` `ot` join `traptype` `tt` on((`tt`.`ID` = `ot`.`TrapTypeID`))) join `owner` `o` on((`o`.`ID` = `ot`.`OwnerID`)));

-- Dumping structure for view asm.v_ownervoucher
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_ownervoucher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ownervoucher` AS select `ov`.`ID` AS `ID`,`ov`.`OwnerID` AS `OwnerID`,`ov`.`VoucherID` AS `VoucherID`,`ov`.`DateIssued` AS `DateIssued`,`ov`.`DateExpired` AS `DateExpired`,`ov`.`Value` AS `Value`,`ov`.`Comments` AS `Comments`,`ov`.`RecordVersion` AS `RecordVersion`,`ov`.`CreatedBy` AS `CreatedBy`,`ov`.`CreatedDate` AS `CreatedDate`,`ov`.`LastChangedBy` AS `LastChangedBy`,`ov`.`LastChangedDate` AS `LastChangedDate`,`v`.`VoucherName` AS `VoucherName`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`o`.`EmailAddress` AS `EmailAddress`,`o`.`AdditionalFlags` AS `AdditionalFlags` from ((`ownervoucher` `ov` join `voucher` `v` on((`v`.`ID` = `ov`.`VoucherID`))) join `owner` `o` on((`o`.`ID` = `ov`.`OwnerID`)));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
