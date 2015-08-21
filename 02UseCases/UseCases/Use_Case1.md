###**Use case # 1:** What are the required types of water system components and their attributes for a WEAP model?   

Use this [query](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Queries/01DataStructures.sql) and execute it against the prepopulated WaM-DaM SQLite database. Here are the [results](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Results/UseCase1.csv) of the query in a CSV format.    

This use case shows a list of the twelve Object Types and their 100 attributes that WEAP uses to model water systems (Table 6). Users then can use this list in the second use case to search for data to populate a specific instance of a WEAP model anywhere. For example, users need to look for instances of “Reservoir” and attributes like “Capacity” to populate their model. Users can define similar data structures for other models and then use such structures to search for data. 

