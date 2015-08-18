/*
06.3 ScenarioDataValues

This query summarizes the difference of data values between two scenarios of the Lower Bear River 
Master Network. 

The query should identify which instances has changes in data values. 

Result:

*/
-- Find the different data values in the base case scenario
-- 3.8 TimeSeries

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
AggregationInterval,SourceName,MethodName,
UnitInterval.UnitName,	
ScenarioName,
AttributeTypeCodeCV

FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN "Methods" 
ON "Methods"."MethodID"="Mapping"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="Mapping"."SourceID"

Left JOIN "Units" 
ON "Units"."UnitID"="Attributes"."UnitID"

Left JOIN "Mapping"
ON "Mapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Instances" 
ON "Instances"."InstanceID"="Mapping"."InstanceID"

Left JOIN "DataStorage" 
ON "DataStorage"."DataStorageID"="Mapping"."DataStorageID"

LEFT JOIN "ScenarioMapping"
ON "ScenarioMapping"."MappingID"="Mapping"."MappingID"

Left JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "TimeSeries" 
ON "TimeSeries"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "Units" AS UnitInterval
ON UnitInterval.UnitID="TimeSeries"."IntervalTimeUnitID"

WHERE  NativeAttributeName='Headflow'  AND AttributeTypeCodeCV='T' AND 
InstanceName='Bear River'


