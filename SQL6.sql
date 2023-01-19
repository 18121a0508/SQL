1)
create proc GetMatchDetails(
@TeamName Nvarchar(50),
@Season int) as

	with c1 as (select m1.MatchID,m1.TeamID,t1.TeamName as MatchWonBYTeam,m1.TossResult
from MatchTeamResult m1
join team t1 on t1.TeamID=m1.TeamID and m1.TossResult='won'),

	c2 as (select m2.MatchID,m2.TeamID,t2.TeamName as FirstBattingTeam,m2.Activity from MatchTeamResult m2
join team t2 on t2.teamId=m2.TeamID and m2.Activity='bat'
),

	c3 as (select m3.MatchID,t3.TeamID,t3.TeamName as TossWonByTeam,m3.Result from MatchTeamResult m3
join team t3 on t3.TeamID=m3.TeamID and m3.Result in ('won','won dl')
),

	c4 as(select m.Season,m.matchId,m.MatchDate,m.City,m.Venue,
n1.TeamName as FirstTeamName,n2.TeamName as SecondTeamName
from match m 
join team n1 on n1.TeamID=m.FirstTeamID
join team n2 on n2.TeamID=m.SecondTeamID)

select c4.MatchDate,c4.Season,c4.City,c4.Venue,c4.FirstTeamName,c4.SecondTeamName,c3.TossWonByTeam,c2.FirstBattingTeam,c1.MatchWonBYTeam
from c1
join c2 on c2.MatchID=c1.MatchID
join c3 on c3.MatchID=c1.MatchID
join c4 on c4.MatchID=c1.MatchID
where (@TeamName=c4.FirstTeamName or @TeamName=c4.SecondTeamName) and @Season=c4.Season 

/*Exec GetMatchDetails
@TeamName='Kolkata Knight Riders',
@Season=2008*/

2)
create proc SearchMatch(
@TeamName Nvarchar(50)= NULL,
@Season int =NULL,
@FromDate dateTime = NULL,
@toDate dateTime= NULL,
@city Nvarchar(50)=NULL) as

	with c1 as (select m1.MatchID,m1.TeamID,t1.TeamName as MatchWonBYTeam,m1.TossResult
from MatchTeamResult m1
join team t1 on t1.TeamID=m1.TeamID and m1.TossResult='won'),

	c2 as (select m2.MatchID,m2.TeamID,t2.TeamName as FirstBattingTeam,m2.Activity from MatchTeamResult m2
join team t2 on t2.teamId=m2.TeamID and m2.Activity='bat'
),

	c3 as (select m3.MatchID,t3.TeamID,t3.TeamName as TossWonByTeam,m3.Result from MatchTeamResult m3
join team t3 on t3.TeamID=m3.TeamID and m3.Result in ('won','won dl')
),

	c4 as(select m.Season,m.matchId,m.MatchDate,m.City,m.Venue,
n1.TeamName as FirstTeamName,n2.TeamName as SecondTeamName
from match m 
join team n1 on n1.TeamID=m.FirstTeamID
join team n2 on n2.TeamID=m.SecondTeamID)

select c4.MatchDate,c4.Season,c4.City,c4.Venue,c4.FirstTeamName,c4.SecondTeamName,c3.TossWonByTeam,c2.FirstBattingTeam,c1.MatchWonBYTeam
from c1
join c2 on c2.MatchID=c1.MatchID
join c3 on c3.MatchID=c1.MatchID
join c4 on c4.MatchID=c1.MatchID

where ((c4.FirstTeamName like '%'+@TeamName+'%' or c4.SecondTeamName like '%'+@TeamName+'%') and
(@Season=c4.Season)) or
((@city=c4.City) and (@FromDate<c4.MatchDate) and (@toDate>c4.MatchDate))
/* Exec SearchMatch
	@season=2008,
	@teamName='kol',
	@FromDate='2008-04-18 00:00:00.000',
	@city='Bangalore'*/
	
3)

CREATE PROCEDURE SearchMatchDynamic ( @PageNo Int =1, @RowsPerPage Int = 10, @TeamName Nvarchar(50)=NUll , @Season Int=Null, 
                              @FromDate DateTime=Null,  @toDate DateTime=Null, @City Nvarchar(50)=null )
AS
BEGIN
    DECLARE @pgno INT = @PageNo
    DECLARE @rowsppg INT = @RowsPerPage
    SELECT M.MatchDate, M.City, M.Venue, T1.TeamName AS FIRSTTEAMNAME, T2.TeamName AS SECONDTEAMNAME,
        (SELECT T.TEAMNAME 
        FROM TEAM T 
        JOIN MatchTeamResult MTR 
        ON MTR.TeamID=T.TeamID 
        WHERE MTR.MatchID=M.MatchID AND MTR.TossResult='Won') TossWonByTeam,
        (SELECT T.TEAMNAME 
         FROM TEAM T 
         JOIN MatchTeamResult MTR 
         ON MTR.TeamID=T.TeamID 
         WHERE MTR.MatchID=M.MatchID AND MTR.Activity='Bat') TeamBattingFirst,
        (SELECT T.TEAMNAME 
        FROM TEAM T 
        JOIN MatchTeamResult MTR 
        ON MTR.TeamID=T.TeamID 
        WHERE MTR.MatchID=M.MatchID AND MTR.Result IN ('Won', 'Won DL')) MatchWonBY
    FROM MATCH M
    JOIN TEAM T1 ON T1.TeamID=M.FirstTeamID
    JOIN TEAM T2 ON T2.TeamID=M.SecondTeamID
    WHERE (  CHARINDEX(@TeamName,t1.TeamName)!=0 OR CHARINDEX(@TeamName,t2.TeamName)!=0 OR T1.TeamName=@TeamName
                  OR @TeamName IS NULL OR T2.TeamName=@TeamName)
          AND (@Season IS NULL OR M.Season=@Season)
          AND (@City IS NULL OR CHARINDEX(@City, M.City)<>0)
          AND (@FromDate IS NULL OR M.MatchDate>@FromDate)
          AND (@toDate IS NULL OR M.MatchDate<=@toDate)
    ORDER BY M.MatchDate DESC
    OFFSET (@pgno-1)*(@rowsppg) ROWS
    FETCH  NEXT @rowsppg ROWS only

END;
/*searchMatchDynamic @pageno=3, @rowsperpage=10*/

