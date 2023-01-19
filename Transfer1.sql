-----------------------------------------------------------------------------Link a server

IF EXISTS(SELECT name FROM sys.servers WHERE name = '10.118.60.186')
BEGIN
        EXEC sp_dropserver '10.118.60.186','droplogins'
END
GO
EXEC sp_addlinkedserver @server = N'10.118.60.186'
GO
EXEC sp_addlinkedsrvlogin
   @rmtsrvname = N'10.118.60.186',
   @useself ='false',
   @locallogin = N'sa',
   @rmtuser = N'sa',
   @rmtpassword = N'GGK@devsd';

------------------------------------------------------------------------------------------
--------------------------------Data From 10.118.60.186        DB:- HRMS_22122020
GO
DROP VIEW IF EXISTS TRANSFER1
GO
CREATE OR ALTER VIEW TRANSFER1
AS
SELECT * FROM OPENQUERY([10.118.60.186],'SELECT E.EmployeeNumber,
												E.FirstName,
												E.LastName,
												E.DisplayName,
												R.RoleName,
												ECD.CompanyEmail,
												EQ.University,
												C.CourseName,
												E.CreatedDate,
												E.ModifiedDate,
												E.CreatedById,
												E.ModifiedByID
											FROM [HRMS_22122020].dbo.Employee E 
											LEFT JOIN [HRMS_22122020].dbo.EmployeeContactDetail ECD 
												ON ECD.EmployeeID=E.EmployeeID
											LEFT JOIN [HRMS_22122020].dbo.UserRole UR 
												ON UR.UserID = E.UserId
											LEFT JOIN [HRMS_22122020].dbo.Role R 
												ON R.RoleId = UR.RoleId
											LEFT JOIN 
												(SELECT EmployeeId,University,CourseId
												FROM [HRMS_22122020].dbo.EmployeeQualification EQ
												WHERE   QualificationId = 
													(SELECT MAX(QualificationId) 
													FROM [HRMS_22122020].dbo.EmployeeQualification 
													WHERE EmployeeId = EQ.EmployeeID)
												GROUP BY EmployeeID,University,CourseId
												) EQ ON EQ.EmployeeID = E.EmployeeID
											LEFT JOIN [HRMS_22122020].dbo.Course C ON C.CourseId = EQ.CourseId
											WHERE E.IsActive = 1')
GO

DBCC CHECKIDENT('InnovaEmployeeReplica',RESEED,0)
GO

MERGE InnovaEmployeereplica AS Target
USING dbo.Transfer1			AS Source
ON 
	Target.EmployeeNumber = Source.EmployeeNumber 

WHEN NOT MATCHED BY Target THEN
    INSERT (EmployeeNumber,	FirstName,		
			LastName,		DisplayName,	
			RoleName,		CompanyEmail,	
			University,		CourseName,		
			CreatedDate,	UpdatedDate,	
			CreatedBy,		UpdatedBy
			)
    VALUES (Source.EmployeeNumber,	Source.FirstName,		
			Source.LastName,		Source.DisplayName,		
			Source.RoleName,		Source.CompanyEmail,	
			Source.University,		Source.CourseName,		
			Source.CreatedDate,		Source.ModifiedDate,	
			Source.CreatedById,		Source.ModifiedByID
			)

WHEN MATCHED THEN UPDATE SET
    Target.FirstName	= Source.FirstName,
	Target.LastName		= Source.LastName,
	Target.DisplayName	= Source.DisplayName,
	Target.RoleName		= Source.RoleName,
	Target.CompanyEmail = Source.CompanyEmail,
	Target.University	= Source.University,
	Target.CourseName	= Source.CourseName,
	Target.CreatedDate	= Source.CreatedDate,
	Target.UpdatedDate	= Source.ModifiedDate,
	Target.CreatedBy	= Source.CreatedById,
	Target.UpdatedBy	= Source.ModifiedById
	;
