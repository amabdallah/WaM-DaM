## Data Sources

We use data from five different national and regional water infrastructure and monitoring sites as an example to populate WaM-DaM database for testing purposes (Table 5). These data sources are: an existing WEAP water allocation model for the Lower Bear River Watershed – Utah (WEAP Model, hereafter) and four datasets: HydroDesktop time series for the Bear River – Utah, National Dams Dataset shapefile (Dams, hereafter), National Waterbodies and Wetlands Dataset shapefile (Waterbodies, hereafter), and the Streams and Waterbodies National Dataset shapefile (Steams, hereafter). These data are available to the public (except WEAP Model and often used in build water management models.  The WEAP model is popular in the water management community and there are 100s of published WEAP modeling studies throughout the world. 

We leverage current knowledge with these models and data sources and demonstrate how WaM-DaM can synthesize and merge this data by overcoming their semantic and syntactic heterogeneity in the Bear River Watershed, Utah in the United States (Figure 3). This Watershed has engineered infrastructure that constitutes a significant part of the hydrologic system (Welsh et al., 2013). 





First, we compiled all the data into CSV files under four Excel workbooks where each workbook has spreadsheets that replicate WaM-DaM tables. Then, I wrote a Matlab script to parse and then load data to the WaM-DaM SQLite database. You can use this generic [Matlab script](https://github.com/amabdallah/WaM-DaM/tree/master/03UseCases/MatlabScript) to load your data to an empty SQLite WaM-DaM database. You can use the populated SQLite database along with the  <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/SQLite_Instructions.md" target="_blank"> instrcutions </a> on how to set it up to test the use cases below. 


| Source name  | Dams | Waterbodies  | Streams  | HydroDesktop Time series  | WEAP Model |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| Data provider and citation  | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| Spatial coverage  | Content Cell  || Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| Time span  | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| #Objects   | Content Cell  || Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| Object topology   | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| # Instances   | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| #Attributes   | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| Data types   | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
|Scenarios    | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
| Connections (links) | Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |
