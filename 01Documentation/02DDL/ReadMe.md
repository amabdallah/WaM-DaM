## Data Definition Lanaguge (DDL)

You only need to use this DDL generator if you edit the XML schema of WaM-DaM and then want to create blank WaM-DaM database schemas. Otherwise you can use the exisitng blank database schemas. 
You can use this smart way to create a DDL script (can create empty database) for MySQL, MS SQL Server, SQLite, and PostgreSQL by forwarding engineer any XML WaM-DaM schema. We adapted these Python scripts below to create blank database scheams for the four databases, all at once. 

**How to create a WaM-DaM DDL from an XML schema?**  These steps are tested on Windows Machine      
1. Download all these scripts  and place them in one folder at your machine (don't change their names)   
[build_ddl.py](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/02DDL/build_ddl.py)   
[base.py](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/02DDL/base.py)   
[data_mapping.py](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/02DDL/data_mapping.py)   
[translator.py](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/02DDL/translator.py)   

2. The DDL generator is called from the CMD terminal. Open the CMD Terminal and navigate to the folder where all the Python scripts reside at
Windows>Start>Accessories>CMD
You can use the commad *cd* then space then the name of the folder that contains these scripts 

3. Edit the name of XML Schema in the build_ddl.py python file and the default schema name to be the same as your XML file name
For example:
input_file = 'WaMDaMAugust19_2015.xml.xml'
default_schema = 'WaMDaMAugust19_2015'

4. Execute this command line at the CMD terminal while still at the directory above   
copy and past this line after you change the *WaM-DaM*.xml name below

        build_ddl.py -d all -x WaMDaMAugust19_2015.xml -o wamdam_ddl   


Upon executing this command, the DDL generator should build four DDL schemas.......done as shown at this snapshot 

![](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/02DDL/SnapshotOfResult_DDL_cmd.JPG)    



**Credit** 
Thanks to Tony Castranova at Utah State University who wrote and shared this DDL generator. You can access the original <a href="https://github.com/ODM2/ODM2/tree/7e488d762812b07be4669b5b95a69539ae2239a4/src/build_schemas" target="_blank">DDL generator</a> script.
