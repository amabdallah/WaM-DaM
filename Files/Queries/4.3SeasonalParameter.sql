-- 4.3 SeasonalParameter

/*
This query shows an example of data values for a seasonal parameter called......... 
,their attributes, units, object names, and instances, and data source 

Result:
users can import the data values to their model. WaM-DaM keeps track of the meanings of data values, their units, 
to what instance they apply too.... 

*/

SELECT CommonAttributeName, NativeAttributeName, UnitName, InstanceName,MasterNetworkName,ScenarioName, AttributeTypeCodeCV,SeasonNameCV
FROM Attributes 

LEFT JOIN ObjectAttributes
ON ObjectAttributes.AttributeID= Attributes .AttributeID

LEFT JOIN CommonAttributes
ON CommonAttributes.CommonAttributeID= Attributes .CommonAttributeID

LEFT JOIN Units
ON Units.UnitID= Attributes.UnitID

LEFT JOIN MetadataMapping
ON MetadataMapping.ObjectAttributeID= ObjectAttributes.ObjectAttributeID

LEFT JOIN Instances
ON Instances.InstanceID= MetadataMapping.InstanceID

LEFT JOIN ScenarioMetadata
ON ScenarioMetadata.MetadataMappingID= MetadataMapping.MetadataMappingID

LEFT JOIN Scenarios
ON Scenarios.ScenarioID= ScenarioMetadata.ScenarioID

LEFT JOIN MasterNetworks
ON MasterNetworks.MasterNetworkID= Scenarios.MasterNetworkID

LEFT JOIN DataStorage
ON DataStorage .DataStorageID = MetadataMapping.DataStorageID 

LEFT JOIN SeasonalParameters
ON SeasonalParameters.DataStorageID = DataStorage.DataStorageID 

LEFT JOIN SeasonName
ON SeasonName.Term= SeasonalParameters.SeasonNameCV

WHERE AttributeTypeCodeCV='S'
--NativeAttributeName='Maximum Hydraulic Outflow'  AND InstanceName='Hyrum (10)' AND ScenarioName='BaseCaseLower'



