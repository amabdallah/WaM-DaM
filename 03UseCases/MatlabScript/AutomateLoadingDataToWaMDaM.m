% Automate data loading from spreadsheets to WaM-DaM
% Adel Abdallah 
% Dec. 8, 2014

% Steps:
% 1. Define a Master Network and a Scenario for your data 
% 2. Read the entire spreadsheet
% 2. Assign the columns that represent tables in WaM-DaM
% i. Data Structure
% ii.Instances and their connections 
% iii.Object Types 
% iv. Attributes and their units 
% v. Define Data Storage for each attribute (source, method, and attribute Type)
% vi. Load the coresponsign data values for each Data Storage Instance 
% vii. Assign foreign keys to match an attribute with its instance and data
% storage
%% Read controlled vocabulary tables 
clear all; clc; close all;

%Start from left to write in WaM-DaM schema 

%1. DataStructureDomain
[num,txt,DataStructureDomain] = xlsread('ControlledVocabulary','DataStructureDomain');
% avoid the headlines  
DataStructureDomain=DataStructureDomain(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(DataStructureDomain)
  if isnan(DataStructureDomain{k})
    DataStructureDomain{k} = [];
  end
end


% 2. CommonObjectCategory

[num,txt,CommonObjectCategory] = xlsread('ControlledVocabulary','CommonObjectCategory');
 % avoid the headlines  
CommonObjectCategory=CommonObjectCategory(2:end,2:end);% avoid the first row and column

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(CommonObjectCategory)
  if isnan(CommonObjectCategory{k})
    CommonObjectCategory{k} = [];
  end
end


%3. Common Object Types CV  

[num,txt,CommonObjectTypes] = xlsread('ControlledVocabulary','CommonObjectTypes');
% avoid the headlines  
CommonObjectTypes=CommonObjectTypes(2:end,2:end);% avoid the first row and first column

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(CommonObjectTypes)
  if isnan(CommonObjectTypes{k})
    CommonObjectTypes{k} = [];
  end
end

%4. Common Attribute Category  

[num,txt,CommonAttributeCategory] = xlsread('ControlledVocabulary','CommonAttributeCategory');
% avoid the headlines  
CommonAttributeCategory=CommonAttributeCategory(2:end,2:end);% avoid the first row and first column

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(CommonAttributeCategory)
  if isnan(CommonAttributeCategory{k})
    CommonAttributeCategory{k} = [];
  end
end

%5. Common Attributes 
[num,txt,CommonAttributes] = xlsread('ControlledVocabulary','CommonAttributes');
% avoid the headlines  
CommonAttributes=CommonAttributes(2:end,2:end);% avoid the first row and column

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(CommonAttributes)
  if isnan(CommonAttributes{k})
    CommonAttributes{k} = [];
  end
end

%6. Organization Type
[num,txt,OrganizationType] = xlsread('ControlledVocabulary','OrganizationType');

 % avoid the headlines  
OrganizationType=OrganizationType(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(OrganizationType)
  if isnan(OrganizationType{k})
    OrganizationType{k} = [];
  end
end

%7. Method Type
[num,txt,MethodType] = xlsread('ControlledVocabulary','MethodType');

 % avoid the headlines  
MethodType=MethodType(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(MethodType)
  if isnan(MethodType{k})
    MethodType{k} = [];
  end
end


%8. Vertical Datum
[num,txt,VerticalDatum] = xlsread('ControlledVocabulary','VerticalDatum');

 % avoid the headlines  
VerticalDatum=VerticalDatum(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(VerticalDatum)
  if isnan(VerticalDatum{k})
    VerticalDatum{k} = [];
  end
end


%9. Attribute Type Code
[num,txt,AttributeTypeCode] = xlsread('ControlledVocabulary','AttributeTypeCode');

% avoid the headlines  
AttributeTypeCode=AttributeTypeCode(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(AttributeTypeCode)
  if isnan(AttributeTypeCode{k})
    AttributeTypeCode{k} = [];
  end
end


%10. Aggregation Statistic
[num,txt,AggregationStatistic] = xlsread('ControlledVocabulary','AggregationStatistic');

% avoid the headlines  
AggregationStatistic=AggregationStatistic(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(AggregationStatistic)
  if isnan(AggregationStatistic{k})
    AggregationStatistic{k} = [];
  end
end


%11. Instance Status
[num,txt,InstanceStatus] = xlsread('ControlledVocabulary','InstanceStatus');

% avoid the headlines  
InstanceStatus=InstanceStatus(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(InstanceStatus)
  if isnan(InstanceStatus{k})
    InstanceStatus{k} = [];
  end
end

%12. SeasonName
[num,txt,SeasonName] = xlsread('ControlledVocabulary','SeasonName');

% avoid the headlines  
SeasonName=SeasonName(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(SeasonName)
  if isnan(SeasonName{k})
    SeasonName{k} = [];
  end
end

%13. Symbols
[num,txt,Symbols] = xlsread('ControlledVocabulary','Symbols');

% avoid the headlines  
Symbols=Symbols(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(Symbols)
  if isnan(Symbols{k})
    Symbols{k} = [];
  end
end


% 14. Controlled Text
[num,txt,ControlledTextValues] = xlsread('ControlledVocabulary','ControlledTextValues');

 % avoid the headlines  
ControlledTextValues=ControlledTextValues(2:end,2:end);% avoid the first row and column

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(ControlledTextValues)
  if isnan(ControlledTextValues{k})
    ControlledTextValues{k} = [];
  end
end
% Convert the data value to string 
ControlledTextValues(:,1) = cellfun(@num2str, ControlledTextValues(:,1), 'UniformOutput', false);

% 15. Units 
[num,txt,Units] = xlsread('ControlledVocabulary','Units');

% avoid the headlines and the unit ID column  
Units=Units(2:length(Units),2:end);
% replace NAN with empty blanks so MYSQL accepts them  

for k = 1:numel(Units)
  if isnan(Units{k})
    Units{k} = [];
  end
end


%16. SpatialReference
[num,txt,SpatialReference] = xlsread('ControlledVocabulary','SpatialReference');
 % avoid the headlines  
SpatialReference=SpatialReference(2:end,2:end);% avoid the first row and column

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(SpatialReference)
  if isnan(SpatialReference{k})
    SpatialReference{k} = [];
  end
end


%17. BinaryValueMeaning
[num,txt,BinaryValueMeaning] = xlsread('ControlledVocabulary','BinaryValueMeaning');
 % avoid the headlines  
BinaryValueMeaning=BinaryValueMeaning(2:end,:);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(BinaryValueMeaning)
  if isnan(BinaryValueMeaning{k})
    BinaryValueMeaning{k} = [];
  end
end
%% Read Metadata 

% Organizations, people, Methods, sources,   Left to right in WaM-DaM schema

%1. NativeObjectCategory
[num,txt,NativeObjectCategory] = xlsread('Metadata','NativeObjectCategory');
 % avoid the headlines  
NativeObjectCategory=NativeObjectCategory(2:end,2:end);% avoid the first row and column

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(NativeObjectCategory)
  if isnan(NativeObjectCategory{k})
    NativeObjectCategory{k} = [];
  end
end


%2. NativeAttribueCategory
[num,txt,NativeAttributeCategory] = xlsread('Metadata','NativeAttributeCategory');
 % avoid the headlines  
NativeAttributeCategory=NativeAttributeCategory(2:end,2:end);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(NativeAttributeCategory)
  if isnan(NativeAttributeCategory{k})
    NativeAttributeCategory{k} = [];
  end
end

% 3. Organizations

[num,txt,Organ] = xlsread('Metadata','Organizations');

 % avoid the headlines  
Organizations=Organ(2:end,2:end);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(Organizations)
  if isnan(Organizations{k})
    Organizations{k} = [];
  end
end

% 4. People 

[num,txt,Peop] = xlsread('Metadata','People');

 % avoid the headlines  
People=Peop(2:end,2:end);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(People)
  if isnan(People{k})
    People{k} = [];
  end
end

% 5. Sources

[num,txt,rawSource] = xlsread('Metadata','Sources');

 % avoid the headlines  
Sources=rawSource(2:end,2:end);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(Sources)
  if isnan(Sources{k})
    Sources{k} = [];
  end
end

% 6. Methods
[num,txt,rawMethods] = xlsread('Metadata','Methods');

 % avoid the headlines  
Methods=rawMethods(2:end,2:end);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(Methods)
  if isnan(Methods{k})
    Methods{k} = [];
  end
end

% 6. Models
[num,txt,Models] = xlsread('Metadata','Models');

 % avoid the headlines  
Models=Models(2:end,2:end);% avoid the first row and column
%% Read Core tables 

%1. DataStructures
[num,txt,DataStructures] = xlsread('Core','DataStructures');
 % avoid the headlines  
DataStructures=DataStructures(2:end,2:end);% avoid the first row

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(DataStructures)
  if isnan(DataStructures{k})
    DataStructures{k} = [];
  end
end

%2. Object types 
[num,txt,ObjTypes] = xlsread('Core','ObjectTypes');

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(ObjTypes)
  if isnan(ObjTypes{k})
    ObjTypes{k} = [];
  end
end
% avoid the headlines  
ObjTypes=ObjTypes(2:length(ObjTypes),2:end);% avoid the first column

% convert the Object code to string
ObjTypes(:,2) = cellfun(@num2str, ObjTypes(:,2), 'UniformOutput', false);


%3. Attributes
[num,txt,Attributes] = xlsread('Core','Attributes');

% avoid the headlines  
Attributes=Attributes(2:end,2:end);% avoid the first column

%4. Object Atributes 
[num,txt,ObjAtt] = xlsread('Core','ObjectAttributes');

ObjectAttributes=ObjAtt(2:end,2:5); % srtart from rwo 2 to avoid headlines 

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(ObjectAttributes)
  if isnan(ObjectAttributes{k})
    ObjectAttributes{k} = [];
  end
end

%5. Master Networks 
[num,txt,MasterNetworks] = xlsread('Core','MasterNetworks');

MasterNetworks=MasterNetworks(2:end,2:end); % srtart from rwo 2 to avoid headlines 

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(MasterNetworks)
  if isnan(MasterNetworks{k})
    MasterNetworks{k} = [];
  end
end

%6. Scenarios
[num,txt,Scenarios] = xlsread('Core','Scenarios');

Scenarios=Scenarios(2:end,2:end); % srtart from rwo 2 to avoid headlines 

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(Scenarios)
  if isnan(Scenarios{k})
    Scenarios{k} = [];
  end
end
%% Read Instances
%Read attributes data values 
[num,txt,rawAttributes] = xlsread('Core','Dams');
% lDams=length(rawAttributes);
rawAttributes(cellfun(@isempty,rawAttributes))={'null'};% Repalce empy cells with Null value. MYSQL doesnt accept empy cells 
% Dams Instances 
[m,n] = size(rawAttributes)
InstanceName=rawAttributes(2:m,2);

% find the length of instances vector
LdamsIns=length(InstanceName);
InstanceCode=rawAttributes(2:m,3);
Status=repmat({'Exists'}, [LdamsIns,1]);
Longitude=rawAttributes(2:m,6);
Latitude=rawAttributes(2:m,7);
Description=cell(LdamsIns,1);
RelatedInstance=cell(LdamsIns,1);

DamsInstances=[InstanceName,InstanceCode,Status,Longitude,Latitude,...
              Description,RelatedInstance];

[num,txt,WaterBodyAtt] = xlsread('Core','Waterbodies');

% Water Bodies Instances 
[mWB,nWB] = size(WaterBodyAtt)
WBInstanceName=WaterBodyAtt(2:mWB,2);
Lins=length(WBInstanceName)

WBInstanceCode=(WaterBodyAtt(2:mWB,1));
WBInstanceCode = cellfun(@num2str, WBInstanceCode, 'UniformOutput', false)

WBStatusCV=repmat({'Exists'}, [Lins,1])
WBLongitude=WaterBodyAtt(2:mWB,3);% extract Long Lat from ArcGIS
WBLatitude=WaterBodyAtt(2:mWB,4);

WBDescription=cell(Lins,1);

WBRelatedInstance=cell(Lins,1);

WBInstances=[WBInstanceName, WBInstanceCode, WBStatusCV, WBLongitude, WBLatitude, WBDescription, WBRelatedInstance]

% Streams Instances 
[num,txt,StreamAtt] = xlsread('Core','StreamAtt');
StreamAtt(cellfun(@isempty,StreamAtt))={'null'};% Repalce empy cells with Null value. MYSQL doesnt accept empy cells 

% Node Instances 
NInstanceCode=StreamAtt(2:65788,9);
NInstanceCode = cellfun(@num2str, NInstanceCode, 'UniformOutput', false)

NInstanceName=cell(65787,1);
NStatus=cell(65787,1);
NLongitude=StreamAtt(2:65788,10);
NLatitude=StreamAtt(2:65788,11);
NDescription=cell(65787,1);
NRelatedInstance=cell(65787,1);

StreamNodeInstances=[NInstanceName,NInstanceCode,NStatus,NLongitude,...
                    NLatitude,NDescription,NRelatedInstance];
% Link Instances 
[mS,nS] = size(StreamAtt)
StrInsInstanceName=StreamAtt(2:mS,4);
LStrIns=length(StrInsInstanceName);% length of instances vector
StrInsInstanceCode=StreamAtt(2:mS,3);
StrInsInstanceCode = cellfun(@num2str, StrInsInstanceCode, 'UniformOutput', false)
StrInsStatus=repmat({'Exists'}, [LStrIns,1]);
StrInsLongitude=StreamAtt(2:mS,5);
StrInsLatitude=StreamAtt(2:mS,6);
StrInsDescription=cell(LStrIns,1);
StrInsRelatedInstance=cell(LStrIns,1);

StreamLinkInstances=[StrInsInstanceName,StrInsInstanceCode,StrInsStatus,StrInsLongitude,StrInsLatitude,...
                    StrInsDescription,StrInsRelatedInstance];

                

% WEAP Instances 
% Nodes 
[num,txt,WEAPInstancesNEW] = xlsread('Core','WEAPInstancesNEW');

WEAPInstancesNEW=WEAPInstancesNEW(2:end,2:8)% avoid headings and first column and irrelevent data 
               
% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(WEAPInstancesNEW)
  if isnan(WEAPInstancesNEW{k})
    WEAPInstancesNEW{k} = [];
  end
end

WEAPInstancesNEW(:,2) = cellfun(@num2str, WEAPInstancesNEW(:,2), 'UniformOutput', false)% convert the InstaceCode to a string 


% %%%%%%%%%%%%%%%%% CUAHSI sites in the Bear River 

[num,txt,CUAHSIsitesVariables] = xlsread('Core','CUAHSIsitesVariables');
[num,txt,CUAHSIsites] = xlsread('Core','CUAHSIsites');

CUAHSIInsInstanceName=CUAHSIsites(2:end,2); %Read site name in ODM////avoid header 

% LStrIns=length(StrInsInstanceName);% length of instances vector

CUAHSIInsInstanceCode=CUAHSIsites(2:end,3);%site code in ODM////avoid header 

% CUAHSIInsInstanceCode = cellfun(@num2str, StrInsInstanceCode, 'UniformOutput', false)

CUAHSIInsStatus=repmat({'Exists'}, [length(CUAHSIInsInstanceName),1]);

CUAHSIInsLongitude=CUAHSIsites(2:end,5);

CUAHSIInsLatitude=CUAHSIsites(2:end,4);

CUAHSIInsDescription=cell(length(CUAHSIInsInstanceName),1);

CUAHSIInsRelatedInstance=cell(length(CUAHSIInsInstanceName),1);

CUAHSIInstances=[CUAHSIInsInstanceName,CUAHSIInsInstanceCode,CUAHSIInsStatus,...
    CUAHSIInsLongitude,CUAHSIInsLatitude,CUAHSIInsDescription,CUAHSIInsRelatedInstance];

% Combine all the instances  
Instances=[DamsInstances;WBInstances;StreamNodeInstances;StreamLinkInstances;WEAPInstancesNEW;CUAHSIInstances,];
%% Connections and vertices

StartNodeInstanceID=cell2mat(StreamAtt(2:mS,1))+8121+26872;
EndNodeInstanceID=cell2mat(StreamAtt(2:mS,2))+8121+26872;
LinkInstanceID=cell2mat(StreamAtt(2:mS,3))+8121+26872+65787;

StreamConn=[LinkInstanceID,StartNodeInstanceID,EndNodeInstanceID];

% WEAP Connections 
[num,txt,WEAPConnections] = xlsread('Core','WEAPInstancesNEWManipulated');

WEAPStartNodeInstanceID=cell2mat(WEAPConnections(2:45,12))+177755;
WEAPEndNodeInstanceID=cell2mat(WEAPConnections(2:45,14))+177755;
WEAPLinkInstanceID=cell2mat(WEAPConnections(2:45,16))+177755;

WEAPConn=[WEAPStartNodeInstanceID,WEAPEndNodeInstanceID,WEAPLinkInstanceID];

Connectivity=[StreamConn;WEAPConn];

% Vertices 

[num,txt,VerticesData] = xlsread('Metadata','Vertices');


Vertices=cell2mat(VerticesData(2:end,2:end))
%% Metadata

% Generate DataStorage table for MySQL INSERT Values 

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

% to create a sceanrio, we need to dublicate maping out the keys 
% from the instances to the the data values. 


% Find out the last Primary key value in the DataStructures table
% sqlquery = 'select * from "Core"."DataStructures"';
% curs = exec(connPostgres2015,sqlquery)
% curs = fetch(curs);
% x=curs.Data(end,1)
%

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
    CUAHSIinst;% CUAHSI instances 
    num2cell(repmat(XX14+1:XX14+2,1,30)')]; % Reservoir #2 above and below Cutler  %%%%%%%%%%%%%%%%%%%%   

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


% % get the attributes of each instance, then get their Ids from the attribute table. 
% % Then 
% 
% CUAHSIAtt = cell(CUAHSIsitesVariables (2:end,3));
% for i = 1:numel(CUAHSIsitesVariables (2:end,3));
%     CUAHSIAtt{i} = find(strcmpi(Attributes(2:end,1),CUAHSIsitesVariables (i+1,3)));
% end
% 
% CUAHSIAtt = cellfun(@num2str, CUAHSIAtt, 'UniformOutput', false)
% ObjAtt(:,3) = cellfun(@num2str, ObjAtt(:,3), 'UniformOutput', false)
% % ObjAtt(:,2) = cellfun(@num2str, ObjAtt(:,2), 'UniformOutput', false)
% 
% t=unique(ObjAtt(2:end,2))
% t2 = cell2mat(cellfun(@str2num, t, 'UniformOutput', false))
% 
% % get the corresponding objetc attribute from the ObjectAttribute table. 
% CUAHSIObjAtt = cell(CUAHSIAtt);
% 
% for j = 1:numel(CUAHSIAtt);
% CUAHSIObjAtt{j} = find(strcmpi(ObjAtt(2:end,3),CUAHSIAtt(j)));
% end  
    
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
            CUAHSIsitesVariables(2:end,24);
            reshape((num2cell(repmat(ObjectAttributeID7,1,2)))',[],1)];  % two reservoirs 
               
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
                  repmat({'P'},[21*5,1]); %Reservoir                   
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
                  repmat({'T'}, [1*4,1]);       %NWISCUAHSIReservoir         
                  repmat({'D'},[1*4,1]);       %NWISCUAHSIReservoir           
                  repmat({'T'},[1*2,1]);  %Reservoir                    
                  repmat({'P'},[2*2,1]);  %Reservoir                   
                  repmat({'T'},[1*2,1]);  %Reservoir 
                  repmat({'M'},[1*2,1]);  %Reservoir 
                  repmat({'P'},[21*2,1]); %Reservoir                   
                  repmat({'C'},[3*2,1]);  %Reservoir
                  repmat({'D'},[1*2,1])]; %Reservoir                            
%P:Parameter 
%TF:TextFree 
%TC:TextControlled 
%T: Time sereis 
%B:Binary
%SP:Seasonal Parameter 
%FB: File Based 
%F: Function
%M: MultiColumnArray
%C: Column
%D: Dummy attribute  

% Sources 
% 1,2 =4
% 3,4,5,6,7,8,9,10=2
% 11=4
% Dams.SourceID = num2cell([repmat(2,Lpar,1);repmat(2,LTextFree,1); repmat(2,LTextCont,1)]);

SourceID=num2cell([repmat(2,1,8121*20)';repmat(3,1,26872*12)';repmat(6,1,65787*1)';
    repmat(6,1,76975*3)';repmat(10,1,WEAPScen4)';repmat(8,1,length(CUAHSIinst))';
    repmat(11,1,60)']);

% work on these methods and sources and then you're good to go!!! 
MethodID=num2cell([repmat(1,1,8121*20)';repmat(2,1,26872*12)';repmat(3,1,65787*1)';
    repmat(3,1,76975*3)';repmat(5,1,WEAPScen4)';repmat(6,1,length(CUAHSIinst))';
    repmat(1,1,60)']);

DataStorageID=num2cell(1:(8121*20+26872*12+65787*1+76975*3+(WEAPScen4))+length(CUAHSIinst)+60)';

Metadata=[ObjectAttributeID,InstanceID,InputOrOutput,... 
          SourceID, MethodID, AttributeTypeCodeCV,DataStorageID];   

% DataStorageIDtimeseries=DataStorageID(length(DataStorageID)-length(CUAHSIinst)+1:end)

% ScenarioInstances
% [num,txt,ScenarioIDs] = xlsread('ScenarioMetadata','RemovedIDs2');

ScenarioID1=num2cell([repmat(1,1,8121*20)'; repmat(2,1,26872*12)';
                repmat(3,1,((65787)*1))';repmat(3,1,((76975)*3))';
                repmat(4,1,WEAPScen4)';
                repmat(7,1,length(CUAHSIinst))']);
            
%                 repmat(5,1,WEAPScen5)']);
%% describe whats going on here!!!

MetadataID1=num2cell(1:(8121*20+26872*12+65787*1+76975*3+WEAPScen4+length(CUAHSIinst)))';
% Look up IDs of metadata that I want to delete and take them away from the exsiting metadata IDs 

% MetadataID3=(MetadataID2(end)+1:MetadataID2(end)+60)';

% Get the MetadataMapping IDs
MetadataIdsQuery = sprintf(['SELECT "Core"."MetadataMapping"."MetadataMappingID"\n'... 
'FROM "Core"."MetadataMapping"\n'...
'Left JOIN "Core"."SceanrioMetadata"\n'...
'ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"\n'...
'Left JOIN "Core"."Scenarios"\n'...
'ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"\n'...
'Left JOIN "Core"."ObjectAttributes"\n'...
'ON "ObjectAttributes"."ObjectAttributeID"= "Core"."MetadataMapping"."ObjectAttributeID"\n'...
'Left JOIN "Core"."ObjectTypes"\n'... 
'ON "Core"."ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"\n'...
'Left JOIN "Core"."DataStructures"\n'...
'ON "Core"."DataStructures"."DataStructureID"="Core"."ObjectTypes"."DataStructureID"\n'...
'Left JOIN  "Core"."Attributes"\n'...
'ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"\n'...
'Left JOIN "Core"."Instances"\n'...
'ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"\n'...
'WHERE\n'...
'"Core"."Scenarios"."ScenarioName"=''BaseCaseLower'' AND "Core"."Attributes"."NativeAttributeName"!=''Net Evaporation''\n'... 
'AND\n'...
'"Core"."Scenarios"."ScenarioName"=''BaseCaseLower'' AND\n'...
'"Core"."Instances"."InstanceName"!=''Barrens (20)'' AND \n'...
'"Core"."Instances"."InstanceName"!=''Transmition Link from Withdrawal Node 8 to Barrens'' AND\n'...
'"Core"."Instances"."InstanceName"!=''Transmition Link from Withdrawal Node 5 to Barrens'' AND\n'...
'"Core"."Instances"."InstanceName"!=''Transmition Link from Barrens to Dummy Junction 2''']);

CursMetadataIdsQuery = exec(connPostgres2015,MetadataIdsQuery)
CursMetadataIdsQuery = fetch(CursMetadataIdsQuery);
CursMetadataIdsQuery=CursMetadataIdsQuery.Data(:,:)

% MetadataID4=(length(MetadataID2)+1:(length(MetadataID2)+length(CUAHSIinst)))';


SceanrioMetadata1= [ScenarioID1,MetadataID1];     


% SceanrioMetadata= [SceanrioMetadata1;SceanrioMetadata2];           

% Change metadata of sources and methods for scenario 5
% Get the MetadataMapping IDs

MetadataMappingQuery = sprintf(['SELECT "Core"."MetadataMapping".* \n'...
'FROM "Core"."MetadataMapping"\n'...
'Left JOIN "Core"."SceanrioMetadata"\n'...
'ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"\n'...
'Left JOIN "Core"."Scenarios"\n'...
'ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"\n'...
'Left JOIN "Core"."Instances" \n'...
'ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"\n'...
'Left JOIN "Core"."ObjectAttributes"\n'...
'ON "Core"."ObjectAttributes"."ObjectAttributeID"="Core"."MetadataMapping"."ObjectAttributeID"\n'...
'Left JOIN  "Core"."ObjectTypes"\n'...
'ON "Core"."ObjectTypes"."ObjectTypeID"="Core"."ObjectAttributes"."ObjectTypeID"\n'...
'Left JOIN "Core"."DataStructures"\n'...
'ON "Core"."DataStructures"."DataStructureID"="Core"."ObjectTypes"."DataStructureID"\n'...
'Left JOIN  "Core"."Attributes"\n'...
'ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"\n'...
'WHERE "NativeAttributeName"= ''Net Evaporation'' AND \n'...
'"ScenarioName"=''BaseCaseLower'' AND \n'...
'"DataStructureName"=''WEAP''']);

MetadataMappingQuerycurs = exec(connPostgres2015,MetadataMappingQuery)
MetadataMappingQuerycurs = fetch(MetadataMappingQuerycurs);
MetadataMapping=MetadataMappingQuerycurs.Data(:,1:end)% avoid the MetadataMappingIDs

% 1) replace the StorageIDs
% get the last StorageID in the database
DataStoragesqlquery = sprintf(['SELECT "DataStorageID" \n'...
'FROM "Core"."DataStorage" order by "DataStorageID" desc limit 1']);
DataStoragesqlquerycurs = exec(connPostgres2015,DataStoragesqlquery)
DataStoragesqlquerycurs = fetch(DataStoragesqlquerycurs);
DataStoragesqlqueryResult=DataStoragesqlquerycurs.Data(:,:)

NewDataStorageScena5=num2cell(((cell2mat(DataStoragesqlqueryResult)+1):length(MetadataMapping)+...
    (cell2mat(DataStoragesqlqueryResult)))');

% 2) replace the SourceIDs and MethodIDs

NewSourceIDScena5=num2cell(repmat(8,length(MetadataMapping),1));
NewMethodIDScena5=num2cell(repmat(6,length(MetadataMapping),1));

% generate new MetadataMappingIDs to use them for the scenarioMetadata
% table 
DataStoragesqlquery = sprintf(['SELECT "MetadataMappingID" \n'...
'FROM "Core"."MetadataMapping" order by "MetadataMappingID" desc limit 1']);
MetadataMappingIDsqlquerycurs = exec(connPostgres2015,DataStoragesqlquery)
MetadataMappingIDsqlquerycurs = fetch(MetadataMappingIDsqlquerycurs);
MetadataMappingIDsqlquerycurs=MetadataMappingIDsqlquerycurs.Data(:,:)


NewMetadataMappingIDs=num2cell(((cell2mat(MetadataMappingIDsqlquerycurs)+1):length(MetadataMapping)+...
    (cell2mat(MetadataMappingIDsqlquerycurs)))');

NewMetadataMappingScena5=[MetadataMapping(:,2),MetadataMapping(:,3),MetadataMapping(:,4),...
    NewSourceIDScena5,NewMethodIDScena5,MetadataMapping(:,7),NewDataStorageScena5];

% first, INSERT DATA STORAGE IDS 
fastinsert(connPostgres2015,'"Core"."DataStorage"',{'"DataStorageID"'},NewDataStorageScena5);

% Second, Insert new metadataMapping for scenario5
fastinsert(connPostgres2015,'"Core"."MetadataMapping"',{'"ObjectAttributeID"','"InstanceID"','"InputOrOutput"',...
                '"SourceID"','"MethodID"', '"AttributeTypeCodeCV"','"DataStorageID"'},NewMetadataMappingScena5);             
            
MetadataID2=[CursMetadataIdsQuery;num2cell(length(MetadataID1)+1:length(MetadataID1)+(60)+length(NewMetadataMappingIDs))']
ScenarioID2=num2cell(repmat(5,1,length(MetadataID2))');
% find out the MetadataMappingIDs that are identical in scenario#4 and
% replace them with the new ones in scenario#5

SceanrioMetadata2=[ScenarioID2,MetadataID2,]
           
fastinsert(connPostgres2015,'"Core"."SceanrioMetadata"',{'"ScenarioID"','"MetadataMappingID"'},SceanrioMetadata2);              
%% Read Parameters (numeric)
% clear all; clc

%Read attributes data values 
[num,txt,rawAttributes] = xlsread('Core','Dams');

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
[num,txt,WaterBodyAtt] = xlsread('Core','Waterbodies');
WBParameterValue=WaterBodyAtt(2:length(WaterBodyAtt),21:23);

WBParameterValue=WBParameterValue(:);
LparmWB=length(WBParameterValue);

% Data storage ID continues after the Dams. It starts at 154299+8121+1=162421
DataStorageIDWBPar=num2cell(162421:162420+LparmWB)';

WBParameterSubName=cell(LparmWB,1);

%Read attributes data values 
[num,txt,StreamAtt] = xlsread('Core','StreamAtt');
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
%% Read Text Free

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

FreeText=[TextDescriptorFree,DataStorageIDFreeT];
%% Read Text Controlled
% Dams 

% Reservoir Purpose 

%Read attributes data values 
[num,txt,rawAttributes] = xlsread('Core','Dams');

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


[num,txt,WaterBodyAtt] = xlsread('Core','Waterbodies');


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
[num,txt,StreamAtt] = xlsread('Core','StreamAtt');
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

ControlledText=[DamsTextDescriptorControlledData;WBTextValueControlledValues;StrTextDescriptorControlledData];

% length(TextDescriptorControlledData)
%% Read Time Series Data 
% WEAP DATA 


% CUAUSI time sereis   
[num,txt,TimeSeriesCUAHSI] = xlsread('Storage','TimeSeries');
TimeSeriesCUAHSI=TimeSeriesCUAHSI(2:end,2:end) %avoid header and first column

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(TimeSeriesCUAHSI)
  if isnan(TimeSeriesCUAHSI{k})
    TimeSeriesCUAHSI{k} = [];
  end
end
TimeSeriesCUAHSI(:,2) = cellfun(@num2str, TimeSeriesCUAHSI(:,2), 'UniformOutput', false);


% CUAUSI time sereis DATA
[num,txt,TimeSeriesData] = xlsread('Storage','TimeSeriesData');
TimeSeriesData=TimeSeriesData(:,2:end)

% replace NAN with empty blanks so MYSQL accepts them  
for k = 1:numel(TimeSeriesData)
  if isnan(TimeSeriesData{k})
    TimeSeriesData{k} = [];
  end
end

TimeSeriesDatat=transpose(TimeSeriesData)
%% Read Multi-Columns

% WEAP multi-columns
[num,txt,MultiColumnArray] = xlsread('Storage','MultiColumnArray');
MultiColumnArray=MultiColumnArray(2:end,2:3) %avoid header and first column

% Values 
[num,txt,MultiColumnValues] = xlsread('Storage','MultiColumnValues');
MultiColumnValues=MultiColumnValues(2:end,1:3) %avoid header and first column


%% Connect to SQLite Database  
%conn = database(dbpath,username,pwd,'org.sqlite.JDBC','URL');

connSQLite = database('C:\SQLite\WaMDaM2.sqlite','','','org.sqlite.JDBC','jdbc:sqlite:C:\SQLite\WaMDaM2.sqlite')
%% Load Controlled Vocabulary
% Steps
% 1. load all the independent tables (Controlled vocabulary tables + Metadata tables)
% Avoid excuting the same line more than one time, otherwise, it would
% double loading the data table to the database 

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
      
%16. Units
fastinsert(connSQLite,'"Units"',{'"UnitType"','"UnitName"',...
          '"UnitSystem"', '"UnitAbbreviation"'},Units);
  
%17. SpatialReference      
fastinsert(connSQLite,'"SpatialReference"',{'"SRSID"','"SRSName"',...
          '"IsGeographic"','"Notes"'},SpatialReference);    
      
%18. BinaryValueMeaning      
fastinsert(connSQLite,'"BinaryValueMeaning"',{'"BinaryValue"','"ValueDefinition"',...
          '"BinaryAttribute"'},BinaryValueMeaning);    
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
%% Load Core tables          

% 1. DataStructures
fastinsert(connSQLite,'"DataStructures"',{'"DataStructureName"', '"DataStructureDomainCV"', '"DataStructureWebpage"',...
        '"DataStrcutureDescription"'},DataStructures);

% 1. Object Types
fastinsert(connSQLite,'"ObjectTypes"',{'"NativeObjectName"','"ObjectCode"','"ObjectTopology"',...
    '"MapColor"', '"MapSymbol"' , '"Description"', '"DataStructureID"',...
    '"NativeObjectCategoryID"', '"CommonObjectTypeID"'},ObjTypes);

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
          '"RelatedInstanceID"'},Instances)
% this Table is loaded here right after the instances Table though the 
% Connections Table is not a Core Table. The Connections Table depends on
% the Instances Table 

% Connections 
fastinsert(connSQLite,'"Connections"',{'"LinkInstanceID"','"StartNodeInstanceID"','"EndNodeInstanceID"'},Connectivity)      

% Vertices 
fastinsert(connSQLite,'"Vertices"',{'"ConnectivityID"','"LongitudeXCoordinate"','"LatitudeYcoordinate"'},Vertices)      
 
% 3. load Data Storage 

datainsert(connSQLite,'"DataStorage"',{'"DataStorageID"'},DataStorageID(198017:end,1))

% 4. Load Metadata Table that maps out the forign keys 

fastinsert(connSQLite,'"MetadataMapping"',{'"ObjectAttributeID"','"InstanceID"','"InputOrOutput"',...
                '"SourceID"','"MethodID"', '"AttributeTypeCodeCV"','"DataStorageID"'},Metadata);   
            
fastinsert(connSQLite,'"SceanrioMetadata"',{'"ScenarioID"','"MetadataMappingID"'},SceanrioMetadata1);      

fastinsert(connSQLite,'"SceanrioMetadata"',{'"ScenarioID"','"MetadataMappingID"'},SceanrioMetadata);   
%% Load Data Storage
fastinsert(connSQLite,'"Parameters"',{'"ParameterValue"','"ParameterSubName"','"DataStorageID"'},Parameters);

fastinsert(connSQLite,'"TextFree"',{'"TextFreeValue"','"DataStorageID"'},FreeText);

fastinsert(connSQLite,'"TextControlled"',{'"DataStorageID"','"TextControlledValueID"'},ControlledText);
% Time series 
insert(connPostgres2015,'"TimeSeries"',...
            {'"AggregationStatisticCV"','"AggregationInterval"',... 
            '"IntervalTimeUnitID"','"BeginDateTime"','"EndDateTime"','"IsRegular"',... 
            '"NoDataValue"','"Description"','"DataStorageID"'},TimeSeriesCUAHSI);

fastinsert(connSQLite,'"TimeSeriesValues"',{'"TimeSeriesID"','"DateTimeStamp"','"Value"'},TimeSeriesData);

% Mulit Column arrays
fastinsert(connSQLite,'"MultiColumnArray"',{'"ColumnNameID"','"DataStorageID"'},MultiColumnArray);

fastinsert(connSQLite,'"MultiColumnValues"',{'"MultiColumnID"','"Value"','"ValueOrder"'},MultiColumnValues);     
%% Load scenario changes 


MetadataIdsQuery = sprintf(['SELECT "MetadataMapping"."MetadataMappingID"\n'... 
'FROM "MetadataMapping"\n'...
'Left JOIN "SceanrioMetadata"\n'...
'ON "SceanrioMetadata"."MetadataMappingID"="MetadataMapping"."MetadataMappingID"\n'...
'Left JOIN "Scenarios"\n'...
'ON "Scenarios"."ScenarioID"="SceanrioMetadata"."ScenarioID"\n'...
'Left JOIN "ObjectAttributes"\n'...
'ON "ObjectAttributes"."ObjectAttributeID"= "MetadataMapping"."ObjectAttributeID"\n'...
'Left JOIN "ObjectTypes"\n'... 
'ON "ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"\n'...
'Left JOIN "DataStructures"\n'...
'ON "DataStructures"."DataStructureID"="ObjectTypes"."DataStructureID"\n'...
'Left JOIN  "Core"."Attributes"\n'...
'ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"\n'...
'Left JOIN "Instances"\n'...
'ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"\n'...
'WHERE\n'...
'"Scenarios"."ScenarioName"=''BaseCaseLower'' AND "Attributes"."NativeAttributeName"!=''Net Evaporation''\n'... 
'AND\n'...
'"Scenarios"."ScenarioName"=''BaseCaseLower'' AND\n'...
'"Instances"."InstanceName"!=''Barrens (20)'' AND \n'...
'"Instances"."InstanceName"!=''Transmition Link from Withdrawal Node 8 to Barrens'' AND\n'...
'"Instances"."InstanceName"!=''Transmition Link from Withdrawal Node 5 to Barrens'' AND\n'...
'"Instances"."InstanceName"!=''Transmition Link from Barrens to Dummy Junction 2''']);

CursMetadataIdsQuery = exec(connPostgres2015,MetadataIdsQuery)
CursMetadataIdsQuery = fetch(CursMetadataIdsQuery);
CursMetadataIdsQuery=CursMetadataIdsQuery.Data(:,:)
%% Load Rules data 
insert(connSQLite,'"Functions "',...
            {'"FunctionVariableID"','"FunctionVariableOrder"',... 
            '"SymbolCV"','"DataStorageID"'},Functions);      
   

        
        
        
        
%% Connect Matlab with PostgreSql
% First of all, connect to PostgreSQL database 
% close(conn1) 
%# add class path (if not in the class path)
% p = 'C:\AdelAbdallah\PhD\CI-Water\WaM-DaM\Design Specifications 2014\ImportAutoma\postgresql-9.3-1102.jdbc4.jar';
% if ~ismember(p,javaclasspath)
%     javaaddpath(p)
% end

% connPostgres2015 = database('WaMDaM2015','postgres','Adel2010','org.postgresql.Driver',...
%     sprintf('jdbc:postgresql://%s/%s','localhost','WaMDaM2015'))

connPostgres2015 = database('WaMDaM','postgres','Adel2010',...
                'Vendor','PostgreSQL',...
                'Server','localhost');
            
% connPostgres2015 = database.ODBCConnection('PostgreSQL30','postgres','Adel2010');
%% Load Controlled Vocabulary
% Steps
% 1. load all the independent tables (Controlled vocabulary tables + Metadata tables)
% Avoid excuting the same line more than one time, otherwise, it would
% double loading the data table to the database 

%1. DataStructureDomain
fastinsert(connPostgres2015,'"CVs"."DataStructureDomain"',{'"Term"',...
          '"Definition"'},DataStructureDomain);
      
%2. CommonObjectCategory      
 fastinsert(connPostgres2015,'"CVs"."CommonObjectCategory"',{'"CommonObjectCategoryName"','"CommonCategoryDefinition"',...
          '"ParentCommonObjectCategoryID"'},CommonObjectCategory); 
            
%3. CommonObjectTypes      
fastinsert(connPostgres2015,'"CVs"."CommonObjectTypes"',{'"CommonObjectType"','"CommonObjectTopology"',...
          '"CommonObjectDefinition"','"CommonObjectCategoryID"'},CommonObjectTypes); 
      
%4. CommonAttributeCategory
fastinsert(connPostgres2015,'"CVs"."CommonAttributeCategory"',{'"CommonAttributeCategoryName"','"CommonCategoryDefinition"',...
          '"ParentCommonAttributeCategoryID"'},CommonAttributeCategory); 
  
%5. CommonAttributes
fastinsert(connPostgres2015,'"CVs"."CommonAttributes"',{'"CommonAttributeName"',...
          '"CommonAttributeDefinition"',...
          '"CommonAttributeCategoryID"'},CommonAttributes);

%6. OrganizationType
fastinsert(connPostgres2015,'"CVs"."OrganizationType"',{'"Term"',...
          '"Definition"'},OrganizationType);
    
%7. MethodType
fastinsert(connPostgres2015,'"CVs"."MethodType"',{'"Term"',...
          '"Definition"'},MethodType);      
      
%8. VerticalDatum
fastinsert(connPostgres2015,'"CVs"."VerticalDatum"',{'"Term"',...
          '"Definition"'},VerticalDatum);      
      
%9. AttributeTypeCode
fastinsert(connPostgres2015,'"CVs"."AttributeTypeCode"',{'"Term"',...
          '"Definition"'},AttributeTypeCode); 
      
%10. AggregationStatistic
fastinsert(connPostgres2015,'"CVs"."AggregationStatistic"',{'"Term"',...
          '"Definition"'},AggregationStatistic);      
    
%11. InstanceStatus
fastinsert(connPostgres2015,'"CVs"."InstanceStatus"',{'"Term"',...
          '"Definition"'},InstanceStatus);        
  
%12. SeasonName
fastinsert(connPostgres2015,'"CVs"."SeasonName"',{'"Term"',...
          '"Definition"'},SeasonName);  
      
%13. Symbols
fastinsert(connPostgres2015,'"CVs"."Symbols"',{'"Term"',...
          '"Definition"'},Symbols);  
      
%14. TextControlledValues
fastinsert(connPostgres2015,'"CVs"."TextControlledValues"',{'"TextControlledValue"',...
          '"TextControlledAttribute"','"ValueDefinition"'},ControlledTextValues);        
      
%16. Units
fastinsert(connPostgres2015,'"CVs"."Units"',{'"UnitType"','"UnitName"',...
          '"UnitSystem"', '"UnitAbbreviation"'},Units);
  
%17. SpatialReference      
fastinsert(connPostgres2015,'"CVs"."SpatialReference"',{'"SRSID"','"SRSName"',...
          '"IsGeographic"','"Notes"'},SpatialReference);    
      

%18. BinaryValueMeaning      
fastinsert(connPostgres2015,'"CVs"."BinaryValueMeaning"',{'"BinaryValue"','"ValueDefinition"',...
          '"BinaryAttribute"'},BinaryValueMeaning);
%% Load metadata    
% NativeObjectCategory      
fastinsert(connPostgres2015,'"Metadata"."NativeObjectCategory"',{'"NativeObjectCategoryName"',...
            '"NativeObjectCategoryDefinition"','"NativeObjectCategoryGroup"',...
            '"ParentNativeObjectCategoryID"'},NativeObjectCategory); 
    
% NativeAttributeCategory      
fastinsert(connPostgres2015,'"Metadata"."NativeAttributeCategory"',{'"NativeAttributeCategoryName"',...
            '"NativeAttributeCategoryDefinition"','"NativeAttributeCategoryGroup"',...
            '"ParentNativeAttributeCategoryID"'},NativeAttributeCategory);         

% Organizations       
fastinsert(connPostgres2015,'"Metadata"."Organizations"',{'"OrganizationName"','"OrganizationTypeCV"',...
          '"Webpage"','"OrganizationDescription"','"ParentOrganizationID"'},Organizations);   

% People   
fastinsert(connPostgres2015,'"Metadata"."People"',{'"ContactName"',...
          '"Address"','"Email"','"Webpage"','"Phone"','"Position"','"OrganizationID"'},People);      

% Models   
 fastinsert(connPostgres2015,'"Metadata"."Models"',{'"ModelName"','"ModelWebpage"',...
           '"ModelInstanceName"','"ModelDateCreated"','"Description"','"TimeStep"',...
           '"TimeStepUnit"','"ModelStartDateTime"','"ModelEndDateTime"'},Models);    
      
% Methods   
fastinsert(connPostgres2015,'"Metadata"."Methods"',{'"MethodName"','"MethodWebpage"',...
          '"MethodDescription"','"MethodTypeCV"','"PersonID"','"ModelID"','"ParentMethodID"'},Methods);

% Sources    
fastinsert(connPostgres2015,'"Metadata"."Sources"',{'"SourceName"','"SourceWebpage"',...
          '"SourceDescription"','"Citation"','"PersonID"','"ParentSourceID"'},Sources); 
%% Load Core tables          

% 1. DataStructures
fastinsert(connPostgres2015,'"Core"."DataStructures"',{'"DataStructureName"', '"DataStructureDomainCV"', '"DataStructureWebpage"',...
        '"DataStrcutureDescription"'},DataStructures);

% 1. Object Types
fastinsert(connPostgres2015,'"Core"."ObjectTypes"',{'"NativeObjectName"','"ObjectCode"','"ObjectTopology"',...
    '"MapColor"', '"MapSymbol"' , '"Description"', '"DataStructureID"',...
    '"NativeObjectCategoryID"', '"CommonObjectTypeID"'},ObjTypes);

% 2. Attributes

fastinsert(connPostgres2015,'"Core"."Attributes"',{'"NativeAttributeName"','"UnitID"',...
          '"AttributeDescription"', '"CommonAttributeID"'},Attributes);

% 3. Object Attributes
fastinsert(connPostgres2015,'"Core"."ObjectAttributes"',{'"ObjectTypeID"','"AttributeID"',...
          '"AttributeCode"','"NativeAttributeCategoryID"'},ObjectAttributes);

% 4. Master Networks 
fastinsert(connPostgres2015,'"Core"."MasterNetworks"',{'"MasterNetworkName"','"SpatialReferenceID"',...
          '"VerticalDatumCV"','"RelatedMasterNetwork"','"Description"'},MasterNetworks);
      
% 5. Scenarios 
fastinsert(connPostgres2015,'"Core"."Scenarios"',{'"ScenarioName"','"Description"',...
          '"MasterNetworkID"'},Scenarios);
      
 % load instances
%Instances
fastinsert(connPostgres2015,'"Core"."Instances"',{'"InstanceName"','"InstanceCode"','"StatusCV"',...
          '"Longitude"','"Latitude"','"Description"',...
          '"RelatedInstanceID"'},Instances)
% this Table is loaded here right after the instances Table though the 
% Connections Table is not a Core Table. The Connections Table depends on
% the Instances Table 

% Connections 
fastinsert(connPostgres2015,'"Metadata"."Connections"',{'"LinkInstanceID"','"StartNodeInstanceID"','"EndNodeInstanceID"'},Connectivity)      

% Vertices 
fastinsert(connPostgres2015,'"Metadata"."Vertices"',{'"ConnectivityID"','"LongitudeXCoordinate"','"LatitudeYcoordinate "'},Vertices)      

% 3. load Data Storage 

fastinsert(connPostgres2015,'"Core"."DataStorage"',{'"DataStorageID"'},DataStorageID)

% 4. Load Metadata Table that maps out the forign keys 

fastinsert(connPostgres2015,'"Core"."MetadataMapping"',{'"ObjectAttributeID"','"InstanceID"','"InputOrOutput"',...
                '"SourceID"','"MethodID"', '"AttributeTypeCodeCV"','"DataStorageID"'},Metadata);   
            

fastinsert(connPostgres2015,'"Core"."SceanrioMetadata"',{'"ScenarioID"','"MetadataMappingID"'},SceanrioMetadata);   

fastinsert(connPostgres2015,'"Core"."SceanrioMetadata"',{'"ScenarioID"','"MetadataMappingID"'},SceanrioMetadata1);                    
%% Load Data Storage
fastinsert(connPostgres2015,'"Storage"."Parameters"',{'"ParameterValue"','"ParameterSubName"','"DataStorageID"'},Parameters);

fastinsert(connPostgres2015,'"Storage"."TextFree"',{'"TextFreeValue"','"DataStorageID"'},FreeText);

fastinsert(connPostgres2015,'"Storage"."TextControlled"',{'"DataStorageID"','"TextControlledValueID"'},ControlledText);
% Time series 
insert(connPostgres2015,'"Storage"."TimeSeries"',...
            {'"AggregationStatisticCV"','"AggregationInterval"',... 
            '"IntervalTimeUnitID"','"BeginDateTime"','"EndDateTime"','"IsRegular"',... 
            '"NoDataValue"','"Description"','"DataStorageID"'},TimeSeriesCUAHSI);

fastinsert(connPostgres2015,'"Storage"."TimeSeriesValues"',{'"TimeSeriesID"','"DateTimeStamp"','"Value"'},TimeSeriesData);

% Mulit Column arrays
fastinsert(connPostgres2015,'"Storage"."MultiColumnArray"',{'"ColumnNameID"','"DataStorageID"'},MultiColumnArray);

fastinsert(connPostgres2015,'"Storage"."MultiColumnValues"',{'"MultiColumnID"','"Value"','"ValueOrder"'},MultiColumnValues);     
%% Load scenario changes 


MetadataIdsQuery = sprintf(['SELECT "Core"."MetadataMapping"."MetadataMappingID"\n'... 
'FROM "Core"."MetadataMapping"\n'...
'Left JOIN "Core"."SceanrioMetadata"\n'...
'ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"\n'...
'Left JOIN "Core"."Scenarios"\n'...
'ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"\n'...
'Left JOIN "Core"."ObjectAttributes"\n'...
'ON "ObjectAttributes"."ObjectAttributeID"= "Core"."MetadataMapping"."ObjectAttributeID"\n'...
'Left JOIN "Core"."ObjectTypes"\n'... 
'ON "Core"."ObjectTypes"."ObjectTypeID"="ObjectAttributes"."ObjectTypeID"\n'...
'Left JOIN "Core"."DataStructures"\n'...
'ON "Core"."DataStructures"."DataStructureID"="Core"."ObjectTypes"."DataStructureID"\n'...
'Left JOIN  "Core"."Attributes"\n'...
'ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"\n'...
'Left JOIN "Core"."Instances"\n'...
'ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"\n'...
'WHERE\n'...
'"Core"."Scenarios"."ScenarioName"=''BaseCaseLower'' AND "Core"."Attributes"."NativeAttributeName"!=''Net Evaporation''\n'... 
'AND\n'...
'"Core"."Scenarios"."ScenarioName"=''BaseCaseLower'' AND\n'...
'"Core"."Instances"."InstanceName"!=''Barrens (20)'' AND \n'...
'"Core"."Instances"."InstanceName"!=''Transmition Link from Withdrawal Node 8 to Barrens'' AND\n'...
'"Core"."Instances"."InstanceName"!=''Transmition Link from Withdrawal Node 5 to Barrens'' AND\n'...
'"Core"."Instances"."InstanceName"!=''Transmition Link from Barrens to Dummy Junction 2''']);

CursMetadataIdsQuery = exec(connPostgres2015,MetadataIdsQuery)
CursMetadataIdsQuery = fetch(CursMetadataIdsQuery);
CursMetadataIdsQuery=CursMetadataIdsQuery.Data(:,:)
%% Load Rules data 
insert(connPostgres2015,'"Storage"."Functions "',...
            {'"FunctionVariableID"','"FunctionVariableOrder"',... 
            '"SymbolCV"','"DataStorageID"'},Functions);
%% Load data to MySQL
% First of all, connect to MySQL database 
% conn = database('WaMDaMDec23','amabdallah','amabdallah')
% close(conn)

% conn27 = database('wamdamdec27','amabdallah','amabdallah')

% conn30 = database('wamdamdec30','amabdallah','amabdallah')

conn2015 = database('WaMDaM2015','amabdallah','amabdallah')

% close(conn1)
%# add class path (if not in the class path)
p = 'C:\AdelAbdallah\PhD\CI-Water\WaM-DaM\Design Specifications 2014\ImportAutoma\postgresql-9.3-1102.jdbc4.jar';
if ~ismember(p,javaclasspath)
    javaaddpath(p)
end
dburl = sprintf('jdbc:postgresql://%s/%s','localhost','postgres');
connPostgres2015 = database('postgres','postgres','Adel2010','org.postgresql.Driver',dburl)


% Steps
% 1. load all the independent tables (Controlled vocabulary tables + Metadata tables)
% Avoid excuting the same line more than one time, otherwise, it would
% double loading the data table to the database 
fastinsert(connPostgres2015,'"CVs"."CommonAttributes"',{'"CommonAttributeName"','"Definition"',...
          '"AttributeCategoryID"'},CommonAttributes);   
%  curs=exec(connPostgres2015,['select "Term" from "CVs"."Symbols"'])
      

for mm=1:length(ObjTypes)% for some reason loading the whole table shuts down Matlab.
%    so I'm using a loop to load one row at a time! 
fastinsert(conn2015,'ObjectTypes',{'NativeObjectName', 'ObjectCode', 'ObjectTopology',...
    'MapColor', 'MapSymbol' , 'Description', 'StructureID',...
    'NativeObjectCategoryID', 'CommonObjectTypeID'},ObjTypes(mm,:));
end


fastinsert(conn2015,'Units',{'UnitType','UnitName',...
          'UnitSystem', 'UnitAbbreviation'},Units);

fastinsert(conn2015,'Attributes',{'NativeAttributeName','UnitID',...
          'Description', 'CommonAttributeID'},Attributes);

fastinsert(conn2015,'ObjectAttributes',{'ObjectID','AttributeID',...
          'NativeAttributeCategoryID'},ObjectAttributes);

      
% 2. load instances. 

%Instances
%       fidInst = fopen('c:\temp\Instances.txt','wt');
% for i = 1:size(Instances,1)
%    fprintf(fidInst,'%12.0f\n',...
%    Instances{i,1});
% end
% fclose(fidInst);
% 
% e = exec(conn,['load data local infile '...
%    ' ''C:\\temp\\Instances.txt'' into table Instances '...
%    'fields terminated by ''\t'' lines terminated '...
%    'by ''\n''']);
% close(e)   

for mc=1:length(Instances)
fastinsert(conn2015,'Instances',{'InstanceName','InstanceCode','StatusCV',...
          'Longitude','Latitude','Description',...
          'RelatedInstanceID'},Instances(mc,:))
end

fastinsert(conn2015,'Connections',{'LinkInstanceID','StartNodeInstanceID','EndNodeInstanceID'},StreamConn)      

% fastinsert(conn,'ScenarioInstances',{'InstanceID','ScenarioID'},ScenarioInstances)      
      
% 3. load Data Storage 
% fid = fopen('C:\AdelAbdallah\PhD\CI-Water\WaM-DaM\Design Specifications 2014\ImportAutoma\DataStorage.txt','wt');
% for i = 1:size(DataStorageID,1)
%    fprintf(fid,'%d \n',...
%    DataStorageID{i,1});
% end
% fclose(fid);
% 
% e = exec(conn,['load data local infile '...
%    ' ''C:\AdelAbdallah\PhD\CI-Water\WaM-DaM\Design Specifications 2014\ImportAutoma\DataStorage.txt'' into table DataStorage '...
%    'fields terminated by ''\t'' lines terminated '...
%    'by ''\n''']);
% close(e)

fastinsert(conn2015,'DataStorage',{'DataStorageID'},DataStorageID)
(1:end,:)
% 4. Load Metadata Table that maps out the forign keys 

% very slow way 

% for md=1:length(Instances)

fastinsert(conn2015,'Metadata',{'ObjectAttributeID','InstanceID','ScenarioID', 'InputOrOutput',...
                'SourceID','MethodID', 'AttributeTypeCodeCV','DataStorageID'},Metadata);
% end
% fid = fopen('C:\MetadataTEST1.txt','wt');
% for i = 1:size(Metadata,1)
%    fprintf(fid,'%d \t %d \t %d \t %s \t %s \t %d \t %d \t %d \n',...
%    Metadata{i,1},Metadata{i,2},Metadata{i,3},Metadata{i,4},Metadata{i,5},...
%    Metadata{i,6},Metadata{i,7},Metadata{i,8});
% end
% fclose(fid);
% 
% e = exec(conn,['load data local infile '...
%    ' "C:\\MetadataTEST1.txt" into table Metadata '...
%    'fields terminated by "\t" lines terminated '...
%    'by "\n"']);
% close(e)
% 
% e = exec(conn, 'select * from Metadata');
% results = fetch(e)

% 5. load data values 


fastinsert(conn2015,'ParameterData',{'ParameterValue','ParameterSubName','DataStorageID'},ParameterData);

fastinsert(conn2015,'TextDescriptorFreeData',{'TextValue','DataStorageID'},TextDescriptorFreeData);

fastinsert(conn2015,'ControlledText',{'TextValueControlled','TextAttributeName','Definition'},ControlledText);

fastinsert(conn2015,'TextDescriptorControlledData',{'DataStorageID','TextValueControlledCVID'},TextDescriptorControlledData);

% Time series 
fastinsert(conn2015,'TimeSeriesCUAHSI',{'AggregationStatisticCV','AggregationInterval',...
    'IntervalTimeUnitID','BeginDateTime','EndDateTime','IsRegular','NoDataValue',...
    'Description','DataStorageID',},TimeSeriesCUAHSI);

fastinsert(conn2015,'TimeSeriesData',{'TimeSeriesID','DateTimeStamp','Value'},TimeSeriesData);

% Mulit Column arrays
fastinsert(conn2015,'MultiColumnArray',{'ColumnNameID','ColumnName','DataStorageID'},MultiColumnArray);

fastinsert(conn2015,'MultiColumnValues',{'MultiColumnID','Value','ValueOrder'},MultiColumnValues);

close(conn)
%% NetCDF

ncid = ncdisp('geometry_cut.nc','channelElementX');
ncidstate_cut = netcdf.open('state_cut.nc','WRITE');
ncidparameter_cut = netcdf.open('parameter_cut.nc','WRITE');



