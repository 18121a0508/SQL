
DROP TABLE EMPLOYEE
CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(400),
LastName VARCHAR(400),
UserName VARCHAR(400) UNIQUE NOT NULL,
CountryID INT foreign key references Country(CountryID),
Gender VARCHAR(255) CHECK(Gender IN ('Male','Female')),
Email VARCHAR(400) UNIQUE NOT NULL,
Mobile VARCHAR(400) UNIQUE CHECK(LEN(Mobile)=10),
DateOfBirth DATE NOT NULL,
Password VARCHAR(400) UNIQUE CHECK(Password LIKE '%[A-Z]%[a-z]%[0-9]%[!@#$%^&*()-_+=.,]' AND LEN(Password)>7))

CREATE TABLE Event_Table(
EmployeeId INT FOREIGN KEY REFERENCES Employee(EmployeeID),
EventDate DATE,
NameOfEvent VARCHAR(MAX),
AddTitle VARCHAR(MAX),
RepeatMode VARCHAR(MAX) CHECK(RepeatMode IN ('Every WeekDay(Mon-Fri)','Daily','Weekly','Monthly', 'Custom')),
StartTime TIME,
EndTime TIME,
ShowAS VARCHAR(200) CHECK(ShowAS IN ('Busy', 'Tentative','Free','Out Of Office')),
AddMembers VARCHAR(MAX),
Descriptions VARCHAR(MAX)
)

CREATE TABLE Task(
Task_id INT PRIMARY KEY IDENTITY(1,1),
Task_name VARCHAR(MAX) NOT NULL,[Status] VARCHAR(MAX) NOT NULL,
[Priority] varchar(max) NOT NULL,Task_Assignedon DATETIME NOT NULL,Task_Deadline DATETIME NOT NULL,Startime TIME NOT NULL,
Endtime TIME,Resumetime TIME,Additional_Notes VARCHAR(MAX) );

CREATE TABLE Project(Project_ID INT PRIMARY KEY IDENTITY(1,1),Project_name VARCHAR(MAX),Task_id INT,
Project_Assignedon DATETIME,Project_deadline DATETIME,
 FOREIGN KEY (Task_id) REFERENCES Task(Task_id));

 CREATE TABLE COUNTRY(
		CountryID INT Primary Key,
		CountryCode VARCHAR(10),
		CountryName VARCHAR(50) );

CREATE TABLE EmployeeProject(
EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
ProjectID INT FOREIGN KEY REFERENCES Project(Project_ID)
)
