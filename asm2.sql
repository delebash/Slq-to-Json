
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accountsrole`
--

DROP TABLE IF EXISTS `accountsrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accountsrole` (
  `AccountID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `CanView` int(11) NOT NULL,
  `CanEdit` int(11) NOT NULL,
  KEY `accountsrole_AccountIDRoleID` (`AccountID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accountstrx`
--

DROP TABLE IF EXISTS `accountstrx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accountstrx` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `additional`
--

DROP TABLE IF EXISTS `additional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `additional` (
  `LinkType` int(11) NOT NULL,
  `LinkID` int(11) NOT NULL,
  `AdditionalFieldID` int(11) NOT NULL,
  `Value` longtext,
  UNIQUE KEY `additional_LinkTypeIDAdd` (`LinkType`,`LinkID`,`AdditionalFieldID`),
  KEY `additional_LinkTypeID` (`LinkType`,`LinkID`),
  KEY `additional_LinkID` (`LinkID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `additionalfield`
--

DROP TABLE IF EXISTS `additionalfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `additionalfield` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adoption`
--

DROP TABLE IF EXISTS `adoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adoption` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animal` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalcontrol`
--

DROP TABLE IF EXISTS `animalcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalcontrol` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalcontrolanimal`
--

DROP TABLE IF EXISTS `animalcontrolanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalcontrolanimal` (
  `AnimalControlID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  UNIQUE KEY `animalcontrolanimal_AnimalControlIDAnimalID` (`AnimalControlID`,`AnimalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalcontrolrole`
--

DROP TABLE IF EXISTS `animalcontrolrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalcontrolrole` (
  `AnimalControlID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `CanView` int(11) NOT NULL,
  `CanEdit` int(11) NOT NULL,
  KEY `animalcontrolrole_AnimalControlIDRoleID` (`AnimalControlID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalcost`
--

DROP TABLE IF EXISTS `animalcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalcost` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animaldiet`
--

DROP TABLE IF EXISTS `animaldiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animaldiet` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalfigures`
--

DROP TABLE IF EXISTS `animalfigures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalfigures` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalfiguresannual`
--

DROP TABLE IF EXISTS `animalfiguresannual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalfiguresannual` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalfound`
--

DROP TABLE IF EXISTS `animalfound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalfound` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animallitter`
--

DROP TABLE IF EXISTS `animallitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animallitter` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animallost`
--

DROP TABLE IF EXISTS `animallost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animallost` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animallostfoundmatch`
--

DROP TABLE IF EXISTS `animallostfoundmatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animallostfoundmatch` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalmedical`
--

DROP TABLE IF EXISTS `animalmedical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalmedical` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalmedicaltreatment`
--

DROP TABLE IF EXISTS `animalmedicaltreatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalmedicaltreatment` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalname`
--

DROP TABLE IF EXISTS `animalname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalname` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Sex` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalpublished`
--

DROP TABLE IF EXISTS `animalpublished`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalpublished` (
  `AnimalID` int(11) NOT NULL,
  `PublishedTo` varchar(255) NOT NULL,
  `SentDate` datetime NOT NULL,
  `Extra` varchar(255) DEFAULT NULL,
  UNIQUE KEY `animalpublished_AnimalIDPublishedTo` (`AnimalID`,`PublishedTo`),
  KEY `animalpublished_SentDate` (`SentDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animaltest`
--

DROP TABLE IF EXISTS `animaltest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animaltest` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animaltransport`
--

DROP TABLE IF EXISTS `animaltransport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animaltransport` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animaltype`
--

DROP TABLE IF EXISTS `animaltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animaltype` (
  `ID` int(11) NOT NULL,
  `AnimalType` varchar(255) NOT NULL,
  `AnimalDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalvaccination`
--

DROP TABLE IF EXISTS `animalvaccination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalvaccination` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `animalwaitinglist`
--

DROP TABLE IF EXISTS `animalwaitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `animalwaitinglist` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audittrail`
--

DROP TABLE IF EXISTS `audittrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `audittrail` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `basecolour`
--

DROP TABLE IF EXISTS `basecolour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `basecolour` (
  `ID` int(11) NOT NULL,
  `BaseColour` varchar(255) NOT NULL,
  `BaseColourDescription` varchar(255) DEFAULT NULL,
  `AdoptAPetColour` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `breed` (
  `ID` int(11) NOT NULL,
  `BreedName` varchar(255) NOT NULL,
  `BreedDescription` varchar(255) DEFAULT NULL,
  `PetFinderBreed` varchar(255) DEFAULT NULL,
  `SpeciesID` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citationtype`
--

DROP TABLE IF EXISTS `citationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `citationtype` (
  `ID` int(11) NOT NULL,
  `CitationName` varchar(255) NOT NULL,
  `CitationDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinicappointment`
--

DROP TABLE IF EXISTS `clinicappointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clinicappointment` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinicinvoiceitem`
--

DROP TABLE IF EXISTS `clinicinvoiceitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clinicinvoiceitem` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `configuration` (
  `ItemName` varchar(255) NOT NULL,
  `ItemValue` longtext NOT NULL,
  KEY `configuration_ItemName` (`ItemName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `costtype`
--

DROP TABLE IF EXISTS `costtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `costtype` (
  `ID` int(11) NOT NULL,
  `CostTypeName` varchar(255) NOT NULL,
  `CostTypeDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customreport`
--

DROP TABLE IF EXISTS `customreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customreport` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customreportrole`
--

DROP TABLE IF EXISTS `customreportrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customreportrole` (
  `ReportID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `CanView` int(11) NOT NULL,
  KEY `customreportrole_ReportIDRoleID` (`ReportID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbfs`
--

DROP TABLE IF EXISTS `dbfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dbfs` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deathreason`
--

DROP TABLE IF EXISTS `deathreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `deathreason` (
  `ID` int(11) NOT NULL,
  `ReasonName` varchar(255) NOT NULL,
  `ReasonDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deletion`
--

DROP TABLE IF EXISTS `deletion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `deletion` (
  `ID` int(11) NOT NULL,
  `TableName` varchar(255) NOT NULL,
  `DeletedBy` varchar(255) NOT NULL,
  `Date` datetime NOT NULL,
  `IDList` varchar(255) NOT NULL,
  `RestoreSQL` longtext,
  KEY `deletion_IDTablename` (`ID`,`TableName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diary`
--

DROP TABLE IF EXISTS `diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diary` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diarytaskdetail`
--

DROP TABLE IF EXISTS `diarytaskdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diarytaskdetail` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diarytaskhead`
--

DROP TABLE IF EXISTS `diarytaskhead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diarytaskhead` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `RecordType` int(11) NOT NULL,
  `RecordVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diet`
--

DROP TABLE IF EXISTS `diet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diet` (
  `ID` int(11) NOT NULL,
  `DietName` varchar(255) NOT NULL,
  `DietDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donationpayment`
--

DROP TABLE IF EXISTS `donationpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `donationpayment` (
  `ID` int(11) NOT NULL,
  `PaymentName` varchar(255) NOT NULL,
  `PaymentDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donationtype`
--

DROP TABLE IF EXISTS `donationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `donationtype` (
  `ID` int(11) NOT NULL,
  `DonationName` varchar(255) NOT NULL,
  `DonationDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entryreason`
--

DROP TABLE IF EXISTS `entryreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `entryreason` (
  `ID` int(11) NOT NULL,
  `ReasonName` varchar(255) NOT NULL,
  `ReasonDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incidentcompleted`
--

DROP TABLE IF EXISTS `incidentcompleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `incidentcompleted` (
  `ID` int(11) NOT NULL,
  `CompletedName` varchar(255) NOT NULL,
  `CompletedDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incidenttype`
--

DROP TABLE IF EXISTS `incidenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `incidenttype` (
  `ID` int(11) NOT NULL,
  `IncidentName` varchar(255) NOT NULL,
  `IncidentDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internallocation`
--

DROP TABLE IF EXISTS `internallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `internallocation` (
  `ID` int(11) NOT NULL,
  `LocationName` varchar(255) NOT NULL,
  `LocationDescription` varchar(255) DEFAULT NULL,
  `Units` longtext,
  `SiteID` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jurisdiction`
--

DROP TABLE IF EXISTS `jurisdiction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jurisdiction` (
  `ID` int(11) NOT NULL,
  `JurisdictionName` varchar(255) NOT NULL,
  `JurisdictionDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `licencetype`
--

DROP TABLE IF EXISTS `licencetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `licencetype` (
  `ID` int(11) NOT NULL,
  `LicenceTypeName` varchar(255) NOT NULL,
  `LicenceTypeDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lkanimalflags`
--

DROP TABLE IF EXISTS `lkanimalflags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lkanimalflags` (
  `ID` int(11) NOT NULL,
  `Flag` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lkcoattype`
--

DROP TABLE IF EXISTS `lkcoattype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lkcoattype` (
  `ID` int(11) NOT NULL,
  `CoatType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lkownerflags`
--

DROP TABLE IF EXISTS `lkownerflags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lkownerflags` (
  `ID` int(11) NOT NULL,
  `Flag` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksaccounttype`
--

DROP TABLE IF EXISTS `lksaccounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksaccounttype` (
  `ID` int(11) NOT NULL,
  `AccountType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksclinicstatus`
--

DROP TABLE IF EXISTS `lksclinicstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksclinicstatus` (
  `ID` int(11) NOT NULL,
  `Status` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksdiarylink`
--

DROP TABLE IF EXISTS `lksdiarylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksdiarylink` (
  `ID` int(11) NOT NULL,
  `LinkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksdonationfreq`
--

DROP TABLE IF EXISTS `lksdonationfreq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksdonationfreq` (
  `ID` int(11) NOT NULL,
  `Frequency` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksex`
--

DROP TABLE IF EXISTS `lksex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksex` (
  `ID` int(11) NOT NULL,
  `Sex` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksfieldlink`
--

DROP TABLE IF EXISTS `lksfieldlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksfieldlink` (
  `ID` int(11) NOT NULL,
  `LinkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksfieldtype`
--

DROP TABLE IF EXISTS `lksfieldtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksfieldtype` (
  `ID` int(11) NOT NULL,
  `FieldType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksize`
--

DROP TABLE IF EXISTS `lksize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksize` (
  `ID` int(11) NOT NULL,
  `Size` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksloglink`
--

DROP TABLE IF EXISTS `lksloglink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksloglink` (
  `ID` int(11) NOT NULL,
  `LinkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksmedialink`
--

DROP TABLE IF EXISTS `lksmedialink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksmedialink` (
  `ID` int(11) NOT NULL,
  `LinkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksmediatype`
--

DROP TABLE IF EXISTS `lksmediatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksmediatype` (
  `ID` int(11) NOT NULL,
  `MediaType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksmovementtype`
--

DROP TABLE IF EXISTS `lksmovementtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksmovementtype` (
  `ID` int(11) NOT NULL,
  `MovementType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksposneg`
--

DROP TABLE IF EXISTS `lksposneg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksposneg` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksrotatype`
--

DROP TABLE IF EXISTS `lksrotatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksrotatype` (
  `ID` int(11) NOT NULL,
  `RotaType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksyesno`
--

DROP TABLE IF EXISTS `lksyesno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksyesno` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lksynun`
--

DROP TABLE IF EXISTS `lksynun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lksynun` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lkurgency`
--

DROP TABLE IF EXISTS `lkurgency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lkurgency` (
  `ID` int(11) NOT NULL,
  `Urgency` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lkworktype`
--

DROP TABLE IF EXISTS `lkworktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lkworktype` (
  `ID` int(11) NOT NULL,
  `WorkType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logtype`
--

DROP TABLE IF EXISTS `logtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logtype` (
  `ID` int(11) NOT NULL,
  `LogTypeName` varchar(255) NOT NULL,
  `LogTypeDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `media` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicalprofile`
--

DROP TABLE IF EXISTS `medicalprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medicalprofile` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `onlineform`
--

DROP TABLE IF EXISTS `onlineform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `onlineform` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `onlineformfield`
--

DROP TABLE IF EXISTS `onlineformfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `onlineformfield` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `onlineformincoming`
--

DROP TABLE IF EXISTS `onlineformincoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `onlineformincoming` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `owner` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownercitation`
--

DROP TABLE IF EXISTS `ownercitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ownercitation` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownerdonation`
--

DROP TABLE IF EXISTS `ownerdonation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ownerdonation` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownerinvestigation`
--

DROP TABLE IF EXISTS `ownerinvestigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ownerinvestigation` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownerlicence`
--

DROP TABLE IF EXISTS `ownerlicence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ownerlicence` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownerlookingfor`
--

DROP TABLE IF EXISTS `ownerlookingfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ownerlookingfor` (
  `OwnerID` int(11) NOT NULL,
  `AnimalID` int(11) NOT NULL,
  `MatchSummary` longtext,
  KEY `ownerlookingfor_OwnerID` (`OwnerID`),
  KEY `ownerlookingfor_AnimalID` (`AnimalID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownerrota`
--

DROP TABLE IF EXISTS `ownerrota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ownerrota` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownertraploan`
--

DROP TABLE IF EXISTS `ownertraploan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ownertraploan` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ownervoucher`
--

DROP TABLE IF EXISTS `ownervoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ownervoucher` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pickuplocation`
--

DROP TABLE IF EXISTS `pickuplocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pickuplocation` (
  `ID` int(11) NOT NULL,
  `LocationName` varchar(255) NOT NULL,
  `LocationDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `primarykey`
--

DROP TABLE IF EXISTS `primarykey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `primarykey` (
  `TableName` varchar(255) NOT NULL,
  `NextID` int(11) NOT NULL,
  KEY `primarykey_TableName` (`TableName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publishlog`
--

DROP TABLE IF EXISTS `publishlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `publishlog` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservationstatus`
--

DROP TABLE IF EXISTS `reservationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservationstatus` (
  `ID` int(11) NOT NULL,
  `StatusName` varchar(255) NOT NULL,
  `StatusDescription` longtext,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL,
  `Rolename` varchar(255) NOT NULL,
  `SecurityMap` longtext,
  PRIMARY KEY (`ID`),
  KEY `role_Rolename` (`Rolename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `site` (
  `ID` int(11) NOT NULL,
  `SiteName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `species` (
  `ID` int(11) NOT NULL,
  `SpeciesName` varchar(255) NOT NULL,
  `SpeciesDescription` varchar(255) DEFAULT NULL,
  `PetFinderSpecies` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stocklevel`
--

DROP TABLE IF EXISTS `stocklevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stocklevel` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stocklocation`
--

DROP TABLE IF EXISTS `stocklocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stocklocation` (
  `ID` int(11) NOT NULL,
  `LocationName` varchar(255) NOT NULL,
  `LocationDescription` longtext,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `stocklocation_LocationName` (`LocationName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockusage`
--

DROP TABLE IF EXISTS `stockusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockusage` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockusagetype`
--

DROP TABLE IF EXISTS `stockusagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockusagetype` (
  `ID` int(11) NOT NULL,
  `UsageTypeName` varchar(255) NOT NULL,
  `UsageTypeDescription` longtext,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `stockusagetype_UsageTypeName` (`UsageTypeName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatedocument`
--

DROP TABLE IF EXISTS `templatedocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `templatedocument` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Path` varchar(255) NOT NULL,
  `Content` longtext,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `templatedocument_NamePath` (`Name`,`Path`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatehtml`
--

DROP TABLE IF EXISTS `templatehtml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `templatehtml` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Header` longtext,
  `Body` longtext,
  `Footer` longtext,
  `IsBuiltIn` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `templatehtml_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testresult`
--

DROP TABLE IF EXISTS `testresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `testresult` (
  `ID` int(11) NOT NULL,
  `ResultName` varchar(255) NOT NULL,
  `ResultDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testtype`
--

DROP TABLE IF EXISTS `testtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `testtype` (
  `ID` int(11) NOT NULL,
  `TestName` varchar(255) NOT NULL,
  `TestDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transporttype`
--

DROP TABLE IF EXISTS `transporttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transporttype` (
  `ID` int(11) NOT NULL,
  `TransportTypeName` varchar(255) NOT NULL,
  `TransportTypeDescription` varchar(255) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `traptype`
--

DROP TABLE IF EXISTS `traptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `traptype` (
  `ID` int(11) NOT NULL,
  `TrapTypeName` varchar(255) NOT NULL,
  `TrapTypeDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userrole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  UNIQUE KEY `userrole_UserIDRoleID` (`UserID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_adoption`
--

DROP TABLE IF EXISTS `v_adoption`;
/*!50001 DROP VIEW IF EXISTS `v_adoption`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_adoption` AS SELECT
 1 AS `ID`,
 1 AS `AdoptionNumber`,
 1 AS `AnimalID`,
 1 AS `OwnerID`,
 1 AS `RetailerID`,
 1 AS `OriginalRetailerMovementID`,
 1 AS `MovementDate`,
 1 AS `MovementType`,
 1 AS `ReturnDate`,
 1 AS `ReturnedReasonID`,
 1 AS `InsuranceNumber`,
 1 AS `ReasonForReturn`,
 1 AS `ReturnedByOwnerID`,
 1 AS `ReservationDate`,
 1 AS `ReservationCancelledDate`,
 1 AS `ReservationStatusID`,
 1 AS `Donation`,
 1 AS `IsTrial`,
 1 AS `IsPermanentFoster`,
 1 AS `TrialEndDate`,
 1 AS `Comments`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerSurname`,
 1 AS `OwnerForenames`,
 1 AS `OwnerName`,
 1 AS `OwnerAddress`,
 1 AS `OwnerTown`,
 1 AS `OwnerCounty`,
 1 AS `OwnerPostcode`,
 1 AS `HomeTelephone`,
 1 AS `WorkTelephone`,
 1 AS `MobileTelephone`,
 1 AS `ReservationStatusName`,
 1 AS `ShelterCode`,
 1 AS `ShortCode`,
 1 AS `AnimalAge`,
 1 AS `AgeGroup`,
 1 AS `AnimalName`,
 1 AS `BreedName`,
 1 AS `Neutered`,
 1 AS `DeceasedDate`,
 1 AS `HasActiveReserve`,
 1 AS `HasTrialAdoption`,
 1 AS `IsHold`,
 1 AS `IsQuarantine`,
 1 AS `HoldUntilDate`,
 1 AS `CrueltyCase`,
 1 AS `NonShelterAnimal`,
 1 AS `ActiveMovementType`,
 1 AS `Archived`,
 1 AS `IsNotAvailableForAdoption`,
 1 AS `CombiTestResult`,
 1 AS `FLVResult`,
 1 AS `HeartwormTestResult`,
 1 AS `ShelterLocationName`,
 1 AS `ShelterLocationUnit`,
 1 AS `RetailerName`,
 1 AS `WebsiteMediaName`,
 1 AS `WebsiteMediaDate`,
 1 AS `Sex`,
 1 AS `SpeciesName`,
 1 AS `ReturnedReasonName`,
 1 AS `MovementName`,
 1 AS `DisplayLocationName`,
 1 AS `CurrentOwnerName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animal`
--

DROP TABLE IF EXISTS `v_animal`;
/*!50001 DROP VIEW IF EXISTS `v_animal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_animal` AS SELECT
 1 AS `ID`,
 1 AS `AnimalTypeID`,
 1 AS `AnimalName`,
 1 AS `NonShelterAnimal`,
 1 AS `CrueltyCase`,
 1 AS `BondedAnimalID`,
 1 AS `BondedAnimal2ID`,
 1 AS `BaseColourID`,
 1 AS `SpeciesID`,
 1 AS `BreedID`,
 1 AS `Breed2ID`,
 1 AS `BreedName`,
 1 AS `CrossBreed`,
 1 AS `CoatType`,
 1 AS `Markings`,
 1 AS `ShelterCode`,
 1 AS `ShortCode`,
 1 AS `UniqueCodeID`,
 1 AS `SmartTagSentDate`,
 1 AS `YearCodeID`,
 1 AS `AcceptanceNumber`,
 1 AS `DateOfBirth`,
 1 AS `EstimatedDOB`,
 1 AS `AgeGroup`,
 1 AS `DeceasedDate`,
 1 AS `Sex`,
 1 AS `Fee`,
 1 AS `Identichipped`,
 1 AS `IdentichipNumber`,
 1 AS `IdentichipDate`,
 1 AS `Identichip2Number`,
 1 AS `Identichip2Date`,
 1 AS `Tattoo`,
 1 AS `TattooNumber`,
 1 AS `TattooDate`,
 1 AS `SmartTag`,
 1 AS `SmartTagNumber`,
 1 AS `SmartTagDate`,
 1 AS `SmartTagType`,
 1 AS `Neutered`,
 1 AS `NeuteredDate`,
 1 AS `NeuteredByVetID`,
 1 AS `CombiTested`,
 1 AS `CombiTestDate`,
 1 AS `CombiTestResult`,
 1 AS `HeartwormTested`,
 1 AS `HeartwormTestDate`,
 1 AS `HeartwormTestResult`,
 1 AS `FLVResult`,
 1 AS `Declawed`,
 1 AS `HiddenAnimalDetails`,
 1 AS `AnimalComments`,
 1 AS `OwnersVetID`,
 1 AS `CurrentVetID`,
 1 AS `OriginalOwnerID`,
 1 AS `BroughtInByOwnerID`,
 1 AS `AdoptionCoordinatorID`,
 1 AS `ReasonForEntry`,
 1 AS `ReasonNO`,
 1 AS `DateBroughtIn`,
 1 AS `EntryReasonID`,
 1 AS `AsilomarIsTransferExternal`,
 1 AS `AsilomarIntakeCategory`,
 1 AS `AsilomarOwnerRequestedEuthanasia`,
 1 AS `IsPickup`,
 1 AS `PickupLocationID`,
 1 AS `PickupAddress`,
 1 AS `HealthProblems`,
 1 AS `PutToSleep`,
 1 AS `PTSReason`,
 1 AS `PTSReasonID`,
 1 AS `IsCourtesy`,
 1 AS `IsDOA`,
 1 AS `IsTransfer`,
 1 AS `IsGoodWithCats`,
 1 AS `IsGoodWithDogs`,
 1 AS `IsGoodWithChildren`,
 1 AS `IsHouseTrained`,
 1 AS `IsNotAvailableForAdoption`,
 1 AS `IsNotForRegistration`,
 1 AS `IsHold`,
 1 AS `HoldUntilDate`,
 1 AS `IsQuarantine`,
 1 AS `HasSpecialNeeds`,
 1 AS `AdditionalFlags`,
 1 AS `ShelterLocation`,
 1 AS `ShelterLocationUnit`,
 1 AS `DiedOffShelter`,
 1 AS `Size`,
 1 AS `Weight`,
 1 AS `RabiesTag`,
 1 AS `Archived`,
 1 AS `ActiveMovementID`,
 1 AS `ActiveMovementType`,
 1 AS `ActiveMovementDate`,
 1 AS `ActiveMovementReturn`,
 1 AS `HasActiveReserve`,
 1 AS `HasTrialAdoption`,
 1 AS `HasPermanentFoster`,
 1 AS `DisplayLocation`,
 1 AS `MostRecentEntryDate`,
 1 AS `TimeOnShelter`,
 1 AS `TotalTimeOnShelter`,
 1 AS `DaysOnShelter`,
 1 AS `TotalDaysOnShelter`,
 1 AS `AgeGroupActiveMovement`,
 1 AS `DailyBoardingCost`,
 1 AS `AnimalAge`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `AnimalTypeName`,
 1 AS `BondedAnimal1Name`,
 1 AS `BondedAnimal1Code`,
 1 AS `BondedAnimal1Archived`,
 1 AS `BondedAnimal2Name`,
 1 AS `BondedAnimal2Code`,
 1 AS `BondedAnimal2Archived`,
 1 AS `BaseColourName`,
 1 AS `AdoptAPetColour`,
 1 AS `SpeciesName`,
 1 AS `PetFinderSpecies`,
 1 AS `BreedName1`,
 1 AS `BreedName2`,
 1 AS `PetFinderBreed`,
 1 AS `PetFinderBreed2`,
 1 AS `CoatTypeName`,
 1 AS `SexName`,
 1 AS `SizeName`,
 1 AS `OwnersVetName`,
 1 AS `OwnersVetAddress`,
 1 AS `OwnersVetTown`,
 1 AS `OwnersVetCounty`,
 1 AS `OwnersVetPostcode`,
 1 AS `OwnersVetWorkTelephone`,
 1 AS `OwnersVetEmailAddress`,
 1 AS `OwnersVetLicenceNumber`,
 1 AS `CurrentVetName`,
 1 AS `CurrentVetAddress`,
 1 AS `CurrentVetTown`,
 1 AS `CurrentVetCounty`,
 1 AS `CurrentVetPostcode`,
 1 AS `CurrentVetWorkTelephone`,
 1 AS `CurrentVetEmailAddress`,
 1 AS `CurrentVetLicenceNumber`,
 1 AS `NeuteringVetName`,
 1 AS `NeuteringVetAddress`,
 1 AS `NeuteringVetTown`,
 1 AS `NeuteringVetCounty`,
 1 AS `NeuteringVetPostcode`,
 1 AS `NeuteringVetWorkTelephone`,
 1 AS `NeuteringVetEmailAddress`,
 1 AS `NeuteringVetLicenceNumber`,
 1 AS `OriginalOwnerName`,
 1 AS `OriginalOwnerTitle`,
 1 AS `OriginalOwnerInitials`,
 1 AS `OriginalOwnerForeNames`,
 1 AS `OriginalOwnerSurname`,
 1 AS `OriginalOwnerAddress`,
 1 AS `OriginalOwnerTown`,
 1 AS `OriginalOwnerCounty`,
 1 AS `OriginalOwnerPostcode`,
 1 AS `OriginalOwnerHomeTelephone`,
 1 AS `OriginalOwnerWorkTelephone`,
 1 AS `OriginalOwnerMobileTelephone`,
 1 AS `OriginalOwnerEmailAddress`,
 1 AS `CurrentOwnerID`,
 1 AS `CurrentOwnerName`,
 1 AS `CurrentOwnerTitle`,
 1 AS `CurrentOwnerInitials`,
 1 AS `CurrentOwnerForeNames`,
 1 AS `CurrentOwnerSurname`,
 1 AS `CurrentOwnerAddress`,
 1 AS `CurrentOwnerTown`,
 1 AS `CurrentOwnerCounty`,
 1 AS `CurrentOwnerPostcode`,
 1 AS `CurrentOwnerHomeTelephone`,
 1 AS `CurrentOwnerWorkTelephone`,
 1 AS `CurrentOwnerMobileTelephone`,
 1 AS `CurrentOwnerEmailAddress`,
 1 AS `BroughtInByOwnerName`,
 1 AS `BroughtInByOwnerAddress`,
 1 AS `BroughtInByOwnerTown`,
 1 AS `BroughtInByOwnerCounty`,
 1 AS `BroughtInByOwnerPostcode`,
 1 AS `BroughtInByHomeTelephone`,
 1 AS `BroughtInByWorkTelephone`,
 1 AS `BroughtInByMobileTelephone`,
 1 AS `BroughtInByEmailAddress`,
 1 AS `ReservedOwnerID`,
 1 AS `ReservedOwnerName`,
 1 AS `ReservedOwnerAddress`,
 1 AS `ReservedOwnerTown`,
 1 AS `ReservedOwnerCounty`,
 1 AS `ReservedOwnerPostcode`,
 1 AS `ReservedOwnerHomeTelephone`,
 1 AS `ReservedOwnerWorkTelephone`,
 1 AS `ReservedOwnerMobileTelephone`,
 1 AS `ReservedOwnerEmailAddress`,
 1 AS `AdoptionCoordinatorName`,
 1 AS `AdoptionCoordinatorHomeTelephone`,
 1 AS `AdoptionCoordinatorWorkTelephone`,
 1 AS `AdoptionCoordinatorMobileTelephone`,
 1 AS `AdoptionCoordinatorEmailAddress`,
 1 AS `ReservationStatusName`,
 1 AS `EntryReasonName`,
 1 AS `PTSReasonName`,
 1 AS `ShelterLocationName`,
 1 AS `ShelterLocationDescription`,
 1 AS `SiteID`,
 1 AS `SiteName`,
 1 AS `PickupLocationName`,
 1 AS `AnimalControlIncidentID`,
 1 AS `AnimalControlIncidentName`,
 1 AS `AnimalControlIncidentDate`,
 1 AS `ActiveMovementTypeName`,
 1 AS `ActiveMovementAdoptionNumber`,
 1 AS `ActiveMovementReturnDate`,
 1 AS `ActiveMovementInsuranceNumber`,
 1 AS `ActiveMovementReasonForReturn`,
 1 AS `ActiveMovementTrialEndDate`,
 1 AS `ActiveMovementComments`,
 1 AS `ActiveMovementReservationDate`,
 1 AS `ActiveMovementDonation`,
 1 AS `ActiveMovementCreatedBy`,
 1 AS `ActiveMovementCreatedByName`,
 1 AS `ActiveMovementCreatedDate`,
 1 AS `ActiveMovementLastChangedBy`,
 1 AS `ActiveMovementLastChangedDate`,
 1 AS `Code`,
 1 AS `DisplayLocationName`,
 1 AS `WebsiteMediaID`,
 1 AS `WebsiteMediaName`,
 1 AS `WebsiteMediaDate`,
 1 AS `WebsiteMediaNotes`,
 1 AS `WebsiteImageCount`,
 1 AS `DocMediaName`,
 1 AS `DocMediaDate`,
 1 AS `WebsiteVideoURL`,
 1 AS `WebsiteVideoNotes`,
 1 AS `HasFutureAdoption`,
 1 AS `RecentlyChangedImages`,
 1 AS `NonShelterAnimalName`,
 1 AS `CrueltyCaseName`,
 1 AS `CrossBreedName`,
 1 AS `EstimatedDOBName`,
 1 AS `IdentichippedName`,
 1 AS `TattooName`,
 1 AS `NeuteredName`,
 1 AS `CombiTestedName`,
 1 AS `CombiTestResultName`,
 1 AS `HeartwormTestedName`,
 1 AS `HeartwormTestResultName`,
 1 AS `FLVResultName`,
 1 AS `DeclawedName`,
 1 AS `PutToSleepName`,
 1 AS `IsDOAName`,
 1 AS `IsTransferName`,
 1 AS `IsPickupName`,
 1 AS `IsGoodWithChildrenName`,
 1 AS `IsGoodWithCatsName`,
 1 AS `IsGoodWithDogsName`,
 1 AS `IsHouseTrainedName`,
 1 AS `IsNotAvailableForAdoptionName`,
 1 AS `IsNotForRegistrationName`,
 1 AS `HasSpecialNeedsName`,
 1 AS `DiedOffShelterName`,
 1 AS `HasActiveReserveName`,
 1 AS `HasTrialAdoptionName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animalcontrol`
--

DROP TABLE IF EXISTS `v_animalcontrol`;
/*!50001 DROP VIEW IF EXISTS `v_animalcontrol`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_animalcontrol` AS SELECT
 1 AS `ID`,
 1 AS `IncidentDateTime`,
 1 AS `IncidentTypeID`,
 1 AS `CallDateTime`,
 1 AS `CallNotes`,
 1 AS `CallTaker`,
 1 AS `CallerID`,
 1 AS `VictimID`,
 1 AS `DispatchAddress`,
 1 AS `DispatchTown`,
 1 AS `DispatchCounty`,
 1 AS `DispatchPostcode`,
 1 AS `DispatchLatLong`,
 1 AS `DispatchedACO`,
 1 AS `PickupLocationID`,
 1 AS `JurisdictionID`,
 1 AS `DispatchDateTime`,
 1 AS `RespondedDateTime`,
 1 AS `FollowupDateTime`,
 1 AS `FollowupComplete`,
 1 AS `FollowupDateTime2`,
 1 AS `FollowupComplete2`,
 1 AS `FollowupDateTime3`,
 1 AS `FollowupComplete3`,
 1 AS `CompletedDate`,
 1 AS `IncidentCompletedID`,
 1 AS `SiteID`,
 1 AS `OwnerID`,
 1 AS `Owner2ID`,
 1 AS `Owner3ID`,
 1 AS `AnimalID`,
 1 AS `AnimalDescription`,
 1 AS `SpeciesID`,
 1 AS `Sex`,
 1 AS `AgeGroup`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `ACID`,
 1 AS `SpeciesName`,
 1 AS `SexName`,
 1 AS `CallerName`,
 1 AS `CallerAddress`,
 1 AS `CallerTown`,
 1 AS `CallerCounty`,
 1 AS `CallerPostcode`,
 1 AS `CallerHomeTelephone`,
 1 AS `CallerWorkTelephone`,
 1 AS `CallerMobileTelephone`,
 1 AS `OwnerName`,
 1 AS `OwnerName1`,
 1 AS `OwnerName2`,
 1 AS `OwnerName3`,
 1 AS `SuspectName`,
 1 AS `SuspectAddress`,
 1 AS `SuspectTown`,
 1 AS `SuspectCounty`,
 1 AS `SuspectPostcode`,
 1 AS `SuspectHomeTelephone`,
 1 AS `SuspectWorkTelephone`,
 1 AS `SuspectMobileTelephone`,
 1 AS `VictimName`,
 1 AS `VictimAddress`,
 1 AS `VictimTown`,
 1 AS `VictimCounty`,
 1 AS `VictimPostcode`,
 1 AS `VictimHomeTelephone`,
 1 AS `VictimWorkTelephone`,
 1 AS `VictimMobileTelephone`,
 1 AS `IncidentName`,
 1 AS `CompletedName`,
 1 AS `LocationName`,
 1 AS `JurisdictionName`,
 1 AS `WebsiteMediaID`,
 1 AS `WebsiteMediaName`,
 1 AS `WebsiteMediaDate`,
 1 AS `WebsiteMediaNotes`,
 1 AS `DocMediaName`,
 1 AS `DocMediaDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animalfound`
--

DROP TABLE IF EXISTS `v_animalfound`;
/*!50001 DROP VIEW IF EXISTS `v_animalfound`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_animalfound` AS SELECT
 1 AS `ID`,
 1 AS `AnimalTypeID`,
 1 AS `DateReported`,
 1 AS `DateFound`,
 1 AS `Sex`,
 1 AS `BreedID`,
 1 AS `AgeGroup`,
 1 AS `BaseColourID`,
 1 AS `DistFeat`,
 1 AS `AreaFound`,
 1 AS `AreaPostcode`,
 1 AS `OwnerID`,
 1 AS `ReturnToOwnerDate`,
 1 AS `Comments`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `LFID`,
 1 AS `SpeciesName`,
 1 AS `BreedName`,
 1 AS `BaseColourName`,
 1 AS `AdoptAPetColour`,
 1 AS `SexName`,
 1 AS `OwnerSurname`,
 1 AS `OwnerForeNames`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerName`,
 1 AS `OwnerPostcode`,
 1 AS `HomeTelephone`,
 1 AS `WorkTelephone`,
 1 AS `MobileTelephone`,
 1 AS `WebsiteMediaID`,
 1 AS `DocMediaName`,
 1 AS `DocMediaDate`,
 1 AS `WebsiteMediaName`,
 1 AS `WebsiteMediaDate`,
 1 AS `WebsiteMediaNotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animallost`
--

DROP TABLE IF EXISTS `v_animallost`;
/*!50001 DROP VIEW IF EXISTS `v_animallost`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_animallost` AS SELECT
 1 AS `ID`,
 1 AS `AnimalTypeID`,
 1 AS `DateReported`,
 1 AS `DateLost`,
 1 AS `DateFound`,
 1 AS `Sex`,
 1 AS `BreedID`,
 1 AS `AgeGroup`,
 1 AS `BaseColourID`,
 1 AS `DistFeat`,
 1 AS `AreaLost`,
 1 AS `AreaPostcode`,
 1 AS `OwnerID`,
 1 AS `Comments`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `LFID`,
 1 AS `SpeciesName`,
 1 AS `BreedName`,
 1 AS `BaseColourName`,
 1 AS `AdoptAPetColour`,
 1 AS `SexName`,
 1 AS `OwnerSurname`,
 1 AS `OwnerForeNames`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerName`,
 1 AS `OwnerPostcode`,
 1 AS `HomeTelephone`,
 1 AS `WorkTelephone`,
 1 AS `MobileTelephone`,
 1 AS `WebsiteMediaID`,
 1 AS `DocMediaName`,
 1 AS `DocMediaDate`,
 1 AS `WebsiteMediaName`,
 1 AS `WebsiteMediaDate`,
 1 AS `WebsiteMediaNotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animalmedicaltreatment`
--

DROP TABLE IF EXISTS `v_animalmedicaltreatment`;
/*!50001 DROP VIEW IF EXISTS `v_animalmedicaltreatment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_animalmedicaltreatment` AS SELECT
 1 AS `ShelterCode`,
 1 AS `ShortCode`,
 1 AS `AnimalName`,
 1 AS `Archived`,
 1 AS `ActiveMovementID`,
 1 AS `ActiveMovementType`,
 1 AS `DeceasedDate`,
 1 AS `AcceptanceNumber`,
 1 AS `HasActiveReserve`,
 1 AS `HasTrialAdoption`,
 1 AS `CrueltyCase`,
 1 AS `NonShelterAnimal`,
 1 AS `ShelterLocation`,
 1 AS `Neutered`,
 1 AS `IsNotAvailableForAdoption`,
 1 AS `IsHold`,
 1 AS `IsQuarantine`,
 1 AS `CombiTestResult`,
 1 AS `FLVResult`,
 1 AS `HeartwormTestResult`,
 1 AS `SpeciesName`,
 1 AS `DisplayLocationName`,
 1 AS `CurrentOwnerID`,
 1 AS `CurrentOwnerName`,
 1 AS `ID`,
 1 AS `AnimalID`,
 1 AS `MedicalProfileID`,
 1 AS `TreatmentName`,
 1 AS `StartDate`,
 1 AS `Dosage`,
 1 AS `Cost`,
 1 AS `CostPaidDate`,
 1 AS `TimingRule`,
 1 AS `TimingRuleFrequency`,
 1 AS `TimingRuleNoFrequencies`,
 1 AS `TreatmentRule`,
 1 AS `TotalNumberOfTreatments`,
 1 AS `TreatmentsGiven`,
 1 AS `TreatmentsRemaining`,
 1 AS `Status`,
 1 AS `Comments`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `DateRequired`,
 1 AS `DateGiven`,
 1 AS `TreatmentComments`,
 1 AS `TreatmentNumber`,
 1 AS `TotalTreatments`,
 1 AS `WebsiteMediaName`,
 1 AS `RegimenID`,
 1 AS `TreatmentID`,
 1 AS `GivenBy`,
 1 AS `AdministeringVetID`,
 1 AS `AdministeringVetName`,
 1 AS `AdministeringVetAddress`,
 1 AS `AdministeringVetTown`,
 1 AS `AdministeringVetCounty`,
 1 AS `AdministeringVetPostcode`,
 1 AS `AdministeringVetEmail`,
 1 AS `AdministeringVetLicence`,
 1 AS `RegimenComments`,
 1 AS `LocationName`,
 1 AS `LocationUnit`,
 1 AS `ShelterLocationName`,
 1 AS `ShelterLocationUnit`,
 1 AS `CompositeID`,
 1 AS `NamedFrequency`,
 1 AS `NamedNumberOfTreatments`,
 1 AS `NamedStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animaltest`
--

DROP TABLE IF EXISTS `v_animaltest`;
/*!50001 DROP VIEW IF EXISTS `v_animaltest`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_animaltest` AS SELECT
 1 AS `ID`,
 1 AS `AnimalID`,
 1 AS `TestTypeID`,
 1 AS `TestResultID`,
 1 AS `AdministeringVetID`,
 1 AS `DateOfTest`,
 1 AS `DateRequired`,
 1 AS `Cost`,
 1 AS `CostPaidDate`,
 1 AS `Comments`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `ShelterCode`,
 1 AS `ShortCode`,
 1 AS `Archived`,
 1 AS `ActiveMovementID`,
 1 AS `ActiveMovementType`,
 1 AS `DeceasedDate`,
 1 AS `AcceptanceNumber`,
 1 AS `HasActiveReserve`,
 1 AS `HasTrialAdoption`,
 1 AS `CrueltyCase`,
 1 AS `NonShelterAnimal`,
 1 AS `ShelterLocation`,
 1 AS `Neutered`,
 1 AS `IsNotAvailableForAdoption`,
 1 AS `IsHold`,
 1 AS `IsQuarantine`,
 1 AS `CombiTestResult`,
 1 AS `FLVResult`,
 1 AS `HeartwormTestResult`,
 1 AS `SpeciesName`,
 1 AS `DisplayLocationName`,
 1 AS `CurrentOwnerID`,
 1 AS `CurrentOwnerName`,
 1 AS `AnimalName`,
 1 AS `WebsiteMediaName`,
 1 AS `TestName`,
 1 AS `TestDescription`,
 1 AS `ResultName`,
 1 AS `LocationName`,
 1 AS `LocationUnit`,
 1 AS `ShelterLocationName`,
 1 AS `ShelterLocationUnit`,
 1 AS `AdministeringVetName`,
 1 AS `AdministeringVetAddress`,
 1 AS `AdministeringVetTown`,
 1 AS `AdministeringVetCounty`,
 1 AS `AdministeringVetPostcode`,
 1 AS `AdministeringVetEmail`,
 1 AS `AdministeringVetLicence`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animalvaccination`
--

DROP TABLE IF EXISTS `v_animalvaccination`;
/*!50001 DROP VIEW IF EXISTS `v_animalvaccination`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_animalvaccination` AS SELECT
 1 AS `ID`,
 1 AS `AnimalID`,
 1 AS `VaccinationID`,
 1 AS `AdministeringVetID`,
 1 AS `DateOfVaccination`,
 1 AS `GivenBy`,
 1 AS `DateRequired`,
 1 AS `DateExpires`,
 1 AS `BatchNumber`,
 1 AS `Manufacturer`,
 1 AS `Cost`,
 1 AS `CostPaidDate`,
 1 AS `Comments`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `ShelterCode`,
 1 AS `ShortCode`,
 1 AS `Archived`,
 1 AS `ActiveMovementID`,
 1 AS `ActiveMovementType`,
 1 AS `DeceasedDate`,
 1 AS `AcceptanceNumber`,
 1 AS `HasActiveReserve`,
 1 AS `HasTrialAdoption`,
 1 AS `CrueltyCase`,
 1 AS `NonShelterAnimal`,
 1 AS `ShelterLocation`,
 1 AS `Neutered`,
 1 AS `IsNotAvailableForAdoption`,
 1 AS `IsHold`,
 1 AS `IsQuarantine`,
 1 AS `CombiTestResult`,
 1 AS `FLVResult`,
 1 AS `HeartwormTestResult`,
 1 AS `SpeciesName`,
 1 AS `DisplayLocationName`,
 1 AS `CurrentOwnerID`,
 1 AS `CurrentOwnerName`,
 1 AS `AnimalName`,
 1 AS `WebsiteMediaName`,
 1 AS `VaccinationType`,
 1 AS `VaccinationDescription`,
 1 AS `LocationName`,
 1 AS `LocationUnit`,
 1 AS `ShelterLocationName`,
 1 AS `ShelterLocationUnit`,
 1 AS `AdministeringVetName`,
 1 AS `AdministeringVetAddress`,
 1 AS `AdministeringVetTown`,
 1 AS `AdministeringVetCounty`,
 1 AS `AdministeringVetPostcode`,
 1 AS `AdministeringVetEmail`,
 1 AS `AdministeringVetLicence`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_animalwaitinglist`
--

DROP TABLE IF EXISTS `v_animalwaitinglist`;
/*!50001 DROP VIEW IF EXISTS `v_animalwaitinglist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_animalwaitinglist` AS SELECT
 1 AS `ID`,
 1 AS `SpeciesID`,
 1 AS `Size`,
 1 AS `DatePutOnList`,
 1 AS `OwnerID`,
 1 AS `AnimalDescription`,
 1 AS `ReasonForWantingToPart`,
 1 AS `CanAffordDonation`,
 1 AS `Urgency`,
 1 AS `DateRemovedFromList`,
 1 AS `AutoRemovePolicy`,
 1 AS `DateOfLastOwnerContact`,
 1 AS `ReasonForRemoval`,
 1 AS `Comments`,
 1 AS `UrgencyUpdateDate`,
 1 AS `UrgencyLastUpdatedDate`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `WLID`,
 1 AS `SpeciesName`,
 1 AS `SizeName`,
 1 AS `OwnerName`,
 1 AS `OwnerSurname`,
 1 AS `OwnerForeNames`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerAddress`,
 1 AS `OwnerTown`,
 1 AS `OwnerCounty`,
 1 AS `OwnerPostcode`,
 1 AS `HomeTelephone`,
 1 AS `WorkTelephone`,
 1 AS `MobileTelephone`,
 1 AS `EmailAddress`,
 1 AS `UrgencyName`,
 1 AS `WebsiteMediaID`,
 1 AS `DocMediaName`,
 1 AS `DocMediaDate`,
 1 AS `WebsiteMediaName`,
 1 AS `WebsiteMediaDate`,
 1 AS `WebsiteMediaNotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_owner`
--

DROP TABLE IF EXISTS `v_owner`;
/*!50001 DROP VIEW IF EXISTS `v_owner`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_owner` AS SELECT
 1 AS `ID`,
 1 AS `OwnerType`,
 1 AS `OwnerCode`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerForeNames`,
 1 AS `OwnerSurname`,
 1 AS `OwnerName`,
 1 AS `IsDeceased`,
 1 AS `OwnerAddress`,
 1 AS `OwnerTown`,
 1 AS `OwnerCounty`,
 1 AS `OwnerPostcode`,
 1 AS `LatLong`,
 1 AS `HomeTelephone`,
 1 AS `WorkTelephone`,
 1 AS `MobileTelephone`,
 1 AS `EmailAddress`,
 1 AS `ExcludeFromBulkEmail`,
 1 AS `GDPRContactOptIn`,
 1 AS `JurisdictionID`,
 1 AS `IDCheck`,
 1 AS `Comments`,
 1 AS `SiteID`,
 1 AS `IsBanned`,
 1 AS `IsVolunteer`,
 1 AS `IsHomeChecker`,
 1 AS `IsMember`,
 1 AS `MembershipExpiryDate`,
 1 AS `MembershipNumber`,
 1 AS `IsAdoptionCoordinator`,
 1 AS `IsDonor`,
 1 AS `IsDriver`,
 1 AS `IsShelter`,
 1 AS `IsACO`,
 1 AS `IsStaff`,
 1 AS `IsFosterer`,
 1 AS `FosterCapacity`,
 1 AS `IsRetailer`,
 1 AS `IsVet`,
 1 AS `IsGiftAid`,
 1 AS `AdditionalFlags`,
 1 AS `HomeCheckAreas`,
 1 AS `DateLastHomeChecked`,
 1 AS `HomeCheckedBy`,
 1 AS `MatchAdded`,
 1 AS `MatchExpires`,
 1 AS `MatchActive`,
 1 AS `MatchSex`,
 1 AS `MatchSize`,
 1 AS `MatchColour`,
 1 AS `MatchAgeFrom`,
 1 AS `MatchAgeTo`,
 1 AS `MatchAnimalType`,
 1 AS `MatchSpecies`,
 1 AS `MatchBreed`,
 1 AS `MatchBreed2`,
 1 AS `MatchGoodWithCats`,
 1 AS `MatchGoodWithDogs`,
 1 AS `MatchGoodWithChildren`,
 1 AS `MatchHouseTrained`,
 1 AS `MatchCommentsContain`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `PersonID`,
 1 AS `HomeCheckedByName`,
 1 AS `HomeCheckedByHomeTelephone`,
 1 AS `HomeCheckedByMobileTelephone`,
 1 AS `HomeCheckedByEmail`,
 1 AS `JurisdictionName`,
 1 AS `WebsiteMediaID`,
 1 AS `WebsiteMediaName`,
 1 AS `WebsiteMediaDate`,
 1 AS `WebsiteMediaNotes`,
 1 AS `DocMediaName`,
 1 AS `DocMediaDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ownercitation`
--

DROP TABLE IF EXISTS `v_ownercitation`;
/*!50001 DROP VIEW IF EXISTS `v_ownercitation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_ownercitation` AS SELECT
 1 AS `ID`,
 1 AS `CitationTypeID`,
 1 AS `CitationDate`,
 1 AS `Comments`,
 1 AS `CitationName`,
 1 AS `FineAmount`,
 1 AS `FineDueDate`,
 1 AS `FinePaidDate`,
 1 AS `AnimalControlID`,
 1 AS `OwnerID`,
 1 AS `IncidentName`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerSurname`,
 1 AS `OwnerForenames`,
 1 AS `OwnerName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ownerdonation`
--

DROP TABLE IF EXISTS `v_ownerdonation`;
/*!50001 DROP VIEW IF EXISTS `v_ownerdonation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_ownerdonation` AS SELECT
 1 AS `ID`,
 1 AS `DonationTypeID`,
 1 AS `DonationPaymentID`,
 1 AS `DonationName`,
 1 AS `Date`,
 1 AS `DateDue`,
 1 AS `Donation`,
 1 AS `PaymentName`,
 1 AS `IsGiftAid`,
 1 AS `IsGiftAidName`,
 1 AS `Frequency`,
 1 AS `Quantity`,
 1 AS `UnitPrice`,
 1 AS `FrequencyName`,
 1 AS `NextCreated`,
 1 AS `ReceiptNumber`,
 1 AS `ChequeNumber`,
 1 AS `IsVAT`,
 1 AS `VATRate`,
 1 AS `VATAmount`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `Comments`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerSurname`,
 1 AS `OwnerForenames`,
 1 AS `OwnerName`,
 1 AS `AnimalName`,
 1 AS `ShelterCode`,
 1 AS `ShortCode`,
 1 AS `AnimalID`,
 1 AS `OwnerID`,
 1 AS `HasActiveReserve`,
 1 AS `HasTrialAdoption`,
 1 AS `CrueltyCase`,
 1 AS `NonShelterAnimal`,
 1 AS `Neutered`,
 1 AS `IsNotAvailableForAdoption`,
 1 AS `IsHold`,
 1 AS `IsQuarantine`,
 1 AS `ShelterLocationUnit`,
 1 AS `CombiTestResult`,
 1 AS `FLVResult`,
 1 AS `HeartwormTestResult`,
 1 AS `DisplayLocationName`,
 1 AS `ShelterLocationName`,
 1 AS `CurrentOwnerName`,
 1 AS `MovementID`,
 1 AS `OwnerAddress`,
 1 AS `OwnerTown`,
 1 AS `OwnerCounty`,
 1 AS `OwnerPostcode`,
 1 AS `HomeTelephone`,
 1 AS `WorkTelephone`,
 1 AS `MobileTelephone`,
 1 AS `EmailAddress`,
 1 AS `AdditionalFlags`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ownerlicence`
--

DROP TABLE IF EXISTS `v_ownerlicence`;
/*!50001 DROP VIEW IF EXISTS `v_ownerlicence`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_ownerlicence` AS SELECT
 1 AS `ID`,
 1 AS `LicenceTypeID`,
 1 AS `IssueDate`,
 1 AS `ExpiryDate`,
 1 AS `LicenceTypeName`,
 1 AS `LicenceNumber`,
 1 AS `LicenceFee`,
 1 AS `Comments`,
 1 AS `OwnerID`,
 1 AS `AnimalID`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `AnimalName`,
 1 AS `ShelterCode`,
 1 AS `ShortCode`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerSurname`,
 1 AS `OwnerForenames`,
 1 AS `OwnerName`,
 1 AS `OwnerAddress`,
 1 AS `OwnerTown`,
 1 AS `OwnerCounty`,
 1 AS `OwnerPostcode`,
 1 AS `HomeTelephone`,
 1 AS `WorkTelephone`,
 1 AS `MobileTelephone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ownertraploan`
--

DROP TABLE IF EXISTS `v_ownertraploan`;
/*!50001 DROP VIEW IF EXISTS `v_ownertraploan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_ownertraploan` AS SELECT
 1 AS `ID`,
 1 AS `TrapTypeID`,
 1 AS `LoanDate`,
 1 AS `TrapTypeName`,
 1 AS `TrapNumber`,
 1 AS `DepositAmount`,
 1 AS `DepositReturnDate`,
 1 AS `ReturnDueDate`,
 1 AS `ReturnDate`,
 1 AS `OwnerID`,
 1 AS `Comments`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `OwnerTitle`,
 1 AS `OwnerInitials`,
 1 AS `OwnerSurname`,
 1 AS `OwnerForenames`,
 1 AS `OwnerName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_ownervoucher`
--

DROP TABLE IF EXISTS `v_ownervoucher`;
/*!50001 DROP VIEW IF EXISTS `v_ownervoucher`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_ownervoucher` AS SELECT
 1 AS `ID`,
 1 AS `OwnerID`,
 1 AS `VoucherID`,
 1 AS `DateIssued`,
 1 AS `DateExpired`,
 1 AS `Value`,
 1 AS `Comments`,
 1 AS `RecordVersion`,
 1 AS `CreatedBy`,
 1 AS `CreatedDate`,
 1 AS `LastChangedBy`,
 1 AS `LastChangedDate`,
 1 AS `VoucherName`,
 1 AS `OwnerName`,
 1 AS `OwnerAddress`,
 1 AS `OwnerTown`,
 1 AS `OwnerCounty`,
 1 AS `OwnerPostcode`,
 1 AS `HomeTelephone`,
 1 AS `WorkTelephone`,
 1 AS `MobileTelephone`,
 1 AS `EmailAddress`,
 1 AS `AdditionalFlags`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vaccinationtype`
--

DROP TABLE IF EXISTS `vaccinationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vaccinationtype` (
  `ID` int(11) NOT NULL,
  `VaccinationType` varchar(255) NOT NULL,
  `VaccinationDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `voucher` (
  `ID` int(11) NOT NULL,
  `VoucherName` varchar(255) NOT NULL,
  `VoucherDescription` varchar(255) DEFAULT NULL,
  `DefaultCost` int(11) DEFAULT NULL,
  `IsRetired` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'asm'
--

--
-- Final view structure for view `v_adoption`
--

/*!50001 DROP VIEW IF EXISTS `v_adoption`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_adoption` AS select `m`.`ID` AS `ID`,`m`.`AdoptionNumber` AS `AdoptionNumber`,`m`.`AnimalID` AS `AnimalID`,`m`.`OwnerID` AS `OwnerID`,`m`.`RetailerID` AS `RetailerID`,`m`.`OriginalRetailerMovementID` AS `OriginalRetailerMovementID`,`m`.`MovementDate` AS `MovementDate`,`m`.`MovementType` AS `MovementType`,`m`.`ReturnDate` AS `ReturnDate`,`m`.`ReturnedReasonID` AS `ReturnedReasonID`,`m`.`InsuranceNumber` AS `InsuranceNumber`,`m`.`ReasonForReturn` AS `ReasonForReturn`,`m`.`ReturnedByOwnerID` AS `ReturnedByOwnerID`,`m`.`ReservationDate` AS `ReservationDate`,`m`.`ReservationCancelledDate` AS `ReservationCancelledDate`,`m`.`ReservationStatusID` AS `ReservationStatusID`,`m`.`Donation` AS `Donation`,`m`.`IsTrial` AS `IsTrial`,`m`.`IsPermanentFoster` AS `IsPermanentFoster`,`m`.`TrialEndDate` AS `TrialEndDate`,`m`.`Comments` AS `Comments`,`m`.`RecordVersion` AS `RecordVersion`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`CreatedDate` AS `CreatedDate`,`m`.`LastChangedBy` AS `LastChangedBy`,`m`.`LastChangedDate` AS `LastChangedDate`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`rs`.`StatusName` AS `ReservationStatusName`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`AnimalAge` AS `AnimalAge`,`a`.`AgeGroup` AS `AgeGroup`,`a`.`AnimalName` AS `AnimalName`,`a`.`BreedName` AS `BreedName`,`a`.`Neutered` AS `Neutered`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`HoldUntilDate` AS `HoldUntilDate`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`Archived` AS `Archived`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,`il`.`LocationName` AS `ShelterLocationName`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`r`.`OwnerName` AS `RetailerName`,`ma`.`MediaName` AS `WebsiteMediaName`,`ma`.`Date` AS `WebsiteMediaDate`,`sx`.`Sex` AS `Sex`,`s`.`SpeciesName` AS `SpeciesName`,`rr`.`ReasonName` AS `ReturnedReasonName`,(case when ((`m`.`MovementType` = 2) and (`m`.`IsPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`m`.`MovementType` = 1) and (`m`.`IsTrial` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when (isnull(`m`.`MovementDate`) and (`m`.`ReservationDate` is not null) and (`m`.`ReservationCancelledDate` is not null)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 10)) when (isnull(`m`.`MovementDate`) and (`m`.`ReservationDate` is not null)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 9)) else `l`.`MovementType` end) AS `MovementName`,(case when ((`m`.`MovementType` = 2) and (`m`.`IsPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`m`.`MovementType` = 1) and (`m`.`IsTrial` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when (isnull(`m`.`MovementDate`) and (`m`.`ReservationDate` is not null) and (`m`.`ReservationCancelledDate` is not null)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 10)) when (isnull(`m`.`MovementDate`) and (`m`.`ReservationDate` is not null)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 9)) else `l`.`MovementType` end) AS `DisplayLocationName`,`co`.`OwnerName` AS `CurrentOwnerName` from ((((((((((((`adoption` `m` left join `reservationstatus` `rs` on((`rs`.`ID` = `m`.`ReservationStatusID`))) left join `lksmovementtype` `l` on((`l`.`ID` = `m`.`MovementType`))) join `animal` `a` on((`m`.`AnimalID` = `a`.`ID`))) left join `adoption` `ad` on((`a`.`ActiveMovementID` = `ad`.`ID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`))) left join `media` `ma` on(((`ma`.`LinkID` = `a`.`ID`) and (`ma`.`LinkTypeID` = 0) and (`ma`.`WebsitePhoto` = 1)))) left join `entryreason` `rr` on((`m`.`ReturnedReasonID` = `rr`.`ID`))) join `species` `s` on((`a`.`SpeciesID` = `s`.`ID`))) join `lksex` `sx` on((`sx`.`ID` = `a`.`Sex`))) left join `owner` `o` on((`m`.`OwnerID` = `o`.`ID`))) left join `owner` `r` on((`m`.`RetailerID` = `r`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animal`
--

/*!50001 DROP VIEW IF EXISTS `v_animal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animal` AS select `a`.`ID` AS `ID`,`a`.`AnimalTypeID` AS `AnimalTypeID`,`a`.`AnimalName` AS `AnimalName`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`BondedAnimalID` AS `BondedAnimalID`,`a`.`BondedAnimal2ID` AS `BondedAnimal2ID`,`a`.`BaseColourID` AS `BaseColourID`,`a`.`SpeciesID` AS `SpeciesID`,`a`.`BreedID` AS `BreedID`,`a`.`Breed2ID` AS `Breed2ID`,`a`.`BreedName` AS `BreedName`,`a`.`CrossBreed` AS `CrossBreed`,`a`.`CoatType` AS `CoatType`,`a`.`Markings` AS `Markings`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`UniqueCodeID` AS `UniqueCodeID`,`a`.`SmartTagSentDate` AS `SmartTagSentDate`,`a`.`YearCodeID` AS `YearCodeID`,`a`.`AcceptanceNumber` AS `AcceptanceNumber`,`a`.`DateOfBirth` AS `DateOfBirth`,`a`.`EstimatedDOB` AS `EstimatedDOB`,`a`.`AgeGroup` AS `AgeGroup`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`Sex` AS `Sex`,`a`.`Fee` AS `Fee`,`a`.`Identichipped` AS `Identichipped`,`a`.`IdentichipNumber` AS `IdentichipNumber`,`a`.`IdentichipDate` AS `IdentichipDate`,`a`.`Identichip2Number` AS `Identichip2Number`,`a`.`Identichip2Date` AS `Identichip2Date`,`a`.`Tattoo` AS `Tattoo`,`a`.`TattooNumber` AS `TattooNumber`,`a`.`TattooDate` AS `TattooDate`,`a`.`SmartTag` AS `SmartTag`,`a`.`SmartTagNumber` AS `SmartTagNumber`,`a`.`SmartTagDate` AS `SmartTagDate`,`a`.`SmartTagType` AS `SmartTagType`,`a`.`Neutered` AS `Neutered`,`a`.`NeuteredDate` AS `NeuteredDate`,`a`.`NeuteredByVetID` AS `NeuteredByVetID`,`a`.`CombiTested` AS `CombiTested`,`a`.`CombiTestDate` AS `CombiTestDate`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`HeartwormTested` AS `HeartwormTested`,`a`.`HeartwormTestDate` AS `HeartwormTestDate`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`Declawed` AS `Declawed`,`a`.`HiddenAnimalDetails` AS `HiddenAnimalDetails`,`a`.`AnimalComments` AS `AnimalComments`,`a`.`OwnersVetID` AS `OwnersVetID`,`a`.`CurrentVetID` AS `CurrentVetID`,`a`.`OriginalOwnerID` AS `OriginalOwnerID`,`a`.`BroughtInByOwnerID` AS `BroughtInByOwnerID`,`a`.`AdoptionCoordinatorID` AS `AdoptionCoordinatorID`,`a`.`ReasonForEntry` AS `ReasonForEntry`,`a`.`ReasonNO` AS `ReasonNO`,`a`.`DateBroughtIn` AS `DateBroughtIn`,`a`.`EntryReasonID` AS `EntryReasonID`,`a`.`AsilomarIsTransferExternal` AS `AsilomarIsTransferExternal`,`a`.`AsilomarIntakeCategory` AS `AsilomarIntakeCategory`,`a`.`AsilomarOwnerRequestedEuthanasia` AS `AsilomarOwnerRequestedEuthanasia`,`a`.`IsPickup` AS `IsPickup`,`a`.`PickupLocationID` AS `PickupLocationID`,`a`.`PickupAddress` AS `PickupAddress`,`a`.`HealthProblems` AS `HealthProblems`,`a`.`PutToSleep` AS `PutToSleep`,`a`.`PTSReason` AS `PTSReason`,`a`.`PTSReasonID` AS `PTSReasonID`,`a`.`IsCourtesy` AS `IsCourtesy`,`a`.`IsDOA` AS `IsDOA`,`a`.`IsTransfer` AS `IsTransfer`,`a`.`IsGoodWithCats` AS `IsGoodWithCats`,`a`.`IsGoodWithDogs` AS `IsGoodWithDogs`,`a`.`IsGoodWithChildren` AS `IsGoodWithChildren`,`a`.`IsHouseTrained` AS `IsHouseTrained`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsNotForRegistration` AS `IsNotForRegistration`,`a`.`IsHold` AS `IsHold`,`a`.`HoldUntilDate` AS `HoldUntilDate`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`HasSpecialNeeds` AS `HasSpecialNeeds`,`a`.`AdditionalFlags` AS `AdditionalFlags`,`a`.`ShelterLocation` AS `ShelterLocation`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`a`.`DiedOffShelter` AS `DiedOffShelter`,`a`.`Size` AS `Size`,`a`.`Weight` AS `Weight`,`a`.`RabiesTag` AS `RabiesTag`,`a`.`Archived` AS `Archived`,`a`.`ActiveMovementID` AS `ActiveMovementID`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`ActiveMovementDate` AS `ActiveMovementDate`,`a`.`ActiveMovementReturn` AS `ActiveMovementReturn`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`HasPermanentFoster` AS `HasPermanentFoster`,`a`.`DisplayLocation` AS `DisplayLocation`,`a`.`MostRecentEntryDate` AS `MostRecentEntryDate`,`a`.`TimeOnShelter` AS `TimeOnShelter`,`a`.`TotalTimeOnShelter` AS `TotalTimeOnShelter`,`a`.`DaysOnShelter` AS `DaysOnShelter`,`a`.`TotalDaysOnShelter` AS `TotalDaysOnShelter`,`a`.`AgeGroupActiveMovement` AS `AgeGroupActiveMovement`,`a`.`DailyBoardingCost` AS `DailyBoardingCost`,`a`.`AnimalAge` AS `AnimalAge`,`a`.`RecordVersion` AS `RecordVersion`,`a`.`CreatedBy` AS `CreatedBy`,`a`.`CreatedDate` AS `CreatedDate`,`a`.`LastChangedBy` AS `LastChangedBy`,`a`.`LastChangedDate` AS `LastChangedDate`,`at`.`AnimalType` AS `AnimalTypeName`,`ba1`.`AnimalName` AS `BondedAnimal1Name`,`ba1`.`ShelterCode` AS `BondedAnimal1Code`,`ba1`.`Archived` AS `BondedAnimal1Archived`,`ba2`.`AnimalName` AS `BondedAnimal2Name`,`ba2`.`ShelterCode` AS `BondedAnimal2Code`,`ba2`.`Archived` AS `BondedAnimal2Archived`,`bc`.`BaseColour` AS `BaseColourName`,`bc`.`AdoptAPetColour` AS `AdoptAPetColour`,`sp`.`SpeciesName` AS `SpeciesName`,`sp`.`PetFinderSpecies` AS `PetFinderSpecies`,`bd`.`BreedName` AS `BreedName1`,`bd2`.`BreedName` AS `BreedName2`,`bd`.`PetFinderBreed` AS `PetFinderBreed`,`bd2`.`PetFinderBreed` AS `PetFinderBreed2`,`ct`.`CoatType` AS `CoatTypeName`,`sx`.`Sex` AS `SexName`,`sz`.`Size` AS `SizeName`,`ov`.`OwnerName` AS `OwnersVetName`,`ov`.`OwnerAddress` AS `OwnersVetAddress`,`ov`.`OwnerTown` AS `OwnersVetTown`,`ov`.`OwnerCounty` AS `OwnersVetCounty`,`ov`.`OwnerPostcode` AS `OwnersVetPostcode`,`ov`.`WorkTelephone` AS `OwnersVetWorkTelephone`,`ov`.`EmailAddress` AS `OwnersVetEmailAddress`,`ov`.`MembershipNumber` AS `OwnersVetLicenceNumber`,`cv`.`OwnerName` AS `CurrentVetName`,`cv`.`OwnerAddress` AS `CurrentVetAddress`,`cv`.`OwnerTown` AS `CurrentVetTown`,`cv`.`OwnerCounty` AS `CurrentVetCounty`,`cv`.`OwnerPostcode` AS `CurrentVetPostcode`,`cv`.`WorkTelephone` AS `CurrentVetWorkTelephone`,`cv`.`EmailAddress` AS `CurrentVetEmailAddress`,`cv`.`MembershipNumber` AS `CurrentVetLicenceNumber`,`nv`.`OwnerName` AS `NeuteringVetName`,`nv`.`OwnerAddress` AS `NeuteringVetAddress`,`nv`.`OwnerTown` AS `NeuteringVetTown`,`nv`.`OwnerCounty` AS `NeuteringVetCounty`,`nv`.`OwnerPostcode` AS `NeuteringVetPostcode`,`nv`.`WorkTelephone` AS `NeuteringVetWorkTelephone`,`nv`.`EmailAddress` AS `NeuteringVetEmailAddress`,`nv`.`MembershipNumber` AS `NeuteringVetLicenceNumber`,`oo`.`OwnerName` AS `OriginalOwnerName`,`oo`.`OwnerTitle` AS `OriginalOwnerTitle`,`oo`.`OwnerInitials` AS `OriginalOwnerInitials`,`oo`.`OwnerForeNames` AS `OriginalOwnerForeNames`,`oo`.`OwnerSurname` AS `OriginalOwnerSurname`,`oo`.`OwnerAddress` AS `OriginalOwnerAddress`,`oo`.`OwnerTown` AS `OriginalOwnerTown`,`oo`.`OwnerCounty` AS `OriginalOwnerCounty`,`oo`.`OwnerPostcode` AS `OriginalOwnerPostcode`,`oo`.`HomeTelephone` AS `OriginalOwnerHomeTelephone`,`oo`.`WorkTelephone` AS `OriginalOwnerWorkTelephone`,`oo`.`MobileTelephone` AS `OriginalOwnerMobileTelephone`,`oo`.`EmailAddress` AS `OriginalOwnerEmailAddress`,`co`.`ID` AS `CurrentOwnerID`,`co`.`OwnerName` AS `CurrentOwnerName`,`co`.`OwnerTitle` AS `CurrentOwnerTitle`,`co`.`OwnerInitials` AS `CurrentOwnerInitials`,`co`.`OwnerForeNames` AS `CurrentOwnerForeNames`,`co`.`OwnerSurname` AS `CurrentOwnerSurname`,`co`.`OwnerAddress` AS `CurrentOwnerAddress`,`co`.`OwnerTown` AS `CurrentOwnerTown`,`co`.`OwnerCounty` AS `CurrentOwnerCounty`,`co`.`OwnerPostcode` AS `CurrentOwnerPostcode`,`co`.`HomeTelephone` AS `CurrentOwnerHomeTelephone`,`co`.`WorkTelephone` AS `CurrentOwnerWorkTelephone`,`co`.`MobileTelephone` AS `CurrentOwnerMobileTelephone`,`co`.`EmailAddress` AS `CurrentOwnerEmailAddress`,`bo`.`OwnerName` AS `BroughtInByOwnerName`,`bo`.`OwnerAddress` AS `BroughtInByOwnerAddress`,`bo`.`OwnerTown` AS `BroughtInByOwnerTown`,`bo`.`OwnerCounty` AS `BroughtInByOwnerCounty`,`bo`.`OwnerPostcode` AS `BroughtInByOwnerPostcode`,`bo`.`HomeTelephone` AS `BroughtInByHomeTelephone`,`bo`.`WorkTelephone` AS `BroughtInByWorkTelephone`,`bo`.`MobileTelephone` AS `BroughtInByMobileTelephone`,`bo`.`EmailAddress` AS `BroughtInByEmailAddress`,`ro`.`ID` AS `ReservedOwnerID`,`ro`.`OwnerName` AS `ReservedOwnerName`,`ro`.`OwnerAddress` AS `ReservedOwnerAddress`,`ro`.`OwnerTown` AS `ReservedOwnerTown`,`ro`.`OwnerCounty` AS `ReservedOwnerCounty`,`ro`.`OwnerPostcode` AS `ReservedOwnerPostcode`,`ro`.`HomeTelephone` AS `ReservedOwnerHomeTelephone`,`ro`.`WorkTelephone` AS `ReservedOwnerWorkTelephone`,`ro`.`MobileTelephone` AS `ReservedOwnerMobileTelephone`,`ro`.`EmailAddress` AS `ReservedOwnerEmailAddress`,`ao`.`OwnerName` AS `AdoptionCoordinatorName`,`ao`.`HomeTelephone` AS `AdoptionCoordinatorHomeTelephone`,`ao`.`WorkTelephone` AS `AdoptionCoordinatorWorkTelephone`,`ao`.`MobileTelephone` AS `AdoptionCoordinatorMobileTelephone`,`ao`.`EmailAddress` AS `AdoptionCoordinatorEmailAddress`,`ars`.`StatusName` AS `ReservationStatusName`,`er`.`ReasonName` AS `EntryReasonName`,`dr`.`ReasonName` AS `PTSReasonName`,`il`.`LocationName` AS `ShelterLocationName`,`il`.`LocationDescription` AS `ShelterLocationDescription`,`il`.`SiteID` AS `SiteID`,`se`.`SiteName` AS `SiteName`,`pl`.`LocationName` AS `PickupLocationName`,`ac`.`ID` AS `AnimalControlIncidentID`,`itn`.`IncidentName` AS `AnimalControlIncidentName`,`ac`.`IncidentDateTime` AS `AnimalControlIncidentDate`,`mt`.`MovementType` AS `ActiveMovementTypeName`,`am`.`AdoptionNumber` AS `ActiveMovementAdoptionNumber`,`am`.`ReturnDate` AS `ActiveMovementReturnDate`,`am`.`InsuranceNumber` AS `ActiveMovementInsuranceNumber`,`am`.`ReasonForReturn` AS `ActiveMovementReasonForReturn`,`am`.`TrialEndDate` AS `ActiveMovementTrialEndDate`,`am`.`Comments` AS `ActiveMovementComments`,`am`.`ReservationDate` AS `ActiveMovementReservationDate`,`am`.`Donation` AS `ActiveMovementDonation`,`am`.`CreatedBy` AS `ActiveMovementCreatedBy`,`au`.`RealName` AS `ActiveMovementCreatedByName`,`am`.`CreatedDate` AS `ActiveMovementCreatedDate`,`am`.`LastChangedBy` AS `ActiveMovementLastChangedBy`,`am`.`LastChangedDate` AS `ActiveMovementLastChangedDate`,(case when exists(select `configuration`.`ItemValue` from `configuration` where ((`configuration`.`ItemName` like 'UseShortShelterCodes') and (`configuration`.`ItemValue` = 'Yes'))) then `a`.`ShortCode` else `a`.`ShelterCode` end) AS `Code`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` in (2,8,13))) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes`,(select count(0) from `media` `mtc` where ((`mtc`.`MediaMimeType` = 'image/jpeg') and (`mtc`.`LinkTypeID` = 0) and (`mtc`.`LinkID` = `a`.`ID`) and (`mtc`.`ExcludeFromPublish` = 0))) AS `WebsiteImageCount`,`doc`.`MediaName` AS `DocMediaName`,`doc`.`Date` AS `DocMediaDate`,`vid`.`MediaName` AS `WebsiteVideoURL`,`vid`.`MediaNotes` AS `WebsiteVideoNotes`,(case when exists(select `adoption`.`ID` from `adoption` where ((`adoption`.`AnimalID` = `a`.`ID`) and (`adoption`.`MovementType` = 1) and (`adoption`.`MovementDate` > '2019-03-02 00:00:00'))) then 1 else 0 end) AS `HasFutureAdoption`,(select count(0) from `media` where ((`media`.`MediaMimeType` = 'image/jpeg') and (`media`.`Date` >= '2019-02-28 00:00:00') and (`media`.`LinkID` = `a`.`ID`) and (`media`.`LinkTypeID` = 0))) AS `RecentlyChangedImages`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`NonShelterAnimal`)) AS `NonShelterAnimalName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`CrueltyCase`)) AS `CrueltyCaseName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`CrossBreed`)) AS `CrossBreedName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`EstimatedDOB`)) AS `EstimatedDOBName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`Identichipped`)) AS `IdentichippedName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`Tattoo`)) AS `TattooName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`Neutered`)) AS `NeuteredName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`CombiTested`)) AS `CombiTestedName`,(select `l`.`Name` from `lksposneg` `l` where (`l`.`ID` = `a`.`CombiTestResult`)) AS `CombiTestResultName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`HeartwormTested`)) AS `HeartwormTestedName`,(select `l`.`Name` from `lksposneg` `l` where (`l`.`ID` = `a`.`HeartwormTestResult`)) AS `HeartwormTestResultName`,(select `l`.`Name` from `lksposneg` `l` where (`l`.`ID` = `a`.`FLVResult`)) AS `FLVResultName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`Declawed`)) AS `DeclawedName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`PutToSleep`)) AS `PutToSleepName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsDOA`)) AS `IsDOAName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsTransfer`)) AS `IsTransferName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsPickup`)) AS `IsPickupName`,(select `l`.`Name` from `lksynun` `l` where (`l`.`ID` = `a`.`IsGoodWithChildren`)) AS `IsGoodWithChildrenName`,(select `l`.`Name` from `lksynun` `l` where (`l`.`ID` = `a`.`IsGoodWithCats`)) AS `IsGoodWithCatsName`,(select `l`.`Name` from `lksynun` `l` where (`l`.`ID` = `a`.`IsGoodWithDogs`)) AS `IsGoodWithDogsName`,(select `l`.`Name` from `lksynun` `l` where (`l`.`ID` = `a`.`IsHouseTrained`)) AS `IsHouseTrainedName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsNotAvailableForAdoption`)) AS `IsNotAvailableForAdoptionName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`IsNotForRegistration`)) AS `IsNotForRegistrationName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`HasSpecialNeeds`)) AS `HasSpecialNeedsName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`DiedOffShelter`)) AS `DiedOffShelterName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`HasActiveReserve`)) AS `HasActiveReserveName`,(select `l`.`Name` from `lksyesno` `l` where (`l`.`ID` = `a`.`HasTrialAdoption`)) AS `HasTrialAdoptionName` from ((((((((((((((((((((((((((((((((((`animal` `a` left join `animal` `ba1` on((`ba1`.`ID` = `a`.`BondedAnimalID`))) left join `animal` `ba2` on((`ba2`.`ID` = `a`.`BondedAnimal2ID`))) left join `animaltype` `at` on((`at`.`ID` = `a`.`AnimalTypeID`))) left join `basecolour` `bc` on((`bc`.`ID` = `a`.`BaseColourID`))) left join `species` `sp` on((`sp`.`ID` = `a`.`SpeciesID`))) left join `lksex` `sx` on((`sx`.`ID` = `a`.`Sex`))) left join `lksize` `sz` on((`sz`.`ID` = `a`.`Size`))) left join `entryreason` `er` on((`er`.`ID` = `a`.`EntryReasonID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`))) left join `site` `se` on((`se`.`ID` = `il`.`SiteID`))) left join `pickuplocation` `pl` on((`pl`.`ID` = `a`.`PickupLocationID`))) left join `media` `web` on(((`web`.`LinkID` = `a`.`ID`) and (`web`.`LinkTypeID` = 0) and (`web`.`WebsitePhoto` = 1)))) left join `media` `vid` on(((`vid`.`LinkID` = `a`.`ID`) and (`vid`.`LinkTypeID` = 0) and (`vid`.`WebsiteVideo` = 1)))) left join `media` `doc` on(((`doc`.`LinkID` = `a`.`ID`) and (`doc`.`LinkTypeID` = 0) and (`doc`.`DocPhoto` = 1)))) left join `breed` `bd` on((`bd`.`ID` = `a`.`BreedID`))) left join `breed` `bd2` on((`bd2`.`ID` = `a`.`Breed2ID`))) left join `lkcoattype` `ct` on((`ct`.`ID` = `a`.`CoatType`))) left join `deathreason` `dr` on((`dr`.`ID` = `a`.`PTSReasonID`))) left join `lksmovementtype` `mt` on((`mt`.`ID` = `a`.`ActiveMovementType`))) left join `owner` `ov` on((`ov`.`ID` = `a`.`OwnersVetID`))) left join `owner` `cv` on((`cv`.`ID` = `a`.`CurrentVetID`))) left join `owner` `nv` on((`nv`.`ID` = `a`.`NeuteredByVetID`))) left join `owner` `oo` on((`oo`.`ID` = `a`.`OriginalOwnerID`))) left join `owner` `bo` on((`bo`.`ID` = `a`.`BroughtInByOwnerID`))) left join `owner` `ao` on((`ao`.`ID` = `a`.`AdoptionCoordinatorID`))) left join `adoption` `am` on((`am`.`ID` = `a`.`ActiveMovementID`))) left join `users` `au` on((`au`.`UserName` = `am`.`CreatedBy`))) left join `owner` `co` on((`co`.`ID` = `am`.`OwnerID`))) left join `animalcontrolanimal` `aca` on(((`a`.`ID` = `aca`.`AnimalID`) and (`aca`.`AnimalControlID` = (select max(`saca`.`AnimalControlID`) from `animalcontrolanimal` `saca` where (`saca`.`AnimalID` = `a`.`ID`)))))) left join `animalcontrol` `ac` on((`ac`.`ID` = `aca`.`AnimalControlID`))) left join `incidenttype` `itn` on((`itn`.`ID` = `ac`.`IncidentTypeID`))) left join `adoption` `ar` on(((`ar`.`AnimalID` = `a`.`ID`) and (`ar`.`MovementType` = 0) and isnull(`ar`.`MovementDate`) and (`ar`.`ReservationDate` is not null) and isnull(`ar`.`ReservationCancelledDate`) and (`ar`.`ID` = (select max(`sar`.`ID`) from `adoption` `sar` where ((`sar`.`AnimalID` = `a`.`ID`) and (`sar`.`MovementType` = 0) and isnull(`sar`.`MovementDate`) and (`sar`.`ReservationDate` is not null) and isnull(`sar`.`ReservationCancelledDate`))))))) left join `reservationstatus` `ars` on((`ars`.`ID` = `ar`.`ReservationStatusID`))) left join `owner` `ro` on((`ro`.`ID` = `ar`.`OwnerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animalcontrol`
--

/*!50001 DROP VIEW IF EXISTS `v_animalcontrol`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animalcontrol` AS select `ac`.`ID` AS `ID`,`ac`.`IncidentDateTime` AS `IncidentDateTime`,`ac`.`IncidentTypeID` AS `IncidentTypeID`,`ac`.`CallDateTime` AS `CallDateTime`,`ac`.`CallNotes` AS `CallNotes`,`ac`.`CallTaker` AS `CallTaker`,`ac`.`CallerID` AS `CallerID`,`ac`.`VictimID` AS `VictimID`,`ac`.`DispatchAddress` AS `DispatchAddress`,`ac`.`DispatchTown` AS `DispatchTown`,`ac`.`DispatchCounty` AS `DispatchCounty`,`ac`.`DispatchPostcode` AS `DispatchPostcode`,`ac`.`DispatchLatLong` AS `DispatchLatLong`,`ac`.`DispatchedACO` AS `DispatchedACO`,`ac`.`PickupLocationID` AS `PickupLocationID`,`ac`.`JurisdictionID` AS `JurisdictionID`,`ac`.`DispatchDateTime` AS `DispatchDateTime`,`ac`.`RespondedDateTime` AS `RespondedDateTime`,`ac`.`FollowupDateTime` AS `FollowupDateTime`,`ac`.`FollowupComplete` AS `FollowupComplete`,`ac`.`FollowupDateTime2` AS `FollowupDateTime2`,`ac`.`FollowupComplete2` AS `FollowupComplete2`,`ac`.`FollowupDateTime3` AS `FollowupDateTime3`,`ac`.`FollowupComplete3` AS `FollowupComplete3`,`ac`.`CompletedDate` AS `CompletedDate`,`ac`.`IncidentCompletedID` AS `IncidentCompletedID`,`ac`.`SiteID` AS `SiteID`,`ac`.`OwnerID` AS `OwnerID`,`ac`.`Owner2ID` AS `Owner2ID`,`ac`.`Owner3ID` AS `Owner3ID`,`ac`.`AnimalID` AS `AnimalID`,`ac`.`AnimalDescription` AS `AnimalDescription`,`ac`.`SpeciesID` AS `SpeciesID`,`ac`.`Sex` AS `Sex`,`ac`.`AgeGroup` AS `AgeGroup`,`ac`.`RecordVersion` AS `RecordVersion`,`ac`.`CreatedBy` AS `CreatedBy`,`ac`.`CreatedDate` AS `CreatedDate`,`ac`.`LastChangedBy` AS `LastChangedBy`,`ac`.`LastChangedDate` AS `LastChangedDate`,`ac`.`ID` AS `ACID`,`s`.`SpeciesName` AS `SpeciesName`,`x`.`Sex` AS `SexName`,`co`.`OwnerName` AS `CallerName`,`co`.`OwnerAddress` AS `CallerAddress`,`co`.`OwnerTown` AS `CallerTown`,`co`.`OwnerCounty` AS `CallerCounty`,`co`.`OwnerPostcode` AS `CallerPostcode`,`co`.`HomeTelephone` AS `CallerHomeTelephone`,`co`.`WorkTelephone` AS `CallerWorkTelephone`,`co`.`MobileTelephone` AS `CallerMobileTelephone`,`o1`.`OwnerName` AS `OwnerName`,`o1`.`OwnerName` AS `OwnerName1`,`o2`.`OwnerName` AS `OwnerName2`,`o3`.`OwnerName` AS `OwnerName3`,`o1`.`OwnerName` AS `SuspectName`,`o1`.`OwnerAddress` AS `SuspectAddress`,`o1`.`OwnerTown` AS `SuspectTown`,`o1`.`OwnerCounty` AS `SuspectCounty`,`o1`.`OwnerPostcode` AS `SuspectPostcode`,`o1`.`HomeTelephone` AS `SuspectHomeTelephone`,`o1`.`WorkTelephone` AS `SuspectWorkTelephone`,`o1`.`MobileTelephone` AS `SuspectMobileTelephone`,`vo`.`OwnerName` AS `VictimName`,`vo`.`OwnerAddress` AS `VictimAddress`,`vo`.`OwnerTown` AS `VictimTown`,`vo`.`OwnerCounty` AS `VictimCounty`,`vo`.`OwnerPostcode` AS `VictimPostcode`,`vo`.`HomeTelephone` AS `VictimHomeTelephone`,`vo`.`WorkTelephone` AS `VictimWorkTelephone`,`vo`.`MobileTelephone` AS `VictimMobileTelephone`,`ti`.`IncidentName` AS `IncidentName`,`ci`.`CompletedName` AS `CompletedName`,`pl`.`LocationName` AS `LocationName`,`j`.`JurisdictionName` AS `JurisdictionName`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes`,`doc`.`MediaName` AS `DocMediaName`,`doc`.`Date` AS `DocMediaDate` from (((((((((((((`animalcontrol` `ac` left join `species` `s` on((`s`.`ID` = `ac`.`SpeciesID`))) left join `lksex` `x` on((`x`.`ID` = `ac`.`Sex`))) left join `jurisdiction` `j` on((`j`.`ID` = `ac`.`JurisdictionID`))) left join `owner` `co` on((`co`.`ID` = `ac`.`CallerID`))) left join `owner` `o1` on((`o1`.`ID` = `ac`.`OwnerID`))) left join `owner` `o2` on((`o2`.`ID` = `ac`.`Owner2ID`))) left join `owner` `o3` on((`o3`.`ID` = `ac`.`Owner3ID`))) left join `owner` `vo` on((`vo`.`ID` = `ac`.`VictimID`))) left join `media` `web` on(((`web`.`LinkID` = `ac`.`ID`) and (`web`.`LinkTypeID` = 6) and (`web`.`WebsitePhoto` = 1)))) left join `media` `doc` on(((`doc`.`LinkID` = `ac`.`ID`) and (`doc`.`LinkTypeID` = 6) and (`doc`.`DocPhoto` = 1)))) left join `pickuplocation` `pl` on((`pl`.`ID` = `ac`.`PickupLocationID`))) left join `incidenttype` `ti` on((`ti`.`ID` = `ac`.`IncidentTypeID`))) left join `incidentcompleted` `ci` on((`ci`.`ID` = `ac`.`IncidentCompletedID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animalfound`
--

/*!50001 DROP VIEW IF EXISTS `v_animalfound`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animalfound` AS select `a`.`ID` AS `ID`,`a`.`AnimalTypeID` AS `AnimalTypeID`,`a`.`DateReported` AS `DateReported`,`a`.`DateFound` AS `DateFound`,`a`.`Sex` AS `Sex`,`a`.`BreedID` AS `BreedID`,`a`.`AgeGroup` AS `AgeGroup`,`a`.`BaseColourID` AS `BaseColourID`,`a`.`DistFeat` AS `DistFeat`,`a`.`AreaFound` AS `AreaFound`,`a`.`AreaPostcode` AS `AreaPostcode`,`a`.`OwnerID` AS `OwnerID`,`a`.`ReturnToOwnerDate` AS `ReturnToOwnerDate`,`a`.`Comments` AS `Comments`,`a`.`RecordVersion` AS `RecordVersion`,`a`.`CreatedBy` AS `CreatedBy`,`a`.`CreatedDate` AS `CreatedDate`,`a`.`LastChangedBy` AS `LastChangedBy`,`a`.`LastChangedDate` AS `LastChangedDate`,`a`.`ID` AS `LFID`,`s`.`SpeciesName` AS `SpeciesName`,`b`.`BreedName` AS `BreedName`,`c`.`BaseColour` AS `BaseColourName`,`c`.`AdoptAPetColour` AS `AdoptAPetColour`,`x`.`Sex` AS `SexName`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForeNames`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `DocMediaName`,`web`.`Date` AS `DocMediaDate`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes` from ((((((`animalfound` `a` left join `breed` `b` on((`a`.`BreedID` = `b`.`ID`))) left join `species` `s` on((`a`.`AnimalTypeID` = `s`.`ID`))) left join `basecolour` `c` on((`a`.`BaseColourID` = `c`.`ID`))) left join `lksex` `x` on((`a`.`Sex` = `x`.`ID`))) left join `media` `web` on(((`web`.`LinkID` = `a`.`ID`) and (`web`.`LinkTypeID` = 2) and (`web`.`WebsitePhoto` = 1)))) left join `owner` `o` on((`a`.`OwnerID` = `o`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animallost`
--

/*!50001 DROP VIEW IF EXISTS `v_animallost`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animallost` AS select `a`.`ID` AS `ID`,`a`.`AnimalTypeID` AS `AnimalTypeID`,`a`.`DateReported` AS `DateReported`,`a`.`DateLost` AS `DateLost`,`a`.`DateFound` AS `DateFound`,`a`.`Sex` AS `Sex`,`a`.`BreedID` AS `BreedID`,`a`.`AgeGroup` AS `AgeGroup`,`a`.`BaseColourID` AS `BaseColourID`,`a`.`DistFeat` AS `DistFeat`,`a`.`AreaLost` AS `AreaLost`,`a`.`AreaPostcode` AS `AreaPostcode`,`a`.`OwnerID` AS `OwnerID`,`a`.`Comments` AS `Comments`,`a`.`RecordVersion` AS `RecordVersion`,`a`.`CreatedBy` AS `CreatedBy`,`a`.`CreatedDate` AS `CreatedDate`,`a`.`LastChangedBy` AS `LastChangedBy`,`a`.`LastChangedDate` AS `LastChangedDate`,`a`.`ID` AS `LFID`,`s`.`SpeciesName` AS `SpeciesName`,`b`.`BreedName` AS `BreedName`,`c`.`BaseColour` AS `BaseColourName`,`c`.`AdoptAPetColour` AS `AdoptAPetColour`,`x`.`Sex` AS `SexName`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForeNames`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `DocMediaName`,`web`.`Date` AS `DocMediaDate`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes` from ((((((`animallost` `a` left join `breed` `b` on((`a`.`BreedID` = `b`.`ID`))) left join `species` `s` on((`a`.`AnimalTypeID` = `s`.`ID`))) left join `basecolour` `c` on((`a`.`BaseColourID` = `c`.`ID`))) left join `lksex` `x` on((`a`.`Sex` = `x`.`ID`))) left join `media` `web` on(((`web`.`LinkID` = `a`.`ID`) and (`web`.`LinkTypeID` = 1) and (`web`.`WebsitePhoto` = 1)))) left join `owner` `o` on((`a`.`OwnerID` = `o`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animalmedicaltreatment`
--

/*!50001 DROP VIEW IF EXISTS `v_animalmedicaltreatment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animalmedicaltreatment` AS select `a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`AnimalName` AS `AnimalName`,`a`.`Archived` AS `Archived`,`a`.`ActiveMovementID` AS `ActiveMovementID`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`AcceptanceNumber` AS `AcceptanceNumber`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`ShelterLocation` AS `ShelterLocation`,`a`.`Neutered` AS `Neutered`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,(select `species`.`SpeciesName` from `species` where (`species`.`ID` = `a`.`SpeciesID`)) AS `SpeciesName`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 8)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 8)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` = 0)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,`co`.`ID` AS `CurrentOwnerID`,`co`.`OwnerName` AS `CurrentOwnerName`,`am`.`ID` AS `ID`,`am`.`AnimalID` AS `AnimalID`,`am`.`MedicalProfileID` AS `MedicalProfileID`,`am`.`TreatmentName` AS `TreatmentName`,`am`.`StartDate` AS `StartDate`,`am`.`Dosage` AS `Dosage`,`am`.`Cost` AS `Cost`,`am`.`CostPaidDate` AS `CostPaidDate`,`am`.`TimingRule` AS `TimingRule`,`am`.`TimingRuleFrequency` AS `TimingRuleFrequency`,`am`.`TimingRuleNoFrequencies` AS `TimingRuleNoFrequencies`,`am`.`TreatmentRule` AS `TreatmentRule`,`am`.`TotalNumberOfTreatments` AS `TotalNumberOfTreatments`,`am`.`TreatmentsGiven` AS `TreatmentsGiven`,`am`.`TreatmentsRemaining` AS `TreatmentsRemaining`,`am`.`Status` AS `Status`,`am`.`Comments` AS `Comments`,`am`.`RecordVersion` AS `RecordVersion`,`am`.`CreatedBy` AS `CreatedBy`,`am`.`CreatedDate` AS `CreatedDate`,`am`.`LastChangedBy` AS `LastChangedBy`,`am`.`LastChangedDate` AS `LastChangedDate`,`amt`.`DateRequired` AS `DateRequired`,`amt`.`DateGiven` AS `DateGiven`,`amt`.`Comments` AS `TreatmentComments`,`amt`.`TreatmentNumber` AS `TreatmentNumber`,`amt`.`TotalTreatments` AS `TotalTreatments`,`ma`.`MediaName` AS `WebsiteMediaName`,`am`.`ID` AS `RegimenID`,`amt`.`ID` AS `TreatmentID`,`amt`.`GivenBy` AS `GivenBy`,`amt`.`AdministeringVetID` AS `AdministeringVetID`,`adv`.`OwnerName` AS `AdministeringVetName`,`adv`.`OwnerAddress` AS `AdministeringVetAddress`,`adv`.`OwnerTown` AS `AdministeringVetTown`,`adv`.`OwnerCounty` AS `AdministeringVetCounty`,`adv`.`OwnerPostcode` AS `AdministeringVetPostcode`,`adv`.`EmailAddress` AS `AdministeringVetEmail`,`adv`.`MembershipNumber` AS `AdministeringVetLicence`,`am`.`Comments` AS `RegimenComments`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then (select `mt`.`MovementType` from `lksmovementtype` `mt` where (`mt`.`ID` = `a`.`ActiveMovementType`)) else `il`.`LocationName` end) AS `LocationName`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then '' else `a`.`ShelterLocationUnit` end) AS `LocationUnit`,`il`.`LocationName` AS `ShelterLocationName`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,concat(`am`.`ID`,'_',`amt`.`ID`) AS `CompositeID`,(case when (`am`.`TimingRule` = 0) then 'One Off' when (`am`.`TimingRuleFrequency` = 0) then concat(`am`.`TimingRule`,' treatments every ',`am`.`TimingRuleNoFrequencies`,' days') when (`am`.`TimingRuleFrequency` = 1) then concat(`am`.`TimingRule`,' treatments every ',`am`.`TimingRuleNoFrequencies`,' weeks') when (`am`.`TimingRuleFrequency` = 2) then concat(`am`.`TimingRule`,' treatments every ',`am`.`TimingRuleNoFrequencies`,' months') when (`am`.`TimingRuleFrequency` = 3) then concat(`am`.`TimingRule`,' treatments every ',`am`.`TimingRuleNoFrequencies`,' years') end) AS `NamedFrequency`,(case when (`am`.`TimingRule` = 0) then '1 treatment' when (`am`.`TreatmentRule` = 1) then 'Unspecified' else concat((`am`.`TimingRule` * `am`.`TotalNumberOfTreatments`),' treatments') end) AS `NamedNumberOfTreatments`,(case when (`am`.`Status` = 0) then 'Active' when (`am`.`Status` = 1) then 'Held' when (`am`.`Status` = 2) then 'Completed' end) AS `NamedStatus` from (((((((`animal` `a` left join `adoption` `ad` on((`ad`.`ID` = `a`.`ActiveMovementID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `media` `ma` on(((`ma`.`LinkID` = `a`.`ID`) and (`ma`.`LinkTypeID` = 0) and (`ma`.`WebsitePhoto` = 1)))) join `animalmedical` `am` on((`a`.`ID` = `am`.`AnimalID`))) join `animalmedicaltreatment` `amt` on((`amt`.`AnimalMedicalID` = `am`.`ID`))) left join `owner` `adv` on((`adv`.`ID` = `amt`.`AdministeringVetID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animaltest`
--

/*!50001 DROP VIEW IF EXISTS `v_animaltest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animaltest` AS select `at`.`ID` AS `ID`,`at`.`AnimalID` AS `AnimalID`,`at`.`TestTypeID` AS `TestTypeID`,`at`.`TestResultID` AS `TestResultID`,`at`.`AdministeringVetID` AS `AdministeringVetID`,`at`.`DateOfTest` AS `DateOfTest`,`at`.`DateRequired` AS `DateRequired`,`at`.`Cost` AS `Cost`,`at`.`CostPaidDate` AS `CostPaidDate`,`at`.`Comments` AS `Comments`,`at`.`RecordVersion` AS `RecordVersion`,`at`.`CreatedBy` AS `CreatedBy`,`at`.`CreatedDate` AS `CreatedDate`,`at`.`LastChangedBy` AS `LastChangedBy`,`at`.`LastChangedDate` AS `LastChangedDate`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`Archived` AS `Archived`,`a`.`ActiveMovementID` AS `ActiveMovementID`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`AcceptanceNumber` AS `AcceptanceNumber`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`ShelterLocation` AS `ShelterLocation`,`a`.`Neutered` AS `Neutered`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,(select `species`.`SpeciesName` from `species` where (`species`.`ID` = `a`.`SpeciesID`)) AS `SpeciesName`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 8)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 8)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` = 0)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,`co`.`ID` AS `CurrentOwnerID`,`co`.`OwnerName` AS `CurrentOwnerName`,`a`.`AnimalName` AS `AnimalName`,`ma`.`MediaName` AS `WebsiteMediaName`,`tt`.`TestName` AS `TestName`,`tt`.`TestDescription` AS `TestDescription`,`tr`.`ResultName` AS `ResultName`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then (select `mt`.`MovementType` from `lksmovementtype` `mt` where (`mt`.`ID` = `a`.`ActiveMovementType`)) else `il`.`LocationName` end) AS `LocationName`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then '' else `a`.`ShelterLocationUnit` end) AS `LocationUnit`,`il`.`LocationName` AS `ShelterLocationName`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`adv`.`OwnerName` AS `AdministeringVetName`,`adv`.`OwnerAddress` AS `AdministeringVetAddress`,`adv`.`OwnerTown` AS `AdministeringVetTown`,`adv`.`OwnerCounty` AS `AdministeringVetCounty`,`adv`.`OwnerPostcode` AS `AdministeringVetPostcode`,`adv`.`EmailAddress` AS `AdministeringVetEmail`,`adv`.`MembershipNumber` AS `AdministeringVetLicence` from ((((((((`animal` `a` left join `adoption` `ad` on((`ad`.`ID` = `a`.`ActiveMovementID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `media` `ma` on(((`ma`.`LinkID` = `a`.`ID`) and (`ma`.`LinkTypeID` = 0) and (`ma`.`WebsitePhoto` = 1)))) join `animaltest` `at` on((`a`.`ID` = `at`.`AnimalID`))) join `testtype` `tt` on((`tt`.`ID` = `at`.`TestTypeID`))) left join `testresult` `tr` on((`tr`.`ID` = `at`.`TestResultID`))) left join `owner` `adv` on((`adv`.`ID` = `at`.`AdministeringVetID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animalvaccination`
--

/*!50001 DROP VIEW IF EXISTS `v_animalvaccination`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animalvaccination` AS select `av`.`ID` AS `ID`,`av`.`AnimalID` AS `AnimalID`,`av`.`VaccinationID` AS `VaccinationID`,`av`.`AdministeringVetID` AS `AdministeringVetID`,`av`.`DateOfVaccination` AS `DateOfVaccination`,`av`.`GivenBy` AS `GivenBy`,`av`.`DateRequired` AS `DateRequired`,`av`.`DateExpires` AS `DateExpires`,`av`.`BatchNumber` AS `BatchNumber`,`av`.`Manufacturer` AS `Manufacturer`,`av`.`Cost` AS `Cost`,`av`.`CostPaidDate` AS `CostPaidDate`,`av`.`Comments` AS `Comments`,`av`.`RecordVersion` AS `RecordVersion`,`av`.`CreatedBy` AS `CreatedBy`,`av`.`CreatedDate` AS `CreatedDate`,`av`.`LastChangedBy` AS `LastChangedBy`,`av`.`LastChangedDate` AS `LastChangedDate`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`Archived` AS `Archived`,`a`.`ActiveMovementID` AS `ActiveMovementID`,`a`.`ActiveMovementType` AS `ActiveMovementType`,`a`.`DeceasedDate` AS `DeceasedDate`,`a`.`AcceptanceNumber` AS `AcceptanceNumber`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`ShelterLocation` AS `ShelterLocation`,`a`.`Neutered` AS `Neutered`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,(select `species`.`SpeciesName` from `species` where (`species`.`ID` = `a`.`SpeciesID`)) AS `SpeciesName`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 8)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 8)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` = 0)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,`co`.`ID` AS `CurrentOwnerID`,`co`.`OwnerName` AS `CurrentOwnerName`,`a`.`AnimalName` AS `AnimalName`,`ma`.`MediaName` AS `WebsiteMediaName`,`vt`.`VaccinationType` AS `VaccinationType`,`vt`.`VaccinationDescription` AS `VaccinationDescription`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then (select `mt`.`MovementType` from `lksmovementtype` `mt` where (`mt`.`ID` = `a`.`ActiveMovementType`)) else `il`.`LocationName` end) AS `LocationName`,(case when ((`a`.`ActiveMovementType` is not null) and (`a`.`ActiveMovementType` > 0)) then '' else `a`.`ShelterLocationUnit` end) AS `LocationUnit`,`il`.`LocationName` AS `ShelterLocationName`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`adv`.`OwnerName` AS `AdministeringVetName`,`adv`.`OwnerAddress` AS `AdministeringVetAddress`,`adv`.`OwnerTown` AS `AdministeringVetTown`,`adv`.`OwnerCounty` AS `AdministeringVetCounty`,`adv`.`OwnerPostcode` AS `AdministeringVetPostcode`,`adv`.`EmailAddress` AS `AdministeringVetEmail`,`adv`.`MembershipNumber` AS `AdministeringVetLicence` from (((((((`animal` `a` left join `adoption` `ad` on((`ad`.`ID` = `a`.`ActiveMovementID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `media` `ma` on(((`ma`.`LinkID` = `a`.`ID`) and (`ma`.`LinkTypeID` = 0) and (`ma`.`WebsitePhoto` = 1)))) join `animalvaccination` `av` on((`a`.`ID` = `av`.`AnimalID`))) left join `owner` `adv` on((`adv`.`ID` = `av`.`AdministeringVetID`))) left join `vaccinationtype` `vt` on((`vt`.`ID` = `av`.`VaccinationID`))) left join `internallocation` `il` on((`il`.`ID` = `a`.`ShelterLocation`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_animalwaitinglist`
--

/*!50001 DROP VIEW IF EXISTS `v_animalwaitinglist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_animalwaitinglist` AS select `a`.`ID` AS `ID`,`a`.`SpeciesID` AS `SpeciesID`,`a`.`Size` AS `Size`,`a`.`DatePutOnList` AS `DatePutOnList`,`a`.`OwnerID` AS `OwnerID`,`a`.`AnimalDescription` AS `AnimalDescription`,`a`.`ReasonForWantingToPart` AS `ReasonForWantingToPart`,`a`.`CanAffordDonation` AS `CanAffordDonation`,`a`.`Urgency` AS `Urgency`,`a`.`DateRemovedFromList` AS `DateRemovedFromList`,`a`.`AutoRemovePolicy` AS `AutoRemovePolicy`,`a`.`DateOfLastOwnerContact` AS `DateOfLastOwnerContact`,`a`.`ReasonForRemoval` AS `ReasonForRemoval`,`a`.`Comments` AS `Comments`,`a`.`UrgencyUpdateDate` AS `UrgencyUpdateDate`,`a`.`UrgencyLastUpdatedDate` AS `UrgencyLastUpdatedDate`,`a`.`RecordVersion` AS `RecordVersion`,`a`.`CreatedBy` AS `CreatedBy`,`a`.`CreatedDate` AS `CreatedDate`,`a`.`LastChangedBy` AS `LastChangedBy`,`a`.`LastChangedDate` AS `LastChangedDate`,`a`.`ID` AS `WLID`,`s`.`SpeciesName` AS `SpeciesName`,`sz`.`Size` AS `SizeName`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForeNames`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`o`.`EmailAddress` AS `EmailAddress`,`u`.`Urgency` AS `UrgencyName`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `DocMediaName`,`web`.`Date` AS `DocMediaDate`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes` from (((((`animalwaitinglist` `a` left join `lksize` `sz` on((`sz`.`ID` = `a`.`Size`))) left join `media` `web` on(((`web`.`LinkID` = `a`.`ID`) and (`web`.`LinkTypeID` = 5) and (`web`.`WebsitePhoto` = 1)))) join `species` `s` on((`s`.`ID` = `a`.`SpeciesID`))) join `owner` `o` on((`o`.`ID` = `a`.`OwnerID`))) join `lkurgency` `u` on((`u`.`ID` = `a`.`Urgency`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_owner`
--

/*!50001 DROP VIEW IF EXISTS `v_owner`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_owner` AS select `o`.`ID` AS `ID`,`o`.`OwnerType` AS `OwnerType`,`o`.`OwnerCode` AS `OwnerCode`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerForeNames` AS `OwnerForeNames`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerName` AS `OwnerName`,`o`.`IsDeceased` AS `IsDeceased`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`LatLong` AS `LatLong`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`o`.`EmailAddress` AS `EmailAddress`,`o`.`ExcludeFromBulkEmail` AS `ExcludeFromBulkEmail`,`o`.`GDPRContactOptIn` AS `GDPRContactOptIn`,`o`.`JurisdictionID` AS `JurisdictionID`,`o`.`IDCheck` AS `IDCheck`,`o`.`Comments` AS `Comments`,`o`.`SiteID` AS `SiteID`,`o`.`IsBanned` AS `IsBanned`,`o`.`IsVolunteer` AS `IsVolunteer`,`o`.`IsHomeChecker` AS `IsHomeChecker`,`o`.`IsMember` AS `IsMember`,`o`.`MembershipExpiryDate` AS `MembershipExpiryDate`,`o`.`MembershipNumber` AS `MembershipNumber`,`o`.`IsAdoptionCoordinator` AS `IsAdoptionCoordinator`,`o`.`IsDonor` AS `IsDonor`,`o`.`IsDriver` AS `IsDriver`,`o`.`IsShelter` AS `IsShelter`,`o`.`IsACO` AS `IsACO`,`o`.`IsStaff` AS `IsStaff`,`o`.`IsFosterer` AS `IsFosterer`,`o`.`FosterCapacity` AS `FosterCapacity`,`o`.`IsRetailer` AS `IsRetailer`,`o`.`IsVet` AS `IsVet`,`o`.`IsGiftAid` AS `IsGiftAid`,`o`.`AdditionalFlags` AS `AdditionalFlags`,`o`.`HomeCheckAreas` AS `HomeCheckAreas`,`o`.`DateLastHomeChecked` AS `DateLastHomeChecked`,`o`.`HomeCheckedBy` AS `HomeCheckedBy`,`o`.`MatchAdded` AS `MatchAdded`,`o`.`MatchExpires` AS `MatchExpires`,`o`.`MatchActive` AS `MatchActive`,`o`.`MatchSex` AS `MatchSex`,`o`.`MatchSize` AS `MatchSize`,`o`.`MatchColour` AS `MatchColour`,`o`.`MatchAgeFrom` AS `MatchAgeFrom`,`o`.`MatchAgeTo` AS `MatchAgeTo`,`o`.`MatchAnimalType` AS `MatchAnimalType`,`o`.`MatchSpecies` AS `MatchSpecies`,`o`.`MatchBreed` AS `MatchBreed`,`o`.`MatchBreed2` AS `MatchBreed2`,`o`.`MatchGoodWithCats` AS `MatchGoodWithCats`,`o`.`MatchGoodWithDogs` AS `MatchGoodWithDogs`,`o`.`MatchGoodWithChildren` AS `MatchGoodWithChildren`,`o`.`MatchHouseTrained` AS `MatchHouseTrained`,`o`.`MatchCommentsContain` AS `MatchCommentsContain`,`o`.`RecordVersion` AS `RecordVersion`,`o`.`CreatedBy` AS `CreatedBy`,`o`.`CreatedDate` AS `CreatedDate`,`o`.`LastChangedBy` AS `LastChangedBy`,`o`.`LastChangedDate` AS `LastChangedDate`,`o`.`ID` AS `PersonID`,`ho`.`OwnerName` AS `HomeCheckedByName`,`ho`.`HomeTelephone` AS `HomeCheckedByHomeTelephone`,`ho`.`MobileTelephone` AS `HomeCheckedByMobileTelephone`,`ho`.`EmailAddress` AS `HomeCheckedByEmail`,`j`.`JurisdictionName` AS `JurisdictionName`,`web`.`ID` AS `WebsiteMediaID`,`web`.`MediaName` AS `WebsiteMediaName`,`web`.`Date` AS `WebsiteMediaDate`,`web`.`MediaNotes` AS `WebsiteMediaNotes`,`doc`.`MediaName` AS `DocMediaName`,`doc`.`Date` AS `DocMediaDate` from ((((`owner` `o` left join `owner` `ho` on((`ho`.`ID` = `o`.`HomeCheckedBy`))) left join `media` `web` on(((`web`.`LinkID` = `o`.`ID`) and (`web`.`LinkTypeID` = 3) and (`web`.`WebsitePhoto` = 1)))) left join `media` `doc` on(((`doc`.`LinkID` = `o`.`ID`) and (`doc`.`LinkTypeID` = 3) and (`doc`.`DocPhoto` = 1)))) left join `jurisdiction` `j` on((`j`.`ID` = `o`.`JurisdictionID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ownercitation`
--

/*!50001 DROP VIEW IF EXISTS `v_ownercitation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ownercitation` AS select `oc`.`ID` AS `ID`,`oc`.`CitationTypeID` AS `CitationTypeID`,`oc`.`CitationDate` AS `CitationDate`,`oc`.`Comments` AS `Comments`,`ct`.`CitationName` AS `CitationName`,`oc`.`FineAmount` AS `FineAmount`,`oc`.`FineDueDate` AS `FineDueDate`,`oc`.`FinePaidDate` AS `FinePaidDate`,`oc`.`AnimalControlID` AS `AnimalControlID`,`oc`.`OwnerID` AS `OwnerID`,`ti`.`IncidentName` AS `IncidentName`,`oc`.`CreatedBy` AS `CreatedBy`,`oc`.`CreatedDate` AS `CreatedDate`,`oc`.`LastChangedBy` AS `LastChangedBy`,`oc`.`LastChangedDate` AS `LastChangedDate`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName` from ((((`ownercitation` `oc` join `citationtype` `ct` on((`ct`.`ID` = `oc`.`CitationTypeID`))) join `owner` `o` on((`o`.`ID` = `oc`.`OwnerID`))) left join `animalcontrol` `ac` on((`ac`.`ID` = `oc`.`AnimalControlID`))) left join `incidenttype` `ti` on((`ti`.`ID` = `ac`.`IncidentTypeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ownerdonation`
--

/*!50001 DROP VIEW IF EXISTS `v_ownerdonation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ownerdonation` AS select `od`.`ID` AS `ID`,`od`.`DonationTypeID` AS `DonationTypeID`,`od`.`DonationPaymentID` AS `DonationPaymentID`,`dt`.`DonationName` AS `DonationName`,`od`.`Date` AS `Date`,`od`.`DateDue` AS `DateDue`,`od`.`Donation` AS `Donation`,`p`.`PaymentName` AS `PaymentName`,`od`.`IsGiftAid` AS `IsGiftAid`,`lk`.`Name` AS `IsGiftAidName`,`od`.`Frequency` AS `Frequency`,`od`.`Quantity` AS `Quantity`,`od`.`UnitPrice` AS `UnitPrice`,`fr`.`Frequency` AS `FrequencyName`,`od`.`NextCreated` AS `NextCreated`,`od`.`ReceiptNumber` AS `ReceiptNumber`,`od`.`ChequeNumber` AS `ChequeNumber`,`od`.`IsVAT` AS `IsVAT`,`od`.`VATRate` AS `VATRate`,`od`.`VATAmount` AS `VATAmount`,`od`.`CreatedBy` AS `CreatedBy`,`od`.`CreatedDate` AS `CreatedDate`,`od`.`LastChangedBy` AS `LastChangedBy`,`od`.`LastChangedDate` AS `LastChangedDate`,`od`.`Comments` AS `Comments`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName`,`a`.`AnimalName` AS `AnimalName`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`a`.`ID` AS `AnimalID`,`o`.`ID` AS `OwnerID`,`a`.`HasActiveReserve` AS `HasActiveReserve`,`a`.`HasTrialAdoption` AS `HasTrialAdoption`,`a`.`CrueltyCase` AS `CrueltyCase`,`a`.`NonShelterAnimal` AS `NonShelterAnimal`,`a`.`Neutered` AS `Neutered`,`a`.`IsNotAvailableForAdoption` AS `IsNotAvailableForAdoption`,`a`.`IsHold` AS `IsHold`,`a`.`IsQuarantine` AS `IsQuarantine`,`a`.`ShelterLocationUnit` AS `ShelterLocationUnit`,`a`.`CombiTestResult` AS `CombiTestResult`,`a`.`FLVResult` AS `FLVResult`,`a`.`HeartwormTestResult` AS `HeartwormTestResult`,(case when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 8)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 8)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2) and (`a`.`HasPermanentFoster` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 12)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 2)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 0) and (`a`.`ActiveMovementType` = 1) and (`a`.`HasTrialAdoption` = 1)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = 11)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` = 0)) then (select `deathreason`.`ReasonName` from `deathreason` where (`deathreason`.`ID` = `a`.`PTSReasonID`)) when ((`a`.`Archived` = 1) and (`a`.`DeceasedDate` is not null) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) when ((`a`.`Archived` = 1) and isnull(`a`.`DeceasedDate`) and (`a`.`ActiveMovementID` <> 0)) then (select `lksmovementtype`.`MovementType` from `lksmovementtype` where (`lksmovementtype`.`ID` = `a`.`ActiveMovementType`)) else (select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) end) AS `DisplayLocationName`,(select `internallocation`.`LocationName` from `internallocation` where (`internallocation`.`ID` = `a`.`ShelterLocation`)) AS `ShelterLocationName`,`co`.`OwnerName` AS `CurrentOwnerName`,`od`.`MovementID` AS `MovementID`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`o`.`EmailAddress` AS `EmailAddress`,`o`.`AdditionalFlags` AS `AdditionalFlags` from ((((((((`ownerdonation` `od` left join `animal` `a` on((`a`.`ID` = `od`.`AnimalID`))) left join `adoption` `ad` on((`ad`.`ID` = `a`.`ActiveMovementID`))) left join `owner` `co` on((`co`.`ID` = `ad`.`OwnerID`))) left join `donationpayment` `p` on((`od`.`DonationPaymentID` = `p`.`ID`))) left join `lksyesno` `lk` on((`lk`.`ID` = `od`.`IsGiftAid`))) join `owner` `o` on((`o`.`ID` = `od`.`OwnerID`))) join `donationtype` `dt` on((`dt`.`ID` = `od`.`DonationTypeID`))) join `lksdonationfreq` `fr` on((`fr`.`ID` = `od`.`Frequency`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ownerlicence`
--

/*!50001 DROP VIEW IF EXISTS `v_ownerlicence`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ownerlicence` AS select `ol`.`ID` AS `ID`,`ol`.`LicenceTypeID` AS `LicenceTypeID`,`ol`.`IssueDate` AS `IssueDate`,`ol`.`ExpiryDate` AS `ExpiryDate`,`lt`.`LicenceTypeName` AS `LicenceTypeName`,`ol`.`LicenceNumber` AS `LicenceNumber`,`ol`.`LicenceFee` AS `LicenceFee`,`ol`.`Comments` AS `Comments`,`ol`.`OwnerID` AS `OwnerID`,`ol`.`AnimalID` AS `AnimalID`,`ol`.`CreatedBy` AS `CreatedBy`,`ol`.`CreatedDate` AS `CreatedDate`,`ol`.`LastChangedBy` AS `LastChangedBy`,`ol`.`LastChangedDate` AS `LastChangedDate`,`a`.`AnimalName` AS `AnimalName`,`a`.`ShelterCode` AS `ShelterCode`,`a`.`ShortCode` AS `ShortCode`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone` from (((`ownerlicence` `ol` join `licencetype` `lt` on((`lt`.`ID` = `ol`.`LicenceTypeID`))) join `owner` `o` on((`o`.`ID` = `ol`.`OwnerID`))) left join `animal` `a` on((`a`.`ID` = `ol`.`AnimalID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ownertraploan`
--

/*!50001 DROP VIEW IF EXISTS `v_ownertraploan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ownertraploan` AS select `ot`.`ID` AS `ID`,`ot`.`TrapTypeID` AS `TrapTypeID`,`ot`.`LoanDate` AS `LoanDate`,`tt`.`TrapTypeName` AS `TrapTypeName`,`ot`.`TrapNumber` AS `TrapNumber`,`ot`.`DepositAmount` AS `DepositAmount`,`ot`.`DepositReturnDate` AS `DepositReturnDate`,`ot`.`ReturnDueDate` AS `ReturnDueDate`,`ot`.`ReturnDate` AS `ReturnDate`,`ot`.`OwnerID` AS `OwnerID`,`ot`.`Comments` AS `Comments`,`ot`.`CreatedBy` AS `CreatedBy`,`ot`.`CreatedDate` AS `CreatedDate`,`ot`.`LastChangedBy` AS `LastChangedBy`,`ot`.`LastChangedDate` AS `LastChangedDate`,`o`.`OwnerTitle` AS `OwnerTitle`,`o`.`OwnerInitials` AS `OwnerInitials`,`o`.`OwnerSurname` AS `OwnerSurname`,`o`.`OwnerForeNames` AS `OwnerForenames`,`o`.`OwnerName` AS `OwnerName` from ((`ownertraploan` `ot` join `traptype` `tt` on((`tt`.`ID` = `ot`.`TrapTypeID`))) join `owner` `o` on((`o`.`ID` = `ot`.`OwnerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_ownervoucher`
--

/*!50001 DROP VIEW IF EXISTS `v_ownervoucher`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_ownervoucher` AS select `ov`.`ID` AS `ID`,`ov`.`OwnerID` AS `OwnerID`,`ov`.`VoucherID` AS `VoucherID`,`ov`.`DateIssued` AS `DateIssued`,`ov`.`DateExpired` AS `DateExpired`,`ov`.`Value` AS `Value`,`ov`.`Comments` AS `Comments`,`ov`.`RecordVersion` AS `RecordVersion`,`ov`.`CreatedBy` AS `CreatedBy`,`ov`.`CreatedDate` AS `CreatedDate`,`ov`.`LastChangedBy` AS `LastChangedBy`,`ov`.`LastChangedDate` AS `LastChangedDate`,`v`.`VoucherName` AS `VoucherName`,`o`.`OwnerName` AS `OwnerName`,`o`.`OwnerAddress` AS `OwnerAddress`,`o`.`OwnerTown` AS `OwnerTown`,`o`.`OwnerCounty` AS `OwnerCounty`,`o`.`OwnerPostcode` AS `OwnerPostcode`,`o`.`HomeTelephone` AS `HomeTelephone`,`o`.`WorkTelephone` AS `WorkTelephone`,`o`.`MobileTelephone` AS `MobileTelephone`,`o`.`EmailAddress` AS `EmailAddress`,`o`.`AdditionalFlags` AS `AdditionalFlags` from ((`ownervoucher` `ov` join `voucher` `v` on((`v`.`ID` = `ov`.`VoucherID`))) join `owner` `o` on((`o`.`ID` = `ov`.`OwnerID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-28  8:17:44
