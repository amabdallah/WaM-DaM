## Data Sources

We use data from five different national and regional water infrastructure and monitoring sites as an example to populate WaM-DaM database for testing purposes (Table 5). These data sources are: an existing WEAP water allocation model for the Lower Bear River Watershed – Utah (WEAP Model, hereafter) and four datasets: HydroDesktop time series for the Bear River – Utah, National Dams Dataset shapefile (Dams, hereafter), National Waterbodies and Wetlands Dataset shapefile (Waterbodies, hereafter), and the Streams and Waterbodies National Dataset shapefile (Steams, hereafter). These data are available to the public (except the WEAP Model).  The WEAP software is popular in the water management community and there are 100s of published WEAP modeling studies throughout the world. 

We leverage current knowledge with these models and data sources and demonstrate how WaM-DaM can synthesize and merge this data by overcoming their semantic and syntactic heterogeneity in the Bear River Watershed, Utah in the United States (Figure 3). This Watershed has engineered infrastructure that constitutes a significant part of the hydrologic system (Welsh et al., 2013). 





First, we compiled all the data into CSV files under four Excel workbooks where each workbook has spreadsheets that replicate WaM-DaM tables. Then, I wrote a Matlab script to parse and then load data to the WaM-DaM SQLite database. You can use this generic [Matlab script](https://github.com/amabdallah/WaM-DaM/tree/master/03UseCases/MatlabScript) to load your data to an empty SQLite WaM-DaM database. You can use the populated SQLite database along with the  <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/SQLite_Instructions.md" target="_blank"> instrcutions </a> on how to set it up to test the use cases below. 


| Source name  | Dams | Waterbodies  | Streams  | HydroDesktop Time series  | WEAP Model |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
|**Data provider and citation**  | USGS (U.S. Geological Survey, 2013) |USGS (National Atlas of the United States, 2013)  | USGS (U.S. Geological Survey, 2005)  | HydroDesktop (Ames et al., 2012) | David Rosenberg, unpublished  |
| **Spatial coverage**  | United States  |United States  |United States  | Bear River Watershed, Utah-Idaho-Wyoming    | Lower Bear River Watershed, Utah  |
| **Time span**  | 1800-2003  | 1995-2002 | 1995-2002 | 1900-2015  | 1966-2006  |
|**#Objects**   | 1 | 1  | 2  | 3  | 12  |
| **Object topology**   | node  | node | node and link  | node   | node and link  |
| **# Instances**   | 8,121  |26,872  | 76,976 | 162  |111  |
| **#Attributes**   | 23  | 15  | 22  | 32  | 200  |
| **Data types**   | Text Controlled, text free, parameter  | Text controlled, text free, parameter  | Text controlled, text free, parameter  | Text controlled, parameter, time series  | Text controlled, multi-columns, parameter, seasonal parameters, time series, rules, file-based  |
|**Scenarios**    | 1  | 1  | 1  | 1  | 2  |
| **Connections (links)** | N/A  | N/A | 76,976  (start and end nodes are implicitly stored in ArcGIS) | N/A | 72 (Node and Arc shapefiles) |
| **Format  ** | shapefile |shapefile | shapefile  | CSV | CSV, Paradox Database,  shapefile |



These data sources have different native syntax and use different semantics to describe their data. Differences in semantics are prevalent through attribute names like SURF_AREA, Area_mi, and surface area. Terms like dam, waterbody, reservoir, and lake in some cases, all refer to the same man-made open structure that stores surface water. For syntax differences in network connectivity, WEAP uses start and end nodes for its links to indicate the directing of flow the connectivity of links. We accessed the schematic of the model’s network through the Node and Arc shapefiles that stored in the WEAP database. The Stream’s Dataset however, stores the connectivity matrix implicitly in ArcGIS. So we extracted the geospatial coordinates of start and end nodes for each stream segment using ArcGIS. 


There are also significant differences in data format and syntax as well. The WEAP model uses a mix of proprietary database and CSV files to manage and store its data. The Streams, Waterbodies, and Dams datasets are shapefiles. Each of them has its own native data structure (e.g., a objects and their attributes). They use coded data values for attributes and they store the meaning of each code separately in a text file. For example, the attribute “purpose” in the Dams Dataset can have a value of “CI” which represents dam designated purposes of “Flood Control” in the letter “C” and “Irrigation” in the letter “I”. This is the case in these datasets for most of the attributes that have a categorical data value. Key metadata for these datasets like methods, sources and units are stored separately at the data supplier webpage. Thus users have to go back and forth between the data and its metadata to look for units and the meanings of coded values of each attribute. 


WaM-DaM therefore overcomes these semantic and syntax differences by imposing a persistent set of specifications on data semantics and syntax across all these data sources as discussed in Sections 3 and 4. Data users in the Bear River Watershed or others can utilize WaM-DaM as a central repository to organize disparate water management data and then use it to discover subsets of data across these sources and populate such data to their models.
