
--STEP 1
CREATE OR ALTER PROC Puzz11PreProc 
AS
BEGIN
DROP TABLE IF EXISTS #temp
DROP SEQUENCE IF EXISTS Puzz11SEQ
DROP VIEW IF EXISTS Puzz11View

DECLARE @Seq NVARCHAR(MAX) = 'CREATE SEQUENCE Puzz11SEQ START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE '+ (SELECT CAST(COUNT(*) AS VARCHAR) FROM Puzz11) + ' CYCLE'
EXEC(@Seq)

--DECLARE @temp NVARCHAR(MAX) = 'CREATE TABLE #temp(Permutations VARCHAR(MAX))'
--EXEC(@temp)

DECLARE @view VARCHAR(MAX) = 'CREATE VIEW Puzz11View AS SELECT ROW_NUMBER() OVER(ORDER BY @@ROWCOUNT) Rnk,Name FROM Puzz11 GROUP BY Name'

EXEC(@view)

END

EXECUTE Puzz11PreProc


--STEP-2
GO

DROP TABLE IF EXISTS #temp
CREATE TABLE #temp(permutations VARCHAR(MAX))
GO
EXEC Puzz11proc

CREATE OR ALTER PROC Puzz11proc
AS
BEGIN

DECLARE @Tot INT = (SELECT COUNT(*) FROM Puzz11View)

DECLARE @i INT = 1
DECLARE @N INT = @Tot - 1

WHILE @i<=@Tot
BEGIN

		DECLARE @x1 INT = 1
		WHILE @x1 <= @Tot
		BEGIN
			
			IF (@x1 != @i)
			BEGIN
				DECLARE @EXE NVARCHAR(MAX) ='ALTER SEQUENCE Puzz11Seq RESTART WITH '+CAST(@x1 AS VARCHAR)
				EXEC(@EXE)
				
				DECLARE @tmp INT = 1


				DECLARE @SQL VARCHAR(MAX) = (SELECT Name FROM Puzz11View WHERE Rnk = @i)
				WHILE (@tmp <= @N)
				BEGIN

				DECLARE @dummy INT =(NEXT VALUE FOR Puzz11SEQ)
				DECLARE @curr INT = (SELECT CAST(current_value AS INT) FROM SYS.SEQUENCES WHERE name = 'Puzz11Seq')
				
				IF (@curr = @i)
				BEGIN
					SET @curr = (NEXT VALUE FOR Puzz11SEQ)
				END
				
				SET @SQL = @SQL + ','+(SELECT Name FROM Puzz11View WHERE Rnk = @curr)

				SET @tmp = @tmp + 1
				END

				INSERT INTO #temp SELECT @SQL EVERYITER

			END			

			SET @x1 = @x1 + 1
		END

	SET @i = @i + 1 
END
SELECT * FROM #temp
END

