## Setup My Database (draft)

Once you have a blank database of WaM-DaM tables in SQLite, here we provide the instructions on how you could load your own data to your WaM-DaM. 

*There are many ways of how users could interact with databases.*    
1. Enter your data into the database manually, one recored at a time. Obviiosuly this is a tredious process but it could be used to learn how the database works.   
2. Import your data to each table from a speadsheet. Many of the relational database systems like Microsoft SQL Serve support this "Import Function". This is a good method to import lots of records at once but we need to automate this process and reused it for the same data.    
3. Load your data using a scripting language like Python and Matlab to read and parse your data from spreadsheets or text files into your database. You need to use the Open Database Connectivity (ODBC) library which allows your scripting languate to talke to the database. ODBC usually and supported by your machine. Otherwise, if ODBC is not supported, you need to install and use the Java Database Connectivity (JDBC) software.     
  
Here, we demonstrate how you could use Matlab ( just because we're familur with it) to load the data sources into a SQLite WaM-DaM database from Excel. We organized four Excel workbooks that reflect the four groups of tables in WaM-DaM: Core Module, Metadata, CVs, and Data Storage. Each Workbook contains spreadsheets with headlines that correspond to tables and their fields in WaM-DaM. You can tweek this Matlab code to work for your own data.   
You need to organize your data to fit into these four workbooks, and then you can use the Matlab script to load your data into the your database. However, you need to map out the forigen keys between your data mainly for the Mapping and Scenario Mapping tables. Otherwise, you need to insert foreign keys manually to the rest of the tables in each spreadsheet. 

The Matlab script to load data is generic to any data source but mapping foreign keys in the script is specific to the used data sources. The Matlab script is used to demonstrate loading data to WaM-DaM but future software work based on WaM-DaM specifications can automate mapping foreign keys like in the Mapping table seemingly through a friendly and interactive graphical user interface.

##A. Setup a SQLite database with a blank WaM-DaM instance
follow these <a href="https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Populated_Database/SQLite_Instructions.md
" target="_blank"> instructions </a> to set up WaM-DaM in SQlite.    

<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite1.JPG" alt="alt text" width="400" height="400">

![]( {width=400px height=400px})   
![](https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite2.JPG {width=400px height=400px})   
![](https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite3.JPG)   
![](https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite4.png)   
![](https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite5.png)   
![](https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite6.png)
![](https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite7.png)

##B. Connect Matlab with SQLite through the JDBC driver 







