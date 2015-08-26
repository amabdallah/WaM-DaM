--4.4 TextFree

/*
This query shows text free data values, their attributes, units, object names, and instances, and data source 
for all the parameters in WaM-DaM

Result:
users can import the data values to their model. WaM-DaM keeps track of the meanings of data values, their units, 
to what instance they apply too.... 

*/

SELECT DataStructureName,ObjectTypes.NativeObjectName, 
Instances.InstanceName,NativeAttributeName,TextFreeValue
--,MethodName,SourceName,
FROM DataStructures


LEFT JOIN ObjectTypes 
ON ObjectTypes.DataStructureID=DataStructures.DataStructureID

LEFT JOIN  ObjectAttributes
ON ObjectAttributes.ObjectTypeID=ObjectTypes.ObjecttypeID

LEFT JOIN  Attributes
ON Attributes.AttributeID=ObjectAttributes.AttributeID

LEFT JOIN Units 
ON Units.UnitID=Attributes.UnitID

LEFT JOIN Mapping 
ON Mapping .ObjectAttributeID=ObjectAttributes.ObjectAttributeID

LEFT JOIN Instances 
ON Instances.InstanceID=Mapping .InstanceID

LEFT JOIN ScenarioMapping 
ON ScenarioMapping.MappingID=Mapping.MappingID

LEFT JOIN DataStorage 
ON DataStorage.DataStorageID=Mapping .DataStorageID

LEFT JOIN Scenarios 
ON Scenarios.ScenarioID=ScenarioMapping.ScenarioID

LEFT JOIN MasterNetworks 
ON MasterNetworks.MasterNetworkID=Scenarios.ScenarioID

--LEFT JOIN Methods 
--ON Methods.MethodID=Metadata.MethodID

--LEFT JOIN Sources 
--ON Sources.SourceID=Metadata.SourceID

LEFT JOIN TextFree
ON TextFree.DataStorageID=DataStorage.DataStorageID

WHERE AttributeTypeCodeCV='TF' AND 

-- specify the boundary of coordinates of the search domain in space 
-- this Boundary is for the parts of the upper Bear River Watershed 
("Instances"."Longitude">='-112.4424' 
AND "Instances"."Longitude"<='-110.65833'
AND "Instances"."Latitude">='42.00'
AND "Instances"."Latitude"<='42.700') 
