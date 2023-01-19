

USE R1
--DENSE_RANK Without using Window Functions order by only salary
SELECT *,(SELECT COUNT(DISTINCT Salary) FROM EmpDense WHERE Salary<=outt.Salary) [DENSE_RANK]  
FROM EmpDense outt
ORDER BY Salary



--DENSE_RANK Without using Window Functions order by only salary DESC
SELECT *,(SELECT COUNT(DISTINCT SALARY) FROM EmpDense WHERE Salary>=E.Salary)[DENSE_RANK] FROM EmpDense E
--ORDER BY Salary DESC




--DENSE_RANK include partition BY
SELECT *,(SELECT COUNT(DISTINCT SALARY) FROM Employee WHERE Department=E.Department AND Salary<=E.Salary) [Dense_Rank] 
FROM Employee E
ORDER BY Department,Salary




----Rank implementation with out using Window Functions Salary Ascending Order
SELECT *,(SELECT COUNT(Salary)+1 FROM EmpDense WHERE Salary<E.Salary) [Rank] FROM EmpDense E
--ORDER BY Salary



--Rank Include Partition By Without Rank
SELECT *,(SELECT COUNT(Salary)+1 FROM EmployeeNew WHERE Department=E.Department AND Salary>E.Salary) [Ranking Department Asc,Salary Desc] 
FROM EmployeeNew E
ORDER BY Department,SALARY DESC




--RANKING Department Ascending Order
SELECT *,(SELECT COUNT(Department)+1 FROM Employee WHERE Department<E.Department)[Ranking Department Asc] 
FROM Employee E
ORDER BY Department

