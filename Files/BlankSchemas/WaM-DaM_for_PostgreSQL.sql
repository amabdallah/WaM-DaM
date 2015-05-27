
CREATE EXTENSION if not exists postgis;
CREATE EXTENSION if not exists postgis_topology;
CREATE EXTENSION if not exists fuzzystrmatch;
CREATE EXTENSION if not exists postgis_tiger_geoCoder;

drop schema if exists WaMDaM cascade;

create schema WaMDaM;

/***************************************************************************/
/******************************* CREATE CORE *******************************/
/***************************************************************************/

create table WaMDaM.Attributes (
	attributeid serial  NOT NULL primary key,
	nativeattributename varchar (255) NOT NULL,
	unitid integer  NOT NULL,
	attributedescription text  NULL,
	commonattributeid integer  NULL
);
create table WaMDaM.DataStorage (
	datastorageid integer  NOT NULL primary key
);
create table WaMDaM.DataStructures (
	datastructureid serial  NOT NULL primary key,
	datastructurename varchar (255) NOT NULL,
	datastructuredomaincv varchar (255) NOT NULL,
	datastructurewebpage varchar (255) NULL,
	datastrcuturedescription text  NULL
);
create table WaMDaM.Instances (
	instanceid serial  NOT NULL primary key,
	instancename varchar (255) NULL,
	instancecode varchar (255) NULL,
	statuscv varchar (255) NULL,
	longitude double precision  NULL,
	latitude double precision  NULL,
	description text  NULL,
	relatedinstanceid integer  NULL
);
create table WaMDaM.MasterNetworks (
	masternetworkid serial  NOT NULL primary key,
	masternetworkname varchar (255) NOT NULL,
	spatialreferenceid integer  NULL,
	verticaldatumcv varchar (255) NULL,
	relatedmasternetwork integer  NULL,
	description text  NULL
);
create table WaMDaM.MetadataMapping (
	metadatamappingid serial  NOT NULL primary key,
	objectattributeid integer  NOT NULL,
	instanceid integer  NOT NULL,
	inputoroutput varchar (255) NULL,
	sourceid integer  NULL,
	methodid integer  NULL,
	attributetypecodecv varchar (255) NULL,
	datastorageid integer  NULL
);
create table WaMDaM.ObjectAttributes (
	objectattributeid serial  NOT NULL primary key,
	objecttypeid integer  NOT NULL,
	attributeid integer  NOT NULL,
	attributecode varchar (50) NULL,
	nativeattributecategoryid integer  NULL,
	relatedobjectattributeid integer  NULL
);
create table WaMDaM.ObjectTypes (
	objecttypeid serial  NOT NULL primary key,
	nativeobjectname varchar (255) NOT NULL,
	objectcode varchar (50) NULL,
	objecttopology varchar (50) NOT NULL,
	mapcolor varchar (50) NULL,
	mapsymbol varchar (50) NULL,
	description text  NULL,
	datastructureid integer  NOT NULL,
	nativeobjectcategoryid integer  NULL,
	commonobjecttypeid integer  NULL
);
create table WaMDaM.SceanrioMetadata (
	sceanriometadataid serial  NOT NULL primary key,
	scenarioid integer  NOT NULL,
	metadatamappingid integer  NOT NULL
);
create table WaMDaM.Scenarios (
	scenarioid serial  NOT NULL primary key,
	scenarioname varchar (255) NOT NULL,
	description text  NULL,
	masternetworkid integer  NOT NULL
);
/***************************************************************************/
/******************************* CREATE CVS ********************************/
/***************************************************************************/

create table WaMDaM.AggregationStatistic (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.AttributeTypeCode (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.BinaryValueMeaning (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.CommonAttributeCategory (
	commonattributecategoryid serial  NOT NULL primary key,
	commonattributecategoryname varchar (255) NOT NULL,
	commoncategorydefinition text  NULL,
	parentcommonattributecategoryid integer  NULL
);
create table WaMDaM.CommonAttributes (
	commonattributeid serial  NOT NULL primary key,
	commonattributename varchar (255) NOT NULL,
	commonattributedefinition text  NULL,
	commonattributecategoryid integer  NULL
);
create table WaMDaM.CommonObjectCategory (
	commonobjectcategoryid serial  NOT NULL primary key,
	commonobjectcategoryname varchar (255) NOT NULL,
	commoncategorydefinition text  NULL,
	parentcommonobjectcategoryid integer  NULL
);
create table WaMDaM.CommonObjectTypes (
	commonobjecttypeid serial  NOT NULL primary key,
	commonobjecttype varchar (255) NOT NULL,
	commonobjecttopology varchar (50) NULL,
	commonobjectdefinition text  NULL,
	commonobjectcategoryid integer  NULL
);
create table WaMDaM.ControlledTextValues (
	controlledtextvalueid serial  NOT NULL primary key,
	controlledtextvalue varchar (255) NOT NULL,
	controlledtextattribute varchar (255) NOT NULL,
	valuedefinition text  NULL
);
create table WaMDaM.DataStructureDomain (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.FileFormate (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.InstanceStatus (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.MethodType (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.OrganizationType (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.SeasonName (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.SpatialReference (
	spatialreferenceid serial  NOT NULL primary key,
	srsname varchar (500) NOT NULL,
	srsid integer  NOT NULL,
	isgeographic integer  NOT NULL,
	notes text  NULL
);
create table WaMDaM.Symbols (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
create table WaMDaM.Units (
	unitid serial  NOT NULL primary key,
	unittype varchar (255) NOT NULL,
	unitname varchar (255) NOT NULL,
	unitsystem varchar (255) NULL,
	unitabbreviation char (50) NOT NULL
);
create table WaMDaM.VerticalDatum (
	term varchar (255) NOT NULL primary key,
	definition text  NULL
);
/***************************************************************************/
/***************************** CREATE METADATA *****************************/
/***************************************************************************/

create table WaMDaM.Connections (
	connectivityid serial  NOT NULL primary key,
	linkinstanceid integer  NOT NULL,
	startnodeinstanceid integer  NOT NULL,
	endnodeinstanceid integer  NOT NULL
);
create table WaMDaM.Methods (
	methodid serial  NOT NULL primary key,
	methodname varchar (255) NOT NULL,
	methodwebpage varchar (255) NULL,
	methoddescription text  NULL,
	methodtypecv varchar (255) NOT NULL,
	personid integer  NOT NULL,
	modelid integer  NULL,
	parentmethodid integer  NULL
);
create table WaMDaM.Models (
	modesid serial  NOT NULL primary key,
	modelname varchar (255) NOT NULL,
	modelwebpage varchar (500) NULL,
	modelinstancename varchar (255) NOT NULL,
	modeldatecreated date  NULL,
	description text  NULL,
	timestep double precision  NULL,
	timestepunit integer  NULL,
	modelstartdatetime timestamp  NULL,
	modelenddatetime timestamp  NULL
);
create table WaMDaM.NativeAttributeCategory (
	nativeattributecategoryid serial  NOT NULL primary key,
	nativeattributecategoryname varchar (255) NOT NULL,
	nativeattributecategorydefinition text  NULL,
	nativeattributecategorygroup varchar (255) NULL,
	parentnativeattributecategoryid integer  NULL
);
create table WaMDaM.NativeObjectCategory (
	nativeobjectcategoryid serial  NOT NULL primary key,
	nativeobjectcategoryname varchar (255) NOT NULL,
	nativeobjectcategorydefinition text  NULL,
	nativeobjectcategorygroup varchar (500) NULL,
	parentnativeobjectcategoryid integer  NULL
);
create table WaMDaM.Organizations (
	organizationid serial  NOT NULL primary key,
	organizationname varchar (255) NULL,
	organizationtypecv varchar (255) NULL,
	webpage varchar (255) NULL,
	organizationdescription text  NULL,
	parentorganizationid integer  NULL
);
create table WaMDaM.People (
	personid serial  NOT NULL primary key,
	contactname varchar (255) NULL,
	address varchar (255) NULL,
	email varchar (255) NULL,
	webpage varchar (255) NULL,
	phone varchar (50) NULL,
	position varchar (255) NULL,
	organizationid integer  NOT NULL
);
create table WaMDaM.Sources (
	sourceid serial  NOT NULL primary key,
	sourcename varchar (500) NOT NULL,
	sourcewebpage varchar (500) NULL,
	sourcedescription text  NULL,
	citation varchar (500) NULL,
	personid integer  NULL,
	parentsourceid integer  NULL
);
create table WaMDaM.Vertices (
	verticeid serial  NOT NULL primary key,
	connectivityid integer  NOT NULL,
	longitudexcoordinate double precision  NOT NULL,
	latitudeycoordinate  double precision  NOT NULL
);
/***************************************************************************/
/***************************** CREATE STORAGE ******************************/
/***************************************************************************/

create table WaMDaM.Binarys (
	binaryid serial  NOT NULL primary key,
	binaryvalue bit varying (1) NOT NULL,
	binaryvaluemeaningcv varchar (255) NOT NULL,
	datastorageid integer  NOT NULL
);
create table WaMDaM.ControlledText (
	controlledtextid serial  NOT NULL primary key,
	datastorageid integer  NOT NULL,
	controlledtextvalueid integer  NOT NULL
);
create table WaMDaM.FileBased (
	filebasedid serial  NOT NULL primary key,
	filename varchar (255) NOT NULL,
	fileformatecv varchar (255) NOT NULL,
	filelocationondesk varchar (255) NOT NULL,
	datastorageid integer  NOT NULL
);
create table WaMDaM.Functions (
	functionid serial  NOT NULL primary key,
	functionvariableid integer  NOT NULL,
	functionvariableorder integer  NULL,
	symbolcv varchar (255) NOT NULL,
	datastorageid integer  NOT NULL
);
create table WaMDaM.MultiColumnArray (
	multicolumnid serial  NOT NULL primary key,
	columnnameid integer  NOT NULL,
	datastorageid integer  NOT NULL
);
create table WaMDaM.MultiColumnValues (
	multicolumnvalueid serial  NOT NULL primary key,
	multicolumnid integer  NOT NULL,
	value varchar (255) NOT NULL,
	valueorder integer  NOT NULL
);
create table WaMDaM.Parameters (
	parameterid serial  NOT NULL primary key,
	parametervalue double precision  NULL,
	parametersubname varchar (255) NULL,
	datastorageid integer  NULL
);
create table WaMDaM.SeasonalParameters (
	seasonalparameterid serial  NOT NULL primary key,
	seasonstartdatetime timestamp  NOT NULL,
	seasonenddatetime timestamp  NOT NULL,
	seasonnamecv varchar (255) NOT NULL,
	seasonvalue varchar (500) NOT NULL,
	datastorageid integer  NOT NULL
);
create table WaMDaM.TextFree (
	textfreeid serial  NOT NULL primary key,
	textfreevalue varchar (500) NULL,
	datastorageid integer  NOT NULL
);
create table WaMDaM.TimeSeries (
	timeseriesid serial  NOT NULL primary key,
	aggregationstatisticcv varchar (255) NOT NULL,
	aggregationinterval double precision  NOT NULL,
	intervaltimeunitid integer  NOT NULL,
	begindatetime timestamp  NULL,
	enddatetime timestamp  NULL,
	isregular boolean  NULL,
	nodatavalue varchar (50) NULL,
	description text  NULL,
	datastorageid integer  NOT NULL
);
create table WaMDaM.TimeSeriesValues (
	timeseriesdataid serial  NOT NULL primary key,
	timeseriesid integer  NOT NULL,
	datetimestamp timestamp  NOT NULL,
	value double precision  NOT NULL
);

alter table WaMDaM.Attributes add constraint fk_Attributes_CommonAttributes
foreign key (CommonAttributeID) References WaMDaM.CommonAttributes (CommonAttributeID)
on update no Action on delete cascade;

alter table WaMDaM.Attributes add constraint fk_Attributes_Units
foreign key (UnitID) References WaMDaM.Units (UnitID)
on update no Action on delete cascade;

alter table WaMDaM.DataStructures add constraint fk_DataStructures_DataStructureDomain
foreign key (DataStructureDomainCV) References WaMDaM.DataStructureDomain (Term)
on update no Action on delete cascade;

alter table WaMDaM.Instances add constraint fk_Instances_Instances
foreign key (RelatedInstanceID) References WaMDaM.Instances (InstanceID)
on update no Action on delete cascade;

alter table WaMDaM.Instances add constraint fk_Instances_InstanceStatus
foreign key (StatusCV) References WaMDaM.InstanceStatus (Term)
on update no Action on delete cascade;

alter table WaMDaM.MasterNetworks add constraint fk_MasterNetworks_MasterNetworks
foreign key (RelatedMasterNetwork) References WaMDaM.MasterNetworks (MasterNetworkID)
on update no Action on delete cascade;

alter table WaMDaM.MasterNetworks add constraint fk_MasterNetworks_SpatialReference
foreign key (SpatialReferenceID) References WaMDaM.SpatialReference (SpatialReferenceID)
on update no Action on delete cascade;

alter table WaMDaM.MasterNetworks add constraint fk_MasterNetworks_VerticalDatum
foreign key (VerticalDatumCV) References WaMDaM.VerticalDatum (Term)
on update no Action on delete cascade;

alter table WaMDaM.MetadataMapping add constraint fk_MetadataMapping_AttributeTypeCode
foreign key (AttributeTypeCodeCV) References WaMDaM.AttributeTypeCode (Term)
on update no Action on delete cascade;

alter table WaMDaM.MetadataMapping add constraint fk_MetadataMapping_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.MetadataMapping add constraint fk_MetadataMapping_Instances
foreign key (InstanceID) References WaMDaM.Instances (InstanceID)
on update no Action on delete cascade;

alter table WaMDaM.MetadataMapping add constraint fk_MetadataMapping_Methods
foreign key (MethodID) References WaMDaM.Methods (MethodID)
on update no Action on delete cascade;

alter table WaMDaM.MetadataMapping add constraint fk_MetadataMapping_ObjectAttributes
foreign key (ObjectAttributeID) References WaMDaM.ObjectAttributes (ObjectAttributeID)
on update no Action on delete cascade;

alter table WaMDaM.MetadataMapping add constraint fk_MetadataMapping_Sources
foreign key (SourceID) References WaMDaM.Sources (SourceID)
on update no Action on delete cascade;

alter table WaMDaM.ObjectAttributes add constraint fk_ObjectAttributes_Attributes
foreign key (AttributeID) References WaMDaM.Attributes (AttributeID)
on update no Action on delete cascade;

alter table WaMDaM.ObjectAttributes add constraint fk_ObjectAttributes_NativeAttributeCategory
foreign key (NativeAttributeCategoryID) References WaMDaM.NativeAttributeCategory (NativeAttributeCategoryID)
on update no Action on delete cascade;

alter table WaMDaM.ObjectAttributes add constraint fk_ObjectAttributes_ObjectAttributes
foreign key (RelatedObjectAttributeID) References WaMDaM.ObjectAttributes (ObjectAttributeID)
on update no Action on delete cascade;

alter table WaMDaM.ObjectAttributes add constraint fk_ObjectAttributes_ObjectTypes
foreign key (ObjectTypeID) References WaMDaM.ObjectTypes (ObjectTypeID)
on update no Action on delete cascade;

alter table WaMDaM.ObjectTypes add constraint fk_ObjectTypes_CommonObjectTypes
foreign key (CommonObjectTypeID) References WaMDaM.CommonObjectTypes (CommonObjectTypeID)
on update no Action on delete cascade;

alter table WaMDaM.ObjectTypes add constraint fk_ObjectTypes_DataStructures
foreign key (DataStructureID) References WaMDaM.DataStructures (DataStructureID)
on update no Action on delete cascade;

alter table WaMDaM.ObjectTypes add constraint fk_ObjectTypes_NativeObjectCategory
foreign key (NativeObjectCategoryID) References WaMDaM.NativeObjectCategory (NativeObjectCategoryID)
on update no Action on delete cascade;

alter table WaMDaM.SceanrioMetadata add constraint fk_SceanrioMetadata_MetadataMapping
foreign key (MetadataMappingID) References WaMDaM.MetadataMapping (MetadataMappingID)
on update no Action on delete cascade;

alter table WaMDaM.SceanrioMetadata add constraint fk_SceanrioMetadata_Scenarios
foreign key (ScenarioID) References WaMDaM.Scenarios (ScenarioID)
on update no Action on delete cascade;

alter table WaMDaM.Scenarios add constraint fk_Scenarios_MasterNetworks
foreign key (MasterNetworkID) References WaMDaM.MasterNetworks (MasterNetworkID)
on update no Action on delete cascade;

alter table WaMDaM.CommonAttributeCategory add constraint fk_CommonAttributeCategory_CommonAttributeCategory
foreign key (ParentCommonAttributeCategoryID) References WaMDaM.CommonAttributeCategory (CommonAttributeCategoryID)
on update no Action on delete cascade;

alter table WaMDaM.CommonAttributes add constraint fk_CommonAttributes_CommonAttributeCategory
foreign key (CommonAttributeCategoryID) References WaMDaM.CommonAttributeCategory (CommonAttributeCategoryID)
on update no Action on delete cascade;

alter table WaMDaM.CommonObjectCategory add constraint fk_CommonObjectCategory_CommonObjectCategory
foreign key (ParentCommonObjectCategoryID) References WaMDaM.CommonObjectCategory (CommonObjectCategoryID)
on update no Action on delete cascade;

alter table WaMDaM.CommonObjectTypes add constraint fk_CommonObjectTypes_CommonObjectCategory
foreign key (CommonObjectCategoryID) References WaMDaM.CommonObjectCategory (CommonObjectCategoryID)
on update no Action on delete cascade;

alter table WaMDaM.Connections add constraint fk_Connections_Instances
foreign key (LinkInstanceID) References WaMDaM.Instances (InstanceID)
on update no Action on delete cascade;

alter table WaMDaM.Methods add constraint fk_Methods_Methods
foreign key (ParentMethodID) References WaMDaM.Methods (MethodID)
on update no Action on delete cascade;

alter table WaMDaM.Methods add constraint fk_Methods_MethodType
foreign key (MethodTypeCV) References WaMDaM.MethodType (Term)
on update no Action on delete cascade;

alter table WaMDaM.Methods add constraint fk_Methods_Models
foreign key (ModelID) References WaMDaM.Models (ModesID)
on update no Action on delete cascade;

alter table WaMDaM.Methods add constraint fk_Methods_People
foreign key (PersonID) References WaMDaM.People (PersonID)
on update no Action on delete cascade;

alter table WaMDaM.Models add constraint fk_Models_Units
foreign key (TimeStepUnit) References WaMDaM.Units (UnitID)
on update no Action on delete cascade;

alter table WaMDaM.NativeAttributeCategory add constraint fk_NativeAttributeCategory_NativeAttributeCategory
foreign key (ParentNativeAttributeCategoryID) References WaMDaM.NativeAttributeCategory (NativeAttributeCategoryID)
on update no Action on delete cascade;

alter table WaMDaM.NativeObjectCategory add constraint fk_NativeObjectCategory_NativeObjectCategory
foreign key (ParentNativeObjectCategoryID) References WaMDaM.NativeObjectCategory (NativeObjectCategoryID)
on update no Action on delete cascade;

alter table WaMDaM.Organizations add constraint fk_Organizations_Organizations
foreign key (ParentOrganizationID) References WaMDaM.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table WaMDaM.Organizations add constraint fk_Organizations_OrganizationType
foreign key (OrganizationTypeCV) References WaMDaM.OrganizationType (Term)
on update no Action on delete cascade;

alter table WaMDaM.People add constraint fk_People_Organizations
foreign key (OrganizationID) References WaMDaM.Organizations (OrganizationID)
on update no Action on delete cascade;

alter table WaMDaM.Sources add constraint fk_Sources_People
foreign key (PersonID) References WaMDaM.People (PersonID)
on update no Action on delete cascade;

alter table WaMDaM.Sources add constraint fk_Sources_Sources
foreign key (ParentSourceID) References WaMDaM.Sources (SourceID)
on update no Action on delete cascade;

alter table WaMDaM.Vertices add constraint fk_Vertices_Connections
foreign key (ConnectivityID) References WaMDaM.Connections (ConnectivityID)
on update no Action on delete cascade;

alter table WaMDaM.Binarys add constraint fk_Binarys_BinaryValueMeaning
foreign key (BinaryValueMeaningCV) References WaMDaM.BinaryValueMeaning (Term)
on update no Action on delete cascade;

alter table WaMDaM.Binarys add constraint fk_Binarys_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.ControlledText add constraint fk_ControlledText_ControlledTextValues
foreign key (ControlledTextValueID) References WaMDaM.ControlledTextValues (ControlledTextValueID)
on update no Action on delete cascade;

alter table WaMDaM.ControlledText add constraint fk_ControlledText_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.FileBased add constraint fk_FileBased_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.FileBased add constraint fk_FileBased_FileFormate
foreign key (FileFormateCV) References WaMDaM.FileFormate (Term)
on update no Action on delete cascade;

alter table WaMDaM.Functions add constraint fk_Functions_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.Functions add constraint fk_Functions_Symbols
foreign key (SymbolCV) References WaMDaM.Symbols (Term)
on update no Action on delete cascade;

alter table WaMDaM.MultiColumnArray add constraint fk_MultiColumnArray_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.MultiColumnValues add constraint fk_MultiColumnValues_MultiColumnArray
foreign key (MultiColumnID) References WaMDaM.MultiColumnArray (MultiColumnID)
on update no Action on delete cascade;

alter table WaMDaM.Parameters add constraint fk_Parameters_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.SeasonalParameters add constraint fk_SeasonalParameters_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.SeasonalParameters add constraint fk_SeasonalParameters_SeasonName
foreign key (SeasonNameCV) References WaMDaM.SeasonName (Term)
on update no Action on delete cascade;

alter table WaMDaM.TextFree add constraint fk_FreeText_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.TimeSeries add constraint fk_TimeSeries_AggregationStatistic
foreign key (AggregationStatisticCV) References WaMDaM.AggregationStatistic (Term)
on update no Action on delete cascade;

alter table WaMDaM.TimeSeries add constraint fk_TimeSeries_DataStorage
foreign key (DataStorageID) References WaMDaM.DataStorage (DataStorageID)
on update no Action on delete cascade;

alter table WaMDaM.TimeSeries add constraint fk_TimeSeries_Units
foreign key (IntervalTimeUnitID) References WaMDaM.Units (UnitID)
on update no Action on delete cascade;

alter table WaMDaM.TimeSeriesValues add constraint fk_TimeSeriesValues_TimeSeries
foreign key (TimeSeriesID) References WaMDaM.TimeSeries (TimeSeriesID)
on update no Action on delete cascade;