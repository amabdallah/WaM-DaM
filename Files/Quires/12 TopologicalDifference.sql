
--ORDER BY "ScenarioName"
--Create Schema "TopoDiff"

SELECT  DISTINCT  "Core"."Instances"."InstanceName","NativeObjectName","ObjectTopology","ScenarioName",
"MasterNetworkName"

FROM "TopoDiff"."ScenarioDifference"

JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."MetadataMappingID"="TopoDiff"."ScenarioDifference"."MetadataMappingID5"

JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="TopoDiff"."ScenarioDifference"."MetadataMappingID5"

JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"="Core"."Scenarios"."MasterNetworkID"

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

WHERE "Core"."Attributes"."NativeAttributeName"='ObjectInstances'


UNION ALL


-- Find the instances that represent the changes in topology 


SELECT  DISTINCT  "Core"."Instances"."InstanceName","NativeObjectName","ObjectTopology","ScenarioName",
"MasterNetworkName"

FROM "TopoDiff"."ScenarioDifference"

JOIN "Core"."MetadataMapping"
ON "MetadataMapping"."MetadataMappingID"="TopoDiff"."ScenarioDifference"."MetadataMappingID4"

JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="TopoDiff"."ScenarioDifference"."MetadataMappingID4"

JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectAttributeID"="Core"."MetadataMapping"."ObjectAttributeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"="Core"."Scenarios"."MasterNetworkID"


Left JOIN  "Core"."ObjectTypes"
ON "Core"."ObjectTypes"."ObjectTypeID"="Core"."ObjectAttributes"."ObjectTypeID"

Left JOIN "Core"."DataStructures"
ON "Core"."DataStructures"."DataStructureID"="Core"."ObjectTypes"."DataStructureID"

JOIN "Core"."Instances"
ON "Core"."Instances"."InstanceID"="MetadataMapping"."InstanceID"

WHERE "Core"."Attributes"."NativeAttributeName"='ObjectInstances'

ORDER BY "ScenarioName" desc 