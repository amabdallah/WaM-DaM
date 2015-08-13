-- This is a Data Definition Language (DDL) script that 
-- generates a blank schema of the Water Management Data Model (WaM-DaM)
-- for SQLite database
-- Use the SQLite Manager Add-on to Mozilla Firefox
-- Create a new empty database. Click on the Execute SQL button and delete the text "SELECT * FROM tablename"
-- Simply copy all this script and paste into this Execute SQL window 
-- Then click Run SQL. The script should run successfully and create the 48 empty tables of WaM-DaM


/***************************************************************************/
/******************************* CREATE CORE *******************************/
/***************************************************************************/

CREATE TABLE Attributes (
	AttributeID INTEGER   NOT NULL PRIMARY KEY,
	NativeAttributeName VARCHAR (255)  NOT NULL,
	UnitID INTEGER   NOT NULL,
	AttributeDescription TEXT   NULL,
	CommonAttributeID INTEGER   NULL,
	FOREIGN KEY (CommonAttributeID) REFERENCES CommonAttributes (CommonAttributeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (UnitID) REFERENCES Units (UnitID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE DataStorage (
	DataStorageID INTEGER   NOT NULL PRIMARY KEY
);

CREATE TABLE DataStructures (
	DataStructureID INTEGER   NOT NULL PRIMARY KEY,
	DataStructureName VARCHAR (255)  NOT NULL,
	DataStructureDomainCV VARCHAR (255)  NOT NULL,
	DataStructureWebpage VARCHAR (255)  NULL,
	DataStrcutureDescription TEXT   NULL,
	FOREIGN KEY (DataStructureDomainCV) REFERENCES DataStructureDomain (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Instances (
	InstanceID INTEGER   NOT NULL PRIMARY KEY,
	InstanceName VARCHAR (255)  NULL,
	InstanceCode VARCHAR (255)  NULL,
	StatusCV VARCHAR (255)  NULL,
	Longitude FLOAT   NULL,
	Latitude FLOAT   NULL,
	Description TEXT   NULL,
	RelatedInstanceID INTEGER   NULL,
	FOREIGN KEY (RelatedInstanceID) REFERENCES Instances (InstanceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (StatusCV) REFERENCES InstanceStatus (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Mapping (
	MappingID INTEGER   NOT NULL PRIMARY KEY,
	ObjectAttributeID INTEGER   NOT NULL,
	InstanceID INTEGER   NOT NULL,
	InputOrOutput VARCHAR (255)  NULL,
	SourceID INTEGER   NULL,
	MethodID INTEGER   NULL,
	AttributeTypeCodeCV VARCHAR (255)  NULL,
	DataStorageID INTEGER   NULL,
	FOREIGN KEY (AttributeTypeCodeCV) REFERENCES AttributeTypeCode (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (InstanceID) REFERENCES Instances (InstanceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ObjectAttributeID) REFERENCES ObjectAttributes (ObjectAttributeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SourceID) REFERENCES Sources (SourceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MasterNetworks (
	MasterNetworkID INTEGER   NOT NULL PRIMARY KEY,
	MasterNetworkName VARCHAR (255)  NOT NULL,
	SpatialReferenceID INTEGER   NULL,
	VerticalDatumCV VARCHAR (255)  NULL,
	RelatedMasterNetwork INTEGER   NULL,
	Description TEXT   NULL,
	FOREIGN KEY (RelatedMasterNetwork) REFERENCES MasterNetworks (MasterNetworkID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SpatialReferenceID) REFERENCES SpatialReference (SpatialReferenceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VerticalDatumCV) REFERENCES VerticalDatum (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ObjectAttributes (
	ObjectAttributeID INTEGER   NOT NULL PRIMARY KEY,
	ObjectTypeID INTEGER   NOT NULL,
	AttributeID INTEGER   NOT NULL,
	AttributeCode VARCHAR (50)  NULL,
	NativeAttributeCategoryID INTEGER   NULL,
	RelatedObjectAttributeID INTEGER   NULL,
	FOREIGN KEY (AttributeID) REFERENCES Attributes (AttributeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (NativeAttributeCategoryID) REFERENCES NativeAttributeCategory (NativeAttributeCategoryID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RelatedObjectAttributeID) REFERENCES ObjectAttributes (ObjectAttributeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ObjectTypeID) REFERENCES ObjectTypes (ObjectTypeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ObjectTypes (
	ObjectTypeID INTEGER   NOT NULL PRIMARY KEY,
	NativeObjectName VARCHAR (255)  NOT NULL,
	ObjectCode VARCHAR (50)  NULL,
	ObjectTopology VARCHAR (50)  NOT NULL,
	MapColor VARCHAR (50)  NULL,
	MapSymbol VARCHAR (50)  NULL,
	Description TEXT   NULL,
	DataStructureID INTEGER   NOT NULL,
	NativeObjectCategoryID INTEGER   NULL,
	CommonObjectTypeID INTEGER   NULL,
	FOREIGN KEY (CommonObjectTypeID) REFERENCES CommonObjectTypes (CommonObjectTypeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DataStructureID) REFERENCES DataStructures (DataStructureID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (NativeObjectCategoryID) REFERENCES NativeObjectCategory (NativeObjectCategoryID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ScenarioMapping (
	ScenarioMappingID INTEGER   NOT NULL PRIMARY KEY,
	ScenarioID INTEGER   NOT NULL,
	MappingID INTEGER   NOT NULL,
	FOREIGN KEY (MappingID) REFERENCES Mapping (MappingID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ScenarioID) REFERENCES Scenarios (ScenarioID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Scenarios (
	ScenarioID INTEGER   NOT NULL PRIMARY KEY,
	ScenarioName VARCHAR (255)  NOT NULL,
	Description TEXT   NULL,
	MasterNetworkID INTEGER   NOT NULL,
	FOREIGN KEY (MasterNetworkID) REFERENCES MasterNetworks (MasterNetworkID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/******************************* CREATE CVS ********************************/
/***************************************************************************/

CREATE TABLE AggregationStatistic (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE AttributeTypeCode (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE BinaryValueMeaning (
	BinaryValueMeaningID INTEGER   NOT NULL PRIMARY KEY,
	BinaryValue BINARY (1)  NOT NULL,
	ValueDefinition TEXT   NULL,
	BinaryAttribute VARCHAR (255)  NOT NULL
);

CREATE TABLE CommonAttributeCategory (
	CommonAttributeCategoryID INTEGER   NOT NULL PRIMARY KEY,
	CommonAttributeCategoryName VARCHAR (255)  NOT NULL,
	CommonCategoryDefinition TEXT   NULL,
	ParentCommonAttributeCategoryID INTEGER   NULL,
	FOREIGN KEY (ParentCommonAttributeCategoryID) REFERENCES CommonAttributeCategory (CommonAttributeCategoryID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CommonAttributes (
	CommonAttributeID INTEGER   NOT NULL PRIMARY KEY,
	CommonAttributeName VARCHAR (255)  NOT NULL,
	CommonAttributeDefinition TEXT   NULL,
	CommonAttributeCategoryID INTEGER   NULL,
	FOREIGN KEY (CommonAttributeCategoryID) REFERENCES CommonAttributeCategory (CommonAttributeCategoryID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CommonObjectCategory (
	CommonObjectCategoryID INTEGER   NOT NULL PRIMARY KEY,
	CommonObjectCategoryName VARCHAR (255)  NOT NULL,
	CommonCategoryDefinition TEXT   NULL,
	ParentCommonObjectCategoryID INTEGER   NULL,
	FOREIGN KEY (ParentCommonObjectCategoryID) REFERENCES CommonObjectCategory (CommonObjectCategoryID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE CommonObjectTypes (
	CommonObjectTypeID INTEGER   NOT NULL PRIMARY KEY,
	CommonObjectType VARCHAR (255)  NOT NULL,
	CommonObjectTopology VARCHAR (50)  NULL,
	CommonObjectDefinition TEXT   NULL,
	CommonObjectCategoryID INTEGER   NULL,
	FOREIGN KEY (CommonObjectCategoryID) REFERENCES CommonObjectCategory (CommonObjectCategoryID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
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
	SpatialReferenceID INTEGER   NOT NULL PRIMARY KEY,
	SRSName VARCHAR (500)  NOT NULL,
	SRSID INTEGER   NOT NULL,
	IsGeographic INTEGER   NOT NULL,
	Notes TEXT   NULL
);

CREATE TABLE Symbols (
	Term VARCHAR (255)  NOT NULL PRIMARY KEY,
	Definition TEXT   NULL
);

CREATE TABLE TextControlledValues (
	TextControlledValueID INTEGER   NOT NULL PRIMARY KEY,
	TextControlledValue VARCHAR (255)  NOT NULL,
	TextControlledAttribute VARCHAR (255)  NOT NULL,
	ValueDefinition TEXT   NULL
);

CREATE TABLE Units (
	UnitID INTEGER   NOT NULL PRIMARY KEY,
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

CREATE TABLE Connections (
	ConnectivityID INTEGER   NOT NULL PRIMARY KEY,
	LinkInstanceID INTEGER   NOT NULL,
	StartNodeInstanceID INTEGER   NOT NULL,
	EndNodeInstanceID INTEGER   NOT NULL,
	FOREIGN KEY (LinkInstanceID) REFERENCES Instances (InstanceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (StartNodeInstanceID) REFERENCES Instances (InstanceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (EndNodeInstanceID) REFERENCES Instances (InstanceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Methods (
	MethodID INTEGER   NOT NULL PRIMARY KEY,
	MethodName VARCHAR (255)  NOT NULL,
	MethodWebpage VARCHAR (255)  NULL,
	MethodDescription TEXT   NULL,
	MethodTypeCV VARCHAR (255)  NOT NULL,
	PersonID INTEGER   NOT NULL,
	ModelID INTEGER   NULL,
	ParentMethodID INTEGER   NULL,
	FOREIGN KEY (ParentMethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodTypeCV) REFERENCES MethodType (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ModelID) REFERENCES Models (ModesID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Models (
	ModesID INTEGER   NOT NULL PRIMARY KEY,
	ModelName VARCHAR (255)  NOT NULL,
	ModelWebpage VARCHAR (500)  NULL,
	ModelInstanceName VARCHAR (255)  NOT NULL,
	ModelDateCreated DATE   NULL,
	Description TEXT   NULL,
	TimeStep FLOAT   NULL,
	TimeStepUnit INTEGER   NULL,
	ModelStartDateTime DATETIME   NULL,
	ModelEndDateTime DATETIME   NULL,
	FOREIGN KEY (TimeStepUnit) REFERENCES Units (UnitID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE NativeAttributeCategory (
	NativeAttributeCategoryID INTEGER   NOT NULL PRIMARY KEY,
	NativeAttributeCategoryName VARCHAR (255)  NOT NULL,
	NativeAttributeCategoryDefinition TEXT   NULL,
	NativeAttributeCategoryGroup VARCHAR (255)  NULL,
	ParentNativeAttributeCategoryID INTEGER   NULL,
	FOREIGN KEY (ParentNativeAttributeCategoryID) REFERENCES NativeAttributeCategory (NativeAttributeCategoryID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE NativeObjectCategory (
	NativeObjectCategoryID INTEGER   NOT NULL PRIMARY KEY,
	NativeObjectCategoryName VARCHAR (255)  NOT NULL,
	NativeObjectCategoryDefinition TEXT   NULL,
	NativeObjectCategoryGroup VARCHAR (500)  NULL,
	ParentNativeObjectCategoryID INTEGER   NULL,
	FOREIGN KEY (ParentNativeObjectCategoryID) REFERENCES NativeObjectCategory (NativeObjectCategoryID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Organizations (
	OrganizationID INTEGER   NOT NULL PRIMARY KEY,
	OrganizationName VARCHAR (255)  NULL,
	OrganizationTypeCV VARCHAR (255)  NULL,
	Webpage VARCHAR (255)  NULL,
	OrganizationDescription TEXT   NULL,
	ParentOrganizationID INTEGER   NULL,
	FOREIGN KEY (ParentOrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (OrganizationTypeCV) REFERENCES OrganizationType (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE People (
	PersonID INTEGER   NOT NULL PRIMARY KEY,
	ContactName VARCHAR (255)  NULL,
	Address VARCHAR (255)  NULL,
	Email VARCHAR (255)  NULL,
	Webpage VARCHAR (255)  NULL,
	Phone VARCHAR (50)  NULL,
	Position VARCHAR (255)  NULL,
	OrganizationID INTEGER   NOT NULL,
	FOREIGN KEY (OrganizationID) REFERENCES Organizations (OrganizationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Sources (
	SourceID INTEGER   NOT NULL PRIMARY KEY,
	SourceName VARCHAR (500)  NOT NULL,
	SourceWebpage VARCHAR (500)  NULL,
	SourceDescription TEXT   NULL,
	Citation VARCHAR (500)  NULL,
	PersonID INTEGER   NULL,
	ParentSourceID INTEGER   NULL,
	FOREIGN KEY (PersonID) REFERENCES People (PersonID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ParentSourceID) REFERENCES Sources (SourceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Vertices (
	VerticeID INTEGER   NOT NULL PRIMARY KEY,
	ConnectivityID INTEGER   NOT NULL,
	LongitudeXCoordinate DOUBLE   NOT NULL,
	LatitudeYcoordinate  DOUBLE   NOT NULL,
	FOREIGN KEY (ConnectivityID) REFERENCES Connections (ConnectivityID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

/***************************************************************************/
/***************************** CREATE STORAGE ******************************/
/***************************************************************************/

CREATE TABLE Binarys (
	BinaryID INTEGER   NOT NULL PRIMARY KEY,
	BinaryValue BINARY (1)  NOT NULL,
	DataStorageID INTEGER   NOT NULL,
	BinaryValueMeaningID INTEGER   NOT NULL,
	FOREIGN KEY (BinaryValueMeaningID) REFERENCES BinaryValueMeaning (BinaryValueMeaningID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE FileBased (
	FileBasedID INTEGER   NOT NULL PRIMARY KEY,
	FileName VARCHAR (255)  NOT NULL,
	FileFormateCV VARCHAR (255)  NOT NULL,
	FileLocationOnDesk VARCHAR (255)  NOT NULL,
	DataStorageID INTEGER   NOT NULL,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (FileFormateCV) REFERENCES FileFormat (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MultiColumnArray (
	MultiColumnID INTEGER   NOT NULL PRIMARY KEY,
	ColumnNameID INTEGER   NOT NULL,
	DataStorageID INTEGER   NOT NULL,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE MultiColumnValues (
	MultiColumnValueID INTEGER   NOT NULL PRIMARY KEY,
	Value VARCHAR (255)  NOT NULL,
	ValueOrder INTEGER   NOT NULL,
	MultiColumnID INTEGER   NOT NULL,
	FOREIGN KEY (MultiColumnID) REFERENCES MultiColumnArray (MultiColumnID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Parameters (
	ParameterID INTEGER   NOT NULL PRIMARY KEY,
	ParameterValue FLOAT   NULL,
	ParameterSubName VARCHAR (255)  NULL,
	DataStorageID INTEGER   NULL,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Rules (
	RuleID INTEGER   NOT NULL PRIMARY KEY,
	RuleVariableID INTEGER   NOT NULL,
	RuleVariableOrder INTEGER   NULL,
	SymbolCV VARCHAR (255)  NOT NULL,
	NumConstant FLOAT   NULL,
	DataStorageID INTEGER   NOT NULL,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SymbolCV) REFERENCES Symbols (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SeasonalParameters (
	SeasonalParameterID INTEGER   NOT NULL PRIMARY KEY,
	SeasonStartDateTime VARCHAR (50)  NOT NULL,
	SeasonEndDateTime VARCHAR (50)  NOT NULL,
	SeasonNameCV VARCHAR (255)  NOT NULL,
	SeasonValue VARCHAR (500)  NOT NULL,
	DataStorageID INTEGER   NOT NULL,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SeasonNameCV) REFERENCES SeasonName (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TextControlled (
	TextControlledID INTEGER   NOT NULL PRIMARY KEY,
	TextControlledValueID INTEGER   NOT NULL,
	DataStorageID INTEGER   NOT NULL,
	FOREIGN KEY (TextControlledValueID) REFERENCES TextControlledValues (TextControlledValueID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TextFree (
	TextFreeID INTEGER   NOT NULL PRIMARY KEY,
	TextFreeValue VARCHAR (500)  NULL,
	DataStorageID INTEGER   NOT NULL,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TimeSeries (
	TimeSeriesID INTEGER   NOT NULL PRIMARY KEY,
	AggregationStatisticCV VARCHAR (255)  NOT NULL,
	AggregationInterval DOUBLE   NOT NULL,
	IntervalTimeUnitID INTEGER   NOT NULL,
	BeginDateTime DATETIME   NULL,
	EndDateTime DATETIME   NULL,
	IsRegular BIT   NULL,
	NoDataValue VARCHAR (50)  NULL,
	Description TEXT   NULL,
	DataStorageID INTEGER   NOT NULL,
	FOREIGN KEY (AggregationStatisticCV) REFERENCES AggregationStatistic (Term)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (DataStorageID) REFERENCES DataStorage (DataStorageID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (IntervalTimeUnitID) REFERENCES Units (UnitID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE TimeSeriesValues (
	TimeSeriesValueID INTEGER   NOT NULL PRIMARY KEY,
	TimeSeriesID INTEGER   NOT NULL,
	DateTimeStamp DATETIME   NOT NULL,
	Value FLOAT   NOT NULL,
	FOREIGN KEY (TimeSeriesID) REFERENCES TimeSeries (TimeSeriesID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);
