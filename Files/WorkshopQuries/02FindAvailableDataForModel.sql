SELECT  DISTINCT "MasterNetworkName" ,
--,"ObjectTypes"."NativeObjectName",
"CommonObjectType",
COUNT(DISTINCT "Instances"."InstanceName") AS "#Of Instances",
COUNT (DISTINCT "Attributes"."NativeAttributeName") AS "#Ofattributes"

FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN "CommonObjectTypes" 
ON "CommonObjectTypes"."CommonObjectTypeID"="ObjectTypes"."CommonObjectTypeID" 

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN "MetadataMapping"
ON "MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "ScenarioMetadata"
ON "ScenarioMetadata"."MetadataMappingID"="MetadataMapping"."MetadataMappingID"

Left JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMetadata"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."MasterNetworkID"

LEFT JOIN "Instances"
ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"


Left JOIN "Connections" 
ON "Connections"."LinkInstanceID"="Instances"."InstanceID"
-- I need to seach for streams through their start/end node coordinates 

Left JOIN "Instances" As "StartNodeInstance"
ON "StartNodeInstance"."InstanceID"="Connections"."StartNodeInstanceID"

Left JOIN "DataStorage" 
ON "DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

Left JOIN "TextControlled" 
ON "TextControlled"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "TextControlledValues" 
ON "TextControlledValues"."TextControlledValueID"="TextControlled"."TextControlledValueID"

WHERE
("Instances"."Longitude">='-112.4424' 
AND "Instances"."Longitude"<='-110.65833'
AND "Instances"."Latitude">='40.83833'
AND "Instances"."Latitude"<='42.84333') AND 

/*OR
("StartNodeInstance"."Longitude">='-112.4424'AND
 "StartNodeInstance"."Longitude"<='-110.65833'AND
 "StartNodeInstance"."Latitude">='40.83833'AND
 "StartNodeInstance"."Latitude"<='42.84333') AND
*/


("CommonObjectType" IN (SELECT  DISTINCT  "CommonObjectType" 

FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN "CommonObjectTypes" 
ON "CommonObjectTypes"."CommonObjectTypeID"="ObjectTypes"."CommonObjectTypeID" 

WHERE "DataStructureName"='WEAP'  AND"CommonObjectType"!='NULL') OR "CommonObjectType"='Water Body' OR "CommonObjectType"='Stream')


GROUP BY
--"DataStructures"."DataStructureName",
"MasterNetworkName" ,"ObjectTypes"."NativeObjectName",
"CommonObjectType"