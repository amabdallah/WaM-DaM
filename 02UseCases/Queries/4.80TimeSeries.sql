-- 4.8 TimeSeries

/*
This query shows time series general metadata, their attributes, units, object names, and instances, and data source 

Result:
Users can choose a single time series and further display its data values and their time stamp as
in the next query "3.81 Time Series"  
WaM-DaM keeps track of the meanings of data values, their units, to what instance they apply too.... 
*/


SELECT NativeObjectName,
InstanceName,
"NativeAttributeName",
AggregationStatisticCV,
Units.UnitName AS IntervalTimeUnitName,
AggregationInterval,
UnitInterval.UnitName,	
"DataStructureName",
AttributeTypeCodeCV

FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"


Left JOIN "Units" 
ON "Units"."UnitID"="Attributes"."UnitID"

Left JOIN "Mapping"
ON "Mapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Instances" 
ON "Instances"."InstanceID"="Mapping"."InstanceID"

Left JOIN "DataStorage" 
ON "DataStorage"."DataStorageID"="Mapping"."DataStorageID"

LEFT JOIN "ScenarioMapping"
ON "ScenarioMapping"."MetadataMappingID"="Mapping"."MetadataMappingID"

Left JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "TimeSeries" 
ON "TimeSeries"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "Units" AS UnitInterval
ON UnitInterval.UnitID="TimeSeries"."IntervalTimeUnitID"

WHERE  NativeAttributeName!='ObjectInstances'  AND AttributeTypeCodeCV='T'

