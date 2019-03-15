drop table TechnicalSchool
drop table University
drop table EducationInstitution
drop table Scholorship
drop table JobListing
drop table UserInterest
drop table OpportunityEntity
drop table Organization
drop table Student
drop table Parent
drop table School
drop table Password
drop table UserEntity

create table UserEntity (
UserEntityID int  identity(1,1) not null,
UserName varchar(50) not null,
EmailAddress varchar (255) not null,
EntityType varchar (10) not null,
Primary Key (UserEntityID)
);

create table Password (
PasswordID int not null,
PasswordHash varchar(50) not null,
PasswordSalt varchar(50) not null,
UserEntityID int not null,
LastUpdated datetime,
Primary Key (PasswordID),
Foreign Key (UserEntityID) references UserEntity (UserEntityID)
); 

Create table School(
SchoolEntityID int not null,
SchoolName varchar (50) not null,
StreetAddress varchar (50) not null,
Country varchar (50) not null,
City varchar (50) not null,
State varchar (50) not null,
ZipCode int not null,
SchoolEntityType varchar(1) not null,
SchoolUserOccupation varchar(50),
primary key (SchoolEntityID),
Foreign key (SchoolEntityID) references UserEntity (UserEntityID)
);

Create table Parent (
ParentEntityID int not null,
FirstName varchar (50),
LastName varchar (50) not null,
MiddleName varchar (50) not null,
StreetAddress varchar (50) not null,
Country varchar (50) not null,
City varchar (50) not null,
State varchar (50) not null,
ZipCode int not null,
primary key (ParentEntityID)
);

Create table Student (
StudentEntityID int not null,
FirstName varchar (50) not null,
LastName varchar (50) not null,
MiddleName varchar (50) not null,
StreetAddress varchar (50) not null,
Country varchar (50) not null,
City varchar (50) not null,
State varchar (50) not null,
ZipCode int not null,
StudentGradeLevel varchar (25) not null,
StudentGPA decimal not null,
StudentACTScore int null,
StudentSATScore int null,
ParentEntityID int null, --parent might not be associated with anything
SchoolEntityID int not null, --student needs to be associated with a school 
primary key (StudentEntityID),
Foreign key (StudentEntityID) references UserEntity (UserEntityID),
Foreign key (ParentEntityID) references Parent (ParentEntityID),
Foreign key (SchoolEntityID) references School (SchoolEntityID)
);

Create table Organization (
OrganizationEntityID int not null,
OrganizationName varchar (50) not null,
OrganizationDescription varchar(255) not null,
StreetAddress varchar (50) not null,
Country varchar (50) not null,
City varchar (50) not null,
State varchar (50) not null,
ZipCode int not null,
primary key (OrganizationEntityID),
Foreign key (OrganizationEntityID) references UserEntity (UserEntityID)
);


Create table OpportunityEntity (
OpportunityID int identity(1,1) not null,
OpportunityType varchar(3) not null,
Primary Key (OpportunityID),
);

Create table UserInterest (
UserInterestID int not null,
UserEntityID int not null,
OpportunityID int not null,
Primary Key (UserInterestID),
Foreign Key (UserEntityID) references UserEntity (UserEntityID),
Foreign Key (OpportunityID) references OpportunityEntity (OpportunityID),
);

Create Table JobListing (
JobListingID int not null,
JobTitle varchar(50) not null,
JobDescription varchar(255) not null,
JobType varchar(10) not null,
Location varchar(35) not null,
PostingDate datetime not null,
Deadline datetime not null,
LastUpdated datetime not null,
Approved varchar(3) not null,
NumOfApplicants int not null,
OrganizationID int not null,
Primary Key (JobListingID),
Foreign Key (OrganizationID) references Organization (OrganizationEntityID),
);

Create Table Scholorship (
ScholarshipID int not null,
ScholarshipName varchar(50) not null,
ScholarshipDescription varchar(255) not null,
ScholarshipMin money not null,
ScholarshipMax money not null,
ScholarshipQuantity int not null,
ScholarshipDueDate datetime not null,
OrganizationID int not null,
Approved varchar(3) not null,
LastUpdated datetime not null,
Primary Key (ScholarshipID),
Foreign Key (OrganizationID) references Organization (OrganizationEntityID),
) ;

Create table EducationInstitution (
HigherEducationID int not null,
EducationInsitutionName varchar(50) not null,
ApplicationDueDate datetime not null,
StreetAddress varchar (50) not null,
Country varchar (50) not null,
City varchar (50) not null,
State varchar (50) not null,
ZipCode int not null,
InstateTutition money not null,
OutOfStateTutition money not null,
UnversityType varchar(10),
Primary Key (HigherEducationID)
);

Create Table University (
UnversityID int not null,
GPARequirement decimal not null,
SATRequirement int not null,
ACTRequirement int not null,
Primary Key (UnversityID),
Foreign Key (UnversityID) references EducationInstitution (HigherEducationID),
) ;
 

Create Table TechnicalSchool (
TechnicalSchoolID int not null,
TechnicalSchoolSkill varchar(50) not null,
Description varchar(50) not null,
Primary Key (TechnicalSchoolID),
Foreign Key (TechnicalSchoolID) references EducationInstitution (HigherEducationID),
);


insert into OpportunityEntity values ('hi')