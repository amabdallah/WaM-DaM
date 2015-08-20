## Data Definition Lanaguge (DDL)

This is a smart way to create a DDL script for MySQL, MS SQL Server, SQLite, and PostgreSQL by forward engineer the XML WaM-DaM schema. We adapted these Python scripts to create blank database scheams for the four databases, all at once. 

** How to create a WaM-DaM DDL from an XML schema?
1. Download all this scripts    

2. Open the CMD Terminal and navigate to the folder where all the Python scripts reside
Windows>Start>Accessories>CMD
You can use the commad *cd then space then the name of the folder 

3. Edit the name of XML Schema in the build_ddl.py python file and the default schema name to be the same as your XML file name
For example:
input_file = 'WaMDaMAugust19_2015.xml.xml'
default_schema = 'WaMDaMAugust19_2015'

4. Execute this command line at the CMD terminal while still at the directory above
% copy and past this line after you change the *WaM-DaM*.xml name below

    build_ddl.py -d all -x WaMDaMAugust19_2015.xml -o wamdam_ddl


Upon executing this command, the DDL generator should build four DDL schemas.......done as shown at this snapshot 

![](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/02DDL/SnapshotOfResult_DDL_cmd.JPG)    



**Credit** 
Thanks to [by Tony Castranova] at Utah State University who wrote and shared this DDL generator. You can access the original <a href="https://github.com/amabdallah/WaM-DaM/tree/master/01Documentation/02DDL" target="_blank">DDL generator</a> script. We 
