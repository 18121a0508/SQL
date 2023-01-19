USE R1
SELECT * FROM VolleyBall2002
SELECT * FROM VolleyBall2006



--Is 'M. S. Rajesh' played VolleyBall in both 2002 & 2006 ? 
select Name from VolleyBall2002 outt
WHERE outt.Name IN (select * from VolleyBall2006 inn WHERE 'M. S. Rajesh'= inn.Name)



--Is 'Tom Joseph' played VolleyBall in both 2002 & 2006 ? 
select Name from VolleyBall2002 outt
WHERE outt.Name IN (select * from VolleyBall2006 inn WHERE 'Tom Joseph'= inn.Name)



--Players Who played VolleyBall in both 2002 & 2006 
select Name from VolleyBall2002 outt
WHERE outt.Name IN (select * from VolleyBall2006 inn WHERE outt.name= inn.Name)



--coRelated sub query in SELECT
--VolleyBall Players Played in Both 2006 & 2002 
SELECT Name '2002',(select Name from VolleyBall2006 WHERE outt.name= Name)'2006' 
FROM VolleyBall2002 outt



SELECT * FROM VolleyBall2002
SELECT * FROM VolleyBall2006



DROP TABLE Employee
CREATE TABLE Employee
		(ID INT NOT NULL,Name AS 'Emp'+CAST(ID AS VARCHAR(100)) PERSISTED PRIMARY KEY,
		Department VARCHAR(255) CHECK(Department IN ('CSE','EEE','CIVIL','ME')),
		Salary INT IDENTITY(25000,5000))
INSERT INTO Employee(ID,Department) 
VALUES		(102,'EEE'),(103,'CIVIL'),(104,'EEE'),(105,'ME'),(106,'CSE'),
			(107,'EEE'),(108,'CIVIL'),(109,'EEE'),(110,'ME'),(111,'CSE'),
			(112,'EEE'),(113,'CIVIL'),(114,'EEE'),(115,'ME'),(116,'CSE'),
			(117,'EEE'),(118,'CIVIL'),(119,'EEE'),(120,'ME'),(121,'CSE'),
 			(122,'EEE'),(123,'CIVIL'),(124,'EEE'),(125,'ME'),(126,'CSE')

SELECT * FROM Employee



--Employees Who Got Highest Salary in CSE
SELECT * FROM Employee outt
WHERE outt.Salary = (SELECT MAX(Salary) FROM Employee WHERE Department='CSE')



--Employees Who Got Highest Salary in ME
SELECT * FROM Employee outt
WHERE outt.Salary = (SELECT MAX(Salary) FROM Employee WHERE Department='ME')




--Employees Highest salary department wise
SELECT * FROM Employee outt
WHERE outt.Salary = (SELECT MAX(Salary) FROM Employee WHERE Department=outt.Department)



--Corelated in SELECT 
SELECT *,(SELECT MAX(Salary) FROM Employee WHERE Department=outt.Department) MAX_salary_Dept_wise 
FROM Employee outt
ORDER BY Department



--CoRelated Sub Query IN Update
DROP TABLE IF EXISTS EmpUpdate 
SELECT * INTO EmpUpdate FROM Employee
SELECT * FROM Employee
SELECT * FROM EmpUpdate



--Updating names to Min+Department
UPDATE dbo.EmpUpdate
SET Name ='min ('+Department+')'
WHERE SALARY=(SELECT MIN(SALARY)_Max_Sal FROM Employee WHERE Department=EmpUpdate.Department)



BEGIN TRANSACTION T1



DELETE FROM EmpUpdate
WHERE SALARY=(SELECT MIN(Salary) FROM Employee WHERE Department=EmpUpdate.Department)
SELECT * FROM EmpUpdate



ROLLBACK TRANSACTION T1



--CoRelated Sub Query IN HAVING
--Departments having Max_salary = Min_Salary+100000
SELECT * FROM Employee



SELECT Department,MIN(SALARY)_MIN,MAX(SALARY)_MAX 
FROM Employee outt
GROUP BY Department
HAVING MAX(SALARY)= (SELECT MIN(Salary)+100000 
					FROM Employee 
					WHERE Department=outt.Department)



	
----SUB QUERY


--Single Row   Employee Who has min salary
SELECT * FROM EMployee
SELECT * FROM Employee WHERE Salary= (SELECT Min(SALARY) FROM Employee)



--Multi Row
--Employees from CSE Department
SELECT * FROM EMPLOYEE WHERE Department=(SELECT TOP 1 Department FROM EMPLOYEE)



--Multi COlumn
SELECT * FROM EMPLOYEE WHERE Salary > (SELECT Min(Salary) FROM Employee)



--Sub Query in FROM 

SELECT * FROM (SELECT Department,COUNT(Name) [Count],
						SUM(Salary) [Sum],
						MAX(Salary) [Max],
						MIN(Salary) [Min],
						AVG(Salary) [Avg]
				FROM EmpUpdate 
				GROUP BY Department) [Stats]

--Sub Query in SELECT 

SELECT *,(SELECT Max(Salary) FROM Employee) [max] FROM Employee


BEGIN TRANSACTION 
ROLLBACK TRANSACTION

--Sub Query in insert
INSERT INTO Employee(ID,Department) SELECT 127,'CSE'




--Sub Query in Update
SELECT * FROM Employee


BEGIN TRANSACTION 
ROLLBACK TRANSACTION

--Setting Name = min(CSE) for Min salary getting employee in CSE 
Update EmpUpdate
SET Name = 'min(CSE)'
WHERE Department='CSE' AND SALARY = (SELECT Min(SALARY) FROM Employee)



BEGIN TRANSACTION 
ROLLBACK TRANSACTION

SELECT * FROM Employee

DELETE FROM Employee
WHERE Salary = (SELECT MIN(Salary) FROM EmpUpdate)

SELECT COUNT(Name),Sum(Salary) FROM Employee
GROUP BY Department


SELECT * FROM EMployee
SELECT CASE WHEN ID THEN 'Rasheed' END FROM  Employee