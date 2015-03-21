
-- find out the differences in metadata between scenario 4 and 5


--ORDER BY "ScenarioName"


SELECT  DISTINCT "Core"."Instances"."InstanceName","NativeObjectName","ObjectTopology","NativeAttributeName",
"SourceName","MethodName","Core"."MetadataMapping"."DataStorageID" ,
"AttributeTypeCodeCV" ,"ScenarioName" 

FROM "schema_name"."ScenarioDifference"

JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."MetadataMappingID"="schema_name"."ScenarioDifference"."MetadataMappingID5"

Left JOIN "Metadata"."Methods" 
ON "Metadata"."Methods"."MethodID"="MetadataMapping"."MethodID"

Left JOIN "Metadata"."Sources" 
ON "Metadata"."Sources"."SourceID"="MetadataMapping"."SourceID"

JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="schema_name"."ScenarioDifference"."MetadataMappingID5"

JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectAttributeID"="Core"."MetadataMapping"."ObjectAttributeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"

Left JOIN  "Core"."ObjectTypes"
ON "Core"."ObjectTypes"."ObjectTypeID"="Core"."ObjectAttributes"."ObjectTypeID"

Left JOIN "Core"."DataStructures"
ON "Core"."DataStructures"."DataStructureID"="Core"."ObjectTypes"."DataStructureID"

JOIN "Core"."Instances"
ON "Core"."Instances"."InstanceID"="MetadataMapping"."InstanceID"

WHERE "InstanceName"='Hyrum (10)'

UNION ALL


-- Find the instances that represent the changes in topology 


SELECT  DISTINCT "Core"."Instances"."InstanceName","NativeObjectName","ObjectTopology","NativeAttributeName",
"SourceName","MethodName","Core"."MetadataMapping"."DataStorageID" ,
"AttributeTypeCodeCV" ,"ScenarioName" 

FROM "schema_name"."ScenarioDifference"

JOIN "Core"."MetadataMapping"
ON "MetadataMapping"."MetadataMappingID"="schema_name"."ScenarioDifference"."MetadataMappingID4"

Left JOIN "Metadata"."Methods" 
ON "Metadata"."Methods"."MethodID"="MetadataMapping"."MethodID"

Left JOIN "Metadata"."Sources" 
ON "Metadata"."Sources"."SourceID"="MetadataMapping"."SourceID"


JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="schema_name"."ScenarioDifference"."MetadataMappingID4"

JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectAttributeID"="Core"."MetadataMapping"."ObjectAttributeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"


Left JOIN  "Core"."ObjectTypes"
ON "Core"."ObjectTypes"."ObjectTypeID"="Core"."ObjectAttributes"."ObjectTypeID"

Left JOIN "Core"."DataStructures"
ON "Core"."DataStructures"."DataStructureID"="Core"."ObjectTypes"."DataStructureID"

JOIN "Core"."Instances"
ON "Core"."Instances"."InstanceID"="MetadataMapping"."InstanceID"
WHERE "InstanceName"='Hyrum (10)'
