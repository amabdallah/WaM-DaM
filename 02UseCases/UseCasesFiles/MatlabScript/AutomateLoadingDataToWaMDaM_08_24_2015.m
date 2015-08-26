% Ovserview: Automate data loading from spreadsheets to WaM-DaM
% Adel Abdallah 

% initially writen in December 2014
% Last time updated August 24, 2015 
% This Matlab script automate loading your data from spreadsheets to
% WaM-DaM SQLite database. 

% With little changes you can load your data to
% Microsoft SQL Server, MySQL, or PostGreSQL databases too.

% Steps:
% 1. Read spreadsheets in this order: Controlld Vocabulary,Metadata
% Core, and Data Storage. The Excel workbooks have to be at the same
% directory of the Matlab script directory. Otherwise, you need to add the 
% appropriate path to the workbooks 

% 2. Connect to the empty WaM-DaM Database in SQLite. 
% Instructions are at https://github.com/amabdallah/WaM-DaM/tree/master/03WaM-DaM_Schema
% But first, you need to define/install the ODBC/JDBC connection in Matlab.
% Matlab needs the Database Toolbox to support connection with databases.
% Standard Matlab licience doesnt come with the Database Toolbox 

% 3. Load the data that are read in step 1 into the database in the same order it
% was read.
% The order of loading data of tables to the database is important because of 
% the dependency between tables. First, you need to load the independent tables
% like controlled vocabulary tables and then the first dependent table, and 
% so on until you load the most dependent table of all, the ScenarioMetadata table 

% Attention: loading large data (thousands to tens of thousands of records) 
% to tables in SQLite might take minutes (like in the Controlled Vocabulary tables)
% or even several hours to load into the database. Be Patient:) 
% There are other more efficient methods to load data to databases from Matlab 
% but for now, lets use this easy one.
% loading data to MySQL and PostgreSQL seemed to be much faster. 
% SQLite has limited data types....so it takes time to internally convert many data types to the supported ones   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read the 18 controlled vocabulary tables from the Excel Workbook called "01CVs"
% close all Matlab windowss, clear the Command Window, and clear the workspace
clear all; clc; close all;

%1. DataStructureDomain
[num,txt,DataStructureDomain] = xlsread('01CVs','DataStructureDomain');

% avoid the two title rows and first column which will be automatically
% generated while loading to the database
DataStructureDomain=DataStructureDomain(3:end,1:end);

%---------------------------------------------------------------------------
% 2. CommonObjectCategory
[num,txt,CommonObjectCategory] = xlsread('01CVs','CommonObjectCategory');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database  
CommonObjectCategory=CommonObjectCategory(3:end,2:end);% avoid the first row and column

%---------------------------------------------------------------------------
%3. Common Object Types CV  
[num,txt,CommonObjectTypes] = xlsread('01CVs','CommonObjectTypes');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
CommonObjectTypes=CommonObjectTypes(3:end,2:end);% avoid the first row and first column

%---------------------------------------------------------------------------
%4. Common Attribute Category  
[num,txt,CommonAttributeCategory] = xlsread('01CVs','CommonAttributeCategory');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
CommonAttributeCategory=CommonAttributeCategory(3:end,2:end);% avoid the first row and first column

%---------------------------------------------------------------------------
%5. Common Attributes 
[num,txt,CommonAttributes] = xlsread('01CVs','CommonAttributes');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
CommonAttributes=CommonAttributes(3:end,2:end);% avoid the first row and column

%---------------------------------------------------------------------------
%6. Organization Type
[num,txt,OrganizationType] = xlsread('01CVs','OrganizationType');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database  
OrganizationType=OrganizationType(3:end,1:end);% 


%---------------------------------------------------------------------------
%7. Method Type
[num,txt,MethodType] = xlsread('01CVs','MethodType');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
MethodType=MethodType(3:end,1:end);% avoid the first row

%---------------------------------------------------------------------------
%8. Vertical Datum
[num,txt,VerticalDatum] = xlsread('01CVs','VerticalDatum');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database  
VerticalDatum=VerticalDatum(3:end,1:end);% avoid the first row

%---------------------------------------------------------------------------
%9. Attribute Type Code
[num,txt,AttributeTypeCode] = xlsread('01CVs','AttributeTypeCode');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
AttributeTypeCode=AttributeTypeCode(3:end,1:end);% avoid the first row

%---------------------------------------------------------------------------
%10. Aggregation Statistic
[num,txt,AggregationStatistic] = xlsread('01CVs','AggregationStatistic');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
AggregationStatistic=AggregationStatistic(3:end,1:end);% avoid the first row

%---------------------------------------------------------------------------
%11. Instance Status
[num,txt,InstanceStatus] = xlsread('01CVs','InstanceStatus');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
InstanceStatus=InstanceStatus(3:end,1:end);% avoid the first row

%---------------------------------------------------------------------------
%12. SeasonName
[num,txt,SeasonName] = xlsread('01CVs','SeasonName');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
SeasonName=SeasonName(3:end,1:end);% avoid the first row

%---------------------------------------------------------------------------
%13. Symbols
[num,txt,Symbols] = xlsread('01CVs','Symbols');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
Symbols=Symbols(3:end,1:end);% avoid the first row

%---------------------------------------------------------------------------
% 14. Controlled Text
[num,txt,ControlledTextValues] = xlsread('01CVs','ControlledTextValues');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
ControlledTextValues=ControlledTextValues(3:end,2:end);% avoid the first row and column
% Convert the data value to string 
ControlledTextValues(:,1) = cellfun(@num2str, ControlledTextValues(:,1), 'UniformOutput', false);

%---------------------------------------------------------------------------
% 15. Units 
[num,txt,Units] = xlsread('01CVs','Units');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
Units=Units(3:length(Units),2:end);

%---------------------------------------------------------------------------
%16. SpatialReference
[num,txt,SpatialReference] = xlsread('01CVs','SpatialReference');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
SpatialReference=SpatialReference(3:end,2:end);% avoid the first row and column

%---------------------------------------------------------------------------
%17. BinaryValueMeaning
[num,txt,BinaryValueMeaning] = xlsread('01CVs','BinaryValueMeaning');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
BinaryValueMeaning=BinaryValueMeaning(3:end,2:end);% avoid the first row

%---------------------------------------------------------------------------
%18. FileFormat
[num,txt,FileFormat] = xlsread('01CVs','FileFormat');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
FileFormat=FileFormat(3:end,1:end);% avoid the first row

% clear these Matlab variables since we wont need them
clear txt num
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read the 9 Metadata tables from the  Excel Workbook called "02Metadata"
% Organizations, people, Methods, sources
%1. NativeObjectCategory
[num,txt,NativeObjectCategory] = xlsread('02Metadata','NativeObjectCategory');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
NativeObjectCategory=NativeObjectCategory(3:end,2:end);% avoid the first row and column

%---------------------------------------------------------------------------
%2. NativeAttribueCategory
[num,txt,NativeAttributeCategory] = xlsread('02Metadata','NativeAttributeCategory');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
NativeAttributeCategory=NativeAttributeCategory(3:end,2:end);% avoid the first row

%---------------------------------------------------------------------------
% 3. Organizations

[num,txt,Organ] = xlsread('02Metadata','Organizations');

% avoid the two title rows and first column which will be automatically
% generated while loading to the database   
Organizations=Organ(3:end,2:end);% avoid the first row

%---------------------------------------------------------------------------
% 4. People 

[num,txt,Peop] = xlsread('02Metadata','People');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database  
People=Peop(3:end,2:end);% avoid the first row

%---------------------------------------------------------------------------
% 5. Sources
[num,txt,rawSource] = xlsread('02Metadata','Sources');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
Sources=rawSource(3:end,2:end);% avoid the first row

%---------------------------------------------------------------------------
% 6. Methods
[num,txt,rawMethods] = xlsread('02Metadata','Methods');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database  
Methods=rawMethods(3:end,2:end);% avoid the first row

%---------------------------------------------------------------------------
% 7. Models
[num,txt,Models] = xlsread('02Metadata','Models');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
Models=Models(3:end,2:end);% avoid the first row and column

%---------------------------------------------------------------------------
%8. Connections 
[num,txt,Connections] = xlsread('02Metadata','Connections');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
Connections=Connections(3:end,2:end); % srtart from rwo 2 to avoid headlines 

%9. Vertices 
[num,txt,VerticesData] = xlsread('02Metadata','Vertices');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database 
Vertices=cell2mat(VerticesData(3:end,2:4))


% Add IDs to reflect the cumulitive IDs

% Streams links then WEAP connections  
%length of stream instances =76975

% Add 8121+26872+65787 to Link Instances 
Connections(1:76975,1)=Connections(1:76975,1)+8121+26872+65787;

% Add 8121+26872 to Start Node instances
Connections(1:76975,2)=Connections(1:76975,2)+8121+26872;

% Add 8121+26872 to Start and End Node instances
Connections(1:76975,3)=Connections(1:76975,3)+8121+26872 ;

%length of stream instances =76975
% Add 177755 to WEAP Start, End, and Link Instances  
Connections(76976:end)=Connections(76976:end)+177755;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read the 10 Core tables from the Excel Workbook called "03Core"
%1. DataStructures
[num,txt,DataStructures] = xlsread('03Core','DataStructures');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
DataStructures=DataStructures(3:end,2:end);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(DataStructures)
  if isnan(DataStructures{k})
    DataStructures{k} = [];
  end
end

%---------------------------------------------------------------------------
%2. Object types 
[num,txt,ObjectTypes] = xlsread('03Core','ObjectTypes');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
ObjectTypes=ObjectTypes(3:length(ObjectTypes),2:end);

% convert the Object code to string
ObjectTypes(:,2) = cellfun(@num2str, ObjectTypes(:,2), 'UniformOutput', false);

%---------------------------------------------------------------------------
%3. Attributes
[num,txt,Attributes] = xlsread('03Core','Attributes');

% avoid the two title rows and first column which will be automatically
% generated while loading to the database
Attributes=Attributes(3:end,2:end);

%---------------------------------------------------------------------------
%4. Object Atributes 
[num,txt,ObjectTypes] = xlsread('03Core','ObjectAttributes');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
ObjectAttributes=ObjectTypes(3:end,2:5); 
% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(ObjectAttributes)
  if isnan(ObjectAttributes{k})
    ObjectAttributes{k} = [];
  end
end

%---------------------------------------------------------------------------
%5. Master Networks 
[num,txt,MasterNetworks] = xlsread('03Core','MasterNetworks');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
MasterNetworks=MasterNetworks(3:end,2:end); 
% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(MasterNetworks)
  if isnan(MasterNetworks{k})
    MasterNetworks{k} = [];
  end
end

%---------------------------------------------------------------------------
%6. Scenarios
[num,txt,Scenarios] = xlsread('03Core','Scenarios');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
Scenarios=Scenarios(3:end,2:end); % 

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(Scenarios)
  if isnan(Scenarios{k})
    Scenarios{k} = [];
  end
end

%---------------------------------------------------------------------------
%7. instances
[num,txt,Instances] = xlsread('03Core','Instances');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
% and the avoid the fake column added to this sheet so they know the source
% of data
Instances=Instances(3:end,2:8); 

%---------------------------------------------------------------------------
%8. Storage
[num,txt,Storage] = xlsread('03Core','Storage');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
Storage=Storage(3:end,1); 

%---------------------------------------------------------------------------
%9. Mapping 
[num,txt,Mapping] = xlsread('03Core','Mapping');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
Mapping=Mapping(3:end,2:end); 
%---------------------------------------------------------------------------
%10. ScenarioMapping
[num,txt,ScenarioMapping] = xlsread('03Core','ScenarioMapping');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
ScenarioMapping=ScenarioMapping(3:end,2:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MappingIDds........
% comments are comming soon to update and describe whats going on here :)

% In the Data Storage table, we need to know the data type (paramete, time
% series), source foriegn key, method forign key, and a scenarrioInstance
% foreign key
 %AttributeTypeCV, Description, MethodID, SourceID, ModelInputOrOutput, ScenarioInstanceID

 % In a software setting, a user first needs to prepare these metadata for each
 % attribute: AttributeTypeCV,Description, MethodID, SourceID, ModelInputOrOutput
 % the softwate makes each of these metadata will be linked to every instance ( I dont know how for now)
 

% Define a vector of foreign keys for attributes to corespond to the the number of storage keys   
% the code should look up the keys of provided variables names instead of
% me giving the code the keys 

% NumInstance=8121+26872+65787+76976;

% to create a Scenario, we need to dublicate maping out the keys 
% from the instances to the the data values. 


% Find out the last Primary key value in the DataStructures table
% sqlquery = 'select * from "Core"."DataStructures"';
% curs = exec(connPostgres2015,sqlquery)
% curs = fetch(curs);
% x=curs.Data(end,1)


XX=8121+26872+65787+76975;
XX2=XX+11; % number of instances of Demand site 
XX3=XX2+2; % number of instances of Groundwater
XX4=XX3+5; % number of instances of Reservoir 
XX5=XX4+4;
XX6=XX5+9;
XX7=XX6+1;
XX8=XX7+4;
XX9=XX8+3;
XX10=XX9+1;
XX11=XX10+7;
XX12=XX11+5;
XX13=XX12+31;
XX14=XX13+28; % number of instances of Reaches 
XX15=XX14+2; % number of instances of new reservoirs  (Above and below Culter Reservoir)

[num,txt,CUAHSIsitesVariables] = xlsread('03Core','CUAHSIsitesVariables');
CUAHSIsites= Instances(177869:end,:)

%find the idex of CUAHSI sites 
% get the ids of CUAHSI Instances
CUAHSIinst = cell(CUAHSIsitesVariables (2:end,2));
for i = 1:numel(CUAHSIsitesVariables (2:end,2));
    CUAHSIinst{i} = find(strcmpi(Instances(:,1),CUAHSIsitesVariables (i+1,2)));
end
InstanceID=[num2cell([repmat(1:8121,1,20)';repmat(8122:8121+26872,1,12)';repmat(8122+26872:8121+26872+65787,1,1)';
    repmat(8122+26872+65787:8121+26872+65787+76975,1,3)';
    repmat(XX+1:XX+11,1,19)'; %demand site #19 attributes 
    repmat(XX2+1:XX2+2,1,12)';% Groundwater #12 attributes 
    repmat(XX3+1:XX3+5,1,30)'; % Reservoir #30 attributes
    repmat(XX4+1:XX4+4,1,31)'; % local reserrvoir #31 attributes
    repmat(XX5+1:XX5+9,1,1)'; % River Withdrawal #1 attributes
    repmat(XX6+1:XX6+1,1,1)'; % Diversion outflow #1 attributes
    repmat(XX7+1:XX7+4,1,1)'; % Tributery #1 attributes
    repmat(XX8+1:XX8+3,1,1)'; % Return flow Node #1 attributes 
    repmat(XX9+1:XX9+1,1,9)'; % Diversion #9 attributes 
    repmat(XX10+1:XX10+7,1,10)'; % Return flow Link #10 attributes 
    repmat(XX11+1:XX11+5,1,10)'; % River #10 attributes 
    repmat(XX12+1:XX12+31,1,11)'; % Transmission Link #11 attributes 
    repmat(XX13+1:XX13+28,1,16)']); % River Reach #16 attributes 
    CUAHSIinst];% CUAHSI instances 

WEAPScen4=19*11+12*2+30*5+31*4+1*9+1*1+1*4+1*3+9*1+10*7+10*5+11*31+16*28;

% WEAPScen5=WEAPScen4+30*2; % Add two reservoirs, 
% deleted a reservoir, and deleted 3 transsmtion links plus one reservoir 

ObjectAttributeIDs=(1:length(ObjectAttributes(:,1)))';% primary keys of Object Attributes 

ObjectAttributeID1=ObjectAttributeIDs(1:20) ;
ObjectAttributeID2=ObjectAttributeIDs(21:32) ; 
ObjectAttributeID3A=ObjectAttributeIDs(33) ;
ObjectAttributeID3B=ObjectAttributeIDs(34:36) ;% Feature, Length
ObjectAttributeID4=ObjectAttributeIDs(37:55) ;% Demand Site attributes 
ObjectAttributeID5=ObjectAttributeIDs(56:78) ;% Catchemnt attributes 
ObjectAttributeID6=ObjectAttributeIDs(79:88) ;% River attributes 
ObjectAttributeID7=ObjectAttributeIDs(89:118) ;% Reservoir attributes 
ObjectAttributeID8=ObjectAttributeIDs(119:131) ;% Run of the River Hydro attributes 
ObjectAttributeID9=ObjectAttributeIDs(132:139) ;% Flow Requirment attributes 
ObjectAttributeID10=ObjectAttributeIDs(140:155) ;% River Reach attributes 
ObjectAttributeID11=ObjectAttributeIDs(156:159) ;% Stream flow Gage attributes
ObjectAttributeID12=ObjectAttributeIDs(160:171) ;% Growndwater attributes
ObjectAttributeID13=ObjectAttributeIDs(172:202) ;% Local Reservoir attributes
ObjectAttributeID14=ObjectAttributeIDs(203) ;% River Withdrawal
ObjectAttributeID15=ObjectAttributeIDs(204) ;% Diversion Outflow
ObjectAttributeID16=ObjectAttributeIDs(205) ;% Tributary
ObjectAttributeID17=ObjectAttributeIDs(206) ;% Retrun Flow attributes // Node 
ObjectAttributeID18=ObjectAttributeIDs(207:215) ;% Diversion/Link 
ObjectAttributeID20=ObjectAttributeIDs(216:226) ;% Transmssion Link  attributes
ObjectAttributeID21=ObjectAttributeIDs(227:236) ;% Retrun Flow attributes // Link 
ObjectAttributeID22=ObjectAttributeIDs(237:248) ;% Wastewater Treatment Plant attributes


   
% replaicate the vectors of object attributes based on the number of
% instances that each object has:)

ObjectAttributeID=[reshape((num2cell(repmat(ObjectAttributeID1,1,8121)))',[],1);
            reshape((num2cell(repmat(ObjectAttributeID2,1,26872)))',[],1);
            reshape((num2cell(repmat(ObjectAttributeID3A,1,65787)))',[],1);
            reshape((num2cell(repmat(ObjectAttributeID3B,1,76975)))',[],1);
            reshape((num2cell(repmat(ObjectAttributeID4,1,11)))',[],1); %  Demand Site  #11
            reshape((num2cell(repmat(ObjectAttributeID12,1,2)))',[],1); %  Groundwater #2                 
            reshape((num2cell(repmat(ObjectAttributeID7,1,5)))',[],1); %  Reservoir #5      
            reshape((num2cell(repmat(ObjectAttributeID13,1,4)))',[],1); %  Local Reservoir #4         
            reshape((num2cell(repmat(ObjectAttributeID14,1,9)))',[],1); %  River Withdrawal #9                 
            reshape((num2cell(repmat(ObjectAttributeID15,1,1)))',[],1); %  Diversion Outflow #1  
            reshape((num2cell(repmat(ObjectAttributeID16,1,4)))',[],1); % Tributary #4              
            reshape((num2cell(repmat(ObjectAttributeID17,1,3)))',[],1); % Return Flow/Node #3              
            reshape((num2cell(repmat(ObjectAttributeID18,1,1)))',[],1); % Diversion Link #1             
            reshape((num2cell(repmat(ObjectAttributeID21,1,7)))',[],1); % Return Flow/Link #7            
            reshape((num2cell(repmat(ObjectAttributeID6,1,5)))',[],1); % River #5           
            reshape((num2cell(repmat(ObjectAttributeID20,1,31)))',[],1); %  Transmission Link #31               
            reshape((num2cell(repmat(ObjectAttributeID10,1,28)))',[],1); %  River Reach #28
            CUAHSIsitesVariables(2:end,24)];
               
InputOrOutput=cell(length(ObjectAttributeID),1);

AttributeTypeCodeCV = [repmat({'P'}, [8121*8,1]);repmat({'TF'}, [8121*2,1]);
                  repmat({'TC'}, [8121*9,1]);repmat({'D'}, [8121*1,1]);
                  repmat({'P'}, [26872*3,1]);repmat({'TC'}, [26872*7,1]); 
                  repmat({'TF'}, [26872*1,1]);repmat({'D'}, [26872*1,1]);
                  repmat({'D'}, [65787*1,1]); 
                  repmat({'TC'}, [76975*1,1]);repmat({'P'},[76975*1,1]);
                  repmat({'D'},  [76975*1,1]);
                  repmat({'T'},[2*11,1]); %Demand Site
                  repmat({'P'},[16*11,1]);%Demand Site
                  repmat({'D'},[1*11,1]); %Demand Site
                  repmat({'P'},[2*2,1]);  %Groundwater 
                  repmat({'T'},[1*2,1]);  %Groundwater 
                  repmat({'P'},[8*2,1]);  %Groundwater 
                  repmat({'D'},[1*2,1]);  %Groundwater                   
                  repmat({'T'},[1*5,1]);  %Reservoir                    
                  repmat({'P'},[2*5,1]);  %Reservoir                   
                  repmat({'T'},[1*5,1]);  %Reservoir 
                  repmat({'M'},[1*5,1]);  %Reservoir 
                  repmat({'R'},[1*5,1]);  %Reservoir 
                  repmat({'P'},[20*5,1]); %Reservoir                   
                  repmat({'C'},[3*5,1]);  %Reservoir
                  repmat({'D'},[1*5,1]);  %Reservoir  
                  repmat({'T'},[2*4,1]);  %Local Reservoir 
                  repmat({'P'},[2*4,1]);  %Local Reservoir 
                  repmat({'T'},[1*4,1]);  %Local Reservoir 
                  repmat({'M'},[1*4,1]);  %Local Reservoir 
                  repmat({'P'},[21*4,1]); %Local Reservoir 
                  repmat({'C'},[3*4,1]);  %Local Reservoir
                  repmat({'D'},[1*4,1]);  %Local Reservoir 
                  repmat({'D'},[1*9,1]);  %River Withdrawal 
                  repmat({'D'},[1*1,1]);  %Diversion outflow
                  repmat({'D'},[1*4,1]);  %Tributery
                  repmat({'D'},[1*3,1]);  %Return flow Node                
                  repmat({'P'},[8*1,1]);  %Diversion
                  repmat({'D'},[1*1,1]);  %Diversion     
                  repmat({'P'},[9*7,1]);  %Return Flow link
                  repmat({'D'},[1*7,1]);  %Return Flow link
                  repmat({'T'},[1*5,1]);  %River                   
                  repmat({'P'},[8*5,1]);  %River                   
                  repmat({'D'},[1*5,1]);  %River                  
                  repmat({'P'},[10*31,1]);%Transmission Link
                  repmat({'D'},[1*31,1]); %Transmission Link
                  repmat({'P'},[15*28,1]);%River Reach
                  repmat({'D'},[1*28,1]); %River Reach
                  repmat({'T'}, [1*(119+6),1]); %NWISCUAHSIStream
                  repmat({'D'},[1*119,1]);      %NWISCUAHSIStream
                  repmat({'T'}, [1*39,1]);      %GHCNCUAHSI              
                  repmat({'D'},[1*39,1]);       %GHCNCUAHSI           
                  repmat({'D'},[1*4,1]);       %NWISCUAHSIReservoir
                  repmat({'T'}, [1*4,1])];       %NWISCUAHSIReservoir                          
                       
%P:Parameter 
%TF:TextFree 
%TC:TextControlled 
%T: Time sereis 
%B:Binary
%S:Seasonal Parameter 
%FB: File Based 
%R: Rule
%M: MultiColumnArray
%C: Column
%RV	Rule Variable
%D: Dummy attribute  

SourceID=num2cell([repmat(2,1,8121*20)';repmat(3,1,26872*12)';repmat(6,1,65787*1)';
    repmat(6,1,76975*3)';repmat(10,1,WEAPScen4)';repmat(8,1,length(CUAHSIinst))']);

MethodID=num2cell([repmat(1,1,8121*20)';repmat(2,1,26872*12)';repmat(3,1,65787*1)';
    repmat(3,1,76975*3)';repmat(5,1,WEAPScen4)';repmat(6,1,length(CUAHSIinst))']);

DataStorageID=num2cell(1:(8121*20+26872*12+65787*1+76975*3+(WEAPScen4))+length(CUAHSIinst))';

Mapping=[ObjectAttributeID,InstanceID,InputOrOutput,... 
          SourceID, MethodID, AttributeTypeCodeCV,DataStorageID];   

% ScenarioInstances
% [num,txt,ScenarioIDs] = xlsread('ScenarioMetadata','RemovedIDs2');
MappingID1=num2cell(1:(8121*20+26872*12+65787*1+76975*3+WEAPScen4+length(CUAHSIinst)))';

% ScenarioID1 doesnt have the last 60 records because they belong to the second scenario 
ScenarioID1=num2cell([repmat(1,1,8121*20)'; repmat(2,1,26872*12)';
                repmat(3,1,((65787)*1))';repmat(3,1,((76975)*3))';
                repmat(4,1,WEAPScen4)';
                repmat(7,1,length(CUAHSIinst))']);

ScenarioMapping1= [ScenarioID1,MappingID1];     
%% Create and load scenarios data 

%First, define the topological changes for the second scenario (Proposed Scenario)
% 1. The proposed scenario removed a reservoir and three transmissions links
%    for the base case scenario.
% 2. The proposed scenatrio has two additional proposed reservoirs

% I run a query against WaM-DaM database to get the Mapping records that
% match the instances that I need to remove 

% Find out the MappingIDs that are identical in scenario#4 and #5 
% In this case, we get all the MappingIDs in scenario#4 but we exclude the
% MappingIDs that corespond to the changes in instances or attributes 
% in this example, we will exclude: 

%instances:
% 'Transmition Link from Withdrawal Node 8 to Barrens' 
% 'Transmition Link from Withdrawal Node 5 to Barrens' 
% 'Transmition Link from Barrens to Dummy Junction 2'

%Attributes for a specific instances
%'Headflow' for the 'Bear River' instance

%replace them with the new ones in scenario#5

MappingIdsQuery = sprintf(['SELECT "Mapping"."MappingID"\n'... 
'FROM "Mapping"\n'...
'Left JOIN "ScenarioMapping"\n'...
'ON "ScenarioMapping"."MappingID"="Mapping"."MappingID"\n'...
'Left JOIN "Scenarios"\n'...
'ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"\n'...
'Left JOIN "ObjectAttributes"\n'...
'ON "ObjectAttributes"."ObjectAttributeID"= "Mapping"."ObjectAttributeID"\n'...
'Left JOIN "ObjectTypes"\n'... 
'ON "ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"\n'...
'Left JOIN "DataStructures"\n'...
'ON "DataStructures"."DataStructureID"="ObjectTypes"."DataStructureID"\n'...
'Left JOIN  "Attributes"\n'...
'ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"\n'...
'Left JOIN "Instances"\n'...
'ON "Instances"."InstanceID"="Mapping"."InstanceID"\n'...
'WHERE\n'...
'"Scenarios"."ScenarioName"=''BaseCaseLower'' AND(\n'...
'"Instances"."InstanceName"!=''Barrens (20)'' AND\n'...
'"Instances"."InstanceName"!=''Transmition Link from Withdrawal Node 8 to Barrens'' AND\n'...
'"Instances"."InstanceName"!=''Transmition Link from Withdrawal Node 5 to Barrens'' AND\n'...
'"Instances"."InstanceName"!=''Transmition Link from Barrens to Dummy Junction 2'') AND\n'...
'("NativeAttributeName"!= ''Headflow'' OR\n'...
'InstanceName!=''Bear River'')']);

CursMappingIdsQuery = exec(connSQLite,MappingIdsQuery)
CursMappingIdsQuery = fetch(CursMappingIdsQuery);
CursMappingIdsQuery=CursMappingIdsQuery.Data(:,:)


%-- Create a new Mapping Record for the Headflow attribute in the Proposed Scenario for the Bear River instance 
%-- First, get the Mapping ID for the Base Case Scenario of this Headflow record 
%--Second, create a new mapping recored that maps to a new data storage, new method, new source, and the proposed scenario


% Change metadata of sources and methods for scenario 5
% Get the MetadataMapping IDs

% create the ScenarioMapping records for the second scenario
% in this case, we use the identical records between the two scenarios 
% then we add the new records that are different for the second scenario

MappingQuery = sprintf(['SELECT "Mapping".* \n'...
'FROM "Mapping"\n'...
'Left JOIN "ScenarioMapping"\n'...
'ON "ScenarioMapping"."ScenarioMappingID"="Mapping"."MappingID"\n'...
'Left JOIN "Scenarios"\n'...
'ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"\n'...
'Left JOIN "Instances" \n'...
'ON "Instances"."InstanceID"="Mapping"."InstanceID"\n'...
'Left JOIN "ObjectAttributes"\n'...
'ON "ObjectAttributes"."ObjectAttributeID"="Mapping"."ObjectAttributeID"\n'...
'Left JOIN  "ObjectTypes"\n'...
'ON "ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"\n'...
'Left JOIN "DataStructures"\n'...
'ON "DataStructures"."DataStructureID"="ObjectTypes"."DataStructureID"\n'...
'Left JOIN  "Attributes"\n'...
'ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"\n'...
'WHERE "NativeAttributeName"= ''Headflow'' AND\n'... 
'InstanceName=''Bear River'' AND\n'...
'"ScenarioName"=''BaseCaseLower''']);

MappingQuerycurs = exec(connSQLite,MappingQuery)
MappingQuerycurs = fetch(MappingQuerycurs);
MappingQuerycurs=MappingQuerycurs.Data(:,:)% 

% 1)  the StorageIDs
% first, get the last StorageID in the database
Storagesqlquery = sprintf(['SELECT "DataStorageID" \n'...
'FROM "DataStorage" order by "DataStorageID" desc limit 1']);
DataStoragesqlquerycurs = exec(connSQLite,Storagesqlquery)
DataStoragesqlquerycurs = fetch(DataStoragesqlquerycurs);
DataStoragesqlqueryResult=DataStoragesqlquerycurs.Data(:,:)

% Add a new Data Storage ID for the Headflow attribute of the Bear River
% that will have a new time series for Scenario #5
NewDataStorageScena5=num2cell(((cell2mat(DataStoragesqlqueryResult)+1):length(DataStoragesqlqueryResult)+...
    (cell2mat(DataStoragesqlqueryResult)))');

% 2) replace the SourceIDs and MethodIDs
% new source =8 which is "CUAHSI HydroDesktop"
% New Method =6 which coresponds to CUAHSI/derivation

NewSourceIDScena5=num2cell(repmat(8,length(DataStoragesqlqueryResult),1));
NewMethodIDScena5=num2cell(repmat(6,length(DataStoragesqlqueryResult),1));

% Compile the new MappingIDs to use them for the ScenarioMapping table 
NewMappingScena5=[MappingQuerycurs(:,2),MappingQuerycurs(:,3),MappingQuerycurs(:,4),...
NewSourceIDScena5,NewMethodIDScena5,MappingQuerycurs(:,7),NewDataStorageScena5];

         
% Create new Mapping IDs for the addition of the two reservoirs 
% in this case we add a

% Add New ObjectAttributes for the attributes of the two reservoirs 
NewObjectAttributes=reshape((num2cell(repmat(ObjectAttributeID7,1,2)))',[],1);  % two reservoirs 

% Add New AttributeTypeCodeCV for the attributes of the two reservoirs 
NewAttributeTypeCodeCV =[repmat({'T'},[1*2,1]); %Reservoir                    
                     repmat({'P'},[2*2,1]);  %Reservoir                   
                     repmat({'T'},[1*2,1]);  %Reservoir 
                     repmat({'M'},[1*2,1]);  %Reservoir 
                     repmat({'P'},[21*2,1]); %Reservoir                   
                     repmat({'C'},[3*2,1]);  %Reservoir
                     repmat({'D'},[1*2,1])]; %Reservoir     
                
% adding 60 records for adding two new reservoirs 
NewSourceID=num2cell(repmat(11,1,60)');

NewInputOrOutput=cell(length(NewObjectAttributes),1);

NewInstances=num2cell(repmat(XX14+1:XX14+2,1,30)'); % Reservoir #2 above and below Cutler  %%%%%%%%%%%%%%%%%%%%   

% adding 60 records for adding two new reservoirs 
NewMethodID=num2cell(repmat(5,1,60)');

% adding 60 records for adding two new reservoirs 
NewDataStorageID=num2cell(cell2mat(NewDataStorageScena5)+1:cell2mat(NewDataStorageScena5)+60)';                

% Compile the new MappingIDs for the Headflow and the addition of two
% reservoirs 
%Mapping=("ObjectAttributeID", "InstanceID", "InputOrOutput", "SourceID", "MethodID", "AttributeTypeCodeCV", "DataStorageID")
NewMappingScena5AddRes=[NewObjectAttributes,NewInstances,NewInputOrOutput,...
NewSourceID,NewMethodID,NewAttributeTypeCodeCV,NewDataStorageID];

% combine both the new Mappings from the Headflow and add the reservoirs 
NewMappingFinal=[NewMappingScena5;NewMappingScena5AddRes];

% Mapp the new Mapping row for the Headflow plus the new 60 records for the
% Reservoir 
% Include the identical MappingIds from the first query up then add the new
% ones for the scenario#5
NewScenarioID=num2cell(repmat(5,1,length(CursMappingIdsQuery)+length(NewMappingFinal))');

% first, get the last MappingIDs in the database
LastMappingIDquery = sprintf(['SELECT "MappingID" \n'...
'FROM "Mapping" order by "MappingID" desc limit 1']);
LastMappingIDqueryCurs = exec(connSQLite,LastMappingIDquery)
LastMappingIDqueryCurs = fetch(LastMappingIDqueryCurs);
LastMappingIDqueryCursResult=LastMappingIDqueryCurs.Data(:,:)

LastMapping=cell2mat(LastMappingIDqueryCursResult)

NewMappingIdsScenario5=[CursMappingIdsQuery;num2cell(LastMapping+1:LastMapping+length(NewMappingFinal))'];

% Third, we insert the ScenarioMapping row 
NewScenarioMapping=[NewScenarioID,NewMappingIdsScenario5]


% We created a new MappingID row for changing the data values, source, and method of 
% the Headflow attribute of the Bear River for Scenario #4

% Now, we insert this new Mapping row, but first, we need to insert the new
% Data Storage ID
fastinsert(connSQLite,'"DataStorage"',{'"DataStorageID"'},NewMappingFinal(:,7));

% Second, Insert new MetadataMapping row for scenario5
fastinsert(connSQLite,'"Mapping"',{'"ObjectAttributeID"','"InstanceID"','"InputOrOutput"',...
                '"SourceID"','"MethodID"', '"AttributeTypeCodeCV"','"DataStorageID"'},NewMappingFinal);   

fastinsert(connSQLite,'"ScenarioMapping"',{'"ScenarioID"','"MappingID"'},NewScenarioMapping);              
%% Read the 9 Data Storage tables from the Excel Workbook called "04Storage" 
% Read Binary Data 
% find out the coressponding StorageID for the attribute 
% "Maximum Hydraulic Outflow" then Insert the data values Z1: Maximum 0and
% Z2: Maximum Hydraulic Outflow= 1

% Hydraulic Outflow =
 
% Get the Mapping IDs
DataStorageIDQuery = sprintf(['SELECT DataStorageID\n'... 
'--,NativeAttributeName,ObjectAttributes.ObjectAttributeID,InstanceName,ScenarioName\n'... 
'FROM Attributes\n'...  
'LEFT JOIN ObjectAttributes\n'... 
'ON ObjectAttributes.AttributeID= Attributes .AttributeID\n'... 
'LEFT JOIN Mapping\n'... 
'ON Mapping.ObjectAttributeID= ObjectAttributes.ObjectAttributeID\n'... 
'LEFT JOIN Instances\n'... 
'ON Instances.InstanceID= Mapping.InstanceID\n'... 
'LEFT JOIN ScenarioMapping\n'... 
'ON ScenarioMapping.MappingID= Mapping.MappingID\n'... 
'LEFT JOIN Scenarios\n'... 
'ON Scenarios.ScenarioID= ScenarioMapping.ScenarioID\n'... 
'WHERE NativeAttributeName=''Maximum Hydraulic Outflow''\n'... 
'AND InstanceName=''Hyrum (10)'' AND ScenarioName=''BaseCaseLower''']);
%Run the query to the SQLite database 
CursDataStorageIDQuery = exec(connSQLite,DataStorageIDQuery)
% retrive the query construct
CursDataStorageIDQuery = fetch(CursDataStorageIDQuery);
% retrive the query result
CursDataStorageIDQuery=CursDataStorageIDQuery.Data(:,:)

% convert the cell result to number
CursDataStorageIDQuery = cell2mat(CursDataStorageIDQuery)

Binarys=[0,CursDataStorageIDQuery,3;1,CursDataStorageIDQuery,6]
% Read Parameters (numeric)
% clear all; clc

%Read attributes data values 
[num,txt,rawAttributes] = xlsread('04Storage','Dams');

% lDams=length(rawAttributes);
rawAttributes(cellfun(@isempty,rawAttributes))={'null'};% Repalce empy cells with Null value. MYSQL doesnt accept empy cells 

% Parameter 
% Read the attribute names and get their corresponsding AttributeID

DamsParameterValue=num(1:8121,24:31);

DamsParameterValue=num2cell(DamsParameterValue(:));
LdamsPar=length(DamsParameterValue);

DamsDataStorageID=num2cell(1:LdamsPar)';

DamsParameterSubName=cell(LdamsPar,1);

% %% Water Bodies
[num,txt,WaterBodyAtt] = xlsread('04Storage','Waterbodies');
WBParameterValue=WaterBodyAtt(2:length(WaterBodyAtt),21:23);

WBParameterValue=WBParameterValue(:);
LparmWB=length(WBParameterValue);

% Data storage ID continues after the Dams. It starts at 154299+8121+1=162421
DataStorageIDWBPar=num2cell(162421:162420+LparmWB)';

WBParameterSubName=cell(LparmWB,1);

%Read attributes data values 
[num,txt,StreamAtt] = xlsread('04Storage','StreamAtt');
% lDams=length(rawAttributes);
StreamAtt(cellfun(@isempty,StreamAtt))={'null'};% Repalce empy cells with Null value. MYSQL doesnt accept empy cells 
% Parameter 
% Read the attribute names and get their corresponsding AttributeID
StrParameterValue=StreamAtt(2:76976,7);
% [StrmParameterValue,streams.nParameterValue]=size(streams.ParameterValue); % size 
StrParameterValue=StrParameterValue(:);

LparmStr=length(StrParameterValue);

StrDataStorageID=num2cell((1:LparmStr)'+(8121*20+12*26872+65787+76975*1));

StrParameterSubName=cell(LparmStr,1);

ParameterValue=[DamsParameterValue;WBParameterValue;StrParameterValue];
ParameterSubName=[DamsParameterSubName;WBParameterSubName;StrParameterSubName];

ParDataStorageID=[DamsDataStorageID;DataStorageIDWBPar;StrDataStorageID]
% 
% AttributeTypeCodeCV = [repmat({'P'}, [8121*8,1]);repmat({'TF'}, [8121*2,1]);repmat({'TC'}, [8121*9,1]);
%                   repmat({'P'}, [26872*3,1]);repmat({'TC'}, [26872*7,1]); repmat({'TF'}, [26872*1,1]);
%                   cell(65787,1); repmat({'TC'}, [76975*1,1]);repmat({'P'}, [76975*1,1])];

Parameters=[ParameterValue,ParameterSubName,ParDataStorageID]
% Read Seasonal Parameter

%1. Seasonal Parameter
[num,txt,SeasonalParameter] = xlsread('04Storage','SeasonalParameter');
 % avoid the headlines  
SeasonalParameter=SeasonalParameter(3:end,2:end);% avoid the first row


% Get the Stroage ID for the Net Evaporation attributue at Hydrum Resrrvoir
NetEvapStorageID = sprintf(['SELECT DataStorageID\n'... 
'FROM Attributes\n'...  
'LEFT JOIN ObjectAttributes\n'... 
'ON ObjectAttributes.AttributeID= Attributes .AttributeID\n'... 
'LEFT JOIN Mapping\n'... 
'ON Mapping.ObjectAttributeID= ObjectAttributes.ObjectAttributeID\n'... 
'LEFT JOIN Instances\n'... 
'ON Instances.InstanceID= Mapping.InstanceID\n'... 
'LEFT JOIN ScenarioMapping\n'... 
'ON ScenarioMapping.MappingID= Mapping.MappingID\n'... 
'LEFT JOIN Scenarios\n'... 
'ON Scenarios.ScenarioID= ScenarioMapping.ScenarioID\n'... 
'WHERE NativeAttributeName=''Net Evaporation''\n'... 
'AND InstanceName=''Hyrum (10)'' AND ScenarioName=''BaseCaseLower''']);
%Run the query to the SQLite database 
CursNetEvapStorageID = exec(connSQLite,NetEvapStorageID)
% retrive the query construct
CursNetEvapStorageQuery = fetch(CursNetEvapStorageID);
% retrive the query result
CursNetEvapStorageQuery=CursNetEvapStorageQuery.Data(:,:)

% convert the cell result to number
CursNetEvapStorageQuery = cell2mat(CursNetEvapStorageQuery)

NetEvapStorageID=repmat(CursNetEvapStorageQuery, 1, length(SeasonalParameter))'

SeasonalParameter(:,5)=num2cell(NetEvapStorageID)
% Read Text Free

% Dams 
Dams.TextDescriptorFreeData=rawAttributes(2:8122,4:5);
DamsTextDescriptorFreeData=Dams.TextDescriptorFreeData(:);
DamsDataStorageIDTF=num2cell((1:8121*2)+8121*8)';

% Water Bodies 
WBTextDescriptorFree=WaterBodyAtt(2:length(WaterBodyAtt),24);
STFree=num2cell((1:26872)+8121*20+26872*10)';

% Combine them 
TextDescriptorFree=[DamsTextDescriptorFreeData;WBTextDescriptorFree];
DataStorageIDFreeT=[DamsDataStorageIDTF;STFree];

% AttributeTypeCodeCV = [repmat({'P'}, [8121*8,1]);repmat({'TF'}, [8121*2,1]);repmat({'TC'}, [8121*9,1]);
%                   repmat({'P'}, [26872*3,1]);repmat({'TC'}, [26872*7,1]); repmat({'TF'}, [26872*1,1]);
%                   cell(65787,1); repmat({'TC'}, [76975*1,1]);repmat({'P'}, [76975*1,1])];

TextDescriptorFree = cellfun(@num2str, TextDescriptorFree, 'UniformOutput', false);

TextFree=[TextDescriptorFree,DataStorageIDFreeT];
% Read Text Controlled
% Dams 

% Reservoir Purpose 

%Read attributes data values 
[num,txt,rawAttributes] = xlsread('04Storage','Dams');

% Dam with FID 4685 has a "G" dam purpuse which is not defined in the
% system. So I just converted it to "Unknown"

% Read the purpose CV data values 
CV=ControlledTextValues%

Value=ControlledTextValues(:,1);

% Find the CV values that correspond to the attribute name "Dam Purposes"
DamPurposeID = find(strcmpi(CV(:,2),'Dam Purposes')) 
DamPurposeValues=Value(DamPurposeID)
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

% Purpose # 1
Dams.Purpose1=rawAttributes(2:8122,20);

% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,Dams.Purpose1);


ind=find(ismember(Dams.Purpose1,' '));
Dams.Purpose1(ind)={'Unknown'};

% get the IDs of dam purpose from the cont. vocab.
indices = cell(size(Dams.Purpose1));% define the "indices" size

for i = 1:numel(Dams.Purpose1);
    indices{i} = find(strcmpi(DamPurposeValues,Dams.Purpose1(i)))+ DamPurposeID(1)-1;
end

%remove empty cell array contents
DamsX1(:,1)=find(~cellfun('isempty',Dams.Purpose1));
DamsX1(:,2)=cell2mat(indices);


% Purpose # 2
Dams.Purpose2=rawAttributes(2:8122,21);
indices2 = cell(size(Dams.Purpose2));
for i = 1:numel(Dams.Purpose2);
    indices2{i} = find(strcmpi(DamPurposeValues,Dams.Purpose2(i)))+DamPurposeID(1)-1;
end
DamsX2(:,1)=find(~cellfun('isempty',Dams.Purpose2));
DamsX2(:,2)=cell2mat(indices2);

% Purpose # 3
Dams.Purpose3=rawAttributes(2:8122,22);
indices3 = cell(size(Dams.Purpose3));
for i = 1:numel(Dams.Purpose3)
    indices3{i} = find(strcmpi(DamPurposeValues,Dams.Purpose3(i)))+DamPurposeID(1)-1;
end
DamsX3(:,1)=find(~cellfun('isempty',Dams.Purpose3));
DamsX3(:,2)=cell2mat(indices3);


% Purpose # 4
Dams.Purpose4=rawAttributes(2:8122,23);
indices4 = cell(size(Dams.Purpose4));
for i = 1:numel(Dams.Purpose4);
    indices4{i} = find(strcmpi(DamPurposeValues,Dams.Purpose4(i)))+DamPurposeID(1)-1;
end
DamsX4(:,1)=find(~cellfun('isempty',Dams.Purpose4));
DamsX4(:,2)=cell2mat(indices4);

% Purpose # 5
Dams.Purpose5=rawAttributes(2:8122,24);
indices5 = cell(size(Dams.Purpose5));
for i = 1:numel(Dams.Purpose5);
    indices5{i} = find(strcmpi(DamPurposeValues,Dams.Purpose5(i)))+DamPurposeID(1)-1;
end
DamsX5(:,1)=find(~cellfun('isempty',Dams.Purpose5));
DamsX5(:,2)=cell2mat(indices5);

% Purpose # 6
Dams.Purpose6=rawAttributes(2:8122,25);
indices6 = cell(size(Dams.Purpose6));
for i = 1:numel(Dams.Purpose6);
    indices6{i} = find(strcmpi(DamPurposeValues,Dams.Purpose6(i)))+DamPurposeID(1)-1;
end
DamsX6(:,1)=find(~cellfun('isempty',Dams.Purpose6));
DamsX6(:,2)=cell2mat(indices6);

% Purpose # 7
Dams.Purpose7=rawAttributes(2:8122,26);
indices7 = cell(size(Dams.Purpose7));
for i = 1:numel(Dams.Purpose7);
    indices7{i} = find(strcmpi(DamPurposeValues,Dams.Purpose7(i)))+DamPurposeID(1)-1;
end

DamsX7(:,1)=find(~cellfun('isempty',Dams.Purpose7));
DamsX7(:,2)=cell2mat(indices7);

TextDescriptorControlledDataPurpose=[DamsX1;DamsX2;DamsX3;DamsX4;DamsX5;DamsX6]

% Dams.DataStorageID3=length(Dams.DataStorageID1)+length(Dams.DataStorageID2);

TextDescriptorControlledDataPurpose(:,1)=TextDescriptorControlledDataPurpose(:,1)+8121*10;
TextDescriptorControlledDataPurpose(:,2)=TextDescriptorControlledDataPurpose(:,2)


%Read attributes data values 

% Find the CV values that correspond to the attribute name "Dam Type"
DamTypeID = find(strcmpi(CV(:,2),'Dam Type'));
DamTypeValues=Value(DamTypeID(1:length(DamTypeID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Dams.DamTypes1=rawAttributes(2:8122,16);
emptyCells = cellfun(@isempty,Dams.DamTypes1); 
ind=find(ismember(Dams.DamTypes1,' '));
Dams.DamTypes1(ind)={'unknown'};

% Dam with FID 1645 has a "rc" dam type which is not defined in the
% system. So I just converted it to "Unknown"

indicesDamType = cell(size(Dams.DamTypes1));

for i = 1:numel(Dams.DamTypes1);
    indicesDamType{i} = find(strcmpi(DamTypeValues,Dams.DamTypes1(i)))+DamTypeID(1)-1;
 end

DamTypesX1(:,1)=find(~cellfun('isempty',Dams.DamTypes1));
DamTypesX1(:,2)=cell2mat(indicesDamType);


% Dam Type # 2
Dams.DamTypes2=rawAttributes(2:8122,17);
indicesDamType2 = cell(size(Dams.DamTypes2));
for i = 1:numel(Dams.DamTypes2);
    indicesDamType2{i} = find(strcmpi(DamTypeValues,Dams.DamTypes2(i)))+DamTypeID(1)-1;
end
DamTypesX2(:,1)=find(~cellfun('isempty',Dams.DamTypes2));
DamTypesX2(:,2)=cell2mat(indicesDamType2);

% Dam Type # 3
Dams.DamTypes3=rawAttributes(2:8122,18);
indicesDamType3 = cell(size(Dams.DamTypes3));
for i = 1:numel(Dams.DamTypes3)
    indicesDamType3{i} = find(strcmpi(DamTypeValues,Dams.DamTypes3(i)))+DamTypeID(1)-1;
end
DamTypesX3(:,1)=find(~cellfun('isempty',Dams.DamTypes3));
DamTypesX3(:,2)=cell2mat(indicesDamType3);


% 
TextDescriptorControlledDataDamTypes=[DamTypesX1;DamTypesX2;DamTypesX3]

TextDescriptorControlledDataDamTypes(:,1)=TextDescriptorControlledDataDamTypes(:,1)+8121*11
TextDescriptorControlledDataDamTypes(:,2)=TextDescriptorControlledDataDamTypes(:,2)
% %%%%%%%%%%%%%%%%%%%%%%%%
 
% County + River + City

% Find the CV values that correspond to the attribute name "Dam Purposes"
CountyID = find(strcmpi(CV(:,2),'County'));
CountyValues=Value(CountyID(1:length(CountyID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Dams.County=rawAttributes(2:8122,8);
emptyCells = cellfun(@isempty,Dams.County); 
ind=find(ismember(Dams.County,' '));
Dams.County(ind)={'unknown'};

indicesCounty= cell(size(Dams.County));

for i = 1:numel(Dams.County);
    indicesCounty{i} = find(strcmpi(CountyValues,Dams.County(i)))+CountyID(1)-1;
end

County(:,1)=find(~cellfun('isempty',Dams.County))+8121*12;
County(:,2)=cell2mat(indicesCounty);


% River 

% Find the CV values that correspond to the attribute name "Dam Purposes"
RiverID = find(strcmpi(CV(:,2),'River'));
RiverValues=Value(RiverID(1:length(RiverID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Dams.River=rawAttributes(2:8122,9);
emptyCells = cellfun(@isempty,Dams.River); 
ind=find(ismember(Dams.River,' '));
Dams.River(ind)={'unknown'};

indicesRiver= cell(size(Dams.River));

for i = 1:numel(Dams.River);
    indicesRiver{i} = find(strcmpi(RiverValues,Dams.River(i)))++RiverID(1)-1;
end

% Dams.DataStorageID6=length(Dams.DataStorageID1)+length(Dams.DataStorageID2)+length(Dams.DataStorageID3)+length(Dams.DataStorageID4)+length(Dams.DataStorageID5)+(1:8121)';

% 
River(:,1)=find(~cellfun('isempty',Dams.River))+8121*13;
River(:,2)=cell2mat(indicesRiver);



% %%%%%%%%%%%%%%%%%%%%%%%%%%%

% City 

% Find the CV values that correspond to the attribute name "Dam Purposes"
CityID = find(strcmpi(CV(:,2),'City'));
CityValues=Value(CityID(1:length(CityID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Dams.City=rawAttributes(2:8122,10);
emptyCells = cellfun(@isempty,Dams.City); 
ind=find(ismember(Dams.City,' '));
Dams.City(ind)={'unknown'};

indicesCity= cell(size(Dams.City));

for i = 1:numel(Dams.City);
    indicesCity{i} = find(strcmpi(CityValues,Dams.City(i)))+CityID(1)-1;
end

City(:,1)=find(~cellfun('isempty',Dams.City))+8121*14;
City(:,2)=cell2mat(indicesCity);

% %%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%

% Owner Type 

% Find the CV values that correspond to the attribute name "Dam Purposes"
OwnerTypeID = find(strcmpi(CV(:,2),'Dam owner type'));
OwnerTypeValues=Value(OwnerTypeID(1:length(OwnerTypeID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Dams.OwnerType=rawAttributes(2:8122,11);
emptyCells = cellfun(@isempty,Dams.OwnerType);

ind=find(ismember(Dams.OwnerType,' '));

Dams.OwnerType(ind)={'unknown'};

iscellstr(Dams.OwnerType)
x=cellfun(@ischar,Dams.OwnerType)

indicesOwnerType= cell(size(Dams.OwnerType));

for i = 1:numel(Dams.OwnerType);
    indicesOwnerType{i} = find(strcmpi(OwnerTypeValues,Dams.OwnerType(i)))+OwnerTypeID(1)-1;
end


OwnerType(:,1)=find(~cellfun('isempty',Dams.OwnerType))+8121*15;
OwnerType(:,2)=cell2mat(indicesOwnerType);


% %%%%%%%%

% Hazard

% Find the CV values that correspond to the attribute name "Dam Purposes"
HazardID = find(strcmpi(CV(:,2),'Dam Hazard'));
HazardValues=Value(HazardID(1:length(HazardID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Dams.Hazard=rawAttributes(2:8122,12);
emptyCells = cellfun(@isempty,Dams.Hazard);

ind=find(ismember(Dams.Hazard,' '));

Dams.OwnerType(ind)={'unknown'};

iscellstr(Dams.Hazard)
x=cellfun(@ischar,Dams.Hazard)

indicesHazard= cell(size(Dams.Hazard));

for i = 1:numel(Dams.Hazard);
    indicesHazard{i} = find(strcmpi(HazardValues,Dams.Hazard(i)))+HazardID(1)-1;
end

Hazard(:,1)=find(~cellfun('isempty',Dams.Hazard))+8121*16;
Hazard(:,2)=cell2mat(indicesHazard);


% %%%%%%%%

% State

% Find the CV values that correspond to the attribute name "Dam Purposes"
StatesID = find(strcmpi(CV(:,2),'US States, FIPS Code'));
StatesValues=Value(StatesID(1:length(StatesID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Dams.States=rawAttributes(2:8122,13);
emptyCells = cellfun(@isempty,Dams.States);

ind=find(ismember(Dams.States,' '));

Dams.States(ind)={'unknown'};

iscellstr(Dams.States)
x=cellfun(@ischar,Dams.States)

indicesStates= cell(size(Dams.States));

for i = 1:numel(Dams.States);
    indicesStates{i} = find(strcmpi(StatesValues,Dams.States(i)))+StatesID(1)-1;
end

DamsStates(:,1)=find(~cellfun('isempty',Dams.States))+8121*17;
DamsStates(:,2)=cell2mat(indicesStates);


% %%%%%%%%

% MainPurpose

% Find the CV values that correspond to the attribute name "Dam Purposes"
MainPurposeID = find(strcmpi(CV(:,2),'Dam Purposes'));
MainPurposeValues=Value(MainPurposeID(1:length(MainPurposeID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Dams.MainPurpose=rawAttributes(2:8122,14);
emptyCells = cellfun(@isempty,Dams.MainPurpose);

ind=find(ismember(Dams.MainPurpose,' '));

Dams.MainPurpose(ind)={'unknown'};

iscellstr(Dams.MainPurpose)
x=cellfun(@ischar,Dams.MainPurpose)

indicesMainPurpose= cell(size(Dams.MainPurpose));

for i = 1:numel(Dams.MainPurpose);
    indicesMainPurpose{i} = find(strcmpi(MainPurposeValues,Dams.MainPurpose(i)))+MainPurposeID(1)-1;
end



MainPurpose(:,1)=find(~cellfun('isempty',Dams.MainPurpose))+8121*18;% Data StorageIDs
MainPurpose(:,2)=cell2mat(indicesMainPurpose);



% %%%%%%%%



DamsTextDescriptorControlledData=num2cell([TextDescriptorControlledDataPurpose; TextDescriptorControlledDataDamTypes;
County;River;City;OwnerType;Hazard;DamsStates;MainPurpose]);


% ___++++++++++++++++++++++++++++++++ Water Bodies 


[num,txt,WaterBodyAtt] = xlsread('04Storage','Waterbodies');


% F_Code. This is a dublicate with the Feature attribute. So I'm not
% condifering it here 

% State_FIPS. This is a dublicate with the State attribute. So I'm not
% condifering it here 

% Region

% Find the CV values that correspond to the attribute name "Region"
RegionID = find(strcmpi(CV(:,2),'Hydrologic Region, US')); % subtract 1 to account for the title 
RegionValues=Value(RegionID(1:length(RegionID),1))
RegionValues = cellfun(@num2str, RegionValues, 'UniformOutput', false)
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 
Region1=WaterBodyAtt(2:length(WaterBodyAtt),7);
Region1 = cellfun(@num2str, Region1, 'UniformOutput', false)
% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,Region1); 
ind=find(ismember(Region1,' '));
Region1(ind)={'Unknown'};
% get the IDs of Region from the cont. vocab.
indicesR = cell(size(Region1));% define the "indices" size
for i = 1:numel(Region1);
    indicesR{i} = find(strcmpi(RegionValues,Region1(i)))+RegionID(1)-1;
end

Region(:,1)=find(~cellfun('isempty',Region1))+8121*20+26872*3;
Region(:,2)=cell2mat(indicesR);

% GM_hyc
% Find the CV values that correspond to the attribute name "GM_hyc"
GM_hycID = find(strcmpi(CV(:,2),'Global Map Hydrological category')); % subtract 1 to account for the title 
GM_hycValues=Value(GM_hycID(1:length(GM_hycID),1))
GM_hycValues = cellfun(@num2str, GM_hycValues, 'UniformOutput', false)
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 
GM_hyc1=WaterBodyAtt(2:length(WaterBodyAtt),8);
GM_hyc1 = cellfun(@num2str, GM_hyc1, 'UniformOutput', false)
% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,GM_hyc1); 
ind=find(ismember(GM_hyc1,' '));
GM_hyc1(ind)={'Unknown'};
% get the IDs of GM_hyc from the cont. vocab.
indicesG = cell(size(GM_hyc1));% define the "indices" size
for i = 1:numel(GM_hyc1);
    indicesG{i} = find(strcmpi(GM_hycValues,GM_hyc1(i)))+GM_hycID(1)-1;
end
GM_hyc(:,1)=find(~cellfun('isempty',GM_hyc1))+8121*20+26872*4;
GM_hyc(:,2)=cell2mat(indicesG);



% GM_hyt
% Find the CV values that correspond to the attribute name "GM_hyt"
GM_hytID = find(strcmpi(CV(:,2),'Global Map Hydrological type')); % subtract 1 to account for the title 
GM_hytValues=Value(GM_hytID(1:length(GM_hytID),1))
GM_hytValues = cellfun(@num2str, GM_hytValues, 'UniformOutput', false)
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 
GM_hyt1=WaterBodyAtt(2:length(WaterBodyAtt),9);
GM_hyt1 = cellfun(@num2str, GM_hyt1, 'UniformOutput', false)
% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,GM_hyt1); 
ind=find(ismember(GM_hyt1,' '));
GM_hyt1(ind)={'Unknown'};
% get the IDs of GM_hyt from the cont. vocab.
indicesGM = cell(size(GM_hyt1));% define the "indices" size
for i = 1:numel(GM_hyt1);
    indicesGM{i} = find(strcmpi(GM_hytValues,GM_hyt1(i)))+GM_hytID(1)-1;
end
GM_hyt(:,1)=find(~cellfun('isempty',GM_hyt1))+8121*20+26872*5;
GM_hyt(:,2)=cell2mat(indicesGM);


% State1
% Find the CV values that correspond to the attribute name "State"
StateID = find(strcmpi(CV(:,2),'US States, FIPS Code')); % subtract 1 to account for the title 
StateValues=Value(StateID(1:length(StateID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 
State1=WaterBodyAtt(2:length(WaterBodyAtt),11);
% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,State1); 
ind=find(ismember(State1,' '));
State1(ind)={'Unknown'};
% get the IDs of GM_hyt from the cont. vocab.
indicesS1 = cell(size(State1));% define the "indices" size
for i = 1:numel(State1);
    indicesS1{i} = find(strcmpi(StateValues,State1(i)))+StateID(1)-1;
end
X6(:,1)=find(~cellfun('isempty',State1));
X6(:,2)=cell2mat(indicesS1);

% State2
State2=WaterBodyAtt(2:length(WaterBodyAtt),12);
% get the IDs of state from the cont. vocab.
indicesS2 = cell(size(State2));% define the "indices" size
for i = 1:numel(State2);
    indicesS2{i} = find(strcmpi(StateValues,State2(i)))+StateID(1)-1;
end
X7(:,1)=find(~cellfun('isempty',State2));
X7(:,2)=cell2mat(indicesS2);


% State3
State3=WaterBodyAtt(2:length(WaterBodyAtt),13);
% get the IDs of GM_hyt from the cont. vocab.
indicesS3 = cell(size(State3));% define the "indices" size
for i = 1:numel(State3);
    indicesS3{i} = find(strcmpi(StateValues,State3(i)))+StateID(1)-1;
end
X8(:,1)=find(~cellfun('isempty',State3));
X8(:,2)=cell2mat(indicesS3);


% State4
State4=WaterBodyAtt(2:length(WaterBodyAtt),14);
% get the IDs of GM_hyt from the cont. vocab.
indicesS4 = cell(size(State4));% define the "indices" size
for i = 1:numel(State4);
    indicesS4{i} = find(strcmpi(StateValues,State4(i)))+StateID(1)-1;
end
X9(:,1)=find(~cellfun('isempty',State4));
X9(:,2)=cell2mat(indicesS4);


% State5
State5=WaterBodyAtt(2:length(WaterBodyAtt),15);% get the IDs of GM_hyt from the cont. vocab.
indicesS5 = cell(size(State5));% define the "indices" size
for i = 1:numel(State5);
    indicesS5{i} = find(strcmpi(StateValues,State5(i)))+StateID(1)-1;
end
X10(:,1)=find(~cellfun('isempty',State5));
X10(:,2)=cell2mat(indicesS5);


% State6
State6=WaterBodyAtt(2:length(WaterBodyAtt),16);% get the IDs of GM_hyt from the cont. vocab.
indicesS6 = cell(size(State6));% define the "indices" size
for i = 1:numel(State6);
    indicesS6{i} = find(strcmpi(StateValues,State6(i)))+StateID(1)-1;
end
X11(:,1)=find(~cellfun('isempty',State6));
X11(:,2)=cell2mat(indicesS6);


% State7
State7=WaterBodyAtt(2:length(WaterBodyAtt),17);
% get the IDs of GM_hyt from the cont. vocab.
indicesS7 = cell(size(State7));% define the "indices" size
for i = 1:numel(State7);
    indicesS7{i} = find(strcmpi(StateValues,State7(i)))+StateID(1)-1;
end
X12(:,1)=find(~cellfun('isempty',State7));
X12(:,2)=cell2mat(indicesS7)

States=[X6;X7;X8;X9;X10;X11;X12]
StatesFinal(:,1)=States(:,1)+8121*20+26872*6;
StatesFinal(:,2)=States(:,2);

% GM_f_code
% Find the CV values that correspond to the attribute name "State"
GM_f_codeID = find(strcmpi(CV(:,2),'The Global Map FACC feature code')); % subtract 1 to account for the title 
GM_f_codeValues=Value(GM_f_codeID(1:length(GM_f_codeID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 
GM_f_code1=WaterBodyAtt(2:length(WaterBodyAtt),18);
% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,GM_f_code1); 
ind=find(ismember(GM_f_code1,' '));
GM_f_code1(ind)={'Unknown'};
% get the IDs of GM_hyt from the cont. vocab.
indices = cell(size(GM_f_code1));% define the "indices" size
for i = 1:numel(GM_f_code1);
    indices{i} = find(strcmpi(GM_f_codeValues,GM_f_code1(i)))+GM_f_codeID(1)-1;
end
GM_f_code(:,1)=find(~cellfun('isempty',GM_f_code1))+8121*20+26872*7;
GM_f_code(:,2)=cell2mat(indices);



% Feature
% Find the CV values that correspond to the attribute name "Feature"
WBFeatureID = find(strcmpi(CV(:,2),'Feature')); % subtract 1 to account for the title 
WBFeatureValues=Value(WBFeatureID(1:length(WBFeatureID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 
WBFeature=WaterBodyAtt(2:length(WaterBodyAtt),19);
% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,WBFeature); 
ind=find(ismember(WBFeature,' '));
WBFeature(ind)={'Unknown'};
% get the IDs of GM_hyt from the cont. vocab.
indices = cell(size(WBFeature));% define the "indices" size
for i = 1:numel(WBFeature);
    indices{i} = find(strcmpi(WBFeatureValues,WBFeature(i)))+WBFeatureID(1)-1;
end
Feature(:,1)=find(~cellfun('isempty',WBFeature))+8121*20+26872*8;
Feature(:,2)=cell2mat(indices);


% GM_soc
% Find the CV values that correspond to the attribute name "GM_soc"
GM_socID = find(strcmpi(CV(:,2),'Country')); % subtract 1 to account for the title 
GM_socValues=Value(GM_socID(1:length(GM_socID),1))
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 
GM_soc1=WaterBodyAtt(2:length(WaterBodyAtt),20);
% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,GM_soc1); 
ind=find(ismember(GM_soc1,' '));
GM_soc1(ind)={'Unknown'};
% get the IDs of GM_soc from the cont. vocab.
indices = cell(size(GM_soc1));% define the "indices" size
for i = 1:numel(GM_soc1);
    indices{i} = find(strcmpi(GM_socValues,GM_soc1(i)))+GM_socID(1)-1;
end
GM_soc(:,1)=find(~cellfun('isempty',GM_soc1))+8121*20+26872*9;
GM_soc(:,2)=cell2mat(indices);


% %%%%%%%%%%%%%% collecting all of them here 
WBTextValueControlledValues=num2cell([Region;GM_hyc;GM_hyt;StatesFinal;GM_f_code;Feature;GM_soc]);


% +++++++++++++++++++++++++++++++++++++++++++++++++
% Streams 
[num,txt,StreamAtt] = xlsread('04Storage','StreamAtt');
StreamAtt(cellfun(@isempty,StreamAtt))={'null'};% Repalce empy cells with Null value. MYSQL doesnt accept empy cells 

% Feature
% Find the CV values that correspond to the attribute name "Feature1"
FeatureID = find(strcmpi(CV(:,2),'Stream Feature')); % subtract 1 to account for the title 
FeatureValues=Value(FeatureID(1:length(FeatureID),1))
FeatureValues = cellfun(@num2str, FeatureValues, 'UniformOutput', false)
% Then use the CV values and their IDs to generate foreigh keys that correspond
% to the input data source 

Feature2=StreamAtt(2:length(StreamAtt),8);
Feature2 = cellfun(@num2str, Feature2, 'UniformOutput', false)
% First, replace empty cells with "Unknown"
emptyCells = cellfun(@isempty,Feature2); 
ind=find(ismember(Feature2,' '));
Feature2(ind)={'Unknown'};

% get the IDs of Feature1 from the cont. vocab.
indicesG = cell(size(Feature2));% define the "indices" size
for i = 1:numel(Feature2);
    indicesG{i} = find(strcmpi(FeatureValues,Feature2(i)))+FeatureID(1)-1;
end
StrX4(:,1)=find(~cellfun('isempty',Feature2))+8121*20+26872*12+65787*1;
StrX4(:,2)=cell2mat(indicesG);
StrX4=num2cell(StrX4);

StrTextDescriptorControlledData=[StrX4(:,1),StrX4(:,2)];

TextControlled=[DamsTextDescriptorControlledData;WBTextValueControlledValues;StrTextDescriptorControlledData];
% switch the columns to match the requirements of the Table. This reqiourent changed after I already created this parameter
TextControlledNew=[TextControlled(:,2),TextControlled(:,1)];
% Read Time Series Data 
% WEAP DATA 

% CUAUSI time sereis   
[num,txt,TimeSeriesCUAHSI] = xlsread('04Storage','TimeSeries');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
TimeSeriesCUAHSI=TimeSeriesCUAHSI(3:end,2:end);

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(TimeSeriesCUAHSI)
  if isnan(TimeSeriesCUAHSI{k})
    TimeSeriesCUAHSI{k} = [];
  end
end
TimeSeriesCUAHSI(:,2) = cellfun(@num2str, TimeSeriesCUAHSI(:,2), 'UniformOutput', false);


% CUAUSI time sereis DATA
[num,txt,TimeSeriesValues] = xlsread('04Storage','TimeSeriesValues');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
TimeSeriesValues=TimeSeriesValues(3:end,2:end);

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(TimeSeriesValues)
  if isnan(TimeSeriesValues{k})
    TimeSeriesValues{k} = [];
  end
end

% Add description to "Discharge, cubic feet per second", attribute, "Logan River
% Above State Dam, Near Logan,UT" site
%add it below HERE 

%ValueType: Derived => this one goes to methods 
% These are not supported in supported in WaM-DaM:
% quality controll and censor code
% Qualifiers
% Offsets
% value accurecy

% SampleMedium goes to the description field in the TimeSeries table
% Read Multi-Columns

% WEAP multi-columns
[num,txt,MultiColumnArray] = xlsread('04Storage','MultiColumnArray');
MultiColumnArray=MultiColumnArray(3:end,2:3) %avoid header and first column

% Values 
[num,txt,MultiColumnValues] = xlsread('04Storage','MultiColumnValues');
MultiColumnValues=MultiColumnValues(3:end,2:4) %avoid header and first column
% Read Rules 

%Loss to groundwater@HyrumReservoir=0.0001*StorageCapacity+0.00001*SurfaceWaterHeadflow*60.37  
%Multiply by 60.37 to convert from CFS to AF/month

[num,txt,RulesData] = xlsread('04Storage','Rules');
% avoid the two title rows and first column which will be automatically
% generated while loading to the database
Rules=RulesData(3:7,2:6) %% Read FileBased 
[num,txt,FileBased] = xlsread('04Storage','FileBased');
FileBased=FileBased(3:end,2:end);% avoid the first row
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Connect to SQLite Database  

% We provide instructions on how to set up a SQLite database and connect it
% with Matlab here @ https://goo.gl/zPwlPX
% Here is the Matlab reference on how to connect Matlab with SQLite @  
% http://www.mathworks.com/help/database/ug/sqlite-jdbc-windows.html

% The template command:
% conn = database(dbpath,username,pwd,'org.sqlite.JDBC','URL');
connSQLite = database('C:\SQLite\WaMDaM.sqlite','','','org.sqlite.JDBC','jdbc:sqlite:C:\SQLite\WaMDaM.sqlite')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Load Controlled Vocabulary
% Steps
% load all the independent tables (Controlled vocabulary tables + Metadata tables)
% Avoid excuting the same line more than one time, otherwise, it would
% double loading the data table to the database 

% The general template to load data to SQLite is:
% fastinsert(conntionName,'"Table_Name_in_SQLite_Database"',{'"Field#1_Name_In_SQLiteDatabase_Table"',...
%          '"Field#2_Name_In_SQLiteDatabase_Table"'},CellArrayName);
% tables names and their fields must match the exact names in the database

%1. DataStructureDomain
fastinsert(connSQLite,'"DataStructureDomain"',{'"Term"',...
          '"Definition"'},DataStructureDomain);
      
%2. CommonObjectCategory      
 fastinsert(connSQLite,'"CommonObjectCategory"',{'"CommonObjectCategoryName"','"CommonCategoryDefinition"',...
          '"ParentCommonObjectCategoryID"'},CommonObjectCategory); 
            
%3. CommonObjectTypes      
fastinsert(connSQLite,'"CommonObjectTypes"',{'"CommonObjectType"','"CommonObjectTopology"',...
          '"CommonObjectDefinition"','"CommonObjectCategoryID"'},CommonObjectTypes); 
      
%4. CommonAttributeCategory
fastinsert(connSQLite,'"CommonAttributeCategory"',{'"CommonAttributeCategoryName"','"CommonCategoryDefinition"',...
          '"ParentCommonAttributeCategoryID"'},CommonAttributeCategory); 
  
%5. CommonAttributes
fastinsert(connSQLite,'"CommonAttributes"',{'"CommonAttributeName"',...
          '"CommonAttributeDefinition"',...
          '"CommonAttributeCategoryID"'},CommonAttributes);

%6. OrganizationType
fastinsert(connSQLite,'"OrganizationType"',{'"Term"',...
          '"Definition"'},OrganizationType);
    
%7. MethodType
fastinsert(connSQLite,'"MethodType"',{'"Term"',...
          '"Definition"'},MethodType);      
      
%8. VerticalDatum
fastinsert(connSQLite,'"VerticalDatum"',{'"Term"',...
          '"Definition"'},VerticalDatum);      
      
%9. AttributeTypeCode
fastinsert(connSQLite,'"AttributeTypeCode"',{'"Term"',...
          '"Definition"'},AttributeTypeCode); 
      
%10. AggregationStatistic
fastinsert(connSQLite,'"AggregationStatistic"',{'"Term"',...
          '"Definition"'},AggregationStatistic);      
    
%11. InstanceStatus
fastinsert(connSQLite,'"InstanceStatus"',{'"Term"',...
          '"Definition"'},InstanceStatus);        
  
%12. SeasonName
fastinsert(connSQLite,'"SeasonName"',{'"Term"',...
          '"Definition"'},SeasonName);  
      
%13. Symbols
fastinsert(connSQLite,'"Symbols"',{'"Term"',...
          '"Definition"'},Symbols);  
      
%14. TextControlledValues
fastinsert(connSQLite,'"TextControlledValues"',{'"TextControlledValue"',...
          '"TextControlledAttribute"','"ValueDefinition"'},ControlledTextValues);        
      
%15. Units
fastinsert(connSQLite,'"Units"',{'"UnitType"','"UnitName"',...
          '"UnitSystem"', '"UnitAbbreviation"'},Units);
  
%16. SpatialReference      
fastinsert(connSQLite,'"SpatialReference"',{'"SRSID"','"SRSName"',...
          '"IsGeographic"','"Notes"'},SpatialReference);    
      
%17. BinaryValueMeaning      
fastinsert(connSQLite,'"BinaryValueMeaning"',{'"BinaryValue"','"ValueDefinition"',...
          '"BinaryAttribute"'},BinaryValueMeaning);    
      
%18. FileFormat      
fastinsert(connSQLite,'"FileFormat"',{'"Term"','"Definition"',...
          '"BinaryAttribute"'},FileFormat);    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
%% Load metadata    
% NativeObjectCategory      
fastinsert(connSQLite,'"NativeObjectCategory"',{'"NativeObjectCategoryName"',...
            '"NativeObjectCategoryDefinition"','"NativeObjectCategoryGroup"',...
            '"ParentNativeObjectCategoryID"'},NativeObjectCategory); 
    
% NativeAttributeCategory      
fastinsert(connSQLite,'"NativeAttributeCategory"',{'"NativeAttributeCategoryName"',...
            '"NativeAttributeCategoryDefinition"','"NativeAttributeCategoryGroup"',...
            '"ParentNativeAttributeCategoryID"'},NativeAttributeCategory);         

% Organizations       
fastinsert(connSQLite,'"Organizations"',{'"OrganizationName"','"OrganizationTypeCV"',...
          '"Webpage"','"OrganizationDescription"','"ParentOrganizationID"'},Organizations);   

% People   
fastinsert(connSQLite,'"People"',{'"ContactName"',...
          '"Address"','"Email"','"Webpage"','"Phone"','"Position"','"OrganizationID"'},People);      

% Models   
 fastinsert(connSQLite,'"Models"',{'"ModelName"','"ModelWebpage"',...
           '"ModelInstanceName"','"ModelDateCreated"','"Description"','"TimeStep"',...
           '"TimeStepUnit"','"ModelStartDateTime"','"ModelEndDateTime"'},Models);    
      
% Methods   
fastinsert(connSQLite,'"Methods"',{'"MethodName"','"MethodWebpage"',...
          '"MethodDescription"','"MethodTypeCV"','"PersonID"','"ModelID"','"ParentMethodID"'},Methods);

% Sources    
fastinsert(connSQLite,'"Sources"',{'"SourceName"','"SourceWebpage"',...
          '"SourceDescription"','"Citation"','"PersonID"','"ParentSourceID"'},Sources); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load Core tables          

% 1. DataStructures
fastinsert(connSQLite,'"DataStructures"',{'"DataStructureName"', '"DataStructureDomainCV"', '"DataStructureWebpage"',...
        '"DataStructureDescription"'},DataStructures);

% 1. Object Types
fastinsert(connSQLite,'"ObjectTypes"',{'"NativeObjectName"','"ObjectCode"','"ObjectTopology"',...
    '"MapColor"', '"MapSymbol"' , '"Description"', '"DataStructureID"',...
    '"NativeObjectCategoryID"', '"CommonObjectTypeID"'},ObjectTypes);

% 2. Attributes

fastinsert(connSQLite,'"Attributes"',{'"NativeAttributeName"','"UnitID"',...
          '"AttributeDescription"', '"CommonAttributeID"'},Attributes);

% 3. Object Attributes
fastinsert(connSQLite,'"ObjectAttributes"',{'"ObjectTypeID"','"AttributeID"',...
          '"AttributeCode"','"NativeAttributeCategoryID"'},ObjectAttributes);

% 4. Master Networks 
fastinsert(connSQLite,'"MasterNetworks"',{'"MasterNetworkName"','"SpatialReferenceID"',...
          '"VerticalDatumCV"','"RelatedMasterNetwork"','"Description"'},MasterNetworks);
      
% 5. Scenarios 
fastinsert(connSQLite,'"Scenarios"',{'"ScenarioName"','"Description"',...
          '"MasterNetworkID"'},Scenarios);
      
% load instances
%Instances
fastinsert(connSQLite,'"Instances"',{'"InstanceName"','"InstanceCode"','"StatusCV"',...
          '"Longitude"','"Latitude"','"Description"',...
          '"RelatedInstanceID"'},Instances);

% Because the Connections Table depends on
% the Instances Table, we loaded the Connections Table after the instances table  
% Connections 
fastinsert(connSQLite,'"Connections"',{'"LinkInstanceID"','"StartNodeInstanceID"','"EndNodeInstanceID"'},Connections)      

% Vertices 
fastinsert(connSQLite,'"Vertices"',{'"ConnectivityID"','"LongitudeXCoordinate"','"LatitudeYcoordinate"'},Vertices)      
 
% 3. load Data Storage table  

datainsert(connSQLite,'"DataStorage"',{'"DataStorageID"'},DataStorageID)

% 4. Load Metadata Table that maps out the forign keys 

fastinsert(connSQLite,'"Mapping"',{'"ObjectAttributeID"','"InstanceID"','"InputOrOutput"',...
                '"SourceID"','"MethodID"', '"AttributeTypeCodeCV"','"DataStorageID"'},Mapping);   


% Load ScenarioMetadata Table   
fastinsert(connSQLite,'"ScenarioMapping"',{'"ScenarioID"','"MappingID"'},ScenarioMapping1);   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load Data Storage

% Binarys
fastinsert(connSQLite,'"Binarys"',{'BinaryValue','DataStorageID','BinaryValueMeaningID'},Binarys);  

% Parameters
fastinsert(connSQLite,'"Parameters"',{'"ParameterValue"','"ParameterSubName"','"DataStorageID"'},Parameters);

% SeasonalParameter 
fastinsert(connSQLite,'"SeasonalParameters"',{'"SeasonStartDateTime"', '"SeasonEndDateTime"', '"SeasonNameCV"', '"SeasonValue"', '"DataStorageID"'},SeasonalParameter);

% TextFree
fastinsert(connSQLite,'"TextFree"',{'"TextFreeValue"','"DataStorageID"'},TextFree);

% TextControlled
fastinsert(connSQLite,'"TextControlled"',{'"TextControlledValueID"','"DataStorageID"'},TextControlledNew);

% FileBased
fastinsert(connSQLite,'"FileBased"',{'"FileName"','"FileFormateCV"',...
    '"FileLocationOnDesk"','"DataStorageID"'},FileBased);

% Load Rules data 
insert(connSQLite,'"Rules"',...
            {'"RuleVariableID"','"RuleVariableOrder"',... 
            '"SymbolCV"','NumConstant','"DataStorageID"'},Rules);      

% Time series- Global metadata  
insert(connSQLite,'"TimeSeries"',...
            {'"AggregationStatisticCV"','"AggregationInterval"',... 
            '"IntervalTimeUnitID"','"BeginDateTime"','"EndDateTime"','"IsRegular"',... 
            '"NoDataValue"','"Description"','"DataStorageID"'},TimeSeriesCUAHSI);

% Time series data values  
fastinsert(connSQLite,'"TimeSeriesValues"',{'"TimeSeriesID"','"DateTimeStamp"','"Value"'},TimeSeriesValues);

% Mulit Column arrays
fastinsert(connSQLite,'"MultiColumnArray"',{'"ColumnNameID"','"DataStorageID"'},MultiColumnArray);

% Column Data values 
fastinsert(connSQLite,'"MultiColumnValues"',{'"Value"','"ValueOrder"','"MultiColumnID"'},MultiColumnValues);   



fastinsert(connSQLite,'"Binarys"',{'BinaryValue','DataStorageID','BinaryValueMeaningID'},Binarys);  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

