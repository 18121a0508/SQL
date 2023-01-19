----Alpha - SQL Test  Solved 

/*Data Model****************************************************************************************************************************************************

BusinessRegion	{ BusinessRegionID, BusinessRegionName, BusinessRegionType}	BusinessRegionType => Region/  Division /  Zone / Area

GEODivision     {GEODivisionID, Country, Province , SubDivision }

Area {AreaID , GEODivisionID } AreaID = BusinessRegion.BusinessRegionID WHERE BusinessRegionType => Area

Zone {ZoneID , Country  }  ZoneID = BusinessRegion.BusinessRegionID WHERE BusinessRegionType => Zone

AreaZone {EffectiveFromDate , AreaID , EffectiveTODate , ZoneID } Primary Key {EffectiveFromDate , AreaID} 

DivisionCountry { EffectiveFromDate, Country, EffectiveTODate, DivisionID } Primary Key {EffectiveFromDate , Conntry}
WHERE DivisionID = BusinessRegion.BusinessRegionID WHERE BusinessRegionType => DivisionID

DivisionRegion  { EffectiveFromDate, DivisionID, EffectiveTODate, RegionID } Primary Key {EffectiveFromDate , DivisionID}
WHERE RegionID = BusinessRegion.BusinessRegionID WHERE BusinessRegionType => RegionID


Location Hierarchy  : Area --> Zone --- >   Division -->  Region    { Group of countries will be a Division }  {Country will have multiple zones}   

Franchise { FranchiseID,  FranchiseName , ParentFranchiseID  } ParentFranchiseID =>Franchise.FranchiseID
LineOFBusiness { LoBID , LoBName}

OutLet { OutLetID, OutLetName , AreaID , FranchiseID , LoBID }

Trasactions { OutLetID , DateOFTransaction , TrasactionType , Amount }

TrasactionType { TrasactionType , AccountType }   AccountType => Debit / Credit
   
TrasactionType	AccountType	
Receivable		Credit	
Expense			Debit	
Write-off		Debit	
Bad Debt		Debit	
Payment			Debit	

Calculations :
Revenue =  Receivable - (Expense-Write-off-bad Debt)
Due Receivables = Revenue - Payments
Cash =  Payments
***************************************************************************************************************************************************************/

/*Q 01**************************************************************************************************************************************************************
 Write a Query to Display Franchise Name and Name of all outlets of the franchise along with the area Name in which it operates and the line of business   
*/

SELECT  F.FranchiseName , O.OutletName ,  BR.BusinessRegionName AreaName , LoB.LobName  
FROM  Franchise F
LEFT  JOIN OutLet O  ON F.FranchiseID = O.FranchiseID			---  As some franchises may not have setup any outlets yet we need to use left Join 
INNER JOIN BusinessRegion  BR ON  BR.BusinessRegionID  =   O.AreaID   --- Because AreaID in Area Table refers to   BusinessRegion.BusinessRegionID
INNER JOIN LineOFBusiness  LoB ON  LoB.LobID  =   O.LobID 

/*End Q 01**************************************************************************************************************************************************************/

/*Q 02**************************************************************************************************************************************************************
 Write a Query to display  all lineofBusineess of a franchise , Note a franchise can have multiple stores for a lineofbusiness , 
 output should have only one row per line of business  , Display Franchise Name  and LineofBusinessName 
 */

SELECT  Distinct F.FranchiseName ,  LoB.LobName  
FROM  Franchise F
LEFT  JOIN OutLet O  ON F.FranchiseID = O.FranchiseID			---  As some franchises may not have setup any outlets yet we need to use left Join 
INNER JOIN LineOFBusiness  LoB ON  LoB.LobID  =   O.LobID 

/*End Q 02**************************************************************************************************************************************************************/

/*Q 03**************************************************************************************************************************************************************
  Write a Query to display  all Areas of a franchise, Note a franchise can have multiple stores operating in an area, output should have only one row per area , 
  Display  FranchiseName and AreaName  
  */

SELECT  distinct F.FranchiseName ,  BR.BusinessRegionName AreaName 
FROM  Franchise F
LEFT  JOIN OutLet O  ON F.FranchiseID = O.FranchiseID			---  As some franchises may not have setup any outlets yet we need to use left Join 
INNER JOIN BusinessRegion  BR ON  BR.BusinessRegionID  =   O.AreaID   --- Because AreaID in Area Table refers to   BusinessRegion.BusinessRegionID

/*End Q 03**************************************************************************************************************************************************************/



/*Q 04**************************************************************************************************************************************************************
   Write a query to Display  All divisions by region as of  '1-April-2022'
	Display  RegionName, DivisionName and Date from which the Division was in that Region 
	Note : use DivisionRegion and BusinessRegion  Tables
  */

SELECT  BRR.BusinessRegionName RegionName  ,  BRD.BusinessRegionName DivisionName 
FROM  DivisionRegion D
INNER JOIN BusinessRegion  BRD ON  BRD.BusinessRegionID  =   D.DivisionID   
INNER JOIN BusinessRegion  BRR ON  BRR.BusinessRegionID  =   D.RegionID    
WHERE  '1-April-2022'  BETWEEN  D.EffectiveFromDate  AND ISNULL(D.EffectiveTODate,'1-April-2022' )
/*End Q 04**************************************************************************************************************************************************************/

/*Q 05**************************************************************************************************************************************************************
  Write a query to Display  All countries by division as of  '31-JAN-2021'
Display  DivisionName, Country and Date from which the Country was in that division 
Note : Use DivisionCountry and BusinessRegion Tables
  */

SELECT  BRD.BusinessRegionName DivisionName , DC.Country  
FROM  DivisionCountry DC
INNER JOIN BusinessRegion  BRD ON  BRD.BusinessRegionID  =   D.DivisionID   
WHERE  '1-April-2022'  BETWEEN  DC.EffectiveFromDate  AND ISNULL(DC.EffectiveTODate,'1-April-2022' )

/*End Q 05**************************************************************************************************************************************************************/

/*Q 06**************************************************************************************************************************************************************
Write a query to Display All Areas by zone as of  today 
Display  ZoneName, Areaname and Date from which the Area was in that zone
Note : Use AreaZone and BusinessRegion Tables
   
  */

SELECT  BRZ.BusinessRegionName ZoneName , BRA.BusinessRegionName AreaName 
FROM  AreaZone AZ
INNER JOIN BusinessRegion  BRZ ON  BRZ.BusinessRegionID  =   AZ.ZoneID
INNER JOIN BusinessRegion  BRA ON  BRA.BusinessRegionID  =   AZ.AreaID  
WHERE  '1-April-2022'  BETWEEN  AZ.EffectiveFromDate  AND ISNULL(AZ.EffectiveTODate,'1-April-2022' )

/*End Q 06**************************************************************************************************************************************************************/


/*Q 07**************************************************************************************************************************************************************
Write a Query to display  No of  Areas in to which a Geo sub division is divided;  Write another query to get  No of  Areas in to which a  province is divided     and Join both the derived Tables on Appropriate grain ; 
use GEODivision and Area Tables.    
Final query should Have Country , Province , Subdivision , Count of Area by Province and  Count of Area by Sub division 
Note:   Province with same Name can be present in Different countries and Subdivision with same name can exists in different Province.0
*/

----  Versions 1  usin derivied query  
	SELECT  SubDivision.* , Province.CountofAreasbyProvience 
	FROM
	(
		SELECT  Province  , Count(A.AreaID) CountofAreasbyProvience 
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  --- Left Join to include Subdivisions where the business does not have any business yet 
		GROUP  BY Province 
	) Province
	INNER JOIN
	(
		SELECT  Province, SubDivision  , Count(A.AreaID) CountofAreasbySubdivision 
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  --- Left Join to include Subdivisions where the business does not have any business yet 
		GROUP  BY Province, SubDivision   
		/*  if we group only SubDivision or on SubDivision and Province result will be same as subdivisions are part of a provience , 
			However as we have to match Aread count @ subdivisions level with  Aread count of Respective Province of the subdivision , 
			we need to include province */ 	
	) SubDivision  ON Province.Province =  SubDivision.Provience 
	
--- Version  2.1 Using  windo funciton  

		SELECT  Province, SubDivision  
			, Count(A.AreaID) CountofAreasbySubdivision
			, Sum(Count(A.AreaID)) Over(Partition by Province  )  CountofAreasbyProvience
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  --- Left Join to include Subdivisions where the business does not have any business yet 
		GROUP  BY Province, SubDivision   
		--- Above method is right way of doing this, 
		/*
			Points to remember 
		 while using Over () clause we should not use order By for count, sum , Min, Max operations 
		 We cannot  perform Count (distinct) with Over() clause  as it is not supported   
		*/

	
	-- Versions 2.2
	/*
		Some people tried below version  , though it gives right result performance wiase it is verry poor, 
		Besaue  CountofAreasbyProvience is only calulated once per subdiviion in 2.1  in 2.2  it will be done per each Area in sub division  
		with is a perform
		Also distinct operation will add more cost to the query  

		As it is wrong way of doing it putting it in comments   

		SELECT  Distinct  Province, SubDivision  
			, Count(A.AreaID) Over (Partition by Province, Subdivision  ) CountofAreasbySubdivision
			, Count(A.AreaID) Over(Partition by Province  )  CountofAreasbyProvience
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  
		
	*/
		 

/*End Q 07**************************************************************************************************************************************************************/


/*Q 08**************************************************************************************************************************************************************
Q08 - Write a Query to display  no of  outlets  by sub division; 
,  Write another query to get  No of  out lets by province and Join both the derived Tables on Appropriate grain;  use GEODivision , Area and Outlet Tables.    
Final query should Have Country , Province , Subdivision , Count of outlet by Province and  Count of outlet by Sub division 
Note:   province with same Name can be present in Different countries and Subdivision with same Name can exists in different Province. 
*/

----  Versions 1  usin derivied query  
	SELECT  SubDivision.* , Province.CountofOutletbyProvience 
	FROM
	(
		SELECT  Province  , Count(O.OutletID) CountofOutletbyProvience 
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  --- Left Join to include Subdivisions where the business does not have any business yet 
		LEFT  JOIN  OutLet O PN  A.AreaID =O.AreaID 
		GROUP  BY Province 
	) Province
	INNER JOIN
	(
		SELECT  Province, SubDivision  , Count(O.OutletID) CountofOutletbySubdivision 
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  --- Left Join to include Subdivisions where the business does not have any business yet 
		LEFT  JOIN  OutLet O PN  A.AreaID =O.AreaID 
		
		GROUP  BY Province, SubDivision   
		/*  if we group only SubDivision or on SubDivision and Province result will be same as subdivisions are part of a provience , 
			However as we have to match Aread count @ subdivisions level with  Aread count of Respective Province of the subdivision , 
			we need to include province */ 	
	) SubDivision  ON Province.Province =  SubDivision.Provience 

	---Version 2.1
	
		SELECT  Province, SubDivision  
			, Count(O.OutletID) CountofOutletbySubdivision 
			, SUM(Count(O.OutletID))  Over(Partition By Province) CountofOutletbyProvince
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  --- Left Join to include Subdivisions where the business does not have any business yet 
		LEFT  JOIN  OutLet O PN  A.AreaID =O.AreaID 
		GROUP  BY Province, SubDivision   
		
	---- Note Refer Q 07  Versions 2.2 to see why we should avoid using that pattern  

/*End Q 08**************************************************************************************************************************************************************/


/*Q 09**************************************************************************************************************************************************************
Write a Query to display  no of count of distinct line of business by sub division 
,  Write another query to get  distinct line of business by province and Join both the derived Tables on Appropriate grain  ;GEODivision , Area and Outlet Tables.   
Final query should Have Country , Province , Subdivision , Count of LOB by Province and  Count of LOB by Sub division 
Note:   province with same Name can be present in Different countries and Subdivision with same Name can exists in different Province. */

----  Versions 1  usin derivied query  
	SELECT  SubDivision.* , Province.CountofLOBbyProvience 
	FROM
	(
		SELECT  Province  , Count(distinct O.LobID) CountofLobbyProvience 
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  --- Left Join to include Subdivisions where the business does not have any business yet 
		LEFT  JOIN  OutLet O PN  A.AreaID =O.AreaID 
		GROUP  BY Province 
	) Province
	INNER JOIN
	(
		SELECT  Province, SubDivision  , Count(distinct O.LobID) CountofLOBbySubdivision 
		From GEODivision GD
		LEFT JOIN Area  A  ON  GD.GEODivisionID  = A.GEODivisionID  --- Left Join to include Subdivisions where the business does not have any business yet 
		LEFT  JOIN  OutLet O PN  A.AreaID =O.AreaID 
		
		GROUP  BY Province, SubDivision   
		/*  if we group only SubDivision or on SubDivision and Province result will be same as subdivisions are part of a provience , 
			However as we have to match Aread count @ subdivisions level with  Aread count of Respective Province of the subdivision , 
			we need to include province */ 	
	) SubDivision  ON Province.Province =  SubDivision.Provience 

	---As Count distinct is not supported with Over caluse we cannot do it using window functions   

/*End Q 09**************************************************************************************************************************************************************/
GO
/*Q 10**************************************************************************************************************************************************************
Write a Procedure to Search for Areas.
Column to display  Country, Province, Subdivision and Area name.
user can search on  one or more of following parameters  @AreaName, @Subdivision , @Province , @Country
@AreaName is mandatory parameter and All other parameters are optional 
User can enter partial Names , so procedure should support starts with search on all parameter's.  
*/
  ---Version 1
CREATE PROCEDURE SP_SearchArea  
(@AreaName NVARCHAR(100), @Subdivision NVARCHAR(100) = NULL, @Province NVARCHAR(100) = NULL, @Country NVARCHAR(100) = NULL)
AS
BEGIN 
	SELECT 
		Country, Province, Subdivision , BR.BusinessRegionName    AreaName
	FROM    Area  A
	INNER JOIN  GEODivision GD ON A.SubDivisionID = GD.SubDivisionID
	INNER JOIN  BusinessRegion BR ON A.AreaID = BR.BusinessRegionID
	WHERE  BR.BusinessRegionName   LIKE @AreaName + '%'  
	AND (@Subdivision IS NULL  OR  GD.Subdivision  LIKE  @Subdivision +'%' )
	AND (@Province IS NULL  OR  GD.Province  LIKE  @Province +'%' )
	AND (@Country IS NULL  OR  GD.Country  LIKE  @Country +'%' )
END 
---  Version 2 dynamic query  
GO

CREATE PROCEDURE SP_SearchAreaDynamic 
(@AreaName NVARCHAR(100), @Subdivision NVARCHAR(100) = NULL, @Province NVARCHAR(100) = NULL, @Country NVARCHAR(100) = NULL)
AS
BEGIN 
  Declare @SQL  NVARCHAR(MAX)
  Declare @Filter  NVARCHAR(MAX)
  
  SET @SQL  = 
	'SELECT 
		Country, Province, Subdivision , BR.BusinessRegionName    AreaName
	FROM    Area  A
	INNER JOIN  GEODivision GD ON A.SubDivisionID = GD.SubDivisionID
	INNER JOIN  BusinessRegion BR ON A.AreaID = BR.BusinessRegionID '
	
	SET  @Filter  = 'BR.BusinessRegionName   LIKE @AreaName1 + ''%'''
	IF @Subdivision IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND GD.Subdivision  LIKE  @Subdivision1 +''%''' 
	IF @Province IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND GD.Province  LIKE  @Province1 +''%''' 
	IF @Country IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND GD.Country  LIKE  @Country1 +''%''' 

    SET @SQL =  @SQL  + ' WHERE  ' + @Filter  	

	EXEC sp_executeSQL @SQL  , N'@AreaName1 NVARCHAR(100), @Subdivision1 NVARCHAR(100), @Province1 NVARCHAR(100), @Country! NVARCHAR(100)',
	@AreaName1 =@AreaName, @Subdivision1 =@Subdivision, @Province1 =@Province, @Country1 =@Country

END 

/*End Q 10**************************************************************************************************************************************************************/

GO
/*Q 11**************************************************************************************************************************************************************
Write a Procedure to Search for Outlets.
Column to display  Country, Province, Subdivision ,Area name and OutletName.
user can search on  one or more of following parameters  @AreaName, @Subdivision , @Province , @Country,@OutLetName
@Country and @AreaName are mandatory parameters, All other parameters are optional 
User can enter partial Names , so procedure should support starts with search on all parameter's.  

*/
  ---Version 1
CREATE PROCEDURE SP_SearchOutlet  
(@AreaName NVARCHAR(100), @Country NVARCHAR(100),@OutletName NVARCHAR(100) = NULL,  @Subdivision NVARCHAR(100) = NULL, @Province NVARCHAR(100) = NULL)
AS
BEGIN 
	SELECT 
		O.OutLetName, Country, Province, Subdivision , BR.BusinessRegionName    AreaName
	FROM   OutLet O  
	INNER JOIN Area  A  ON O.AreaUD =A.AreaID  
	INNER JOIN  GEODivision GD ON A.SubDivisionID = GD.SubDivisionID
	INNER JOIN  BusinessRegion BR ON A.AreaID = BR.BusinessRegionID
	WHERE  BR.BusinessRegionName   LIKE @AreaName + '%'  
	AND GD.Country  LIKE  @Country +'%' 
	AND (@Subdivision IS NULL  OR  GD.Subdivision  LIKE  @Subdivision +'%' )
	AND (@Province IS NULL  OR  GD.Province  LIKE  @Province +'%' )
	AND (@OutletName IS NULL  OR  0.OutletName  LIKE  @OutletName +'%' )
END 
---  Version 2 dynamic query  
GO

CREATE PROCEDURE SP_SearchOutletDynamic   
(@AreaName NVARCHAR(100), @Country NVARCHAR(100),@OutletName NVARCHAR(100) = NULL,  @Subdivision NVARCHAR(100) = NULL, @Province NVARCHAR(100) = NULL)
AS
BEGIN 
  Declare @SQL  NVARCHAR(MAX)
  Declare @Filter  NVARCHAR(MAX)
  
  SET @SQL  = 
	'SELECT 
		O.OutLetName, Country, Province, Subdivision , BR.BusinessRegionName    AreaName
	FROM   OutLet O  
	INNER JOIN Area  A  ON O.AreaUD =A.AreaID  
	INNER JOIN  GEODivision GD ON A.SubDivisionID = GD.SubDivisionID
	INNER JOIN  BusinessRegion BR ON A.AreaID = BR.BusinessRegionID	 '
	
	SET  @Filter  = 'BR.BusinessRegionName   LIKE @AreaName1 + ''%'' AND GD.Country LIKE @Country! + ''%'' '
	IF @Subdivision IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND GD.Subdivision  LIKE  @Subdivision1 +''%''' 
	IF @Province IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND GD.Province  LIKE  @Province1 +''%''' 
	IF @OutLetName IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND O.OutLetNameLIKE  @OutLetName1 +''%''' 

    SET @SQL =  @SQL  + ' WHERE  ' + @Filter  	

	EXEC sp_executeSQL @SQL  , N'@OutLetName1 NVARCHAR(100),@AreaName1 NVARCHAR(100), @Subdivision1 NVARCHAR(100), @Province1 NVARCHAR(100), @Country! NVARCHAR(100)',
	@OutLetName1=@OutLetName, @AreaName1 =@AreaName, @Subdivision1 =@Subdivision, @Province1 =@Province, @Country1 =@Country

END 

/*End Q 11**************************************************************************************************************************************************************/
Go
/*Q 12**************************************************************************************************************************************************************
Write a Procedure to Search for Outlets of a franchise.
Column to display   FranchiseName, Country, Province, Subdivision ,Area name and OutletName.
user can search on  one or more of following parameters  @FranchiseName, @Subdivision , @Province , @Country
@FranchiseName is a mandatory parameters, All other parameters are optional 
User can enter partial Names , so procedure should support starts with search on all parameter's.  

*/

  ---Version 1
CREATE PROCEDURE SP_SearchFranchiseOutlets  
(@FranchiseName NVARCHAR(100), @Country NVARCHAR(100) = Null,  @Subdivision NVARCHAR(100) = NULL, @Province NVARCHAR(100) = NULL)
AS
BEGIN 
	SELECT 
		F.FranchiseName, O.OutLetName, Country, Province, Subdivision , BR.BusinessRegionName    AreaName
	FROM   OutLet O  
	INNER JOIN Area  A  ON O.AreaUD =A.AreaID  
	INNER JOIN  GEODivision GD ON A.SubDivisionID = GD.SubDivisionID
	INNER JOIN  BusinessRegion BR ON A.AreaID = BR.BusinessRegionID
	INNER JOIN  Franchise F ON F.FranchiseID = O.FranchiseID 	
	WHERE  F.FranchiseName   LIKE @FranchiseName + '%'  
	AND GD.Country  LIKE  @Country +'%' 
	AND (@Subdivision IS NULL  OR  GD.Subdivision  LIKE  @Subdivision +'%' )
	AND (@Province IS NULL  OR  GD.Province  LIKE  @Province +'%' )
	AND (@Country   IS NULL  OR  GD.Country LIKE  @Country +'%' )
END 
---  Version 2 dynamic query  
GO
1
CREATE PROCEDURE SP_SearchFranchiseOutletsDynamic   
(@FranchiseName NVARCHAR(100), @Country NVARCHAR(100)=Null,  @Subdivision NVARCHAR(100) = NULL, @Province NVARCHAR(100) = NULL)
AS
BEGIN 
  Declare @SQL  NVARCHAR(MAX)
  Declare @Filter  NVARCHAR(MAX)
  
  SET @SQL  = 
	'SELECT 
		F.FranchiseName, O.OutLetName, Country, Province, Subdivision , BR.BusinessRegionName    AreaName
	FROM   OutLet O  
	INNER JOIN Area  A  ON O.AreaUD =A.AreaID  
	INNER JOIN  GEODivision GD ON A.SubDivisionID = GD.SubDivisionID
	INNER JOIN  BusinessRegion BR ON A.AreaID = BR.BusinessRegionID
	INNER JOIN  Franchise F ON F.FranchiseID = O.FranchiseID 	
	'
	
	SET  @Filter  = 'F.FranchiseName   LIKE @FranchiseName1 + ''%'' '
	IF @Subdivision IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND GD.Subdivision  LIKE  @Subdivision1 +''%''' 
	IF @Province IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND GD.Province  LIKE  @Province1 +''%''' 
	IF @Country IS NOT NULL  
		SET  @Filter  =  @Filter  + '  AND O.Country  @Country1 +''%''' 

    SET @SQL =  @SQL  + ' WHERE  ' + @Filter  	

	EXEC sp_executeSQL @SQL  , N'@FranchiseName1 NVARCHAR(100), @Subdivision1 NVARCHAR(100), @Province1 NVARCHAR(100), @Country! NVARCHAR(100)',
	 @FranchiseName1 =@FranchiseName, @Subdivision1 =@Subdivision, @Province1 =@Province, @Country1 =@Country

END 

/*End Q 12**************************************************************************************************************************************************************/
