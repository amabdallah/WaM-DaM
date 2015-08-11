/*
06.3 ScenarioDataValues

This query summarizes the difference of metadata between two scenarios of the Lower Bear River 
Master Network. 

First, the query should indentify which instances has changes in metadata. 
Then, using the spcific instances, we should look for changes in what kind of metadata 

Result:

*/
-- find the metadata differences in the base case scenario
SELECT  DISTINCT "Instances"."InstanceName","NativeObjectName","ObjectTopology","NativeAttributeName",
"SourceName","MethodName","MetadataMapping"."DataStorageID" ,
"AttributeTypeCodeCV" ,"ScenarioName" 

FROM "ScenarioComparision"

JOIN "MetadataMapping"
ON "MetadataMapping"."MetadataMappingID"="ScenarioComparision"."MetadataMappingID5"

Left JOIN "Methods" 
ON "Methods"."MethodID"="MetadataMapping"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="MetadataMapping"."SourceID"

JOIN "ScenarioMetadata"
ON "ScenarioMetadata"."MetadataMappingID"="ScenarioComparision"."MetadataMappingID5"

JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMetadata"."ScenarioID"

Left JOIN "ObjectAttributes"
ON "ObjectAttributes"."ObjectAttributeID"="MetadataMapping"."ObjectAttributeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN  "ObjectTypes"
ON "ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"

Left JOIN "DataStructures"
ON "DataStructures"."DataStructureID"="ObjectTypes"."DataStructureID"

JOIN "Instances"
ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"

WHERE InstanceName  NOT IN  (SELECT InstanceName
FROM Topologies )

UNION ALL


-- Find the metadata changes in the Proposed scenario

SELECT  DISTINCT "Instances"."InstanceName","NativeObjectName","ObjectTopology","NativeAttributeName",
"SourceName","MethodName","MetadataMapping"."DataStorageID" ,
"AttributeTypeCodeCV" ,"ScenarioName" 

FROM "ScenarioComparision"

JOIN "MetadataMapping"
ON "MetadataMapping"."MetadataMappingID"="ScenarioComparision"."MetadataMappingID4"

Left JOIN "Methods" 
ON "Methods"."MethodID"="MetadataMapping"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="MetadataMapping"."SourceID"

JOIN "ScenarioMetadata"
ON "ScenarioMetadata"."MetadataMappingID"="ScenarioComparision"."MetadataMappingID4"

JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMetadata"."ScenarioID"

Left JOIN "ObjectAttributes"
ON "ObjectAttributes"."ObjectAttributeID"="MetadataMapping"."ObjectAttributeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN  "ObjectTypes"
ON "ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"

Left JOIN "DataStructures"
ON "DataStructures"."DataStructureID"="ObjectTypes"."DataStructureID"

JOIN "Instances"
ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"
WHERE "InstanceName" NOT IN  (SELECT InstanceName
FROM Topologies );

