
SELECT  DISTINCT  
/*"Core"."DataStructures"."DataStructureName","related"."MasterNetworkName","Core"."MasterNetworks"."MasterNetworkName",*/
--"Core"."ObjectTypes"."NativeObjectName",
"CommonObjectType","Core"."Instances"."InstanceName",
COUNT (DISTINCT "Core"."Attributes"."NativeAttributeName") AS "#Ofattributes",
COUNT(DISTINCT "Core"."Instances"."InstanceName") AS "#Ofinstances"

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

Left JOIN "Core"."MasterNetworks" As "ParentMaster"
ON "ParentMaster"."RelatedMasterNetwork"="Core"."Scenarios"."MasterNetworkID"

Left JOIN "Core"."MasterNetworks" AS "related"
ON "related"."MasterNetworkID"="Core"."MasterNetworks"."RelatedMasterNetwork"

LEFT JOIN "Core"."Instances" 
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"

Left JOIN "Metadata"."Connections" 
ON "Metadata"."Connections"."LinkInstanceID"="Core"."Instances"."InstanceID"

Left JOIN "Core"."Instances" As "StartNodeInstance"
ON "StartNodeInstance"."InstanceID"="Metadata"."Connections"."StartNodeInstanceID"

WHERE
("Core"."Instances"."Longitude">='-112.4424' 
AND "Core"."Instances"."Longitude"<='-110.65833'
AND "Core"."Instances"."Latitude">='40.83833'
AND "Core"."Instances"."Latitude"<='42.84333') OR

("StartNodeInstance"."Longitude">='-112.4424'AND
 "StartNodeInstance"."Longitude"<='-110.65833'AND
 "StartNodeInstance"."Latitude">='40.83833'AND
 "StartNodeInstance"."Latitude"<='42.84333') AND

("CommonObjectType" IN (SELECT  DISTINCT  "CommonObjectType" 

FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN "CVs"."CommonObjectTypes" 
ON "CVs"."CommonObjectTypes"."CommonObjectTypeID"="Core"."ObjectTypes"."CommonObjectTypeID" 

WHERE "DataStructureName"='WEAP'  AND"CommonObjectType"!='NULL') OR "CommonObjectType"='Water Body' OR "CommonObjectType"='Stream')


GROUP BY 
--"Core"."ObjectTypes"."NativeObjectName",
"CommonObjectType","Core"."Instances"."InstanceName"


--HAVING COUNT(DISTINCT "Core"."Instances"."InstanceName")=0

/*
"Core"."DataStructures"."DataStructureName","related"."MasterNetworkName","Core"."MasterNetworks"."MasterNetworkName",
*/

