-- This is a Data Definition Language (DDL) script that 
-- generates a blank schema of the Water Management Data Model (WaM-DaM)
-- for MySQL database
-- in MySQL Workbench, Create a New SQL Tab for Executing queries
-- Simply copy all this script and paste into the new window of "create query"
-- Then click execute. The script should run successfully and create the 48 empty tables of WaM-DaM


DROP SCHEMA IF EXISTS WaMDaM;

CREATE SCHEMA IF NOT EXISTS WaMDaM;

/***************************************************************************/
/******************************* CREATE CORE *******************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE Attributes (
	AttributeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	NativeAttributeName VARCHAR (255)  NOT NULL,
	UnitID INT   NOT NULL,
	AttributeDescription TEXT   NULL,
	CommonAttributeID INT   NULL
);

CREATE TABLE DataStorage (
	DataStorageID INT   NOT NULL PRIMARY KEY
);

CREATE TABLE DataStructure (
	DataStructureID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	DataStructureName VARCHAR (255)  NOT NULL,
	DataStructureDomainCV VARCHAR (255)  NOT NULL,
	DataStructureWebpage VARCHAR (255)  NULL,
	DataStructureDescription TEXT   NULL
);

CREATE TABLE Instances (
	InstanceID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	InstanceName VARCHAR (255)  NULL,
	InstanceCode VARCHAR (255)  NULL,
	StatusCV VARCHAR (255)  NULL,
	Longitude FLOAT   NULL,
	Latitude FLOAT   NULL,
	Description TEXT   NULL,
	RelatedInstanceID INT   NULL
);

CREATE TABLE Mapping (
	MappingID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ObjectAttributeID INT   NOT NULL,
	InstanceID INT   NOT NULL,
	InputOrOutput VARCHAR (255)  NULL,
	SourceID INT   NULL,
	MethodID INT   NULL,
	AttributeTypeCodeCV VARCHAR (255)  NULL,
	DataStorageID INT   NULL
);

CREATE TABLE MasterNetworks (
	MasterNetworkID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MasterNetworkName VARCHAR (255)  NOT NULL,
	SpatialReferenceID INT   NULL,
	VerticalDatumCV VARCHAR (255)  NULL,
	RelatedMasterNetwork INT   NULL,
	Description TEXT   NULL
);

CREATE TABLE ObjectAttributes (
	ObjectAttributeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ObjectTypeID INT   NOT NULL,
	AttributeID INT   NOT NULL,
	AttributeCode VARCHAR (50)  NULL,
	NativeAttributeCategoryID INT   NULL,
	RelatedObjectAttributeID INT   NULL
);

CREATE TABLE ObjectTypes (
	ObjectTypeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	NativeObjectName VARCHAR (255)  NOT NULL,
	ObjectCode VARCHAR (50)  NULL,
	ObjectTopology VARCHAR (50)  NOT NULL,
	MapColor VARCHAR (50)  NULL,
	MapSymbol VARCHAR (50)  NULL,
	Description TEXT   NULL,
	DataStructureID INT   NOT NULL,
	NativeObjectCategoryID INT   NULL,
	CommonObjectTypeID INT   NULL
);

CREATE TABLE ScenarioMapping (
	ScenarioMappingID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ScenarioID INT   NOT NULL,
	MappingID INT   NOT NULL
);

CREATE TABLE Scenarios (
	ScenarioID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ScenarioName VARCHAR (255)  NOT NULL,
	Description TEXT   NULL,
	MasterNetworkID INT   NOT NULL
);

/***************************************************************************/
/******************************* CREATE CVS ********************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE AggregationStatistic (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE AttributeTypeCode (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE BinaryValueMeaning (
	BinaryValueMeaningID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	BinaryValue BINARY (1)  NOT NULL,
	ValueDefinition TEXT   NULL,
	BinaryAttribute VARCHAR (255)  NOT NULL
);

CREATE TABLE CommonAttributeCategory (
	CommonAttributeCategoryID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CommonAttributeCategoryName VARCHAR (255)  NOT NULL,
	CommonCategoryDefinition TEXT   NULL,
	ParentCommonAttributeCategoryID INT   NULL
);

CREATE TABLE CommonAttributes (
	CommonAttributeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CommonAttributeName VARCHAR (255)  NOT NULL,
	CommonAttributeDefinition TEXT   NULL,
	CommonAttributeCategoryID INT   NULL
);

CREATE TABLE CommonObjectCategory (
	CommonObjectCategoryID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CommonObjectCategoryName VARCHAR (255)  NOT NULL,
	CommonCategoryDefinition TEXT   NULL,
	ParentCommonObjectCategoryID INT   NULL
);

CREATE TABLE CommonObjectTypes (
	CommonObjectTypeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	CommonObjectType VARCHAR (255)  NOT NULL,
	CommonObjectTopology VARCHAR (50)  NULL,
	CommonObjectDefinition TEXT   NULL,
	CommonObjectCategoryID INT   NULL
);

CREATE TABLE DataStructureDomain (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE FileFormat (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE InstanceStatus (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE MethodType (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE OrganizationType (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE SeasonName (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE SpatialReference (
	SpatialReferenceID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SRSName VARCHAR (500)  NOT NULL,
	SRSID INT   NOT NULL,
	IsGeographic INT   NOT NULL,
	Notes TEXT   NULL
);

CREATE TABLE Symbols (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE TextControlledValues (
	TextControlledValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	TextControlledValue VARCHAR (255)  NOT NULL,
	TextControlledAttribute VARCHAR (255)  NOT NULL,
	ValueDefinition TEXT   NULL
);

CREATE TABLE Units (
	UnitID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	UnitType VARCHAR (255)  NOT NULL,
	UnitName VARCHAR (255)  NOT NULL,
	UnitSystem VARCHAR (255)  NULL,
	UnitAbbreviation char (50)  NOT NULL
);

CREATE TABLE VerticalDatum (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

/***************************************************************************/
/***************************** CREATE METADATA *****************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE Connections (
	ConnectivityID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	LinkInstanceID INT   NOT NULL,
	StartNodeInstanceID INT   NOT NULL,
	EndNodeInstanceID INT   NOT NULL
);

CREATE TABLE Methods (
	MethodID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	MethodName VARCHAR (255)  NOT NULL,
	MethodWebpage VARCHAR (255)  NULL,
	MethodDescription TEXT   NULL,
	MethodTypeCV VARCHAR (255)  NOT NULL,
	PersonID INT   NOT NULL,
	ModelID INT   NULL,
	ParentMethodID INT   NULL
);

CREATE TABLE Models (
	ModesID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ModelName VARCHAR (255)  NOT NULL,
	ModelWebpage VARCHAR (500)  NULL,
	ModelInstanceName VARCHAR (255)  NOT NULL,
	ModelDateCreated DATE   NULL,
	Description TEXT   NULL,
	TimeStep FLOAT   NULL,
	TimeStepUnit INT   NULL,
	ModelStartDateTime DATETIME   NULL,
	ModelEndDateTime DATETIME   NULL
);

CREATE TABLE NativeAttributeCategory (
	NativeAttributeCategoryID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	NativeAttributeCategoryName VARCHAR (255)  NOT NULL,
	NativeAttributeCategoryDefinition TEXT   NULL,
	NativeAttributeCategoryGroup VARCHAR (255)  NULL,
	ParentNativeAttributeCategoryID INT   NULL
);

CREATE TABLE NativeObjectCategory (
	NativeObjectCategoryID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	NativeObjectCategoryName VARCHAR (255)  NOT NULL,
	NativeObjectCategoryDefinition TEXT   NULL,
	NativeObjectCategoryGroup VARCHAR (500)  NULL,
	ParentNativeObjectCategoryID INT   NULL
);

CREATE TABLE Organizations (
	OrganizationID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	OrganizationName VARCHAR (255)  NULL,
	OrganizationTypeCV VARCHAR (255)  NULL,
	Webpage VARCHAR (255)  NULL,
	OrganizationDescription TEXT   NULL,
	ParentOrganizationID INT   NULL
);

CREATE TABLE People (
	PersonID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ContactName VARCHAR (255)  NULL,
	Address VARCHAR (255)  NULL,
	Email VARCHAR (255)  NULL,
	Webpage VARCHAR (255)  NULL,
	Phone VARCHAR (50)  NULL,
	Position VARCHAR (255)  NULL,
	OrganizationID INT   NOT NULL
);

CREATE TABLE Sources (
	SourceID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SourceName VARCHAR (500)  NOT NULL,
	SourceWebpage VARCHAR (500)  NULL,
	SourceDescription TEXT   NULL,
	Citation VARCHAR (500)  NULL,
	PersonID INT   NULL,
	ParentSourceID INT   NULL
);

CREATE TABLE Vertices (
	VerticeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ConnectivityID INT   NOT NULL,
	LongitudeXCoordinate DOUBLE   NOT NULL,
	LatitudeYcoordinate  DOUBLE   NOT NULL
);

/***************************************************************************/
/***************************** CREATE STORAGE ******************************/
/***************************************************************************/
USE WaMDaM;

CREATE TABLE Binarys (
	BinaryID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	BinaryValue BINARY (1)  NOT NULL,
	DataStorageID INT   NOT NULL,
	BinaryValueMeaningID INT   NOT NULL
);

CREATE TABLE FileBased (
	FileBasedID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	FileName VARCHAR (255)  NOT NULL,
	FileFormateCV VARCHAR (255)  NOT NULL,
	FileLocationOnDesk VARCHAR (255)  NOT NULL,
	DataStorageID INT   NOT NULL
);

CREATE TABLE MultiColumnArray (
	MultiColumnID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ColumnNameID INT   NOT NULL,
	DataStorageID INT   NOT NULL
);

CREATE TABLE MultiColumnValues (
	MultiColumnValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Value VARCHAR (255)  NOT NULL,
	ValueOrder INT   NOT NULL,
	MultiColumnID INT   NOT NULL
);

CREATE TABLE Parameters (
	ParameterID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	ParameterValue FLOAT   NULL,
	ParameterSubName VARCHAR (255)  NULL,
	DataStorageID INT   NULL
);

CREATE TABLE Rules (
	RuleID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	RuleVariableID INT   NOT NULL,
	RuleVariableOrder INT   NULL,
	SymbolCV VARCHAR (255)  NOT NULL,
	NumConstant FLOAT   NULL,
	DataStorageID INT   NOT NULL
);

CREATE TABLE SeasonalParameters (
	SeasonalParameterID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	SeasonStartDateTime VARCHAR (50)  NULL,
	SeasonEndDateTime VARCHAR (50)  NULL,
	SeasonNameCV VARCHAR (255)  NOT NULL,
	SeasonValue VARCHAR (500)  NOT NULL,
	DataStorageID INT   NOT NULL
);

CREATE TABLE TextControlled (
	TextControlledID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	TextControlledValueID INT   NOT NULL,
	DataStorageID INT   NOT NULL
);

CREATE TABLE TextFree (
	TextFreeID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	TextFreeValue VARCHAR (500)  NULL,
	DataStorageID INT   NOT NULL
);

CREATE TABLE TimeSeries (
	TimeSeriesID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	AggregationInterval DOUBLE   NOT NULL,
	IntervalTimeUnitID INT   NOT NULL,
	BeginDateTime DATETIME   NULL,
	EndDateTime DATETIME   NULL,
	IsRegular TINYINT(1)   NULL,
	NoDataValue VARCHAR (50)  NULL,
	Description TEXT   NULL,
	DataStorageID INT   NOT NULL
);

CREATE TABLE TimeSeriesValues (
	TimeSeriesValueID INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
	TimeSeriesID INT   NOT NULL,
	DateTimeStamp DATETIME   NOT NULL,
	Value FLOAT   NOT NULL
);


ALTER TABLE Attributes ADD CONSTRAINT fk_Attributes_CommonAttributes
FOREIGN KEY (CommonAttributeID) REFERENCES CommonAttributes (CommonAttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Attributes ADD CONSTRAINT fk_Attributes_Units
FOREIGN KEY (UnitID) REFERENCES Units (UnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE DataStructure ADD CONSTRAINT fk_DataStructures_DataStructureDomain
FOREIGN KEY (DataStructureDomainCV) REFERENCES DataStructureDomain (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Instances ADD CONSTRAINT fk_Instances_Instances
FOREIGN KEY (RelatedInstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Instances ADD CONSTRAINT fk_Instances_InstanceStatus
FOREIGN KEY (StatusCV) REFERENCES InstanceStatus (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mapping ADD CONSTRAINT fk_MetadataMapping_AttributeTypeCode
FOREIGN KEY (AttributeTypeCodeCV) REFERENCES AttributeTypeCode (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mapping ADD CONSTRAINT fk_MetadataMapping_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mapping ADD CONSTRAINT fk_MetadataMapping_Instances
FOREIGN KEY (InstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mapping ADD CONSTRAINT fk_MetadataMapping_Methods
FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mapping ADD CONSTRAINT fk_MetadataMapping_ObjectAttributes
FOREIGN KEY (ObjectAttributeID) REFERENCES ObjectAttributes (ObjectAttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Mapping ADD CONSTRAINT fk_MetadataMapping_Sources
FOREIGN KEY (SourceID) REFERENCES Sources (SourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MasterNetworks ADD CONSTRAINT fk_MasterNetworks_MasterNetworks
FOREIGN KEY (RelatedMasterNetwork) REFERENCES MasterNetworks (MasterNetworkID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MasterNetworks ADD CONSTRAINT fk_MasterNetworks_SpatialReference
FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReference (SpatialReferenceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MasterNetworks ADD CONSTRAINT fk_MasterNetworks_VerticalDatum
FOREIGN KEY (VerticalDatumCV) REFERENCES VerticalDatum (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectAttributes ADD CONSTRAINT fk_ObjectAttributes_Attributes
FOREIGN KEY (AttributeID) REFERENCES Attributes (AttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectAttributes ADD CONSTRAINT fk_ObjectAttributes_NativeAttributeCategory
FOREIGN KEY (NativeAttributeCategoryID) REFERENCES NativeAttributeCategory (NativeAttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectAttributes ADD CONSTRAINT fk_ObjectAttributes_ObjectAttributes
FOREIGN KEY (RelatedObjectAttributeID) REFERENCES ObjectAttributes (ObjectAttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectAttributes ADD CONSTRAINT fk_ObjectAttributes_ObjectTypes
FOREIGN KEY (ObjectTypeID) REFERENCES ObjectTypes (ObjectTypeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectTypes ADD CONSTRAINT fk_ObjectTypes_CommonObjectTypes
FOREIGN KEY (CommonObjectTypeID) REFERENCES CommonObjectTypes (CommonObjectTypeID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectTypes ADD CONSTRAINT fk_ObjectTypes_DataStructures
FOREIGN KEY (DataStructureID) REFERENCES DataStructure (DataStructureID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ObjectTypes ADD CONSTRAINT fk_ObjectTypes_NativeObjectCategory
FOREIGN KEY (NativeObjectCategoryID) REFERENCES NativeObjectCategory (NativeObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ScenarioMapping ADD CONSTRAINT fk_SceanrioMetadata_MetadataMapping
FOREIGN KEY (MappingID) REFERENCES Mapping (MappingID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE ScenarioMapping ADD CONSTRAINT fk_SceanrioMetadata_Scenarios
FOREIGN KEY (ScenarioID) REFERENCES Scenarios (ScenarioID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Scenarios ADD CONSTRAINT fk_Scenarios_MasterNetworks
FOREIGN KEY (MasterNetworkID) REFERENCES MasterNetworks (MasterNetworkID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CommonAttributeCategory ADD CONSTRAINT fk_CommonAttributeCategory_CommonAttributeCategory
FOREIGN KEY (ParentCommonAttributeCategoryID) REFERENCES CommonAttributeCategory (CommonAttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CommonAttributes ADD CONSTRAINT fk_CommonAttributes_CommonAttributeCategory
FOREIGN KEY (CommonAttributeCategoryID) REFERENCES CommonAttributeCategory (CommonAttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CommonObjectCategory ADD CONSTRAINT fk_CommonObjectCategory_CommonObjectCategory
FOREIGN KEY (ParentCommonObjectCategoryID) REFERENCES CommonObjectCategory (CommonObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE CommonObjectTypes ADD CONSTRAINT fk_CommonObjectTypes_CommonObjectCategory
FOREIGN KEY (CommonObjectCategoryID) REFERENCES CommonObjectCategory (CommonObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Connections ADD CONSTRAINT fk_Connections_Instances1
FOREIGN KEY (LinkInstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Connections ADD CONSTRAINT fk_Connections_Instances2
FOREIGN KEY (StartNodeInstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Connections ADD CONSTRAINT fk_Connections_Instances3
FOREIGN KEY (EndNodeInstanceID) REFERENCES Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Methods ADD CONSTRAINT fk_Methods_Methods
FOREIGN KEY (ParentMethodID) REFERENCES Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Methods ADD CONSTRAINT fk_Methods_MethodType
FOREIGN KEY (MethodTypeCV) REFERENCES MethodType (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Methods ADD CONSTRAINT fk_Methods_Models
FOREIGN KEY (ModelID) REFERENCES Models (ModesID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Methods ADD CONSTRAINT fk_Methods_People
FOREIGN KEY (PersonID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Models ADD CONSTRAINT fk_Models_Units
FOREIGN KEY (TimeStepUnit) REFERENCES Units (UnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE NativeAttributeCategory ADD CONSTRAINT fk_NativeAttributeCategory_NativeAttributeCategory
FOREIGN KEY (ParentNativeAttributeCategoryID) REFERENCES NativeAttributeCategory (NativeAttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE NativeObjectCategory ADD CONSTRAINT fk_NativeObjectCategory_NativeObjectCategory
FOREIGN KEY (ParentNativeObjectCategoryID) REFERENCES NativeObjectCategory (NativeObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Organizations ADD CONSTRAINT fk_Organizations_Organizations
FOREIGN KEY (ParentOrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Organizations ADD CONSTRAINT fk_Organizations_OrganizationType
FOREIGN KEY (OrganizationTypeCV) REFERENCES OrganizationType (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE People ADD CONSTRAINT fk_People_Organizations
FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Sources ADD CONSTRAINT fk_Sources_People
FOREIGN KEY (PersonID) REFERENCES People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Sources ADD CONSTRAINT fk_Sources_Sources
FOREIGN KEY (ParentSourceID) REFERENCES Sources (SourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Vertices ADD CONSTRAINT fk_Vertices_Connections
FOREIGN KEY (ConnectivityID) REFERENCES Connections (ConnectivityID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Binarys ADD CONSTRAINT fk_Binarys_BinaryValueMeaning
FOREIGN KEY (BinaryValueMeaningID) REFERENCES BinaryValueMeaning (BinaryValueMeaningID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Binarys ADD CONSTRAINT fk_Binarys_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE FileBased ADD CONSTRAINT fk_FileBased_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE FileBased ADD CONSTRAINT fk_FileBased_FileFormate
FOREIGN KEY (FileFormateCV) REFERENCES FileFormat (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MultiColumnArray ADD CONSTRAINT fk_MultiColumnArray_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE MultiColumnValues ADD CONSTRAINT fk_MultiColumnValues_MultiColumnArray
FOREIGN KEY (MultiColumnID) REFERENCES MultiColumnArray (MultiColumnID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Parameters ADD CONSTRAINT fk_Parameters_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Rules ADD CONSTRAINT fk_Functions_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE Rules ADD CONSTRAINT fk_Functions_Symbols
FOREIGN KEY (SymbolCV) REFERENCES Symbols (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SeasonalParameters ADD CONSTRAINT fk_SeasonalParameters_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE SeasonalParameters ADD CONSTRAINT fk_SeasonalParameters_SeasonName
FOREIGN KEY (SeasonNameCV) REFERENCES SeasonName (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TextControlled ADD CONSTRAINT fk_ControlledText_ControlledTextValues
FOREIGN KEY (TextControlledValueID) REFERENCES TextControlledValues (TextControlledValueID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TextControlled ADD CONSTRAINT fk_ControlledText_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TextFree ADD CONSTRAINT fk_FreeText_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeries ADD CONSTRAINT fk_TimeSeries_AggregationStatistic
FOREIGN KEY (AggregationStatisticCV) REFERENCES AggregationStatistic (Term)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeries ADD CONSTRAINT fk_TimeSeries_DataStorage
FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeries ADD CONSTRAINT fk_TimeSeries_Units
FOREIGN KEY (IntervalTimeUnitID) REFERENCES Units (UnitID)
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE TimeSeriesValues ADD CONSTRAINT fk_TimeSeriesValues_TimeSeries
FOREIGN KEY (TimeSeriesID) REFERENCES TimeSeries (TimeSeriesID)
ON UPDATE NO ACTION ON DELETE NO ACTION;