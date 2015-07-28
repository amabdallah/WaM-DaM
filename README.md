#### The Water Management Data Model (WaM-DaM)

Water Management Data Model (WaM-DaM) is a persistent information model to organize and synthesize disparate systems water management data. The information model aims to help scientists and practitioners like you to organize, search, discover, and interpret their disparate and diverse data to save time plus facilitate modeling.

WaM-DaM supports this collection of nine data types that are used in systems analysis: binary, numeric parameters, seasonal, parameters, file based, rules, time series, and multi-column arrays. WaM-DaM uses modular objects of data with their attributes. Objects can be replicated as instances with specific data for resources and infrastructure components. The components can be connected through a network of nodes and links. WaM-DaM supports scenarios that track changes in networks and allows users to compare them and identify differences among scenarios. 

Think of WaM-DaM as a repository of water management data (purple cylinder) and a translator between numerous data sources on the left and different models on the right (see flowchart). WaM-DaM translates two aspects of the data: the syntax and semantics. WaM-DaM will speed the time to find, organize, and synthesize data from different sources and prepare data for modeling. Along the way, you'll learn more about your data and the water system the data describes. 

![](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Figures/WaM-DaM_workflow.jpg)

The repository is organized to direct you to i) understand WaM-DaM design, demonstrate how WaM-DaM works, and provide you with instructions on how to use WaM-DaM 

#### Who can use WaM-DaM?
You can use WaM-DaM if:   
1.	Your data are for nodes (points) and/or links (connections between nodes).    
2.	You have one or more data types such as binary, numeric parameters, seasonal, parameters, file-based, rules, time series, or multi-column arrays.   
3.	You want to share and publish your data. WaM-DaM supports important metadata like sources, methods, and units to help others correctly interpret the meanings of your data.Check out the [scope](https://github.com/amabdallah/WaM-DaM/blob/master/docs/Scope.md) of WaM-DaM data.  

#### Getting Started with WaM-DaM
 
WaM-DaM information model is implemented in a relational database which is ready for use to load your data into it. You can choose one of these relational database systems. If you are a beginner, we recommend you to use SQLite because it is very simple to use and set up, doesn’t require a server, and you can use the free Mozilla Firefox Manager to interact with its data.  
Check out the [Instructions](https://github.com/amabdallah/WaM-DaM/blob/master/docs/SQLite_Instructions.md) on how you can set up a WaM-DaM database in SQLite. The instructions are demonstrated live in a video screenshot :)

Check out this <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Workshop.md" target="_blank"> WaM-DaM Workshop </a>  activity to discover water management data for a WEAP model 

Here are the SQL scripts that you can use to create a blank WaM-DaM database. The differences among them are minor and technical due to differences in physical data types used by each system.
* [SQLite](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/BlankSchemas/WaM-DaM_for_SQLite.sql)
* [Microsoft SQL Server] (https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/BlankSchemas/WaM-DaM_for_MSSQL.sql)
* [MySQL](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/BlankSchemas/WaM-DaM_for_MySQL.sql)
* [PostgreSQL](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/BlankSchemas/WaM-DaM_for_PostgreSQL.sql)

#### Documentation  
WaM-DaM is a set of related database tables that are organized into four groups handling different aspects of water management data:  
* Core constructs (blue) which represent the key configuring constructs of WaM-DaM modular design, 
* Metadata (orange) which represents key metadata that help users correctly and unambiguously interpret their data, 
* Controlled Vocabularies (CVs) (purple) which enforces the consistent use of terms across disparate data sources (only one CV box is shown for simplicity), and 
* Data Storage (red) which holds data values of different types based on the user’s choice (e.g., time series and text)

![](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Figures/WaM-DaM_Conceptual.jpg)

Check out this interactive WaM-DaM logical data model <a href="http://amabdallah.github.io/WaM-DaM/" target="_blank">(WaM-DaM schema)</a> and see the full [Documentation](https://github.com/amabdallah/WaM-DaM/blob/master/docs/Documentation.md) abou WaM-DaM architecture

#### Use Cases (Draft)
In the Getting Started with WaM-DaM section above, you can get an empty database of WaM-DaM. Then the Documentation section gives you an idea about WaM-DaM tables, what they mean, and how they are connected with each other. In this section we offer a simple use case as an example that you can follow to use WaM-DaM as a repository for data. We hope that you can follow the logic of the use case to build a WaM-DaM database for your own data. This Use Cases page provide instrucutions that you can follow.  
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Use_Cases.md" target="_blank">Use cases</a>     

Check out more info about the project and [Rationale and Context](https://github.com/amabdallah/WaM-DaM/blob/master/docs/Rationale_Context.md) of WaM-DaM development

#### Publications
A preliminary WaM-DaM design was published in 2014 as a peer-reviewed conference paper:
<a href="http://www.iemss.org/sites/iemss2014/papers/iemss2014_submission_406.pdf" target="_blank">WaM-DaM:A Data Model to Organize and Synthesize Water Management Data</a> 

Please cite WaM-DaM as:
Abdallah, A., Rosenberg, D., 2014. WaM-DaM: A Data Model to Organize and Synthesize Water Management Data. In: Ames, D.P., Quinn, N.W.T., Rizzoli, A.E. (Eds.), Proceedings of the 7th International Congress on Environmental Modelling and Software, June 15-19, San Diego, California, USA. ISBN: 978-88-9035-744-2

#### Presentations
Check out the professional and conference [presentations](https://github.com/amabdallah/WaM-DaM/blob/master/docs/Presentations.md) along the way of WaM-DaM development 

### Future Work and Limitations 
There are numerous opportunities for <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Future_Work.md" target="_blank">futute work </a> to build on on WaM-DaM and benifit from its design. Several of these opportunities need to overcome the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Limitations.md" target="_blank">limitations</a>
 of the current design and improve it.  

### LICENSING
Materials in this GitHub repository are disturbed under a BSD 3-Clause license (see           [LICENSE](https://github.com/amabdallah/WaM-DaM/blob/master/LICENSE.md)). 
For alternative licensing arrangements, contact Adel M. Abdallah or David E. Rosenberg directly.    

## AUTHOR and CONTACT
For more info, please free to email    
<a href="http://www.engr.usu.edu/cee/faculty/derosenberg/students.htm" target="_blank"> Adel Abdallah </a> at: amabdallah@aggiemail.usu.edu       
<a href="http://www.engr.usu.edu/cee/faculty/derosenberg/" target="_blank"> David Rosenberg </a> at: david.rosenberg@usu.edu

## Sponsors and Credit 
This material is based upon work supported by the National Science Foundation Grant <a href="http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482" target="_blank">NSF grant</a> . Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.   

[![NSF](http://www.nsf.gov/images/logos/nsf1v.jpg)](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482&HistoricalAwards=false)[![CI-Water](http://ci-water.org/images/logo/ciwater.png)](http://ci-water.org/)


