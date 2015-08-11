﻿-- 4.81 TimeSeriesValues

/*
This query shows data values for a particular time series their attributes, units, object names, and instances, and data source 

Result:
Users can import these time series data to their model 
WaM-DaM keeps track of the meanings of data values, their units, to what instance they apply too.... 
*/


SELECT InstanceName,
"NativeAttributeName",
AggregationStatisticCV,
Units.UnitName AS IntervalTimeUnitName,
AggregationInterval,
UnitInterval.UnitName,
DateTimeStamp,
Value

FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"


Left JOIN "Units" 
ON "Units"."UnitID"="Attributes"."UnitID"

Left JOIN "MetadataMapping"
ON "MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Instances" 
ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"

Left JOIN "DataStorage" 
ON "DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

LEFT JOIN "ScenarioMetadata"
ON "ScenarioMetadata"."MetadataMappingID"="MetadataMapping"."MetadataMappingID"

Left JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMetadata"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "TimeSeries" 
ON "TimeSeries"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "TimeSeriesValues" 
ON "TimeSeriesValues"."TimeSeriesID"="TimeSeries"."TimeSeriesID"

Left JOIN "Units" AS UnitInterval
ON UnitInterval.UnitID="TimeSeries"."IntervalTimeUnitID"

WHERE  InstanceName='LOGAN RIVER ABOVE STATE DAM, NEAR LOGAN, UT'  AND AttributeTypeCodeCV='T' AND NativeAttributeName!='ObjectInstances'

