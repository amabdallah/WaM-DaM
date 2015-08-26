###Use case #4: What are the data value(s) of an attribute of a system component?   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/04ComparSurfaceArea_Parameter.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.0.csv)  
Let us suppose that the user is looking for data values of the attribute “surface area” for any node instance like Hyrum Reservoir. Table 8 shows how the WaM-DaM controlled vocabulary attribute “surface area” for a selected controlled Object Type as “Reservoir” allows the user to discover synonymous Object Types (i.e., dam and water body) for different native Attributes (i.e., “Area”, “Area_mi”, and “SURF_AREA” ) from different data sources. Here the surface area of Hyrum Reservoir instance is reported to have 0.705 square miles (equivalent to 452 acres) from the WaterBodies dataset and two values of 480 acres from the WEAP Model and Dams dataset. Use Case #5 provides metadata that can help explain the discrepancy among these data value. 

**4.1 Binarys**  
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.1Binarys.sql)   
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.1.csv)  
The query result shows duel binary values of zero and one for the attribute name "Maximum Hydraulic Outflow" of Hyrum Reservoir. For example, zero refers to the binary attribute of Z1: Maximum Hydraulic Outflow with a definition for the value. 		

**4.2 Parameters**   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.2Parameters.sql)    
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.2.csv) 
The query results lists the data values of parameters of instances in the selected region.


**4.3 Seasonal Parameters**   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.3SeasonalParameter.sql)   
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.30.csv)  
The query result lists seasonal data values of Net Evaporation for Hyrum Reservoir for the tweleve months of the year. These seasonal values apply to all the years in the modeling period.  

**4.4 Text Free**    
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.4TextFree.sql)   
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.4.csv)  
The query results lists text data values for parameters that have no constraint on their data values like a second name of a reservoir. 

**4.5 Text Controlled**    
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.5TextControlled.sql)   
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.5.csv)    
The query result lists text values that are controlled and reused with a clear value definition which is very helpful for coded data values.

**4.6 File Based**    
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.6FileBased.sql)  
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.6.csv)  
The query result lists the file location, name, and format on desk for the headflow attribute of the Little Bear River.

**4.7 Rules**    
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.7Rules.sql)   
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.70.csv)    
The query results show how a Loss to Groundwater attribute for Hyrum Reservoir has a rule that dependes on other attributes that are already defined in WaM-DaM. The rule reads as this:    
Loss to groundwater@HyrumReservoir=0.0001 X StorageCapacity + 0.00001 x SurfaceWaterHeadflow x 60.37       
*Multiply by 60.37 to convert from CFS to AF/month*    
The RuleVariableOrder preserves the order of variables, constants, and operations in the rule.  There always should be a SymboleCV (e.g., +, - , *) between the rule variables and constants. Thus a software business rule should enforce this property by not allowing a Rule Variable to be stored in the same line along with a constant or vice versa. Each variable of the rule must have a unit.

**4.80 Time Series**      
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.80TimeSeries.sql)  
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.80.csv)  
The query result lists the attributes that have time series data along with their global metadata of AggregationStatisticCV, IntervalTimeUnitName, AggregationInterval, and UnitName. The next query lists data values and their time stamp for an example attribute. 


**4.81 TimeSeriesValues**   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.81TimeSeriesValues.sql)   
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.81.csv)  
The query lists data values and their time stamp for the headflow attribute at of the Bear River instance. This time series is represents average monthly inflow data with a unit of cubic feet per second.


**4.9 Multi-Column Array**     
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Queries/4.90MultiColumns.sql)  
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Results/UseCase4.90.csv)  
The query result lists the data values of the three attributes that compose the Volume Elevation Curve attribute for Hyrum Reservoir. Each attribute has data values and their unit along with their order. The value order preserves the pairing among the data values of the three attributes.  	
