/*
02 SearchSystemInfrastructureComponentsForModel

Use case #2: What are the available water system infrastructure components to expand the Lower Bear River Model to the entire Bear River Watershed? 

This query discovers the available data to expand the existing Lower Bear River Model in the Water and Evaluation 
and Assessment (WEAP) model to the entire Bear Watershed 

The search is based on a boundary of coordinates for instances in the upper Bear River Watershed. 
Users need to only change these coordinates to discover data in other regions 


Result:
Users can see the number of available instances and attributes for object types that WEAP requires. 
They can see the sources of each Object types and the native name in its original source along with the 
controlled or common name. 

Users can further search for more metadata and data about these instances. 
Then they can choose which ones to import to their model 

*/

-- Select the available Object Types that match with what WEAP is looking for.
-- Controlled vocabularies of Object Types is the mediator between WEAP and the other sources semantics 

-- Count the number of instances that are available for each Object Type
SELECT  DISTINCT NativeObjectName,COUNT(DISTINCT "Instances"."InstanceName") AS "#Of Instances",
"CommonObjectType", ObjectTopology ,"MasterNetworkName" 


-- Count the number of attributes that are available for each Object type 
--COUNT (DISTINCT "Attributes"."NativeAttributeName") AS "#Ofattributes",

FROM "DataStructures"

-- Left join the Object types with the select Data Structure 
Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN "CommonObjectTypes" 
ON "CommonObjectTypes"."CommonObjectTypeID"="ObjectTypes"."CommonObjectTypeID" 

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN "Mapping"
ON "Mapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "ScenarioMapping"
ON "ScenarioMapping"."MappingID"="Mapping"."MappingID"

Left JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."MasterNetworkID"

LEFT JOIN "Instances"
ON "Instances"."InstanceID"="Mapping"."InstanceID"

Left JOIN "Connections" 
ON "Connections"."LinkInstanceID"="Instances"."InstanceID"

Left JOIN "Instances" As "StartNodeInstance"
ON "StartNodeInstance"."InstanceID"="Connections"."StartNodeInstanceID"


WHERE
-- specify the boundary of coordinates of the search domain in space 
-- this Boundary is for the parts of the upper Bear River Watershed 
("Instances"."Longitude">='-112.4424' 
AND "Instances"."Longitude"<='-110.65833'
AND "Instances"."Latitude">='42.00'
AND "Instances"."Latitude"<='42.700') AND


-- Select the list of Object Types that only WEAP requires based on the common object type mediator 
("CommonObjectType" IN (SELECT  DISTINCT  "CommonObjectType" 

FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN "CommonObjectTypes" 
ON "CommonObjectTypes"."CommonObjectTypeID"="ObjectTypes"."CommonObjectTypeID" 

-- Query only the WEAP Data Structure   

WHERE "DataStructureName"='WEAP') OR 

-- Include the  Streams Object Type
 "CommonObjectType"='Stream' OR 

-- Include the  Water Bodies Object Type
 "CommonObjectType"='Water Body')
 
GROUP BY
"MasterNetworkName" ,"ObjectTypes"."NativeObjectName",
"CommonObjectType"