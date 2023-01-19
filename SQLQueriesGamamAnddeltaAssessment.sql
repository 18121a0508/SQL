/* SQL test Gamma And Delta Team
 
Data Model 
	Employee {EmpID,  Name ,  DOB,  DOJ,  DateofSeperation,  CurrentDesignationID, 
			BusinessUnitID   ManagerID }  ManagerID :  Refferes to Employee.EmPID 
	Client  { ClientID, ClientName , City , Province, Country }
	Project {ProjectID,ProjectName,ClientID,StartDate,EndDate , ManagerID }
	EmployeeProject { EmpID,ProjectID,StartDate,EndDate, RateCardID, BillableHours  , AllocatedWorkHours   }   :   
		Billable Hours   would be from 0 or 8 
	AllocatedWorkHours   :  Allocated Work Hours is Daily average no of hours to be spent on the Project 
	Ratecard {RateCardID,BillingType, BillingRate }  BillingType :   Values would be Hourly , Daily ,  Weekly, Monthly  
	Designation {DesignationID, DesignationName  Grade}   Grade will be L01 to L16   , higher the grade higher the designation 
	BusinessUnit {BusinessUnitID, BusinessUnitName , City, Province , Country } 

*/
/**START Q 01**********************************************************************************************************************************************************
Refer the data model  shared and write a Query  to display  Information of all employees who are working in USA
EmpID , Name ,DOJ, DesignationName,  BusinessunitName ,  City, Province, Country  

*/

SELECT  
	E.EMPID, E.Name , E.DOJ  ,  D.DesignationName, B.BusinessUnitName , B.City, B.Province , B.Country
FROM Employee E
INNER JOIN  Designation D ON E.CurrentDesignationID = D.DesignationID
INNER JOIN  BusinessUnit B ON E.BusinessUnitID = B.BusinessUnitID
WHERE  Country= 'USA'

/*	Common observations
	1. Country Like '%USA%'  Country Like 'USA%'   , when the need to match on full word we should not user partial match
			There are two issue with above usage , 
			1. partial matches  could return rows which are not as per requirement 
			2.Like operation '%USA%' or '%USA' even if we have index on Country it will not be of any use!  
			   for 'USA%' it is of some use however cost of operation will be higher than  using ='s operator. 
		 
		
	2. Country = "USA"  or Country LIKE "%USA%"  : Incorrect in SQL server string literals should be enclosed in single quotes and not double quotes   
	3. Some people are using in line query for fetching Designation Name or Business Unit Name ,  Inline queries shall be used only if a Normal Join cannot be used. 
	4. usage of inline Queries is an indication of Gaps in understanding of SQL

*END Q 01*************************************************************************************************************************************************************/

/****START Q 02*****************************************************************************************************************************************************

Refer the data model shared and write a Query  to display  employees information along with client and info of Project for which they are currently working.   
EmpID , Name ,DOJ, ManagerName, ClientName,  ProjectName,  BillingType , BillingRate 
Current projects of an employee can be fetched from EmployeeProject where todays date falls between Start and EndDates, Note EndDate Could be null  for some rows where project end date is not known           
*/

SELECT  
E.EmpID , E.Name ,E.DOJ, Mgr.Name ManagerName, C.ClientName,  P.ProjectName,  R.BillingType , R.BillingRate 

FROM EMPLOYEE  E
LEFT JOIN EMPLOYEE  Mgr On E.ManagerID =  Mgr.EmpID   
/*
    Employee (E.EmpID)'S Manager is (E.ManagerID) to Get Managers Name we need to lookup employeeTable again to Get Name of (E.ManagerID)
  Let us take Mgr as alias for employee to represent Manager , know we need to look up Mgr alias to find a the row containing the Employee Information of the Manager 
  Know join will be E.ManagerID =  Mgr.EmpID , Hear we should not use inner Join because head of the organization will not have a Manager! when we use inner Join one rows will be missed    
*/
LEFT JOIN  EmployeeProject EP  ON EP.EMPID = E.EMPID   --- To get employee Project we need to Join EmployeeProject Based on EMPID
AND  GetDate() BETWEEN   EP.StartDate   AND  ISNULL(EP.ENDDate,Getdate()) 
/* 
		why Left Join  : All Missed below business scenario  
		Not all employees will be on a Project   
		Employees from supporting departments  will never be associated with a project 
		While implementing any code we need to think all Possible business scenarios  

		Current Project Filter Dates : People have made inaccurate Assumptions or missed business scenarios 
		1. EndDate > Getdate() ENdDate is null does not always mean the project is current,  it could be about projects which will start in Near feature!
		2. So Right filter is StartDate <= getdate() AND (EndDate >=   Getdate()  OR  END Date IS NULL )
		which can be written as  StartDate <= getdate()  AND  ISNULL(ENDDate,Getdate()) >=  GetDate()
		OR getdate() BETWEEN  StartDate   AND  ISNULL(ENDDate,GETDATE()) 
*/
INNER JOIN  Project P  ON EP.ProjectID = P.ProjectID  
INNER JOIN  Client C   ON C.ClientID = P.ClientID 
INNER JOIN  RateCard R   ON EP.RateCardID  = R.RateCardID 

/*END Q 02*************************************************************************************************************************************************************/

/****START Q 03*****************************************************************************************************************************************************
Write a query to display    ClientName, ProjectName,  No of Project  by client  , No of distinct Employees who worked on the Project ,  No of distinct Employees who worked for the  Client. 

*/

/*
	In this we need Aggregates at two different Grains  One is at Client Level and one is at Project  Level 
	
*/

/* Start Q 03 Version 1 :Appt approach for the scenario ****************************************************************************************************************************************************************/
   -- Version with out comments 
	SELECT 
		C.ClientID ,  ClientMetrics.ProjectsByClient , ClientMetrics.EmployeesByClient , ProjectMetrics.EmployeesByProject 
	FROM
	(
		SELECT  Project.CLientID,	
			Count(Distinct Project.ProjectID )  ProjectsByClient ,  
			Count(Distinct EmployeeProject.EmpID)  EmployeesByClient   
		FROM PROJECT  LEFT JOIN EmployeePROJECT  ON EMployeeProject.ProjectID  =   Project.ProjectID  
		GROUP BY Project.CLientID
	)  ClientMetrics  
	LEFT JOIN    
	(
		SELECT  Project.CLientID, PROJECT.ProjectName  , 
		Count(Distinct EMployeeProject.EMPID )  EmployeesByProject   
		FROM EMployeeProject  INNER JOIn PROJECT  ON EMployeeProject.ProjectID  =   Project.ProjectID  
		GROUP BY Project.CLientID, PROJECT.ProjectName    
    )  ProjectMetrics   
	ON  ClientMetrics.ClientID = ProjectMetrics.ClientID
	INNER JOIN Client C  ON ClientMetrics.ClientID =C.CLientID  


	--- Versions with comments to explain the query  
	SELECT 
		C.ClientID ,  ClientMetrics.ProjectsByClient , ClientMetrics.EmployeesByClient , ProjectMetrics.EmployeesByProject 
	FROM
	(
		---  Query derives Needed aggregates at Client Level,  	
		SELECT  Project.CLientID,	
			Count(Distinct Project.ProjectID )  ProjectsByClient ,  
				/*			
					1. a project would have  1 or more employees os  to count no of project we need to do distinct of project ID
					2. We need to count distinct of Project.ProjectID and Not EmployeeProject.ProjectID , because all Projects in project Table might not have Employees allocated yet
					3.  Thuough we are counting Project.ProjectID  as we are joining with employeeProjects result result would have one row per each row in EmployeeProject   
				*/

			Count(Distinct EmployeeProject.EmpID)  EmployeesByClient   

			/*   We need to use distinct in above count operation as EmployeeProject can have multiple rows for an employee in below business scenarios 
				1. Employee Can be moved from full billability to Partially billability or vice versa
				2. Client can stop and restart a project  
				3. An employee can be Rolled off temporally and brought back 
				4. Employee can work with the same project at different times 
				5. Billing rate card of employee can change from time to time 
			*/			
		FROM PROJECT  LEFT JOIN EmployeePROJECT  ON EMployeeProject.ProjectID  =   Project.ProjectID  
			-- As not all projects can have employee allocation yet, we need to do a left join on EmployeePROJECT to avoid excluding such Projects 
		GROUP BY Project.CLientID
			---  Query is valid only when every non aggregate column used in select is in Group by most people have not followed this basic rule 
    )  ClientMetrics  
	LEFT JOIN    
	--- For a new clinet we may have projectcreated, and No employee is  onboarded a yet so left join will ensure such rows are not eliminated 
	(
		---  Query derives Needed aggregates at Project Level ,  
		---CleintID of project is included to enable combining Client Level aggregates with Project level aggregates 
	
		SELECT  Project.CLientID, PROJECT.ProjectName  , 
			Count(Distinct EMployeeProject.EMPID )  EmployeesByProject   
			/*   See above explination for using distinct 
			*/			
		FROM EMployeeProject  INNER JOIn PROJECT  ON EMployeeProject.ProjectID  =   Project.ProjectID  
		GROUP BY Project.CLientID, PROJECT.ProjectName    
			---  Query is valid only when every non aggregate column used in select is in Group by most people have not followed this basic rule 
    )  ProjectMetrics   
	ON  ClientMetrics.ClientID = ProjectMetrics.ClientID
	INNER JOIN Client C  ON ClientMetrics.ClientID =C.CLientID  
	--  while Grouping ClientName is irrelavnt so we can join CLient after we have derived the needed metrics in respective derived queries  

/* END Q 03 Version 1 :Appt approach for the scenario ****************************************************************************************************************************************************************/

/* Start Q 03 Version 2 with Outer Apply****************************************************************************************************************************************************************/
	
	
SELECT PROJECT.ProjectName  , Clinet.ClientName  ,EmployeeByProject, EmployeeByClient , Count(1)  Over(Partition By ClientName) ProjectsByCLient 
FROM PROJECT  
INNER JOIN Client  ON Project.ClientID = Client.ClientID 
OUTER APPLY 
(
	SELECT   EmployeeProject.ProjectID ,  Count(Distinct EmpID ) EmployeeByProject  
	FROM  EmployeeProject  
	WHERE EmployeeProject.ProjectID =Project.ProjectID    
	GROUP  BY P1.ProjectID 
) P
OUTER APPLY 
(
	SELECT   Count(Distinct EmpID ) EmployeeByClient   
	FROM  EmployeeProject  
	WHERE EmployeeProject.ProjectID =Project.ProjectID
) C

/* END Q 03 Version 2 ****************************************************************************************************************************************************************/

/* Start Q 03 Version 3 with in Line queries****************************************************************************************************************************************************************/
	
SELECT 

PROJECT.ProjectName  , Clinet.ClientName  ,EmployeeByProject, EmployeeByClient 

, Count(1)  Over(Partition By ClientName) ProjectsByCLient 
,
(
	SELECT     Count(Distinct EmpID ) 
	FROM  EmployeeProject  
	WHERE EmployeeProject.ProjectID =Project.ProjectID    
) EmployeeByProject  

,
(
	SELECT     Count(Distinct EmpID ) 
	FROM  Project P1 
	INNER JOIN  EmployeeProject   ON EmployeeProject.ProjectID =P1.ProjectID
	WHERE P1.ClientID=Project.ClientID 
) EmployeeByClient   

FROM PROJECT  
INNER JOIN Client  ON Project.ClientID = Client.ClientID 

/* END Q 03 Version 2 ****************************************************************************************************************************************************************/


/* Start Q 03 Version 4 with window funtion****************************************************************************************************************************************************************/
/*  many people attemted this approch , but this does not work for the given requirment 
*/

	---Note : People tried Count distinct with window function however that is not supported  

		SELECT  
			Project.ProjectName,Client.CLientName 	
			,	Count(Project.ProjectID) Over (Partition BY Project.ClientID)  
				---   for projects with multiple employee rows the project is counted multiple times so does not meet requirement 
			,Count(EmployeeProject.EmpID ) Over (Partition BY Project.ClientID)        EmployeesByClient 

			--- See Version 1 comment employee can have multiple rows per project once hence does not meet distinct count requirement 
			,Count(EmployeeProject.EmpID ) Over (Partition BY Project.Project)        EmployeesByProject  --same as above does not meet requirement   

		FROM PROJECT  
		INNER JOIN Client  On Project.ClientID =Client.ClientID  
		LEFT JOIN EmployeePROJECT  ON EMployeeProject.ProjectID  =   Project.ProjectID  
		


		SELECT  
			Project.ProjectName,Client.CLientName 	
			,Count(distinct EmployeeProject.EmpID ) EmployesbyProject --- correct   
			, Count(1) Over(Partition BY CLientName) ProjectsByClient --- correct 

			, SUM(Count(distinct EmployeeProject.EmpID ) ) Over(Partition BY CLientName) EmployeesByClient --- in correct 
			 -- if an employee worked in two or more project or a client  employee row will be counted multiple times --  Sum of Distinct count cannot give distinct out at hogher grain 

		FROM PROJECT  
		INNER JOIN Client  On Project.ClientID =Client.ClientID  
		LEFT JOIN EmployeePROJECT  ON EMployeeProject.ProjectID  =   Project.ProjectID  
		GROUP BY 	Project.ProjectName,Client.CLientName 	
		
	--- So window funtion does not meet the current query scenario  


/* Start Q 03 Version 4 ****************************************************************************************************************************************************************/

/*END Q 03*************************************************************************************************************************************************************/

/*Start Q 04*************************************************************************************************************************************************************/


/*
Refer to the shared data model and write  a Procedure  to search for employees based on   Country , City , BillingRate , ClientName 

All parameters are optional, User shall pass at least one parameter , if no parameter is passed procedure should return zero rows.  
User would enter a Part of Name , so all filters should use starts with search.  
Procedure has to support pagination to all application to fetch data for a particular page. 
 
Attributes to display 
EMPID , EmployeeName , DOB ,  ClientName , ProjectName ,  BillingType , BillingRate , DesignationName, BusinessUnitName, City, Country,  ClientCountry.    
*/


/*Start  Q 04 Version 1 Dynamic Query*************************************************************************************************************************************************************/

	CREATE PROCEDURE SP_GetEmployee 
	(
		 @Country NVARCHAR(50) = NULL, @City NVARCHAR(50) = NULL, @BillingRate INT = NULL, @ClientName NVARCHAR(50) = NULL
		 ---  For a parameter to be Optional  we need to  initiate it to a value  in declaration ,  better to set it to null
		 ,@PageNumber Int = 1, @RowsPerPage Int = 50
	)
	AS
	BEGIN
		Declare @SQL  NVARCHAR(MAX)


		Declare @Filter  NVARCHAR(MAX)

		SET @SQL = '
		SELECT  E.EMPID , E.Name , E.DOB ,  C.ClientName , P.ProjectName ,  R.BillingType , R.BillingRate , D.DesignationName, B.BusinessUnitName, B.City, B.Country,  B.ClientCountry.    
		FROM EMPLOYEE  E		
		LEFT JOIN  EmployeeProject EP  ON EP.EMPID = E.EMPID   --- To get employee Project we need to Join EmployeeProject Based on EMPID
		INNER JOIN  Project P  ON EP.ProjectID = P.ProjectID  
		INNER JOIN  Client C   ON C.ClientID = P.ClientID 
		INNER JOIN  RateCard R   ON EP.RateCardID  = R.RateCardID 
		INNER JOIN  Designation D ON E.CurrentDesignationID = D.DesignationID
		INNER JOIN  BusinessUnit B ON E.BusinessUnitID = B.BusinessUnitID 
		

		'  
		SET @Filter = ''

		IF @Country IS NOT NULL 
			SET @Filter  =   ' B.Country LIKE + @COuntry1 + ''%''' 
		IF @City IS NOT NULL 
				SET @Filter  =   @Filter  + CASE WHEN @Filter ='' THEN  '' ELSE ' AND ' END +   ' B.City LIKE + @City1 + ''%''' 
		IF @ClientName  IS NOT NULL 
				SET @Filter  =   @Filter  + CASE WHEN @Filter ='' THEN  '' ELSE ' AND ' END +   ' C.ClientName  LIKE + @ClientName1  + ''%''' 
		IF @BillingRate  IS NOT NULL 
				SET @Filter  =   @Filter  + CASE WHEN @Filter ='' THEN  '' ELSE ' AND ' END +   ' R.BillingRate  =@BillingRate1  ' 
		
		IF @Filter = ''  
			SET @Filter   = ' 1=2 '  -- to retrun no rows if no parameter is passed   


	   SET  @SQL  = @SQL  + ' WHERE  ' + @Filter  + ' ORDER BY EMPID 
					OFFSET (@PageNumber1-1)*@RowsOfPage1 ROWS
					FETCH NEXT @RowsOfPage1 ROWS ONLY '  

		EXEC SP_ExecuteSQL  @SQL  ,  N'@Country1 NVARCHAR(50), @City1 NVARCHAR(50), @BillingRate1 INT,@ClientName1 NVARCHAR(50)
				,@PageNumber1 Int, @RowsPerPage1' , @Country1 =@Country, @City1 =@City , @BillingRate1=@BillingRate,@ClientName1=@ClientName
				,@PageNumber1=@PageNumber , @RowsPerPage1=@RowsPerPage 
	

	END
/*END  Q 04 Version 1 Dynamic Query*************************************************************************************************************************************************************/


/*Start  Q 04 Version 2 Dynamic Query*************************************************************************************************************************************************************/

	CREATE PROCEDURE SP_GetEmployee 
	(
		 @Country NVARCHAR(50) = NULL, @City NVARCHAR(50) = NULL, @BillingRate INT = NULL, @ClientName NVARCHAR(50) = NULL
		 ---  For a parameter to be Optional  we need to  initiate it to a value  in declaration ,  better to set it to null
		 ,@PageNumber Int = 1, @RowsPerPage Int = 50
	)
	AS
	BEGIN

		Declare @isValidFilter Int 
		
		IF @Country  Is not Null  or @City is not null  or  @ClientName is not null or @BillingRate is not null 
			SET @isValidFilter =1 
		ELSE @isValidFilter=0 

		SELECT  E.EMPID , E.Name , E.DOB ,  C.ClientName , P.ProjectName ,  R.BillingType , R.BillingRate , D.DesignationName, B.BusinessUnitName, B.City, B.Country,  B.ClientCountry.    
		FROM EMPLOYEE  E		
		LEFT JOIN  EmployeeProject EP  ON EP.EMPID = E.EMPID   --- To get employee Project we need to Join EmployeeProject Based on EMPID
		INNER JOIN  Project P  ON EP.ProjectID = P.ProjectID  
		INNER JOIN  Client C   ON C.ClientID = P.ClientID 
		INNER JOIN  RateCard R   ON EP.RateCardID  = R.RateCardID 
		INNER JOIN  Designation D ON E.CurrentDesignationID = D.DesignationID
		INNER JOIN  BusinessUnit B ON E.BusinessUnitID = B.BusinessUnitID 
		WHERE 1 =  @isValidFilter   ---  stop  retuning rows when no paramaeter is passed   
		AND  (@Country IS NULL  OR  B.Country LIKE @Country + '%')
		AND  (@City IS NULL  OR  B.City LIKE @City + '%')
		AND  (@ClientName IS NULL  OR  C.ClientName LIKE @ClientName + '%')
		AND  (@BillingRate IS NULL  OR  R.BillingRate = @BillingRate)
		ORDER BY  E.EmpID 
		OFFSET (@PageNumber-1)*@RowsOfPage ROWS
		FETCH NEXT @RowsOfPage ROWS ONLY 
END
/*END  Q 04 Version 2 *************************************************************************************************************************************************************/

/*END  Q 04*************************************************************************************************************************************************************/
