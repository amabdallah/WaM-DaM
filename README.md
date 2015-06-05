WaM-DaM
===========

#### The Water Management Data Model (WaM-DaM). 

#### Model Quicker, Publish Faster! 

Water Management Data Model (WaM-DaM) is an information model that is proposed to synthesize and integrate Fragmented and inconsistent water resources management data. The information model aimes to help scientists and water managers organize, query, and interpret their disparate and diverse data to save time plus facilitate modeling.


![](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/WIKI/WaM-DaM.jpg)




#### Software 
I used [DbWrench 3.2.4](http://www.dbwrench.com) to draw the Entity-Relationship (ER) diagram of WaM-DaM logical Data Model

#### Getting Started with WaM-DaM
Check out the [WaM-DaM XML Schema] (https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/WaM-DaM1.0.xml)
 

SQL scripts for generating blank WaM-DaM databases can be downloaded here:
* [Microsoft SQL Server] (https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/BlankSchemas/WaM-DaM_for_MSSQL.sql)
* [MySQL](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/BlankSchemas/WaM-DaM_for_MySQL.sql)
* [PostgreSQL](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/BlankSchemas/WaM-DaM_for_PostgreSQL.sql)
* [SQLite](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/BlankSchemas/WaM-DaM_for_SQLite.sql)

**Credit** I used the this DDL Script in Python [by Tony Castranova] that converts the DbWrench XML file of WaM-DaM to forward engineer to MsSQL, MySQL, and PostgreSQL.
https://github.com/ODM2/ODM2/tree/master/src/build_schemas

Matlab Script to load data to WaM-DaM SQLite [here](https://github.com/amabdallah/WaM-DaM/blob/master/Files/MatlabScript/AutomateLoadingDataToWaMDaM.m) 

Populated SQLite WaM-DaM database [here]()

Check out the current WaM-DaM logical data model [schema](http://amabdallah.github.io/WaM-DaM/
). Last time updated: June 4, 2015 

Check out the use cases and their results at the WIKI pages [here](https://github.com/amabdallah/WaM-DaM1.0/wiki/Use-Cases)


Please be aware that the earlier design concepts and documnetations have changed significantlry. However, the spirt of WaM-DaM and its priciples remain the same. You may check earlier documentations here at [WaM-DaM0.1](https://github.com/amabdallah/WaMDaM
)

#### Publications:
A preliminary WaM-DaM design was published in 2014 as a peer-reviewd conference paper:
[WaM-DaM:A Data Model to Organize and Synthesize Water Management Data](http://www.iemss.org/sites/iemss2014/papers/iemss2014_submission_406.pdf)

Please cite WaM-DaM as:
Abdallah, A., Rosenberg, D., 2014. WaM-DaM: A Data Model to Organize and Synthesize Water Management Data. In: Ames, D.P., Quinn, N.W.T., Rizzoli, A.E. (Eds.), Proceedings of the 7th International Congress on Environmental Modelling and Software, June 15-19, San Diego, California, USA. ISBN: 978-88-9035-744-2

#### Presentatons:
8. Adel Abdallah, David E. Rosenberg (2014).[WaM-DaM: A Data Model to Organize and Synthesize Water Management Data](http://www.engr.usu.edu/cee/faculty/derosenberg/documents/WaM-DaM_UWUG.pptx)  Utah Water Data Users Group 2nd Meeting, Salt Lake City, Utah: Jan. 27, 2015.

7. Adel Abdallah, David E. Rosenberg (2014). [WaM-DaM: A Data Model to Synthesize and Organize Water Management Data](http://www.engr.usu.edu/cee/faculty/derosenberg/documents/AbdallahRosenberg-WaMDaM-EWRI-June2014.pptx) World Environmental & Water Resources Congress, Portland, OR: June 1-5, 2014.

6. Adel Abdallah, David E. Rosenberg (2014)."WaM-DaM: A Data Model to Organize and Synthesize Water Management Data."  International Environmental Modelling and Software Society (iEMSs) 7th Intl. Congress on Env. Modelling and Software, San Diego, CA, USA, [POSTER](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/WIKI/iEMSs%202014_Poster.pptx?raw=true)

5. Adel M. Abdallah and David E. Rosenberg (2014). [WaM-DaM: A Data Model to Organize, Share, and Publish Water Management Data](http://www.awra.org/meetings/SnowBird2014/doc/powerpoint/SPR_S8A_Abdallah_Adel.pdf) American Water Resources Association (AWRA) Spring Specialty Conference". Snowbird, Utah, USA.   May 12-14, 2014

4. Adel M. Abdallah and David E. Rosenberg (2013). [A Relational Data Model for Water Management Data](https://github.com/amabdallah/WaM-DaM1.0/blob/master/Files/WIKI/CUAHSI2013_WaM-DaM.pptx?raw=true) CUASHI Conference on Hydroinformatics and Modeling, Logan, UT: July 17-19, 2013.

3. Adel M. Abdallah and David E. Rosenberg (2013). [a Summary of the Proposed WaM-DaM](https://github.com/amabdallah/WaM-DaM/blob/master/Files/WIKI/WaM-DaM_Summary_Dec_2013.pdf) Term Project Final Report,GIS in Water Resources Class, USU: Dec 6, 2013.

2. Adel M. Abdallah. [Investigate the Capability of Arc Hydro Framework to Represent Water Management Data](https://github.com/amabdallah/WaM-DaM/blob/master/Files/WIKI/ArcHydro_Project.pdf) Term Project Final Report,GIS in Water Resources Class, USU: Nov 6, 2013.

1. Adel M. Abdallah and David E. Rosenberg (2013). [Design Reservoir Conceptual Data Model](https://github.com/amabdallah/WaM-DaM/blob/master/Files/WIKI/WaM-DaM_Summary_Dec_2013.pdf) Final Term Project Paper, GHydroinformatics Class, USU: Dec 13, 2012.


For more info, please free to email Adel Abdallah at:
amabdallah@aggiemail.usu.edu


## Sponsors and Credit 

This material is based upon work supported by the National Science Foundation Grant [NSF grant](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482) . Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.

This WaM-DaM project is funded as part of the CI-Water Project. An interdisciplinary team of Utah and Wyoming researchers has received a $6 million, three-year award from the National Science Foundation (NSF) to develop a better understanding of the interconnectivity of natural and human water resources systems – a critical environmental sustainability problem facing both Western states.

The award will allow the team of researchers to develop high-performance computer modeling and computational resources (known as cyberinfrastructure or CI for short) to simulate and study how factors such as population growth, shifting land uses and climate variability will impact water storage and availability in the Intermountain West. This award is made under the NSF Experimental Program to Stimulate Competitive Research (EPSCoR), which supports states' efforts to enhance research, science and mathematics education, and workforce development.

The CI-WATER project includes researchers from Brigham Young University, the University of Utah, Utah State University, and the University of Wyoming. BYU and the University of Wyoming are the lead institutions for their respective states in the consortium.

This work is part of a large cyberinfrastructure project [(CI-WATER)](http://ci-water.org/) to advance water resources modeling that involves Utah State University, Brigham Young University, University of Utah and University of Wyoming. 

Check out WaM-DaM documentation and development at the [GitHub Wiki](https://github.com/amabdallah/WaM-DaM1.0/wiki)



[![NSF](http://www.nsf.gov/images/logos/nsf1v.jpg)](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482&HistoricalAwards=false)[![CI-Water](http://ci-water.org/images/logo/ciwater.png)](http://ci-water.org/)



