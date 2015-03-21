
SELECT  DISTINCT  "Core"."DataStructures"."DataStructureName",
"MasterNetworkName" 
--,"Core"."ObjectTypes"."NativeObjectName",
"CommonObjectType",
COUNT(DISTINCT "Core"."Instances"."InstanceName") AS "#Of Instances"
--,COUNT (DISTINCT "Core"."Attributes"."NativeAttributeName") AS "#Ofattributes",

FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN "CVs"."CommonObjectTypes" 
ON "CVs"."CommonObjectTypes"."CommonObjectTypeID"="Core"."ObjectTypes"."CommonObjectTypeID" 

Left JOIN  "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectTypeID"="Core"."ObjectTypes"."ObjectTypeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"

Left JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"

Left JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"="Core"."Scenarios"."MasterNetworkID"

LEFT JOIN "Core"."Instances"
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"


Left JOIN "Metadata"."Connections" 
ON "Metadata"."Connections"."LinkInstanceID"="Core"."Instances"."InstanceID"
-- I need to seach for streams through their start/end node coordinates 

Left JOIN "Core"."Instances" As "StartNodeInstance"
ON "StartNodeInstance"."InstanceID"="Metadata"."Connections"."StartNodeInstanceID"

Left JOIN "Core"."DataStorage" 
ON "Core"."DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

Left JOIN "Storage"."ControlledText" 
ON "Storage"."ControlledText"."DataStorageID"="Core"."DataStorage"."DataStorageID"

Left JOIN "CVs"."ControlledTextValues" 
ON "CVs"."ControlledTextValues"."ControlledTextValueID"="ControlledText"."ControlledTextValueID"

WHERE
("Core"."Instances"."Longitude">='-112.4424' 
AND "Core"."Instances"."Longitude"<='-110.65833'
AND "Core"."Instances"."Latitude">='40.83833'
AND "Core"."Instances"."Latitude"<='42.84333') AND /*OR

("StartNodeInstance"."Longitude">='-112.4424'AND
 "StartNodeInstance"."Longitude"<='-110.65833'AND
 "StartNodeInstance"."Latitude">='40.83833'AND
 "StartNodeInstance"."Latitude"<='42.84333') AND*/

("CommonObjectType" IN (SELECT  DISTINCT  "CommonObjectType" 

FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN "CVs"."CommonObjectTypes" 
ON "CVs"."CommonObjectTypes"."CommonObjectTypeID"="Core"."ObjectTypes"."CommonObjectTypeID" 

WHERE "DataStructureName"='WEAP'  AND"CommonObjectType"!='NULL') OR "CommonObjectType"='Water Body' OR "CommonObjectType"='Stream')


GROUP BY
 "Core"."DataStructures"."DataStructureName",
"MasterNetworkName" ,"Core"."ObjectTypes"."NativeObjectName",
"CommonObjectType"