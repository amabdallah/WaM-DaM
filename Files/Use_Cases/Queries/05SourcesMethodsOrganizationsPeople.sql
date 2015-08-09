--- 05 SourcesMethodsOrganizationsPeople

/*
Use case #5: Where the data came from for an attribute, who reported them, 
and to what organization the person belongs to, and using what method?

Documenting this metadata improves transparency of modelling by providing
traceable lineage of data values especially for controversial water management models

*/

SELECT "NativeAttributeName","MethodName",
"OrganizationsMethods"."OrganizationName" As "MethodOrganizationName",
"PeopleMethods"."ContactName" As "MethodContactName",
"Sources"."SourceName","OrganizationsSources"."OrganizationName" As "SourceOrganizationName",
--"ParentSources"."SourceName" AS "ParentSource",
"PeopleSources"."ContactName" As "SourceContactName"




FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN "CommonObjectTypes" 
ON "CommonObjectTypes"."CommonObjectTypeID"="ObjectTypes"."CommonObjectTypeID"

Left JOIN "CommonObjectCategory" 
ON "CommonObjectCategory"."CommonObjectCategoryID"="CommonObjectTypes"."CommonObjectCategoryID"

Left JOIN "NativeObjectCategory" 
ON "NativeObjectCategory"."NativeObjectCategoryID"="ObjectTypes"."NativeObjectCategoryID"

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN  "CommonAttributes"
ON "CommonAttributes"."CommonAttributeID"="Attributes"."CommonAttributeID"

Left JOIN  "CommonAttributeCategory"
ON "CommonAttributeCategory"."CommonAttributeCategoryID"="CommonAttributes"."CommonAttributeCategoryID"

Left JOIN "Units" 
ON "Units"."UnitID"="Attributes"."UnitID"

Left JOIN "MetadataMapping"
ON "MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "DataStorage" 
ON "DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

Left JOIN "ScenarioMetadata"
ON "ScenarioMetadata"."MetadataMappingID"="MetadataMapping"."MetadataMappingID"

Left JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMetadata"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "Methods" 
ON "Methods"."MethodID"="MetadataMapping"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="MetadataMapping"."SourceID"

Left JOIN "Sources" As "ParentSources"
ON "ParentSources"."SourceID"="Sources"."ParentSourceID"

Left JOIN "People" As "PeopleSources"
ON "PeopleSources"."PersonID"="Sources"."PersonID"

--Left JOIN "People" As "PeopleParentSources"
--ON "PeopleParentSources"."PersonID"="Sources"."PersonID"

Left JOIN "People" As "PeopleMethods" 
ON "PeopleMethods"."PersonID"="Methods"."PersonID"

Left JOIN "Organizations" As "OrganizationsMethods" 
ON "OrganizationsMethods" ."OrganizationID"="PeopleMethods"."OrganizationID"

Left JOIN "Organizations" As "OrganizationsSources" 
ON "OrganizationsSources" ."OrganizationID"="PeopleSources"."OrganizationID"

Left JOIN "Instances" 
ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"
WHERE  "ScenarioName"!='AbandonedPlans' AND("Instances"."InstanceName"='Hyrum (10)' OR "Instances"."InstanceName"='Hyrum Reservoir' OR "Instances"."InstanceName"='HYRUM')

