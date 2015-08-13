-- Logic of comparison
-- create a table that shows the differences between the two scenarios 
 
-- differences can come from three sources:
-- Topology, metadata, and data values 


-- First,  query and combine the Mapping tables for both scenarios (Left Outer Join)
-- Second, subtract the common Mapping between the two scenarios 

-- Create a new table that has the Scenario and Mapping unique identifiers to Scenario #4 
-- which corresponds to the Base Case 
CREATE Table t4 AS
SELECT ScenarioID,MetadataMappingID
 FROM "ScenarioMapping"
WHERE ScenarioID=4

-- Create a new table that has the Scenario and Mapping unique identifiers to Scenario #5 
-- which corresponds to the Proposed scenario
CREATE Table t5 AS
SELECT ScenarioID,MetadataMappingID
 FROM "ScenarioMapping" 
WHERE ScenarioID=5

-- create a new table that joins both tables above but shows only the differences between them 
-- i.e., the additions or removals of unique identifiers that are no similar between the two scenarios
CREATE Table ScenarioComparision AS 

SELECT "t4"."MetadataMappingID" As MetadataMappingID4,"t4"."ScenarioID" As ScenarioID4,
       CAST(NULL AS INTEGER) As MetadataMappingID5, CAST(NULL AS INTEGER) As ScenarioID5

FROM "t4"
WHERE NOT EXISTS (
    SELECT *
FROM "t5"
WHERE "t4"."MetadataMappingID"="t5"."MetadataMappingID" )


UNION ALL

SELECT        CAST(NULL AS INTEGER) As MetadataMappingID5, CAST(NULL AS INTEGER) As ScenarioID5,
	"t5"."MetadataMappingID","t5"."ScenarioID"
       
FROM "t5"
WHERE NOT EXISTS (
    SELECT *
FROM "t4"
WHERE "t4"."MetadataMappingID"="t5"."MetadataMappingID" )

