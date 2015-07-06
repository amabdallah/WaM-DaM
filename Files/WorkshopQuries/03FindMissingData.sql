-- search for instances of an object type within a box of coordinates

-- General Query across the database 
SELECT DISTINCT"ObjectTypes"."NativeObjectName","CommonObjectType", Count(DISTINCT NativeAttributeName)

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

Left JOIN "DataStorage" 
ON "DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

Left JOIN "ScenarioMetadata"
ON "ScenarioMetadata"."MetadataMappingID"="MetadataMapping"."MetadataMappingID"

Left JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMetadata"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"= "Scenarios"."MasterNetworkID"

LEFT JOIN "Instances" 
ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"
AND "Instances"."Longitude">='-112.4424'  
AND "Instances"."Longitude"<='-110.65833'
AND "Instances"."Latitude">='40.83833'
AND "Instances"."Latitude"<='42.84333'


WHERE    
"Scenarios"."ScenarioName"='BaseCaseLower'



/* OR 
"CommonObjectTypes" ."CommonObjectType"='Demand Site'AND
*/

/*
"ObjectTypes"."NativeObjectName"='Groundwater'

AND "Attributes"."NativeAttributeName"='ObjectInstances'
 
AND 
AND  "Attributes"."NativeAttributeName"='ObjectInstances'
*/
 
GROUP BY 

"ObjectTypes"."NativeObjectName"
