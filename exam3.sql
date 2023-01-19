DECLARE @SQL NVARCHAR(4000) = ' ';
DECLARE @params NVARCHAR(4000) = '@Semister INT, @Category NVARCHAR(255), @AcademicYear DateTime';
 
SELECT @SQL = 'SELECT S.StudentName, C.CourseName, SC.ExpectedDateofCompletion, SC.Status, CC.CourseCategory, SC.Semister, SC.AcademicYear
FROM StudentCourse SC
INNER JOIN Student S ON S.StudentId = SC.StudentId
INNER JOIN Courses C ON C.CourseId = SC.CourseId
INNER JOIN CourseCateogry CC ON SC.CourseCategoryId = CC.Category
WHERE SC.Semister = @Semister and CC.CourseCategory = @Category and SC.AcademicYear = @AcademicYear';

EXEC sp_executesql @SQL, @params, @Semister = 1, @Category = 'Btech' ; @AcademicYear= 2022;



------------------------------------------------------------------------


SELECT  
		EngagementId,
		COUNT(DISTINCT NewStatusID) count_of_statuses 
FROM EngagementStatusTrack
GROUP BY EngagementID
HAVING COUNT(DISTINCT NewStatusID)>3
----------------------------------------------------------------------

CREATE OR ALTER PROC StudentSearch(@semister INT NULL,@category VARCHAR(155) NULL,@academicyear INT NULL)
AS
BEGIN
SELECT 
		SC.Coursename,
		SC.ExpectedDateofCompletion,
		SC.Status,
		SC.Category,	
		SC.Semister,
		SC.AcademicYear
		
FROM
StudentCourse		SC

LEFT JOIN Student S ON SC.StudentId = S.StudentId
LEFT JOIN Courses C ON SC.CourseId  = C.CourseId

WHERE	(@semister IS NULL OR SC.Semister = @semister)
	OR	(@category IS NULL OR SC.category = @category)
	OR	(@academicyear IS NULL OR SC.academicyear = @academicyear)

END

EXEC StudentSearch @semister = 1,@category = 'programming',@academicyear = 2016
-------------------------------------------------------------------------------------------


CREATE PROC objectSearch(@dbName VARCHAR(255))
AS 
BEGIN
SELECT *,DATEDIFF(dd,modify_date,GETDATE()) diff FROM SYS.objects
WHERE Object_id = OBJECT_ID(@dbname) AND DATEDIFF(dd,modify_date,GETDATE()) <=7 
END

EXEC objectSearch @dbname = 'employee'

-------------------------------------------------------------------------------


--VALIDATION OF LASTNAME Answer


--LASTNAME FETCHING PROCEDURE
CREATE OR ALTER  PROC Fetch_lastName(@fullName VARCHAR(255),@lname VARCHAR(255) OUTPUT)
AS
BEGIN

SET @lname = (
SELECT value FROM 
(SELECT ROW_NUMBER() OVER (ORDER BY @@ROWCOUNT) SLNO,* FROM string_split(@fullName,' ')) X
WHERE X.SLNO = 3
)

END
-------------------------------------------------------
----VALIDATION PROCEDURE
CREATE OR ALTER PROC ValidateLastname(@lastName VARCHAR(255))
AS 
BEGIN

DECLARE @LenOfLastName INT = LEN(@lastName)

DECLARE @temp INT = 1
DECLARE @X INT 
DECLARE @status INT = 1

WHILE @temp <= @LenOfLastName
BEGIN

	SET @x = (ASCII(LOWER(SUBSTRING(@LastName,@temp,1))) )
	IF @X > 122 OR @X < 97
	BEGIN
		SELECT 'Invalid LastName'
		SET @status = 0
		BREAK;
	END

	SET @temp = @temp +1
END

IF @status = 1
BEGIN 
	SELECT 'VALID LASTNAME'
END

END




----------------------------------------------------------------


DECLARE @LastName VARCHAR(255)

EXEC Fetch_lastName @fullName =  'AKULA ABDUL RASHEED', @lname = @LastName OUTPUT 

EXEC ValidateLastname @lastName

--------------------------------------------------------------------------------------------