/*
01 DataStructures

Use case # 1: What are the required types of water system components and their attributes for a WEAP model?

This query shows the data structure of Object Types and their Attributes 
for Water Evaluation and Assessment (WEAP) model. 

Result:
Users can see the Objects, their topology, and their Attributes that WEAP uses 
to model water systems. These Object and Attributes are used as input to queries 
to search and discover water management data in other data structures

*/

-- Select Objects, their topology, and attributes for a data structure
SELECT  DISTINCT "DataStructureName","NativeObjectName","ObjectTopology","NativeAttributeName"

FROM "DataStructures"

-- Left join the Data Structure with its Object types
Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

-- Left join the Object Types with their attributes 
Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

-- Left join the Attributes with their Object Types  
Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

-- Query only the WEAP Data Structure   
WHERE DataStructureName='WEAP'
