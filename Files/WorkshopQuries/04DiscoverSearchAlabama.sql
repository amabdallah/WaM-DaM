 /*
This query discovers the available data to to build a model in the Water and Evaluation 
and Assessment (WEAP) system for the Tuscaloosa region, Alabama

The search is based on a boundary of coordinates for instances in the Tuscaloosa region, Alabama
Users need to only change these coordinates to discover data in other regions 


Result:
Users can see the Objects, their topology, and their Attributes that WEAP uses 
to model water systems. These Object and Attributes are used as input to queries 
to search and discover water management data in other data structures

Users can further search for more metadata and data about these instances. 
Then they can choose which ones to import to their model 

*/

-- Select the available Object Types that match with what WEAP is looking for.
-- Controlled vocabularies of Object Types is the mediator between WEAP and the other sources semantics 

SELECT  DISTINCT "Instances"."InstanceName","ObjectTypes"."NativeObjectName","CommonObjectType","ObjectTopology","MasterNetworkName"

-- 
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


-- specify the boundary of coordinates of the search domain in space 
-- this Boundary is for the Tuscaloosa region, Alabama
WHERE  "Instances"."Longitude">='-88.00' AND "Instances"."Latitude">='33.00'
AND "Attributes"."NativeAttributeName"='ObjectInstances' 

AND "Instances"."Longitude"<='-87.00' AND "Instances"."Latitude"<='34.00'
AND  "Attributes"."NativeAttributeName"='ObjectInstances'  AND

("CommonObjectType" IN (SELECT  DISTINCT  "CommonObjectType" 

FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN "CommonObjectTypes" 
ON "CommonObjectTypes"."CommonObjectTypeID"="ObjectTypes"."CommonObjectTypeID" 

-- Query only the WEAP Data Structure   
WHERE "DataStructureName"='WEAP') OR 

-- Include the WaterBody and Streams Object Types 
"CommonObjectType"='Stream')


ORDER BY "InstanceName"
