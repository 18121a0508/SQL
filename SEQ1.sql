
DECLARE @Tot INT = (SELECT COUNT(*) FROM Puzz11)

DECLARE @x INT = 1

WHILE @x <= @Tot
BEGIN
	

	DECLARE @temp INT = @tot-1
	DECLARE @y INT = 1
	DECLARE @str VARCHAR(MAX) = (SELECT Name FROM Puzz11View WHERE Rnk = @x)


	WHILE @y <= @temp
	BEGIN
		DECLARE @test INT =(SELECT CAST(current_value AS INT) FROM SYS.sequences WHERE NAME='Puzz11Seq')
		SELECT 


		SET @y = @y + 1
	END

	SET @x = @x + 1
END


