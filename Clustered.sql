USE showroom


CREATE TABLE CAR(CARID INT PRIMARY KEY, CARNAME VARCHAR(400) UNIQUE NOT NULL)

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME='car'



CREATE TABLE BUS(BusID INT,BusName VARCHAR(300) NOT NULL)

DROP TABLE BUS
SELECT * FROM BUS
CREATE CLUSTERED INDEX IX_TAB_BUS
ON BUS(BusName)

Alter Table Bus 
ADD PRIMARY KEY (BusName)




ALTER TABLE BUS
ADD CONSTRAINT PK_TAB_BUS PRIMARY KEY(BusID)

CREATE CLUSTERED INDEX IX_Tab_Bus
ON Bus(BusID)

DROP INDEX IX_TAB_BUS ON Bus

EXEC SP_helpIndex Bus




CREATE TABLE t(ID INT,NAME VARCHAR(300))
CREATE UNIQUE INDEX IX_t
ON t(ID DESC,Name ASC)  


DROP TABLE t
INSERT INTO t VALUES(1,'Z'),(1,'Y'),(1,'A'),(2,'Z'),(2,'Y'),(2,'A'),(3,'Z'),(4,'Y'),(5,'A')
SELECT * FROM t



CREATE TABLE NonT(ID INT, Name VARCHAR(300))

CREATE NONCLUSTERED INDEX


