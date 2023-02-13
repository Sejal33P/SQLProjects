use StudentExperimentalDatabase;
Create table dbo.PurohitPatient
(
PatientID       int identity(1,1) not null,
FirstName        varchar (30) null,
LastName         varchar (30) null,
BirthDate        date null,
PhoneNumber      varchar(10)
Primary Key (PatientID)
)

Create table dbo.PurohitNurse
(
NurseID       int identity(1,1) not null,
FirstName        varchar (30) null,
LastName         varchar (30) null,
StateLicensedIn  varchar (30) null,
LicenseNumber    varchar (10) null,
PhoneNumber      varchar(10)
Primary Key (NurseID)
)

Create table dbo.PurohitVisit
(
VisitID                           int identity(1,1) not null,
NursingNotes                      varchar (30) null,
VisitStartDate					  date null,
VisitEndDate					  date,
PatientFK						  int not null,
NurseFK							  int not null,
Foreign Key (PatientFK) References dbo.PurohitPatient(PatientID),
Foreign Key (NurseFK) References dbo.PurohitNurse(NurseID),
Primary Key (VisitID)
)


Insert into dbo.PurohitPatient
(
FirstName,     
LastName,        
BirthDate,       
PhoneNumber
)
Values
('Ron',
'Wesely',
'11/12/1990',
'6784567898'
)

Insert into dbo.PurohitPatient
(
FirstName,     
LastName,        
BirthDate,       
PhoneNumber
)
Values
('Hermione',
'Granger',
'07/22/1991',
'8584565681'
)

Insert into dbo.PurohitPatient
(
FirstName,     
LastName,        
BirthDate,       
PhoneNumber
)
Values
('Harry',
'Potter',
'12/9/1990',
'9871235675'
)

Insert into dbo.PurohitPatient
(
FirstName,     
LastName,        
BirthDate,       
PhoneNumber
)
Values
('Neville',
'Longbottom',
'03/04/1989',
'773999227'
)

Insert into dbo.PurohitNurse
(       
FirstName,        
LastName,         
StateLicensedIn,  
LicenseNumber,    
PhoneNumber      
)
Values
(
'Severus',
'Snape',
'New York ',
'N-78',
'5557775757'
)

Insert into dbo.PurohitNurse
(       
FirstName,        
LastName,         
StateLicensedIn,  
LicenseNumber,    
PhoneNumber      
)
Values
(
'Rubeus',
'Hagrid',
'Florida',
'N-38',
'6767676753'
)

Insert into dbo.PurohitNurse
(       
FirstName,        
LastName,         
StateLicensedIn,  
LicenseNumber,    
PhoneNumber      
)
Values
(
'Albus',
'Dumbeldore',
'Arizona',
'N-902',
'4987612380'
)

Insert into dbo.PurohitVisit
(                       
NursingNotes,                     
PatientFK,      
NurseFK,      
VisitStartDate,					  
VisitEndDate					  
)
Values
(
'Ulcers found',
'2',
'3',
'07-08-2002',
'08-10-2002'
)

Insert into dbo.PurohitVisit
(                       
NursingNotes,                     
PatientFK,      
NurseFK,      
VisitStartDate,					  
VisitEndDate					  
)
Values
(
'Muscle Soreness',
'1',
'1',
'01-25-2005',
'08-17-2007'
)

Insert into dbo.PurohitVisit
(                       
NursingNotes,                     
PatientFK,      
NurseFK,      
VisitStartDate,					  
VisitEndDate					  
)
Values
(
'Breathing Difficulties',
'3',
'1',
'12-02-2010',
'10-03-2012'
)

-- Queries
select VisitStartDate from dbo.PurohitVisit where VisitStartDate > '2005';

select p.PatientID, p.firstname, p.lastname, n.FirstName as 'Nurse First Name', n.LastName as 'Nurse Last Name', v.NursingNotes, v.VisitStartDate from  PurohitPatient p
join PurohitVisit v
on p.PatientID = v.PatientFK
join PurohitNurse n
on n.NurseID = v.NurseFK;

select firstname, lastname, birthdate from PurohitPatient where birthdate between '1990' and '2010'

select p.PatientID, p.firstname, p.lastname, v.VisitStartDate, v.VisitEndDate from PurohitPatient p
join PurohitVisit v
on p.PatientID= v.PatientFK
