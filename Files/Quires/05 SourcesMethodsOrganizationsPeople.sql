-- 5.	What are the sources, methods, organizations, and contact people for data about Hyrum Reservoir?

--Copy(

SELECT "NativeAttributeName","MethodName",
"OrganizationsMethods"."OrganizationName" As "MethodOrganizationName",
"PeopleMethods"."ContactName" As "MethodContactName",
"Metadata"."Sources"."SourceName","OrganizationsSources"."OrganizationName" As "SourceOrganizationName",
--"ParentSources"."SourceName" AS "ParentSource",
"PeopleSources"."ContactName" As "SourceContactName"




FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN "CVs"."CommonObjectTypes" 
ON "CVs"."CommonObjectTypes"."CommonObjectTypeID"="Core"."ObjectTypes"."CommonObjectTypeID"

Left JOIN "CVs"."CommonObjectCategory" 
ON "CVs"."CommonObjectCategory"."CommonObjectCategoryID"="CVs"."CommonObjectTypes"."CommonObjectCategoryID"

Left JOIN "Metadata"."NativeObjectCategory" 
ON "Metadata"."NativeObjectCategory"."NativeObjectCategoryID"="Core"."ObjectTypes"."NativeObjectCategoryID"

Left JOIN  "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectTypeID"="Core"."ObjectTypes"."ObjectTypeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"

Left JOIN  "CVs"."CommonAttributes"
ON "CVs"."CommonAttributes"."CommonAttributeID"="Core"."Attributes"."CommonAttributeID"

Left JOIN  "CVs"."CommonAttributeCategory"
ON "CVs"."CommonAttributeCategory"."CommonAttributeCategoryID"="CVs"."CommonAttributes"."CommonAttributeCategoryID"

Left JOIN "CVs"."Units" 
ON "CVs"."Units"."UnitID"="Core"."Attributes"."UnitID"

Left JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Core"."DataStorage" 
ON "Core"."DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

Left JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"

Left JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "Metadata"."Methods" 
ON "Metadata"."Methods"."MethodID"="MetadataMapping"."MethodID"

Left JOIN "Metadata"."Sources" 
ON "Metadata"."Sources"."SourceID"="MetadataMapping"."SourceID"

Left JOIN "Metadata"."Sources" As "ParentSources"
ON "ParentSources"."SourceID"="Metadata"."Sources"."ParentSource"

Left JOIN "Metadata"."People" As "PeopleSources"
ON "PeopleSources"."PersonID"="Sources"."PersonID"

--Left JOIN "Metadata"."People" As "PeopleParentSources"
--ON "PeopleParentSources"."PersonID"="Sources"."PersonID"

Left JOIN "Metadata"."People" As "PeopleMethods" 
ON "PeopleMethods"."PersonID"="Methods"."PersonID"

Left JOIN "Metadata"."Organizations" As "OrganizationsMethods" 
ON "OrganizationsMethods" ."OrganizationID"="PeopleMethods"."OrganizationID"

Left JOIN "Metadata"."Organizations" As "OrganizationsSources" 
ON "OrganizationsSources" ."OrganizationID"="PeopleSources"."OrganizationID"

Left JOIN "Core"."Instances" 
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"
WHERE  "ScenarioName"!='AbandonedPlans' AND("Core"."Instances"."InstanceName"='Hyrum (10)' OR "Core"."Instances"."InstanceName"='Hyrum Reservoir' OR "Core"."Instances"."InstanceName"='HYRUM')

