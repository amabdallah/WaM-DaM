-- What are the water system infrastructure components, within this boundary? 
-- "Longitude" >'-112.2571' and <='-111.015'
-- "Latitude" >='41.505' and <='42.715'

-- lakes and reservoirs that have a surface area greater than 300 acres and maximum storage greater than 
-- 10,000 acre-foot, and reservoir purpose for irrigation 

-- General Query across the database 
SELECT  DISTINCT "Instances"."InstanceName","ObjectTypes"."NativeObjectName","CommonObjectType","ObjectTopology","MasterNetworkName"
--"CommonAttributeName","ValueDefinition","ParameterValue"
--,"Longitude"

--"ScenarioName"
FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN "CommonObjectTypes" 
ON "CommonObjectTypes"."CommonObjectTypeID"="ObjectTypes"."CommonObjectTypeID"

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN  "CommonAttributes"
ON "CommonAttributes"."CommonAttributeID"="Attributes"."CommonAttributeID"

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

Left JOIN "Instances" 
ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"

Left JOIN "TextControlled" 
ON "TextControlled"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "TextControlledValues" 
ON "TextControlledValues"."TextControlledValueID"="TextControlled"."TextControlledValueID"

Left JOIN "Parameters" 
ON "Parameters"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "TextFree" 
ON "TextFree"."DataStorageID"="DataStorage"."DataStorageID"

WHERE  "Instances"."Longitude">='-88.00' AND "Instances"."Latitude">='33.00'
AND "Attributes"."NativeAttributeName"='ObjectInstances' 

AND "Instances"."Longitude"<='-87.00' AND "Instances"."Latitude"<='34.00'
AND  "Attributes"."NativeAttributeName"='ObjectInstances' 
ORDER BY "InstanceName"
