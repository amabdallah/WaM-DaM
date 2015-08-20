**Use case #4:** What are the data value(s) of an attribute of a system component?   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/04ComparSurfaceArea_Parameter.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase4.csv)  


4.1 Binarys  
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.1Binarys.sql)   
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase4.1.csv)  

4.2 Parameters   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.2Parameters.sql)    
[Result]() 

4.3 Seasonal Parameters   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.3SeasonalParameter.sql)   
[Result]()  

4.4 Text Free    
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.4TextFree.sql)   
[Result]()  

4.5 Text Controlled    
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.5TextControlled.sql)   
[Result]()    

4.6 File Based    
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.6FileBased.sql)[Result]()  

4.7 Rules    
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.7Rules.sql)[Result]()    

4.80 Time Series      
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.80TimeSeries.sql)  
[Result]()  

4.81 TimeSeriesValues   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.81TimeSeriesValues.sql)   
[Result]()  

4.9 Multi-Column Array     
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/4.90MultiColumns.sql)  
[Result]()  


5 Sources/Methods/Organizations/People of data   
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/05SourcesMethodsOrganizationsPeople.sql)     
[Result]()   

**Scenario Comparison
First at 6.1, create a new table called *ScenarioComparision* which organizes all the differnces between the Base Case (ID=4) and the Proposed (ID=5) Scenarios of the Lower Bear River Model in WEAP. This table is created based on queires on the ScenarioMapping Table as a combination of two other new tables called T4 and T5. We will only use the *ScenarioComparision* table to identify the differences in topology, metadata, and data values between the two scenarios. 

6.0 Create Scenario Comparision Table
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/06.0ScenarioComparisionCreatTable.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase6.0.csv)  

6.10 Identify additions to topology 
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/06.10TopologicalDifferenceAdditions.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase6.10.csv)  

6.11 Identify removals to topology 
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/06.11TopologicalDifferenceRemovals.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase6.11.csv)  

6.12 Create a table of topologies additions and removal for use in 6.2 and 6.3  
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/06.12TopologicalDifferenceCreateTable.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase6.12.csv)  

6.2 Scenario Metadata
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/06.20ScenarioMetadata.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase6.20.csv)

6.3 ScenarioDataTypes
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/06.30ScenarioDataTypes.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase6.30.csv)

6.31 ScenarioDataValues
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/06.31ScenarioDataValues.sql)     
[Result]()
# update time stamp for 6.31, otherwise its good to go!!! 



