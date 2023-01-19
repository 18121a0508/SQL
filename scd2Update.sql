DROP TABLE IF EXISTS DAY1,DAY2,DAY3

CREATE TABLE DAY1(
					ID INT,
					Name VARCHAR(30),
					Subject VARCHAR(30),
					Marks INT,
					Attempt INT DEFAULT 1,
					RecordStatus VARCHAR(30) DEFAULT 'Active'
				 )
SELECT * FROM DAY1

INSERT INTO DAY1(ID,Name,Subject,Marks) VALUES(1,'Trivikram','Psycology',38)
GO
INSERT INTO DAY1(ID,Name,Subject,Marks) VALUES(121,'Rani','English',59)
GO



CREATE TABLE DAY2(
					ID INT,
					Name VARCHAR(30),
					Subject VARCHAR(30),
					Marks INT,
					Attempt INT DEFAULT 1,
					RecordStatus VARCHAR(30) DEFAULT 'Active'
				 )
GO
SELECT * FROM DAY2
GO
INSERT INTO DAY2(ID,Name,Subject,Marks) VALUES(1,'Trivikram Srinivas','Psycology',100)
GO
INSERT INTO DAY2(ID,Name,Subject,Marks) VALUES(121,'Rani','English',92)
GO
INSERT INTO DAY2(ID,Name,Subject,Marks) VALUES(1441,'Raju','Telugu',88)
GO



CREATE TABLE DAY3(
					ID INT,
					Name VARCHAR(30),
					Subject VARCHAR(30),
					Marks INT,
					Attempt INT DEFAULT 1,
					RecordStatus VARCHAR(30) DEFAULT 'Active'
				 )
GO
SELECT * FROM DAY3
GO
INSERT INTO DAY3(ID,Name,Subject,Marks) VALUES(121,'Rani','English',100)
GO
INSERT INTO DAY3(ID,Name,Subject,Marks) VALUES(1441,'Raju','Telugu',99)
GO
INSERT INTO DAY3(ID,Name,Subject,Marks) VALUES(777,'Dhoni','Maths',10)
GO


SELECT * FROM DAY1
SELECT * FROM DAY2
SELECT * FROM DAY3

BEGIN TRAN
ROLLBACK TRAN

--Updating the Day2 Attempt 
UPDATE DAY2
SET Day2.Attempt = d1.Attempt + 1

FROM Day1 d1 
JOIN Day2 d2 ON d1.ID=d2.ID  AND  d1.Subject=d2.Subject  AND  d1.Marks != d2.Marks
GO
SELECT * FROM Day2


--Updating the RecordStatus of Day1
UPDATE Day1
SET DAY1.RecordStatus = 'expired'

FROM DAY1 d1 
JOIN Day2 d2 ON d1.ID=d2.ID AND d1.Subject=d2.Subject
GO 
SELECT * FROM DAY1


--Updating Day2 RecordStatus
UPDATE Day2
SET Day2.RecordStatus = 'expired'
FROM Day2 d2
JOIN Day3 d3 ON d2.ID=d3.ID  AND  d2.Subject=d3.Subject 
GO 
SELECT * FROM DAY2


--Updating Day3 Attempt
UPDATE DAY3
SET Day3.Attempt = d2.Attempt +1 

FROM Day2 d2
JOIN Day3 d3 ON d2.ID=d3.ID  AND  d2.Subject=d3.Subject  AND  d2.Marks != d3.Marks
GO
SELECT * FROM DAY3

--JOINING 3 Tables
SELECT * FROM Day1
UNION
SELECT * FROM Day2
UNION
SELECT * FROM Day3
