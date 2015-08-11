**Use case #3:** How are the water system components physically connected? Show directions of flow    
Use this [query](https://github.com/amabdallah/WaM-DaM/blob/master/03UseCases/Queries/03FindConnectivityMatrixOfScenario.sql) and execute it against the prepopulated WaM-DaM SQLite database.

Here are the [Result](https://github.com/amabdallah/WaM-DaM/blob/master/03UseCases/Results/UseCase3.csv) of the query

The figure below shows how instances of part of the Lower Bear River network are connected in their Base Case Scenario. The Figure is based on a matrix table of link instances, start and end node instances for each link. The schematic shows how Hyrum Reservoir is built on the Bear River, receives water from the Blacksmith Fork diversion, and supplies water to South Cache Existing demand site. Users can use this query for other areas by changing the search boundary to understand how the water infrastructure components are connected. Users can use this connectivity understand how water is moving in the system and then build their models. 
![](https://github.com/amabdallah/WaM-DaM/blob/master/03UseCases/Results/ExampleNetwork.jpg)
