--SCD Type 1 Using Update Join
DROP TABLE IF EXISTS DAY1,Day2,DAY3
CREATE TABLE Day1
				(
				ID INT,
				Name VARCHAR(30),
				Subject VARCHAR(30),
				Marks INT,
				Attempt INT DEFAULT 1
				)
GO
INSERT INTO Day1 VALUES
					(1,'Trivikram','Telugu',38,1),
					(2,'Rani','English',59,1),
					(3,'Rasheed','Science',38,1)
GO
CREATE TABLE DAY2
				(
				ID INT,
				Name VARCHAR(30),
				Subject VARCHAR(30),
				Marks INT,
				Attempt INT DEFAULT 1
				)
GO
INSERT INTO Day2 VALUES
					(1,'Trivikram Srinivas','Telugu',100,1),
					(2,'Rani','English',92,1),
					(4,'Raju','Social',88,1)
GO
CREATE TABLE Day3
				(
				ID INT,
				Name VARCHAR(30),
				Subject VARCHAR(30),
				Marks INT,
				Attempt INT DEFAULT 1
				)
GO
INSERT INTO Day3 VALUES
					(2,'Rani','English',100,1),
					(4,'Raju','Social',99,1),
					(7,'Dhoni','Maths',52,1)
GO
SELECT * FROM DAy1
SELECT * FROM DAy2
SELECT * FROM DAy3

BEGIN TRAN 
ROLLBACK TRAN

--Updating Day2 Attempt
UPDATE Day2
SET Day2.Attempt = d1.Attempt +1

FROM Day1 d1
JOIN Day2 d2 ON d1.ID=d2.ID  AND  d1.Subject=d2.Subject  AND d1.Marks != d2.Marks
GO 
SELECT * FROM Day1
SELECT * FROM Day2


--Deleting Day1 Expired data
DELETE Day1 

FROM Day1 d1 
JOIN Day2 d2 ON d1.ID=d2.ID AND d1.Subject=d2.Subject
GO 
SELECT * FROM DAY1


--Updating Day3 Attempt
UPDATE Day3
SET Day3.Attempt = d2.Attempt +1

FROM Day2 d2
JOIN Day3 d3 ON d2.ID=d3.ID  AND  d2.Subject=d3.Subject  AND  d2.Marks != d3.Marks
GO
SELECT * FROM Day2
SELECT * FROM Day3


--Deleting Expired data From Day2
DELETE Day2

FROM Day2 d2 
JOIN Day3 d3 ON d2.ID=d3.Id AND d2.Subject=d3.Subject
GO 
SELECT * FROM Day2

--Combining all the three Tables
SELECT * FROM day1
UNION 
SELECT * FROM day2
UNION
SELECT * FROM day3



