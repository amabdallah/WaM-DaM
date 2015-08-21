## Rationale and Context

### Rationale
The development of WaM-DaM is part of an ambitious research project to develop cyberinfrastructure to advance the science of hydrology and water resources management. The project is called “Cyber-Infrastructure to Advance High Performance Water Resource Modelling” <a href="http://ci-water.org" target="_blank">CI-WATER</a>. The CI-WATER Project is funded by the National Science Foundation through grants <a href="http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482" target="_blank">EPS-1135482</a>
and EPS-1135483. The project comprises large interdisciplinary team of Utah and Wyoming researchers. You may download the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/Files/WIKI/CI-WATER_Proposal.pdf" target="_blank">CI-WATER Proposal</a>

The CI-WATER project includes researchers from Brigham Young University, the University of Utah, Utah State University, and the University of Wyoming. The project has received a $6 million, three-year award from the National Science Foundation (NSF) to develop a better understanding of the interconnectivity of natural and human water resources systems – a critical environmental sustainability problem facing both Western states. CI-WATER aims also to simulate and study how factors such as population growth, shifting land uses and climate variability will impact water storage and availability in the Intermountain West. This award is made under the NSF Experimental Program to Stimulate Competitive Research (EPSCoR), which supports states' efforts to enhance research, science and mathematics education, and workforce development. NSF Award Number: 

Systems water management data lacks a standardized method to organize and communicate its diverse and disparate data. Developing a persistent data model for water management data is an important step to advance how we communicate such vital data across disciplines. So the C-WATER team at Utah State University took the task to develop WaM-DaM.

Most of existing models use the traditional architecture which incorporate three integrated and tight coupled components i) user interface, data management system, and the model engine of algorithms (Harou et al., 2010). There is an increasing interest to decouple the three components to allow the reuses of data and user interface across different models. WaM-DaM aims to provide a standard for the database component so other models can re-use the same data.


![](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/PradigmShift.jpg)



###Context
The timing, availability of funds, expertise, and passion for WaM-DaM development were incredible by all means. Along the way of WaM-DaM development, there has been an incredible interest from national and international scientists and practitioners in standardizing the way we communicate systems water management data.

We were fortunate to discuss and the development of WaM-DaM with these research groups and agencies listed below. WaM-DaM and these projects complement each other and there is a big room for real future collaboration. There are numerous opportunities for [future work](https://github.com/amabdallah/WaM-DaM/edit/master/docs/Future_Work.md) with many of these groups. We hope that our discussions with them continue so we can achieve our common goal of having a standard to communicate systems water management data. 



| #  | Project       | Affiliation|
| --- | :-------------| :-----|
|  1 |Hydra Platform: web-services to linking water resource network models, share data in an open data management platform| University of Manchester, United Kingdom|
|  2 |<a href="http://hobbes.ucdavis.edu" target="_blank">HOBBES</a>:  a bottom up approach to improve and organize the data for water modeling efforts in California| University of California, Davis|
|  3 |ADHydro: A Large-scale High-resolution Multi-physics Distributed Water Resources Model for Water Resources Simulations      |University of Wyoming|
|  4 |<a href="http://www.weap21.org/index.asp" target="_blank">WEAP</a>: Water Evaluation And Planning System| Stockholm Environment Institute|
|  5 |<a href="http://www.riverware.org/index.html" target="_blank">RiverWare</a>: a river system modeling tool| Center for Advanced Decision Support for Water and Environmental Systems (CADSWES). University of Colorado at Boulder|
|  6 |<a href="http://www.hec.usace.army.mil/software/hec-ressim" target="_blank">HEC-ResSim</a>: The Reservoir System Simulation software |U.S. Army Corps of Engineers, Institute for Water Resources, Hydrologic Engineering Center|
|  7|<a href="http://demo.tethys.ci-water.org/apps/parleys-creek-management/" target="_blank">IWRM</a>: Integrated Water Resources Management|<a href="http://urbanwater.utah.edu/home" target="_blank">The Urban Water Group</a> University of Utah|
| 8|<a href="http://www.westernstateswater.org/wade/" target="_blank">WaDE</a>:The Water Data Exchange Program |Western States Water Council|
| 9|Managing data for the state river basins water budgets models |Utah Division of Water Resources|
| 10|<a href="http://hydroshare.cuahsi.org/" target="_blank">HydroShare</a>:collaborative environment for sharing hydrologic data and models aimed at giving hydrologists the technology infrastructure they need to address critical issues related to water quantity, quality, accessibility, and management. |Utah State University|


### Acknowledgement 
These people provided valuable feedback and insights into earlier designs and materials of WaM-DaM: David Tarboton, Jeffery Horsburgh,  Pabitra Dash, Toney Castronova at the Utah Water Research Laboratory and Utah State University, Julien Harou, Stephen Knox, and Philipp Meier at Manchester University, Josue Medellin-Azuara and Quinn Hart at the University of California, Davis.

### Disclaimer:
The CI-WATER Project is funded by the National Science Foundation through grants EPS-1135482 and EPS-1135483. Any opinions, findings, and conclusions or recommendations expressed in this GitHub repository are those of the author(s) do not necessarily reflect the views of the National Science Foundation. Utah Water Research Laboratory and the Water Users Association provided financial support.
