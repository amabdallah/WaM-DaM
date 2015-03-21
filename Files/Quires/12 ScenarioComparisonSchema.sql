-- Find siliarities and differences between two scenarios


--CREATE SCHEMA TopoDiff;

CREATE TABLE "TopoDiff"."ScenarioDifference" AS


SELECT "Scen4"."MetadataMappingID" As "MetadataMappingID4",
"Scen4"."ScenarioID" AS "ScenarioID4",
"Scen5"."MetadataMappingID" As "MetadataMappingID5",
"Scen5"."ScenarioID" AS "ScenarioID5"

FROM "Core"."SceanrioMetadata" AS "Scen5"

Full OUTER  JOIN "Core"."SceanrioMetadata" AS "Scen4"
ON "Scen4"."MetadataMappingID"="Scen5"."MetadataMappingID" AND "Scen4"."ScenarioID"=4
WHERE "Scen5"."ScenarioID"=5  

-- ORDER BY  "MetadataMappingID" 

EXCEPT 

SELECT "Scen4"."MetadataMappingID" As "MetadataMappingID4",
"Scen4"."ScenarioID" AS "ScenarioID4",
"Scen5"."MetadataMappingID" As "MetadataMappingID5",
"Scen5"."ScenarioID" AS "ScenarioID5"
FROM "Core"."SceanrioMetadata" AS "Scen5"

INNER JOIN "Core"."SceanrioMetadata" AS "Scen4"
ON "Scen4"."MetadataMappingID"="Scen5"."MetadataMappingID" AND "Scen4"."ScenarioID"=4
WHERE "Scen5"."ScenarioID"=5
 
UNION

-- Find siliarities and differences between two scenarios

-- Find siliarities and differences between two scenarios

--SELECT * FROM "schema_name"."ScenarioDifference2"

--CREATE SCHEMA schema_name;

--CREATE TABLE "schema_name"."ScenarioDifference2" AS 


SELECT "Scen4"."MetadataMappingID" As "MetadataMappingID4",
"Scen4"."ScenarioID" AS "ScenarioID4",
"Scen5"."MetadataMappingID" As "MetadataMappingID5",
"Scen5"."ScenarioID" AS "ScenarioID5"

FROM "Core"."SceanrioMetadata" AS "Scen5"

Full OUTER  JOIN "Core"."SceanrioMetadata" AS "Scen4"
ON "Scen4"."MetadataMappingID"="Scen5"."MetadataMappingID" AND "Scen5"."ScenarioID"=5
WHERE   "Scen4"."ScenarioID"=4 

EXCEPT 

SELECT "Scen4"."MetadataMappingID" As "MetadataMappingID4",
"Scen4"."ScenarioID" AS "ScenarioID4",
"Scen5"."MetadataMappingID" As "MetadataMappingID5",
"Scen5"."ScenarioID" AS "ScenarioID5"
FROM "Core"."SceanrioMetadata" AS "Scen5"

INNER JOIN "Core"."SceanrioMetadata" AS "Scen4"
ON "Scen4"."MetadataMappingID"="Scen5"."MetadataMappingID" AND "Scen5"."ScenarioID"=5
WHERE "Scen4"."ScenarioID"=4
 

ORDER BY  "MetadataMappingID4" 
