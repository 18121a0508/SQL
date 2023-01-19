1)
ALTER PROCEDURE SP_SearchMatches( 
@MatchDateFrom DATE =NULL,@MatchDateTO date =NULL,@city varchar(255)=NULL,
@TeamName VARCHAR(255) =NULL,@MinInningsRuns INT = NULL,@MaxInningsRuns INT = NULL,
@PlayerName VARCHAR(255) =NULL)
AS
BEGIN
with c1 as
(SELECT M.MatchID, M.MatchDate,M.City,M.Venue,
	T1.TeamName Team1Name,T2.TeamName Team2Name,WT.TeamName MatchWonby
FROM match M
JOIN Team T1 on T1.TeamID=M.FirstTeamID
JOIN Team T2 on T2.TeamID=M.SecondTeamID
JOIN MatchTeamResult MTR on MTR.MatchID=M.MatchID and MTR.Result in ('Won','Won dl')
JOIN Team WT on WT.TeamID=MTR.TeamID),

I1 as (SELECT M.MatchID,sum(B1.Score) InningsIscore,COUNT(B1.DismissalType) InningsIWickets 
FROM MATCH M
JOIN BallByBallScoreCard B1 on B1.MatchID=M.MatchID and B1.InningsID=1
GROUP BY M.MatchID),

I2 as(SELECT M.MatchID,sum(B2.Score) InningsIIscore,COUNT(B2.DismissalType) InningsIIWickets 
FROM MATCH M
JOIN BallByBallScoreCard B2 on B2.MatchID=M.MatchID and B2.InningsID=2
GROUP BY M.MatchID),

Pl as (SELECT m.MatchDate,t.TeamName,p.PlayerName
from match m
join PlayerScoreCard psc on psc.MatchID = m.MatchID
JOIN Team t ON t.TeamID=psc.PlayingTeamID
join Player p on psc.PLayerID = p.PlayerID)


SELECT c1.MatchDate,c1.City,c1.Venue,c1.Team1Name,c1.Team2Name,c1.MatchWonby,I1.InningsIscore,I1.InningsIWickets,I2.InningsIIscore,I2.InningsIIWickets
FROM c1
JOIN I2 on I2.MatchID=c1.MatchID
JOIN I1 on I1.MatchID=c1.MatchID
WHERE (c1.City LIKE '%'+@city+'%' OR @city IS NULL) AND 
	(c1.Team1Name LIKE '%'+@TeamName+'%' OR c1.Team2Name LIKE '%'+@TeamName+'%' OR @TeamName IS NULL) AND
	((I1.InningsIscore>=@MinInningsRuns AND I2.InningsIIscore > @MinInningsRuns) OR @MinInningsRuns IS NULL) AND
	((I1.InningsIscore<=@MaxInningsRuns AND I2.InningsIIscore < @MaxInningsRuns) OR @MaxInningsRuns IS NULL) AND
	(c1.MatchDate > @MatchDateFrom OR @MatchDateFrom IS NULL) AND
	(c1.MatchDate < @MatchDateTO OR @MatchDateTO IS NULL)
Order BY c1.Team1Name
END;

EXEC SP_SearchMatches 
	@PlayerName='MV Boucher'

2)
ALTER PROCEDURE SP_SearchMatches( 
@MatchDateFrom DATE =NULL,@MatchDateTO date =NULL,@city varchar(255) =NULL,
@TeamName VARCHAR(255) =NULL,@MinInningsRuns INT = NULL,@MaxInningsRuns INT = NULL,
@PageNo INT =1,@RowsPerPage INT=10)
AS
BEGIN
with c1 as
(SELECT M.MatchID, M.MatchDate,M.City,M.Venue,
	T1.TeamName Team1Name,T2.TeamName Team2Name,WT.TeamName MatchWonby
FROM match M
JOIN Team T1 on T1.TeamID=M.FirstTeamID
JOIN Team T2 on T2.TeamID=M.SecondTeamID
JOIN MatchTeamResult MTR on MTR.MatchID=M.MatchID and MTR.Result in ('Won','Won dl')
JOIN Team WT on WT.TeamID=MTR.TeamID),

I1 as (SELECT M.MatchID,sum(B1.Score) InningsIscore,COUNT(B1.DismissalType) InningsIWickets 
FROM MATCH M
JOIN BallByBallScoreCard B1 on B1.MatchID=M.MatchID and B1.InningsID=1
GROUP BY M.MatchID),

I2 as(SELECT M.MatchID,sum(B2.Score) InningsIIscore,COUNT(B2.DismissalType) InningsIIWickets 
FROM MATCH M
JOIN BallByBallScoreCard B2 on B2.MatchID=M.MatchID and B2.InningsID=2
GROUP BY M.MatchID)

SELECT c1.MatchDate,c1.City,c1.Venue,c1.Team1Name,c1.Team2Name,c1.MatchWonby,I1.InningsIscore,I1.InningsIWickets,I2.InningsIIscore,I2.InningsIIWickets 
FROM c1
JOIN I2 on I2.MatchID=c1.MatchID
JOIN I1 on I1.MatchID=c1.MatchID
WHERE (c1.City LIKE '%'+@city+'%' OR @city IS NULL) AND 
	(c1.Team1Name LIKE '%'+@TeamName+'%' OR c1.Team2Name LIKE '%'+@TeamName+'%' OR @TeamName IS NULL) AND
	((I1.InningsIscore>=@MinInningsRuns AND I2.InningsIIscore > @MinInningsRuns) OR @MinInningsRuns IS NULL) AND
	((I1.InningsIscore<=@MaxInningsRuns AND I2.InningsIIscore < @MaxInningsRuns) OR @MaxInningsRuns IS NULL) AND
	(c1.MatchDate > @MatchDateFrom OR @MatchDateFrom IS NULL) AND
	(c1.MatchDate < @MatchDateTO OR @MatchDateTO IS NULL)
ORDER BY c1.MatchDate
OFFSET (@RowsPerPage)*(@PageNo-1) ROWS
FETCH NEXT @RowsPerPage ROWS ONLY
END;

EXEC SP_SearchMatches 
	@City='Chandigarh',
	@RowsPerPage=6,
	@PageNo=2
