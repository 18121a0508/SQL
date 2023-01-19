--Difference Between Column level & Table level
CREATE TABLE Offer
(
ProductID INT PRIMARY KEY,
Cost INT,
Quantity INT,
CHECK ( (Cost*Quantity) >= 3499 )
)


sp_help Employee

CREATE TABLE Shop
(
Product INT ,
Cost INT CHECK(Cost>100),
Quantity INT,
)
-----------------------------------------------------------------------------------------

---UNIQUE CONSTRAINT       Column Level
CREATE TABLE Shop
(
StaffFullName VARCHAR(100) UNIQUE,
Salary INT,
)


DROP TABLE IF EXISTS Shop
--Unique Using Alter
CREATE TABLE Shop
(
StaffFullName VARCHAR(100),
Salary INT,
)
Alter Table Shop
ADD CONSTRAINT unique_Shop_StaffFullName UNIQUE (StaffFullName)  


-----Unique     Table Level
CREATE TABLE Shop
(
Firstname VARCHAR(100),
Lastname VARCHAR(100),
Salary INT,
CONSTRAINT unique_shop_Name UNIQUE(Firstname,LastName)  
)


--DROP Constraints 
Alter Table Shop
DROP CONSTRAINT Constraint_Name


-----GET Constraints applied on table
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME='shop'


Sp_help Parent

CREATE TABLE Parent(ID INT PRIMARY KEY,NAME VARCHAR(150) UNIQUE)
INSERT INTO Parent VALUES(1,'A'),(2,'B')

CREATE TABLE Child(StudentName VARCHAR(150) FOREIGN KEY REFERENCES parent(name),StudentID INT FOREIGN KEY REFERENCES Parent(ID))



DROP TABLE IF EXISTS Constraints
CREATE TABLE Constraints(
							
							StudentID INT PRIMARY KEY,
							Physics INT DEFAULT 0,
							TeacherID INT UNIQUE NOT NULL,

							Promotion VARCHAR(190), 
							CHECK ( (Physics>37 AND Promotion='Promoted') OR  (Physics<38 AND Promotion='Not Promoted')),
						) 
INSERT INTO Constraints VALUES (111,1,37,12345,'Not Promoted')
SELECT * FROM Constraints

-------------------------------------------------------------
CREATE TABLE Marks( 
	ID INT IDENTITY,
	Boolean VARCHAR(100)
)

ALTER TABLE Marks
ADD CONSTRAINT Default_constraint DEFAULT CASE WHEN ID>2 THEN 'Greater than 2' ELSE 'Less Than 2' END FOR Boolean 
