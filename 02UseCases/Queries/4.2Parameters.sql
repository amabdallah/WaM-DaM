-- 4.2 Parameters

/*
This query shows parameters data values, their attributes, units, object names, and instances, and data source 
for all the parameters in WaM-DaM

Result:
users can import the data values to their model. WaM-DaM keeps track of the meanings of data values, their units, 
to what instance they apply too.... 

*/

SELECT NativeObjectName,InstanceName,"NativeAttributeName","UnitName",
"Parameters"."ParameterValue",

"DataStructures"."DataStructureName"
--"CommonObjectType",
--"MasterNetworkName",
-- "NativeObjectName",
--,"Instances"."InstanceName",
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
ON "ScenarioMapping"."MappingID"="Mapping"."MappingID"

Left JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "Parameters" 
ON "Parameters"."DataStorageID"="DataStorage"."DataStorageID"

WHERE AttributeTypeCodeCV='P' AND 

-- specify the boundary of coordinates of the search domain in space 
-- this Boundary is for the parts of the upper Bear River Watershed 
("Instances"."Longitude">='-112.4424' 
AND "Instances"."Longitude"<='-110.65833'
AND "Instances"."Latitude">='42.00'
AND "Instances"."Latitude"<='42.700') 
