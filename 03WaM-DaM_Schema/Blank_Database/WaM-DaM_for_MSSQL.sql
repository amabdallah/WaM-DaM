-- This is a Data Definition Language (DDL) script that 
-- generates a blank schema of the Water Management Data Model (WaM-DaM)
-- for Microsoft SQL Server database
-- in SQL Server, Click File >> New >> Query with Current Condition  
-- Simply copy all this script and paste into the new window of "create query"
-- Then click execute. The script should run successfully and create the 48 empty tables of WaM-DaM

-- Drop the database called 'WaM-DaM' if it exists and then 
-- create a new database called 'WaM-DaM'

USE master;
GO

IF DB_ID(N'WaMDaM') IS NOT NULL
DROP DATABASE WaMDaM;
GO

CREATE DATABASE WaMDaM;
GO

USE WaMDaM;
GO

CREATE SCHEMA WaMDaM;
GO

/***************************************************************************/
/******************************* CREATE CORE *******************************/
/***************************************************************************/

CREATE TABLE WaMDaM.Attributes (
	AttributeID int  IDENTITY (1,1) NOT NULL,
	NativeAttributeName varchar (255)  NOT NULL,
	UnitID int   NOT NULL,
	AttributeDescription text   NULL,
	CommonAttributeID int   NULL,
	PRIMARY KEY (AttributeID)
)
CREATE TABLE WaMDaM.DataStorage (
	DataStorageID int   NOT NULL,
	PRIMARY KEY (DataStorageID)
)
CREATE TABLE WaMDaM.DataStructure (
	DataStructureID int  IDENTITY (1,1) NOT NULL,
	DataStructureName varchar (255)  NOT NULL,
	DataStructureDomainCV varchar (255)  NOT NULL,
	DataStructureWebpage varchar (255)  NULL,
	DataStructureDescription text   NULL,
	PRIMARY KEY (DataStructureID)
)
CREATE TABLE WaMDaM.Instances (
	InstanceID int  IDENTITY (1,1) NOT NULL,
	InstanceName varchar (255)  NULL,
	InstanceCode varchar (255)  NULL,
	StatusCV varchar (255)  NULL,
	Longitude float   NULL,
	Latitude float   NULL,
	Description text   NULL,
	RelatedInstanceID int   NULL,
	PRIMARY KEY (InstanceID)
)
CREATE TABLE WaMDaM.Mapping (
	MappingID int  IDENTITY (1,1) NOT NULL,
	ObjectAttributeID int   NOT NULL,
	InstanceID int   NOT NULL,
	InputOrOutput varchar (255)  NULL,
	SourceID int   NULL,
	MethodID int   NULL,
	AttributeTypeCodeCV varchar (255)  NULL,
	DataStorageID int   NULL,
	PRIMARY KEY (MappingID)
)
CREATE TABLE WaMDaM.MasterNetworks (
	MasterNetworkID int  IDENTITY (1,1) NOT NULL,
	MasterNetworkName varchar (255)  NOT NULL,
	SpatialReferenceID int   NULL,
	VerticalDatumCV varchar (255)  NULL,
	RelatedMasterNetwork int   NULL,
	Description text   NULL,
	PRIMARY KEY (MasterNetworkID)
)
CREATE TABLE WaMDaM.ObjectAttributes (
	ObjectAttributeID int  IDENTITY (1,1) NOT NULL,
	ObjectTypeID int   NOT NULL,
	AttributeID int   NOT NULL,
	AttributeCode varchar (50)  NULL,
	NativeAttributeCategoryID int   NULL,
	RelatedObjectAttributeID int   NULL,
	PRIMARY KEY (ObjectAttributeID)
)
CREATE TABLE WaMDaM.ObjectTypes (
	ObjectTypeID int  IDENTITY (1,1) NOT NULL,
	NativeObjectName varchar (255)  NOT NULL,
	ObjectCode varchar (50)  NULL,
	ObjectTopology varchar (50)  NOT NULL,
	MapColor varchar (50)  NULL,
	MapSymbol varchar (50)  NULL,
	Description text   NULL,
	DataStructureID int   NOT NULL,
	NativeObjectCategoryID int   NULL,
	CommonObjectTypeID int   NULL,
	PRIMARY KEY (ObjectTypeID)
)
CREATE TABLE WaMDaM.ScenarioMapping (
	ScenarioMappingID int  IDENTITY (1,1) NOT NULL,
	ScenarioID int   NOT NULL,
	MappingID int   NOT NULL,
	PRIMARY KEY (ScenarioMappingID)
)
CREATE TABLE WaMDaM.Scenarios (
	ScenarioID int  IDENTITY (1,1) NOT NULL,
	ScenarioName varchar (255)  NOT NULL,
	Description text   NULL,
	MasterNetworkID int   NOT NULL,
	PRIMARY KEY (ScenarioID)
)
/***************************************************************************/
/******************************* CREATE CVS ********************************/
/***************************************************************************/

CREATE TABLE WaMDaM.AggregationStatistic (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.AttributeTypeCode (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.BinaryValueMeaning (
	BinaryValueMeaningID int  IDENTITY (1,1) NOT NULL,
	BinaryValue binary (1)  NOT NULL,
	ValueDefinition text   NULL,
	BinaryAttribute varchar (255)  NOT NULL,
	PRIMARY KEY (BinaryValueMeaningID)
)
CREATE TABLE WaMDaM.CommonAttributeCategory (
	CommonAttributeCategoryID int  IDENTITY (1,1) NOT NULL,
	CommonAttributeCategoryName varchar (255)  NOT NULL,
	CommonCategoryDefinition text   NULL,
	ParentCommonAttributeCategoryID int   NULL,
	PRIMARY KEY (CommonAttributeCategoryID)
)
CREATE TABLE WaMDaM.CommonAttributes (
	CommonAttributeID int  IDENTITY (1,1) NOT NULL,
	CommonAttributeName varchar (255)  NOT NULL,
	CommonAttributeDefinition text   NULL,
	CommonAttributeCategoryID int   NULL,
	PRIMARY KEY (CommonAttributeID)
)
CREATE TABLE WaMDaM.CommonObjectCategory (
	CommonObjectCategoryID int  IDENTITY (1,1) NOT NULL,
	CommonObjectCategoryName varchar (255)  NOT NULL,
	CommonCategoryDefinition text   NULL,
	ParentCommonObjectCategoryID int   NULL,
	PRIMARY KEY (CommonObjectCategoryID)
)
CREATE TABLE WaMDaM.CommonObjectTypes (
	CommonObjectTypeID int  IDENTITY (1,1) NOT NULL,
	CommonObjectType varchar (255)  NOT NULL,
	CommonObjectTopology varchar (50)  NULL,
	CommonObjectDefinition text   NULL,
	CommonObjectCategoryID int   NULL,
	PRIMARY KEY (CommonObjectTypeID)
)
CREATE TABLE WaMDaM.DataStructureDomain (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.FileFormat (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.InstanceStatus (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.MethodType (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.OrganizationType (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.SeasonName (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.SpatialReference (
	SpatialReferenceID int  IDENTITY (1,1) NOT NULL,
	SRSName varchar (500)  NOT NULL,
	SRSID int   NOT NULL,
	IsGeographic int   NOT NULL,
	Notes text   NULL,
	PRIMARY KEY (SpatialReferenceID)
)
CREATE TABLE WaMDaM.Symbols (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
CREATE TABLE WaMDaM.TextControlledValues (
	TextControlledValueID int  IDENTITY (1,1) NOT NULL,
	TextControlledValue varchar (255)  NOT NULL,
	TextControlledAttribute varchar (255)  NOT NULL,
	ValueDefinition text   NULL,
	PRIMARY KEY (TextControlledValueID)
)
CREATE TABLE WaMDaM.Units (
	UnitID int  IDENTITY (1,1) NOT NULL,
	UnitType varchar (255)  NOT NULL,
	UnitName varchar (255)  NOT NULL,
	UnitSystem varchar (255)  NULL,
	UnitAbbreviation char (50)  NOT NULL,
	PRIMARY KEY (UnitID)
)
CREATE TABLE WaMDaM.VerticalDatum (
	Term varchar (255)  NOT NULL,
	Definition text   NULL,
	PRIMARY KEY (Term)
)
/***************************************************************************/
/***************************** CREATE METADATA *****************************/
/***************************************************************************/

CREATE TABLE WaMDaM.Connections (
	ConnectivityID int  IDENTITY (1,1) NOT NULL,
	LinkInstanceID int   NOT NULL,
	StartNodeInstanceID int   NOT NULL,
	EndNodeInstanceID int   NOT NULL,
	PRIMARY KEY (ConnectivityID)
)
CREATE TABLE WaMDaM.Methods (
	MethodID int  IDENTITY (1,1) NOT NULL,
	MethodName varchar (255)  NOT NULL,
	MethodWebpage varchar (255)  NULL,
	MethodDescription text   NULL,
	MethodTypeCV varchar (255)  NOT NULL,
	PersonID int   NOT NULL,
	ModelID int   NULL,
	ParentMethodID int   NULL,
	PRIMARY KEY (MethodID)
)
CREATE TABLE WaMDaM.Models (
	ModesID int  IDENTITY (1,1) NOT NULL,
	ModelName varchar (255)  NOT NULL,
	ModelWebpage varchar (500)  NULL,
	ModelInstanceName varchar (255)  NOT NULL,
	ModelDateCreated date   NULL,
	Description text   NULL,
	TimeStep float   NULL,
	TimeStepUnit int   NULL,
	ModelStartDateTime datetime   NULL,
	ModelEndDateTime datetime   NULL,
	PRIMARY KEY (ModesID)
)
CREATE TABLE WaMDaM.NativeAttributeCategory (
	NativeAttributeCategoryID int  IDENTITY (1,1) NOT NULL,
	NativeAttributeCategoryName varchar (255)  NOT NULL,
	NativeAttributeCategoryDefinition text   NULL,
	NativeAttributeCategoryGroup varchar (255)  NULL,
	ParentNativeAttributeCategoryID int   NULL,
	PRIMARY KEY (NativeAttributeCategoryID)
)
CREATE TABLE WaMDaM.NativeObjectCategory (
	NativeObjectCategoryID int  IDENTITY (1,1) NOT NULL,
	NativeObjectCategoryName varchar (255)  NOT NULL,
	NativeObjectCategoryDefinition text   NULL,
	NativeObjectCategoryGroup varchar (500)  NULL,
	ParentNativeObjectCategoryID int   NULL,
	PRIMARY KEY (NativeObjectCategoryID)
)
CREATE TABLE WaMDaM.Organizations (
	OrganizationID int  IDENTITY (1,1) NOT NULL,
	OrganizationName varchar (255)  NULL,
	OrganizationTypeCV varchar (255)  NULL,
	Webpage varchar (255)  NULL,
	OrganizationDescription text   NULL,
	ParentOrganizationID int   NULL,
	PRIMARY KEY (OrganizationID)
)
CREATE TABLE WaMDaM.People (
	PersonID int  IDENTITY (1,1) NOT NULL,
	ContactName varchar (255)  NULL,
	Address varchar (255)  NULL,
	Email varchar (255)  NULL,
	Webpage varchar (255)  NULL,
	Phone varchar (50)  NULL,
	Position varchar (255)  NULL,
	OrganizationID int   NOT NULL,
	PRIMARY KEY (PersonID)
)
CREATE TABLE WaMDaM.Sources (
	SourceID int  IDENTITY (1,1) NOT NULL,
	SourceName varchar (500)  NOT NULL,
	SourceWebpage varchar (500)  NULL,
	SourceDescription text   NULL,
	Citation varchar (500)  NULL,
	PersonID int   NULL,
	ParentSourceID int   NULL,
	PRIMARY KEY (SourceID)
)
CREATE TABLE WaMDaM.Vertices (
	VerticeID int  IDENTITY (1,1) NOT NULL,
	ConnectivityID int   NOT NULL,
	LongitudeXCoordinate float   NOT NULL,
	LatitudeYcoordinate  float   NOT NULL,
	PRIMARY KEY (VerticeID)
)
/***************************************************************************/
/***************************** CREATE STORAGE ******************************/
/***************************************************************************/

CREATE TABLE WaMDaM.Binarys (
	BinaryID int  IDENTITY (1,1) NOT NULL,
	BinaryValue binary (1)  NOT NULL,
	DataStorageID int   NOT NULL,
	BinaryValueMeaningID int   NOT NULL,
	PRIMARY KEY (BinaryID)
)
CREATE TABLE WaMDaM.FileBased (
	FileBasedID int  IDENTITY (1,1) NOT NULL,
	FileName varchar (255)  NOT NULL,
	FileFormateCV varchar (255)  NOT NULL,
	FileLocationOnDesk varchar (255)  NOT NULL,
	DataStorageID int   NOT NULL,
	PRIMARY KEY (FileBasedID)
)
CREATE TABLE WaMDaM.MultiColumnArray (
	MultiColumnID int  IDENTITY (1,1) NOT NULL,
	ColumnNameID int   NOT NULL,
	DataStorageID int   NOT NULL,
	PRIMARY KEY (MultiColumnID)
)
CREATE TABLE WaMDaM.MultiColumnValues (
	MultiColumnValueID int  IDENTITY (1,1) NOT NULL,
	Value varchar (255)  NOT NULL,
	ValueOrder int   NOT NULL,
	MultiColumnID int   NOT NULL,
	PRIMARY KEY (MultiColumnValueID)
)
CREATE TABLE WaMDaM.Parameters (
	ParameterID int  IDENTITY (1,1) NOT NULL,
	ParameterValue float   NULL,
	ParameterSubName varchar (255)  NULL,
	DataStorageID int   NULL,
	PRIMARY KEY (ParameterID)
)
CREATE TABLE WaMDaM.Rules (
	RuleID int  IDENTITY (1,1) NOT NULL,
	RuleVariableID int   NOT NULL,
	RuleVariableOrder int   NULL,
	SymbolCV varchar (255)  NOT NULL,
	NumConstant float   NULL,
	DataStorageID int   NOT NULL,
	PRIMARY KEY (RuleID)
)
CREATE TABLE WaMDaM.SeasonalParameters (
	SeasonalParameterID int  IDENTITY (1,1) NOT NULL,
	SeasonStartDateTime varchar (50)  NULL,
	SeasonEndDateTime varchar (50)  NULL,
	SeasonNameCV varchar (255)  NOT NULL,
	SeasonValue varchar (500)  NOT NULL,
	DataStorageID int   NOT NULL,
	PRIMARY KEY (SeasonalParameterID)
)
CREATE TABLE WaMDaM.TextControlled (
	TextControlledID int  IDENTITY (1,1) NOT NULL,
	TextControlledValueID int   NOT NULL,
	DataStorageID int   NOT NULL,
	PRIMARY KEY (TextControlledID)
)
CREATE TABLE WaMDaM.TextFree (
	TextFreeID int  IDENTITY (1,1) NOT NULL,
	TextFreeValue varchar (500)  NULL,
	DataStorageID int   NOT NULL,
	PRIMARY KEY (TextFreeID)
)
CREATE TABLE WaMDaM.TimeSeries (
	TimeSeriesID int  IDENTITY (1,1) NOT NULL,
	AggregationStatisticCV varchar (255)  NOT NULL,
	AggregationInterval float   NOT NULL,
	IntervalTimeUnitID int   NOT NULL,
	BeginDateTime datetime   NULL,
	EndDateTime datetime   NULL,
	IsRegular bit   NULL,
	NoDataValue varchar (50)  NULL,
	Description text   NULL,
	DataStorageID int   NOT NULL,
	PRIMARY KEY (TimeSeriesID)
)
CREATE TABLE WaMDaM.TimeSeriesValues (
	TimeSeriesValueID int  IDENTITY (1,1) NOT NULL,
	TimeSeriesID int   NOT NULL,
	DateTimeStamp datetime   NOT NULL,
	Value float   NOT NULL,
	PRIMARY KEY (TimeSeriesValueID)
)

ALTER TABLE WaMDaM.Attributes ADD CONSTRAINT fk_Attributes_CommonAttributes
FOREIGN KEY (CommonAttributeID) REFERENCES WaMDaM.CommonAttributes (CommonAttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Attributes ADD CONSTRAINT fk_Attributes_Units
FOREIGN KEY (UnitID) REFERENCES WaMDaM.Units (UnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.DataStructure ADD CONSTRAINT fk_DataStructures_DataStructureDomain
FOREIGN KEY (DataStructureDomainCV) REFERENCES WaMDaM.DataStructureDomain (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Instances ADD CONSTRAINT fk_Instances_Instances
FOREIGN KEY (RelatedInstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Instances ADD CONSTRAINT fk_Instances_InstanceStatus
FOREIGN KEY (StatusCV) REFERENCES WaMDaM.InstanceStatus (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_MetadataMapping_AttributeTypeCode
FOREIGN KEY (AttributeTypeCodeCV) REFERENCES WaMDaM.AttributeTypeCode (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_MetadataMapping_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_MetadataMapping_Instances
FOREIGN KEY (InstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_MetadataMapping_Methods
FOREIGN KEY (MethodID) REFERENCES WaMDaM.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_MetadataMapping_ObjectAttributes
FOREIGN KEY (ObjectAttributeID) REFERENCES WaMDaM.ObjectAttributes (ObjectAttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_MetadataMapping_Sources
FOREIGN KEY (SourceID) REFERENCES WaMDaM.Sources (SourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MasterNetworks ADD CONSTRAINT fk_MasterNetworks_MasterNetworks
FOREIGN KEY (RelatedMasterNetwork) REFERENCES WaMDaM.MasterNetworks (MasterNetworkID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MasterNetworks ADD CONSTRAINT fk_MasterNetworks_SpatialReference
FOREIGN KEY (SpatialReferenceID) REFERENCES WaMDaM.SpatialReference (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MasterNetworks ADD CONSTRAINT fk_MasterNetworks_VerticalDatum
FOREIGN KEY (VerticalDatumCV) REFERENCES WaMDaM.VerticalDatum (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectAttributes ADD CONSTRAINT fk_ObjectAttributes_Attributes
FOREIGN KEY (AttributeID) REFERENCES WaMDaM.Attributes (AttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectAttributes ADD CONSTRAINT fk_ObjectAttributes_NativeAttributeCategory
FOREIGN KEY (NativeAttributeCategoryID) REFERENCES WaMDaM.NativeAttributeCategory (NativeAttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectAttributes ADD CONSTRAINT fk_ObjectAttributes_ObjectAttributes
FOREIGN KEY (RelatedObjectAttributeID) REFERENCES WaMDaM.ObjectAttributes (ObjectAttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectAttributes ADD CONSTRAINT fk_ObjectAttributes_ObjectTypes
FOREIGN KEY (ObjectTypeID) REFERENCES WaMDaM.ObjectTypes (ObjectTypeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectTypes ADD CONSTRAINT fk_ObjectTypes_CommonObjectTypes
FOREIGN KEY (CommonObjectTypeID) REFERENCES WaMDaM.CommonObjectTypes (CommonObjectTypeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectTypes ADD CONSTRAINT fk_ObjectTypes_DataStructures
FOREIGN KEY (DataStructureID) REFERENCES WaMDaM.DataStructure (DataStructureID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectTypes ADD CONSTRAINT fk_ObjectTypes_NativeObjectCategory
FOREIGN KEY (NativeObjectCategoryID) REFERENCES WaMDaM.NativeObjectCategory (NativeObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ScenarioMapping ADD CONSTRAINT fk_SceanrioMetadata_MetadataMapping
FOREIGN KEY (MappingID) REFERENCES WaMDaM.Mapping (MappingID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ScenarioMapping ADD CONSTRAINT fk_SceanrioMetadata_Scenarios
FOREIGN KEY (ScenarioID) REFERENCES WaMDaM.Scenarios (ScenarioID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Scenarios ADD CONSTRAINT fk_Scenarios_MasterNetworks
FOREIGN KEY (MasterNetworkID) REFERENCES WaMDaM.MasterNetworks (MasterNetworkID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.CommonAttributeCategory ADD CONSTRAINT fk_CommonAttributeCategory_CommonAttributeCategory
FOREIGN KEY (ParentCommonAttributeCategoryID) REFERENCES WaMDaM.CommonAttributeCategory (CommonAttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.CommonAttributes ADD CONSTRAINT fk_CommonAttributes_CommonAttributeCategory
FOREIGN KEY (CommonAttributeCategoryID) REFERENCES WaMDaM.CommonAttributeCategory (CommonAttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.CommonObjectCategory ADD CONSTRAINT fk_CommonObjectCategory_CommonObjectCategory
FOREIGN KEY (ParentCommonObjectCategoryID) REFERENCES WaMDaM.CommonObjectCategory (CommonObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.CommonObjectTypes ADD CONSTRAINT fk_CommonObjectTypes_CommonObjectCategory
FOREIGN KEY (CommonObjectCategoryID) REFERENCES WaMDaM.CommonObjectCategory (CommonObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Connections ADD CONSTRAINT fk_Connections_Instances1
FOREIGN KEY (LinkInstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Connections ADD CONSTRAINT fk_Connections_Instances2
FOREIGN KEY (StartNodeInstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Connections ADD CONSTRAINT fk_Connections_Instances3
FOREIGN KEY (EndNodeInstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Methods ADD CONSTRAINT fk_Methods_Methods
FOREIGN KEY (ParentMethodID) REFERENCES WaMDaM.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Methods ADD CONSTRAINT fk_Methods_MethodType
FOREIGN KEY (MethodTypeCV) REFERENCES WaMDaM.MethodType (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Methods ADD CONSTRAINT fk_Methods_Models
FOREIGN KEY (ModelID) REFERENCES WaMDaM.Models (ModesID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Methods ADD CONSTRAINT fk_Methods_People
FOREIGN KEY (PersonID) REFERENCES WaMDaM.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Models ADD CONSTRAINT fk_Models_Units
FOREIGN KEY (TimeStepUnit) REFERENCES WaMDaM.Units (UnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.NativeAttributeCategory ADD CONSTRAINT fk_NativeAttributeCategory_NativeAttributeCategory
FOREIGN KEY (ParentNativeAttributeCategoryID) REFERENCES WaMDaM.NativeAttributeCategory (NativeAttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.NativeObjectCategory ADD CONSTRAINT fk_NativeObjectCategory_NativeObjectCategory
FOREIGN KEY (ParentNativeObjectCategoryID) REFERENCES WaMDaM.NativeObjectCategory (NativeObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Organizations ADD CONSTRAINT fk_Organizations_Organizations
FOREIGN KEY (ParentOrganizationID) REFERENCES WaMDaM.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Organizations ADD CONSTRAINT fk_Organizations_OrganizationType
FOREIGN KEY (OrganizationTypeCV) REFERENCES WaMDaM.OrganizationType (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.People ADD CONSTRAINT fk_People_Organizations
FOREIGN KEY (OrganizationID) REFERENCES WaMDaM.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Sources ADD CONSTRAINT fk_Sources_People
FOREIGN KEY (PersonID) REFERENCES WaMDaM.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Sources ADD CONSTRAINT fk_Sources_Sources
FOREIGN KEY (ParentSourceID) REFERENCES WaMDaM.Sources (SourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Vertices ADD CONSTRAINT fk_Vertices_Connections
FOREIGN KEY (ConnectivityID) REFERENCES WaMDaM.Connections (ConnectivityID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Binarys ADD CONSTRAINT fk_Binarys_BinaryValueMeaning
FOREIGN KEY (BinaryValueMeaningID) REFERENCES WaMDaM.BinaryValueMeaning (BinaryValueMeaningID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Binarys ADD CONSTRAINT fk_Binarys_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.FileBased ADD CONSTRAINT fk_FileBased_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.FileBased ADD CONSTRAINT fk_FileBased_FileFormate
FOREIGN KEY (FileFormateCV) REFERENCES WaMDaM.FileFormat (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MultiColumnArray ADD CONSTRAINT fk_MultiColumnArray_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MultiColumnValues ADD CONSTRAINT fk_MultiColumnValues_MultiColumnArray
FOREIGN KEY (MultiColumnID) REFERENCES WaMDaM.MultiColumnArray (MultiColumnID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Parameters ADD CONSTRAINT fk_Parameters_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Rules ADD CONSTRAINT fk_Functions_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Rules ADD CONSTRAINT fk_Functions_Symbols
FOREIGN KEY (SymbolCV) REFERENCES WaMDaM.Symbols (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.SeasonalParameters ADD CONSTRAINT fk_SeasonalParameters_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.SeasonalParameters ADD CONSTRAINT fk_SeasonalParameters_SeasonName
FOREIGN KEY (SeasonNameCV) REFERENCES WaMDaM.SeasonName (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TextControlled ADD CONSTRAINT fk_ControlledText_ControlledTextValues
FOREIGN KEY (TextControlledValueID) REFERENCES WaMDaM.TextControlledValues (TextControlledValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TextControlled ADD CONSTRAINT fk_ControlledText_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TextFree ADD CONSTRAINT fk_FreeText_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TimeSeries ADD CONSTRAINT fk_TimeSeries_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES WaMDaM.AggregationStatistic (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TimeSeries ADD CONSTRAINT fk_TimeSeries_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES WaMDaM.DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TimeSeries ADD CONSTRAINT fk_TimeSeries_Units
FOREIGN KEY (IntervalTimeUnitID) REFERENCES WaMDaM.Units (UnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TimeSeriesValues ADD CONSTRAINT fk_TimeSeriesValues_TimeSeries
FOREIGN KEY (TimeSeriesID) REFERENCES WaMDaM.TimeSeries (TimeSeriesID)
ON UPDATE NO ACTION ON DELETE NO ACTION