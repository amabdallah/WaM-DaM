

SELECT  DISTINCT  "Core"."DataStructures"."DataStructureName",
"Core"."MasterNetworks"."MasterNetworkName",
"related"."MasterNetworkName" As "ParentMasterNetwork",
Count(DISTINCT "NativeObjectName") As "#ObjectTypes",
"ScenarioName",Count ("NativeAttributeName") As "#Instances",
"SRSName","Core"."MasterNetworks"."VerticalDatumCV"

FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN  "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectTypeID"="Core"."ObjectTypes"."ObjectTypeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"

Left JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"

Left JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

JOIN "Core"."Instances"
ON "Core"."Instances"."InstanceID"="MetadataMapping"."InstanceID"

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"="Core"."Scenarios"."MasterNetworkID"

Left JOIN "Core"."MasterNetworks" As "ParentMaster"
ON "ParentMaster"."RelatedMasterNetwork"="Core"."Scenarios"."MasterNetworkID"

Left JOIN "Core"."MasterNetworks" AS "related"
ON "related"."MasterNetworkID"="Core"."MasterNetworks"."RelatedMasterNetwork"

Left JOIN "CVs"."SpatialReference"
ON "CVs"."SpatialReference"."SpatialReferenceID"="Core"."MasterNetworks"."SpatialReferenceID"

WHERE "Core"."Attributes"."NativeAttributeName"='ObjectInstances'

GROUP BY "DataStructureName","Core"."MasterNetworks"."MasterNetworkName",
"ParentMasterNetwork","ScenarioName","SRSName","Core"."MasterNetworks"."VerticalDatumCV"



