### Reviewed Systems

Download spreadsheet of the [ReviewedSystems](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/ReviewedDataManagementSystems.xlsx).
For each data management system and model software, we identified its common use and application, data formats, data types, technology of the data management system (e.g., text files, database), availability data schema, how data is represented in time and space (Table belew). The term data format is used here to mean the physical or digital means of storing data (DCMI, 2013). The term data type is used here to mean how data is organized within the data format type (DCMI, 2013).

If the schema is not available, we reverse engineered the conceptual data schema for many models by using third party software or through the model user interface and its published User Manual or journal articles. Reverse engineering models and data systems gave us an insight on how the data is organized in state of the art systems. For example, we used SQLite Manager Add-on extension in Firefox-Mozilla [https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager] to reverse engineer the schema of HydroPlatform (Harou et al., 2010) and we used “Paradox dBase Reader” [http://download.cnet.com/Paradox-dbase-Reader/3000-2065_4-10860264.html] to reverse engineer the schema of the WEAP model (Yates et al., 2005).



| Review criteria | Synthesized results |
| ------------- | ------------- |
| Common use and application | simulation, optimization, operations, and planning of water resources |
| Represents data in space | gridded raster, networks of nodes and links, triangular mesh, nodes and three dimensional links |
| Represents data in time | time series, seasonal parameters |
| Data formats: physical or digital means of storing data (DCMI, 2013)| csv, shp, dss, ndf, NetCDF, ini, gsm, db, .xy, .mdb, XML, PDF, .rdf, HDB, txt |
| Data types: how data is organized within the data format type (DCMI, 2013)| binary, parameters, seasonal parameters, text, rules, time series, and multi-column arrays |
| Technology | Paradox database, Microsoft SQL Server, locked and proprietary, ArcGIS, SQLite, spreadsheets, and text files (ASCII)|
| Access to data schema  | we reverse engineered it, shared by developers, inspected through user interface, explored through user manuals, or inspected through self-describing text files |
| Documents metadata | units, general notes, user info, static descriptive metadata about parameters |


The review also identified how each model represents data in time and space. In space, we identified distributed raster grids or vector networks of nodes and links. Systems modeling, as the focus of this paper, uses the abstract concept of nodes and links to represent water system components (e.g., reservoirs, canals, demand sites) and their interactions (Loucks et al., 2005; Zagona et al., 2001). A node or link is an abstract of a virtual or real system component that could have a geometric shape into points and lines as vectors. A node (e.g., demand site, reservoir) is represented as a point in its center with its attributes with longitude and latitude coordinates in to geo-reference the component’s center in space. A link connects two nodes and transports resources between them in one dimension (e.g., a river that connects two reservoirs). Water management data in time, uses regular and irregular time series plus seasonal parameters that correspond to pattern changes in time but not necessarily the four seasons (e.g., winter, summer, day, and night).

For the technology of data management system, the term data format is used in this paper to mean the “physical or digital manifestation” of the stored data (DCMI, 2013). We identified these formats in the reviewed models: csv, shp, dss, ndf, NetCDF, ini, gsm, db, .xy, .mdb, XML, PDF, .rdf, HDB. The term data type is used here to mean “the nature or genre” of the data and how it is organized (DCMI, 2013). We identified these common data types: point time series, parameters, text, seasonal parameters, binary, rules, and multi-columns. 
