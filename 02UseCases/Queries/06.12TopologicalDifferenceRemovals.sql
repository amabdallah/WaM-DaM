/* 
06.1 TopologicalDifference

Use case #6: What are the data and metadata differences between two scenarios?

This query summarizes the difference of topologies between two scenarios of the Lower Bear River 
Master Network. 

You can choose to run the the entire query to find the differences of addition and removal altogether. 
But it is best to run the query into two parts. 
The first part shows the additions and the second part shows the removal
The divide between the two queries is the UNION command 

Result:

The first part of the query finds the instances that are added to the original scenario 
the second part of the query finds the instances that are removed from the original scenario 

*/
-- Find the instances that are deleted (removals) from the original scenario

SELECT  DISTINCT  "Instances"."InstanceName","NativeObjectName","ObjectTopology","ScenarioName",
"MasterNetworkName"

FROM "ScenarioComparision"

JOIN "Mapping"
ON "Mapping"."MappingID"="ScenarioComparision"."MappingID4"

JOIN "ScenarioMapping"
ON "ScenarioMapping"."MappingID"="ScenarioComparision"."MappingID4"

JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

Left JOIN "ObjectAttributes"
ON "ObjectAttributes"."ObjectAttributeID"="Mapping"."ObjectAttributeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."MasterNetworkID"

Left JOIN  "ObjectTypes"
ON "ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"

Left JOIN "DataStructures"
ON "DataStructures"."DataStructureID"="ObjectTypes"."DataStructureID"

JOIN "Instances"
ON "Instances"."InstanceID"="Mapping"."InstanceID"

WHERE "Attributes"."NativeAttributeName"='ObjectInstances'

ORDER BY "ScenarioName" desc 