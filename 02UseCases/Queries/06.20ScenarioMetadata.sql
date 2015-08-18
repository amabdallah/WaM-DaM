/*
06.3 ScenarioDataValues

This query summarizes the difference of metadata between two scenarios of the Lower Bear River 
Master Network. 

First, the query should identify which instances has changes in metadata. 
Then, using the specific instances, we should look for changes in what kind of metadata 

Result:

*/
-- find the metadata differences in the base case scenario
SELECT  DISTINCT "Instances"."InstanceName","NativeObjectName","ObjectTopology","NativeAttributeName",
"SourceName","MethodName","Mapping"."DataStorageID" ,
"AttributeTypeCodeCV" ,"ScenarioName" 

FROM "ScenarioComparision"

JOIN "Mapping"
ON "Mapping"."MappingID"="ScenarioComparision"."MappingID5"

Left JOIN "Methods" 
ON "Methods"."MethodID"="Mapping"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="Mapping"."SourceID"

JOIN "ScenarioMapping"
ON "ScenarioMapping"."MappingID"="ScenarioComparision"."MappingID5"

JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

Left JOIN "ObjectAttributes"
ON "ObjectAttributes"."ObjectAttributeID"="Mapping"."ObjectAttributeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN  "ObjectTypes"
ON "ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"

Left JOIN "DataStructures"
ON "DataStructures"."DataStructureID"="ObjectTypes"."DataStructureID"

JOIN "Instances"
ON "Instances"."InstanceID"="Mapping"."InstanceID"

WHERE InstanceName  NOT IN  (SELECT InstanceName
FROM Topologies )

UNION ALL


-- Find the metadata changes in the Proposed scenario

SELECT  DISTINCT "Instances"."InstanceName","NativeObjectName","ObjectTopology","NativeAttributeName",
"SourceName","MethodName","Mapping"."DataStorageID" ,
"AttributeTypeCodeCV" ,"ScenarioName" 

FROM "ScenarioComparision"

JOIN "Mapping"
ON "Mapping"."MappingID"="ScenarioComparision"."MappingID4"

Left JOIN "Methods" 
ON "Methods"."MethodID"="Mapping"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="Mapping"."SourceID"

JOIN "ScenarioMapping"
ON "ScenarioMapping"."MappingID"="ScenarioComparision"."MappingID4"

JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

Left JOIN "ObjectAttributes"
ON "ObjectAttributes"."ObjectAttributeID"="Mapping"."ObjectAttributeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN  "ObjectTypes"
ON "ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"

Left JOIN "DataStructures"
ON "DataStructures"."DataStructureID"="ObjectTypes"."DataStructureID"

JOIN "Instances"
ON "Instances"."InstanceID"="Mapping"."InstanceID"
WHERE "InstanceName" NOT IN  (SELECT InstanceName
FROM Topologies );

