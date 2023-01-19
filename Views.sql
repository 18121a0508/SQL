--'CREATE/ALTER VIEW' does not allow specifying the database name as a prefix to the object name.
CREATE VIEW T20.dbo.rasheed
AS
SELECT * FROM Employee


CREATE TABLE T20.dbo.table1(ID INT)


DROP VIEW View1
CREATE VIEW dbo.View1 AS
SELECT ID,Department,Salary FROM Employee


SELECT * FROM sys.sysusers 

--Cannot create index on view 'View1' because the view is not schema bound.
CREATE CLUSTERED INDEX IX1 ON View1(ID)



--Cannot schema bind view 'View1' because name 'Employee' is invalid for schema binding. 
--Names must be in two-part format and an object cannot reference itself.


CREATE VIEW View1 WITH SCHEMABINDING
AS
SELECT ID,Department,Salary FROM Employee


DROP View View1

SELECT * FROM org

CREATE VIEW View1 WITH SCHEMABINDING
AS
SELECT ID,Department,Salary FROM dbo.org




SELECT * FROM View1 WHERE Department='CSE'


GO
CREATE UNIQUE CLUSTERED INDEX IX1 ON View1(ID)
GO
SELECT * FROM View1 WHERE Department='CSE'

GO


SELECT * FROM View1 WITH (NOEXPAND) WHERE Department='CSE'


GO
CREATE UNIQUE NONCLUSTERED INDEX IX2 ON View1(Salary)



--DML Operations
Update View1
SET Salary = 25000
WHERE ID = 21

DROP View View1

SELECT * FROM View1

INSERT INTO View1 VALUES(10,'ME',12500)

SELECT * FROM org


DELETE FROM org WHERE ID = 10





--Creating Views on Temporary Table
CREATE TABLE Patients
(
   ID int,
   Name VARCHAR (20),
   blood_group VARCHAR (20)
)
GO
INSERT INTO Patients
VALUES (1, 'Mark', 'O+'),
(2, 'Fred', 'A-'),
(3, 'Joe', 'AB+'),
(4, 'Elice', 'B+'),
(5, 'Marry', 'O-')
GO
SELECT * FROM Patients
GO
CREATE VIEW PatientView AS
SELECT ID,name,blood_group FROM patients
GO
SELECT * FROM PatientView
GO 
--we create table, then view and then try to drop table 

--DROP TABLE patients
SELECT * FROM PatientView  --VIEW still Exists

DROP VIEW PatientView

--Trying to rename View
EXEC sp_rename 'PatientsView','PatientView'

--Tried to rename column inside VIEW
EXEC sp_rename 'patientView.ID', 'EID', 'Column'

SELECT * FROM PatientView
SELECT * FROM patients

SELECT * FROM patients

--Renaming column name inside table which referenced to VIEW
EXEC sp_rename 'patients.name', 'PatientName', 'COLUMN'
SELECT * FROM patients








