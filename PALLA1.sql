1) Province is part of a country, similar to a state or a county



SELECT 
  ISNULL(FP.FranchiseName,F.FranchiseName)
  , L.LobName 
  , Count(Distinct F.FranchiseID)   FranchiseCount  --1
  , Count(O.OutLetID) OutLetCount 
FROM outLet  O
INNER JOIN Franchise F   On O.FranchiseID =F.FranchiseID
LEFT JOIN Franchise FP  On F.ParentFranchiseID =FP.FranchiseID
INNER JOIN LineofBusiness L  ON O.LobID = L.LobID  
GROUP  BY ISNULL(FP.FranchiseName,F.FranchiseName) , L.LobName 



SELECT 
B.* , franchiseCount   , Count(O.OutLetID) 
FROM  

(

SELECT
   o.outletid,o.outletname,o.areaid,o.ffranchiseid,o.lobid,
   f.franchisename,b.bussinessregionname,g.country,g.provision,g.subdivision
   bz.bussinessregionname ZoneName 
   bDC.bussinessregionname DivisionName 
   bDR.bussinessregionname RegionName 
From outlet o
INNER JOIN franchise f on o.franchiseid=f.franchiseid
INNER JOIN area a on o.areaid=a.areaid
INNER JOIN geodivision g on g.giodivisionid=a.giodivisionid
INNER JOIN bussinessregion b on a.areaid=b.bussinessregionid;

INNER JOIN AreaZone AZ ON A.AreaID = AZ.AreaID  AND Getdate() Between AZ.EffectiveFromDate 
AND AZ.EffectiveToDate 
INNER JOIN bussinessregion bZ on AZ.ZoneID=bz.bussinessregionid
INNER JOIN Zone Z on AZ.ZoneID=Z.ZoneID

------   There will be  different zone in a country  
------   Country will move from  one division to another division over time 
 -----  based on business realignment
INNER JOIN DivisionCountry DC on Z.Country =DC.Country   AND Getdate() Between DC.EffectiveFromDate 
AND DC.EffectiveToDate 
INNER JOIN bussinessregion BDC  on DC.DivisionID=bDC.bussinessregionid
INNER JOIN DivisionRegion DR  on DC.DivisionID = DR.DivisionID
AND Getdate() Between DR.EffectiveFromDate 
AND DR.EffectiveToDate 
INNER JOIN bussinessregion BDR  on DR.RegionID=bDR.bussinessregionid


SELECT
bz.bussinessregionname ZoneName , Count(Distinct O.franchiseid) , Count(O.OutLetID)
From outlet o
INNER JOIN area a on o.areaid=a.areaid
INNER JOIN AreaZone AZ ON A.AreaID = AZ.AreaID  AND Getdate() Between AZ.EffectiveFromDate
AND AZ.EffectiveToDate
INNER JOIN bussinessregion bZ on AZ.ZoneID=bz.bussinessregionid
GROUP BY  bz.bussinessregionname


SELECT
bz.bussinessregionname ZoneName , Count(Distinct O.franchiseid) , Count(O.OutLetID)
From outlet o
INNER JOIN area a on o.areaid=a.areaid
INNER JOIN AreaZone AZ ON A.AreaID = AZ.AreaID  AND Getdate() Between AZ.EffectiveFromDate
AND AZ.EffectiveToDate
INNER JOIN bussinessregion bZ on AZ.ZoneID=bz.bussinessregionid
GROUP BY  bz.bussinessregionname ZoneName


SELECT
bz.bussinessregionname ZoneName , ba.bussinessregionname areaName

, Count(O.OutLetID) OutLetCountbyArea 

, Sum(Count(O.OutLetID) )  OVER(Partition BY bz.bussinessregionname ) OutLetCountbyZone

From outlet o
INNER JOIN area a on o.areaid=a.areaid
INNER JOIN AreaZone AZ ON A.AreaID = AZ.AreaID  AND Getdate() Between AZ.EffectiveFromDate 
AND AZ.EffectiveToDate 
INNER JOIN bussinessregion bZ on AZ.ZoneID=bz.bussinessregionid
INNER JOIN bussinessregion Ba on o.areaid=BA.bussinessregionid
GROUP BY  bz.bussinessregionname  ,ba.bussinessregionname


SELECT
bz.bussinessregionname ZoneName 
, Count(Distinct O.franchiseid) franchiseCount   , Count(O.OutLetID) OutLetCount

From outlet o
INNER JOIN area a on o.areaid=a.areaid
INNER JOIN AreaZone AZ ON A.AreaID = AZ.AreaID  AND Getdate() Between AZ.EffectiveFromDate 
AND AZ.EffectiveToDate 
INNER JOIN bussinessregion bZ on AZ.ZoneID=bz.bussinessregionid
GROUP BY  bz.bussinessregionname  
)  A
INNER JOIN 

(
SELECT
bz.bussinessregionname ZoneName , ba.bussinessregionname areaName
, Count(Distinct O.franchiseid) franchiseCount   , Count(O.OutLetID) OutLetCount
From outlet o
INNER JOIN area a on o.areaid=a.areaid
INNER JOIN AreaZone AZ ON A.AreaID = AZ.AreaID  AND Getdate() Between AZ.EffectiveFromDate 
AND AZ.EffectiveToDate 
INNER JOIN bussinessregion bZ on AZ.ZoneID=bz.bussinessregionid
INNER JOIN bussinessregion Ba on o.areaid=BA.bussinessregionid
GROUP BY  bz.bussinessregionname  
)  B
ON  A.ZoneName = B.ZoneName