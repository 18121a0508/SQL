--CTE Common Table Expressions


SELECT	*,(SELECT COUNT(ID) FROM Employee WHERE Department=outt.Department Group By Department) Emp_count,
		(SELECT MAX(SALARY) FROM Employee WHERE Department=outt.Department Group By Department) MAX_salary, 
		(SELECT SUM(SALARY) FROM Employee WHERE Department=outt.Department Group By Department) SUM_salary
FROM Employee outt


--Using Aggregate Functions
SELECT *,AVG(SALARY) OVER (PARTITION BY Department) Avg_Salary,
		COUNT(ID) OVER (PARTITION BY Department) Emp_Count,
		SUM(Salary) OVER (PARTITION BY Department) Sum_Salary
FROM Employee 


--CTE BEFORE SELECT 
WITH CTE AS (SELECT Department,COUNT(ID) Emp_Count,MAX(SALARY) Max_Salary,MIN(SALARY) Min_Salary,SUM(SALARY) Sum_Salary
				FROM Employee 
				GROUP BY Department
			)
	SELECT E.*,CTE.* 
	FROM CTE 
	JOIN Employee E ON CTE.Department=E.Department 


--CTE BEFORE INSERT
WITH CTE AS (
			SELECT * FROM ExamResult
			)
INSERT INTO ExamResult SELECT StudentName,'Physics',Marks-20
						FROM CTE
GO
SELECT * FROM ExamResult



--CTE BEFORE DELETE
WITH CTE AS (
			SELECT * FROM ExamResult
			)
DELETE FROM CTE WHERE Subject='Physics'
GO
SELECT * FROM ExamResult



--RECURSIVE CTE



--Display Numbers From 1

WITH RecursiveDisplayNum(n) AS
(
	SELECT 1
	UNION ALL 
	SELECT 1 
		FROM RecursiveDisplayNum 
	WHERE n<101
)
SELECT n FROM RecursiveDisplayNum



--EVEN/ODD
with RecursiveEVEN(n,[EVEN or ODD]) AS
(
	SELECT 0,CASE WHEN 0%2=0 THEN 'Even' ELSE 'ODD' END
	UNION ALL
	SELECT n+1, CASE WHEN (n+1)%2=0 THEN 'Even' ELSE 'ODD' END 
	FROM RecursiveEVEN
	WHERE n<99
)
SELECT * FROM RecursiveEVEN --OPTION(MAXRECURSION 80)

--msg 530, level 16, state 1, line 49
--the statement terminated. the maximum recursion 100 has been exhausted before statement completion.

SELECT * FROM Employee

SELECT * FROM EmpDense


WITH CTE AS 
(
	SELECT * FROM VolleyBall2002 
	UNION ALL
	SELECT * FROM VolleyBall2006 WHERE Name IS NULL
)
SELECT * FROM CTE --OPTION (MAXRECURSION 99)



WITH RecursiveCTE(n) AS
	(
	SELECT n=1
	UNION ALL
	SELECT n+1 FROM RecursiveCTE WHERE n<10
	)
SELECT n FROM RecursiveCTE
