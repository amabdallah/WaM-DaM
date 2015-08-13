-- 03.1 Find Connectivity Matrix of a scenario of a network

/*
Use case #3.1: How are the water system components physically connected? Show directions of flow 


Users can use such query to understand how the water infrastructure is connected 
and thus they can incorporate the connectivity in their conceptual models of how 
water is moving in the system. Users can build new schematics for their water management
models by importing larger connectivity matrix that has object types, their instances, 
and start and end nodes for each link to indicate the direction of flow to their model. 
 
*/

SELECT  "Instances"."InstanceName" As "LinkInstanceName",
 "Instances".InstanceID AS "LinkInstaceID",
"ObjectTypes"."NativeObjectName",
"StartNodeInstance"."InstanceName" AS "StartInstanceName",
"StartNodeInstance"."InstanceID" AS "StartNodeInstanceID",
"ObjectTypeStartNodeInstance"."NativeObjectName",
"EndNodeInstance"."InstanceName" AS "EndInstanceName",
"EndNodeInstance"."InstanceID" AS "EndNodeInstanceID",
"ObjectTypeEndNodeInstance"."NativeObjectName" As "ObjectEndInstance"
--,"DataStructures"."DataStructureName"


FROM "DataStructures"

-- Join the Data Strucutre to get its Objects 
Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

-- Join the Objects to get their attributes  
Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

-- Join the Objects Attributes to Mapping Table  
Left JOIN "Mapping"
ON "Mapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

-- Join the Attributes table to the ObjectAttributes table   
Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID" 

-- Join the Mapping table to the ScenarioMapping table   
Left JOIN "ScenarioMapping"
ON "ScenarioMapping"."MetadataMappingID"="Mapping"."MetadataMappingID"

-- Join the Scenarios table to the ScenarioMapping table   
Left JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

-- Join the MasterNetworks table to the Scenarios table   
Left JOIN "MasterNetworks"
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."MasterNetworkID"

-- Join the Instances table to the Mapping table   
Left JOIN "Instances" 
ON "Instances"."InstanceID"="Mapping"."InstanceID"

-- Join the Connections table to the Instances table   
Left JOIN "Connections" 
ON "Connections"."LinkInstanceID"="Instances"."InstanceID"

-- Join the Instances table the Start Node of link   
Left JOIN "Instances" As "StartNodeInstance"
ON "StartNodeInstance"."InstanceID"="Connections"."StartNodeInstanceID"

-- Join the Instances table the End Node of link   
Left JOIN "Instances"  AS "EndNodeInstance"
ON "EndNodeInstance"."InstanceID"="Connections"."EndNodeInstanceID"

--- Get the Object Type Name for the start node instance 
Left JOIN "Mapping" As "MetadataStartNodeInstace"
ON "MetadataStartNodeInstace"."InstanceID"="StartNodeInstance"."InstanceID"

Left JOIN  "ObjectAttributes" As "ObjectAttStartNodeInstance"
ON "ObjectAttStartNodeInstance"."ObjectAttributeID"="MetadataStartNodeInstace"."ObjectAttributeID"

Left JOIN  "ObjectTypes" As "ObjectTypeStartNodeInstance"
ON "ObjectTypeStartNodeInstance"."ObjectTypeID"="ObjectAttStartNodeInstance"."ObjectTypeID"

Left JOIN  "Attributes" As "AttLinkInstance"
ON "AttLinkInstance"."AttributeID"="ObjectAttStartNodeInstance"."AttributeID"

--- Get the Object Type Name for the end node instance 
Left JOIN "Mapping" As "MetadataEndNodeInstace"
ON "MetadataEndNodeInstace"."InstanceID"="EndNodeInstance"."InstanceID"

Left JOIN  "ObjectAttributes" As "ObjectAttEndNodeInstance"
ON "ObjectAttEndNodeInstance"."ObjectAttributeID"="MetadataEndNodeInstace"."ObjectAttributeID"

Left JOIN  "ObjectTypes" As "ObjectTypeEndNodeInstance"
ON "ObjectTypeEndNodeInstance"."ObjectTypeID"="ObjectAttEndNodeInstance"."ObjectTypeID"

Left JOIN  "Attributes" As "AttLinkEndInstance"
ON "AttLinkEndInstance"."AttributeID"="ObjectAttEndNodeInstance"."AttributeID"

-- Over 

WHERE  "AttLinkInstance"."NativeAttributeName"='ObjectInstances'
AND "Attributes"."NativeAttributeName"='ObjectInstances'
AND "AttLinkEndInstance"."NativeAttributeName"='ObjectInstances'
AND DataStructureName='WEAP'
AND ScenarioName ='BaseCaseLower'

