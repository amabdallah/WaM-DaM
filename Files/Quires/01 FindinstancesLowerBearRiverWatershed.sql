-- search for instances of an object type within a box of coordinates

-- search for the available instances within a boundry with conditions like 
-- lakes and reservoirs that have a surface area greater than 300 acres and maximum storage greater than 
-- 10,000 acre-foot, and reservoir purpose for irrigation 

-- General Query across the database 
SELECT  DISTINCT "Instances"."InstanceName","Core"."ObjectTypes"."NativeObjectName","ObjectTopology","MasterNetworkName","Core"."DataStructures"."DataStructureName"
--"CommonAttributeName","ValueDefinition","ParameterValue"
--,"Longitude"
--"CommonObjectType"
--"ScenarioName"
FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN "CVs"."CommonObjectTypes" 
ON "CVs"."CommonObjectTypes"."CommonObjectTypeID"="Core"."ObjectTypes"."CommonObjectTypeID"

Left JOIN  "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectTypeID"="Core"."ObjectTypes"."ObjectTypeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"

Left JOIN  "CVs"."CommonAttributes"
ON "CVs"."CommonAttributes"."CommonAttributeID"="Core"."Attributes"."CommonAttributeID"

Left JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Core"."DataStorage" 
ON "Core"."DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

Left JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="MetadataMapping"."MetadataMappingID"

Left JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"= "Core"."Scenarios"."MasterNetworkID"

Left JOIN "Core"."Instances" 
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"

Left JOIN "Storage"."ControlledText" 
ON "Storage"."ControlledText"."DataStorageID"="Core"."DataStorage"."DataStorageID"

Left JOIN "CVs"."ControlledTextValues" 
ON "CVs"."ControlledTextValues"."ControlledTextValueID"="ControlledText"."ControlledTextValueID"

Left JOIN "Storage"."Parameters" 
ON "Storage"."Parameters"."DataStorageID"="Core"."DataStorage"."DataStorageID"

Left JOIN "Storage"."FreeText" 
ON "Storage"."FreeText"."DataStorageID"="Core"."DataStorage"."DataStorageID"

WHERE  "Core"."Instances"."Longitude">='-112.2571' AND "Core"."Instances"."Latitude">='41.505'
AND "Core"."Attributes"."NativeAttributeName"='ObjectInstances' 

AND "Core"."Instances"."Longitude"<='-111.015' AND "Core"."Instances"."Latitude"<='42.715'
AND  "Core"."Attributes"."NativeAttributeName"='ObjectInstances' 
AND ("InstanceName"='Cache Valley Agriculture (5)' OR "InstanceName"='Hyrum Reservoir' OR "InstanceName"='Bear River' 
OR "InstanceName"='BEAR RIVER AT IDAHO-UTAH STATE LINE'
OR "InstanceName"='Transmition Link from Withdrawal Node 8 to Barrens'
OR "InstanceName"='HYRUM'
OR "InstanceName"='Hyrum (10)') 
AND "ScenarioName"!='Proposed'
ORDER BY "InstanceName"
