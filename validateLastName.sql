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

