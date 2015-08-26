###Use case #6: What are the data and metadata differences between two scenarios?   

**Scenario Comparison
First at 6.1, create a new table called *ScenarioComparision* which organizes all the differnces between the Base Case (ID=4) and the Proposed (ID=5) Scenarios of the Lower Bear River Model in WEAP. This table is created based on queires on the ScenarioMapping Table as a combination of two other new tables called T4 and T5. We will only use the *ScenarioComparision* table to identify the differences in topology, metadata, and data values between the two scenarios. 

6.0 Create Scenario Comparision Table
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Queries/06.0ScenarioComparisionCreatTable.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Results/UseCase6.0.csv)  

6.10 Identify additions to topology 
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Queries/06.10TopologicalDifferenceAdditions.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Results/UseCase6.10.csv)  

6.11 Identify removals to topology 
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Queries/06.11TopologicalDifferenceRemovals.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Results/UseCase6.11.csv)  

6.12 Create a table of topologies additions and removal for use in 6.2 and 6.3  
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Queries/06.12TopologicalDifferenceCreateTable.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Results/UseCase6.12.csv)  

6.2 Scenario Metadata
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Queries/06.20ScenarioMetadata.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Results/UseCase6.20.csv)

6.3 ScenarioDataTypes
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Queries/06.30ScenarioDataTypes.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Results/UseCase6.30.csv)

6.31 ScenarioDataValues
[Query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Queries/06.31ScenarioDataValues.sql)     
[Result](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/Results/UseCase6.31.csv)
