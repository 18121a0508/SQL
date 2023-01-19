SQLF01

/*Question No : 1
Write a query to display data for all matched played across all seasons
Column display order : MatchID, Season, MatchDate, City, Venue, FirstTeamID, SecondTeamID
Tables to use : Match
*/
select m.MatchID,m.Season,m.MatchDate,m.City,m.Venue,m.FirstTeamID,m.SecondTeamID
from Match m


/*Question No : 2
Write a query to display Matches played in 2008
Column display order : MatchID, MatchDate, City, Venue, FirstTeamID, SecondTeamID
Tables to use : Match*/
select MatchID,MatchDate,City,Venue,FirstTeamID,SecondTeamID 
from match
where year(MatchDate) in (2008);


/*Question No : 3
Write a query to display Matches played in 2008,2011 or Matches played in Mumbai,Hyderabad
Column display order : MatchID,Season, MatchDate, City, Venue, FirstTeamID, SecondTeamID
Tables to use : Match*/
select MatchID,Season, MatchDate, City, Venue, FirstTeamID, SecondTeamID 
from match
where year(MatchDate) in (2008,2011) or City in ('mumbai','hyderabad');


/*Question No : 4
Write a query to display Matches played between 2008 and 2014 by Chenni Super Kings
Column display order : MatchID,Season, MatchDate, City, Venue, FirstTeamName, SecondTeamName
Tables to use : Match , Team*/
select m.MatchID,m.Season,m.MatchDate,m.City,m.venue,t.teamname first_Team,s.teamname second_Team
from match m 
join team t
on t.TeamID=m.FirstTeamID

join team s
on s.TeamID=m.SecondTeamID
where m.Season between 2008 and 2014;


/*
Question No : 5
Write a query to display Count of Players of a Team by Season
Column display order : Season, TeamName, CountofPlayers
Tables to use : PlayerTeam, Team*/
select ps.season,count(ps.playerid) as player_count,t.teamname
from team t inner join PlayerSeason ps
on t.teamid=ps.TeamID
group by ps.Season,t.teamname;


/*Question No : 6
Write a query to display Count of Matches won by Team by season order by TeamName and Season
Column display order : TeamName,Season, MatchesWon
Tables to use : Match, MatchTeamResult*/
select t.TeamName,ts.Season,count(mtr.MatchID) as Matches_WON
from MatchTeamResult mtr
join TEAMSeason ts on ts.TeamID=mtr.TeamID
join team t on t.TeamID=mtr.TeamID
where mtr.result='won'
group by ts.Season,t.TeamName
order by t.TeamName,ts.Season;


7)
/*7) select playername , t.TeamName , Season,MatchDate,City,Venue, t.TeamName as participatingteamname1 , k.TeamName as participatingteamname2, RunsGiven,BallFaced,DismissalType,
RunsGiven, BallsBowled, WicketsTaken from Player p full outer join PlayerScoreCard ps on p.playerId = ps.PLayerID
full outer join MATCH m on m.matchID = ps.MatchID
full outer join TEAM t on t.TeamID = m.FirstTeamID
full outer join TEAM k on k.TeamID = m.SecondTeamID*/
select *
from PlayerScoreCard psc

join Player p on p.PlayerID=psc.PLayerID

join match m on m.MatchID=psc.MatchID

join team t on t.TeamID=psc.PlayingTeamID

join team t1 on t1.TeamID=m.FirstTeamID

join team t2 on t2.TeamID=m.SecondTeamID

;

/*Question No : 8
Write a query to display teams who played both in 2015 and 2016
Column display order : TeamName
Tables/Views to use : Team2015,Team2016
Note : Use using appt Join Type and filter condition*/
select t1.TeamName
from team2015 t1
inner join team2016 t2
on t1.teamid=t2.teamid;


/*Question No : 9
Write a query to display teams who played in 2015 bot not in 2016
Column display order : TeamName
Tables/Views to use : Team2015,Team2016
Note : Use using appt Join Type and filter condition*/
select t1.teamname TeamName
from 
team2015 t1 
left join team2016 t2
on t1.teamid=t2.teamid
where t2.teamid is NULL;

/*Question No : 10
Write a query to display Players who played in 2015 or 2016 but not both
Column display order : TeamName
Tables/Views to use : Player2015,Player2016
Note : Use using appt Join Type and filter condition*/
select 
p.PlayerName,t.TeamName,m.Season, m.MatchDate, m.City, m.Venue,
t1.TeamName as ParticipatingTeamName1 , t2.TeamName as ParticipatingTeamName2 , 
psc.RunsScored, psc.BallFaced, psc.DismissalType, psc.RunsGiven, 
psc.BallsBowled,psc.WicketsTaken

from 
PlayerScoreCard psc
join player p on p.PlayerID=psc.PLayerID
join team t on t.TeamID=psc.PlayingTeamID
join match m on m.MatchID=psc.MatchID
join team t1 on t1.TeamID=m.FirstTeamID
join team t2 on t2.TeamID=m.SecondTeamID

order by p.PlayerName,m.MatchDate;





SQLF02


/*Question No : 1
Write a query to display No of Seasons in which each team has participated
Column display order : TeamName , SeasonCount
Tables to use : Use your understanding of T20 scheam and use apt tables*/
select t.teamname TeamName,count(ts.season) SeasonCount 
from teamseason ts
join team t on t.TeamID=ts.TeamID
group by t.TeamName;


/*Question No : 2
Write a query to display No of matches played by a player by season
Column display order : PlayerName, Season, MatchCount
Tables to use : PlayerScoreCard , Player , Match
Hints
Player can have more than one row per match in PlayerScoreCard
use Count(distinct )*/
select p.PlayerName,m.season,count(m.MatchID)
from PlayerScoreCard psc
join player p on p.PlayerID=psc.PLayerID
join match m on m.MatchID=psc.MatchID
group by p.PlayerName,m.Season;



/*Question No : 3
Write a query to display Batting and bowling average of a player by season
Column display order : PlayerName,Season, Runsscored, NoOftimesDismissed,BattingAverage, Runsgiven, NoofWicketsTaken, BowlingAverage
Tables to use : PlayerScoreCard , Player , Match
Hints
BattingAverage is Runsscored/ NoOftimesDismissed
BowlingAverage is RunsGiven/ NoofWicketsTaken
Player can be taken as dismissed if dismissaltype is not null
You would need to handle zero divide scenario in the query*/
select p.PlayerName,m.Season, 
sum(psc.RunsScored) Runsscored, count(psc.DismissalType) NoOftimesDismissed,

(case 
	when count(psc.DismissalType)=0 then NULL
	else sum(psc.RunsScored)/count(psc.DismissalType)
 end ) as BattingAverage,


sum(psc.RunsGiven) Runsgiven, sum(psc.WicketsTaken) NoofWicketsTaken,

(case
	when sum(psc.WicketsTaken)=0 then NULL
	else sum(psc.RunsGiven)/sum(psc.WicketsTaken)
 end ) as BowlingAverage

from PlayerScoreCard psc
join player p on p.PlayerID=psc.PLayerID
join match m on m.MatchID=psc.MatchID
group by p.PlayerName,m.Season
order by p.PlayerName,m.Season
;


/*Question No : 4
Write a query to display Matches where City Name of venue is not in any of the two playing teams
Column display order : MatchID,Season, MatchDate, City, FirstTeamName, SecondTeamName
Tables to use : Match , Team*/
select m.MatchID,m.Season,m.MatchDate,m.City,t1.TeamName as FistTeamName,t2.TeamName as SecondTeamName 
from match m
join team t1 on t1.TeamID=m.FirstTeamID
join team t2 on t2.TeamID=m.SecondTeamID
where charindex(m.city,t1.teamName)=0 and charindex(m.city,t2.teamname)=0;



/*Question No : 5
Write a query to display Names of players who have exactly two parts in their Names using like operator
Column display order : PlayerName
Tables to use : Player*/
select PlayerName from player
where playerName not like '% % %';
	/*(or)
select playerName from player
where len(playerName)-len(replace(playerName,' ',''))=1;
*/


/*Question No : 6
Write a query to display Names of players who have exactly three parts in their Names with out using like operator, string value '(sub)' should not be counted as one of the three parts
Column display order : PlayerName
Tables to use : Player*/
select PlayerName from player
where len(playerName)-len(replace(replace(playerName,' (sub)',''),' ',''))=2


/*Question No : 7
Write a query to display Names of players where player name ends with sharma, Khan or sing
Column display order : PlayerName
Tables to use : Player*/
select playerName 
from player 
where PlayerName like '%sharma' or
playerNAme like '%Khan' or playerName like '%sing';


/*Question No : 8
Write a query to display Names of players where Name starts with Y contains PA and end with n
Column display order : PlayerName
Tables to use : Player*/
select PlayerName
from player
where playerName like 'Y%PA%n'


/*Question No : 9
Write a query to display Names of players by replacing sing with sharma, Sharma with Khan and khan with sing
Column display order : PlayerName
Tables to use : Player*/
select 
case 
	when playerName Like '%Sharma%' then replace(playerName,'Sharma','Khan')
	when playerName Like '%singh%' then replace(playerName,'singh','Sharma')
	when playerName Like '%khan%' then replace(playerName,'khan','singh')
	else PlayerName
end as PlayerName
from player
where playerName in (select playerName from player where playerName like '%Sharma%' or playerName like '%singh%' or playerName like '%Khan%');



SQLF03


/*Question No : 1
Write a query to display TOP 5 scorers Across all seasons
Column display order : PlayerName , RunsScored
Tables to use : PlayerScoreCard and Player
Hints
Usage of TOP and Fetch is not valid in the scenario, Learn about TOP with ties and difference between TOP,Fetch and TOP with ties
*/
select top 5 with ties
p.PlayerName,sum(psc.RunsScored) as Runsscored from PlayerScoreCard psc
join player p on p.PlayerID=psc.PLayerID
group by p.PlayerName
order by Runsscored desc;

/*Question No : 2
Write a query to display TOP 10 wicket Takers per season
Column display order : PlayerName , RunsScored
Tables to use : PlayerScoreCard and Player
Hints
Need to use window fuctions*/
select * from


(select  
row_number() over(partition by m.season order by sum(psc.WicketsTaken) desc) as ROWNUM,
p.PlayerName,m.Season,sum(psc.WicketsTaken) as Wickets

from PlayerScoreCard psc
join Player p on p.PlayerID=psc.PLayerID
join match m on m.MatchID=psc.MatchID


group by m.Season,p.PlayerName
) as x
where x.ROWNUM<11
;


/*Question No : 3
Write a query to display Players RunsScored per season, sorted by Runsscored,Season,PlayerNane , display first 100 rows
Column display order : PlayerName ,Season, RunsScored , RowSnO
Tables to use : PlayerScoreCard,Match and Player
Hints
Need to use window fuctions*/
select * 
from
(select 
Row_Number() over (order by sum(psc.runsscored),m.season,p.playerName) as RWNUM,

p.PlayerName,m.Season,sum(psc.RunsScored) as Runsscored from PlayerScoreCard psc
join match m on m.MatchID=psc.MatchID
join player p on p.PlayerID=psc.PLayerID
group by p.PlayerName,m.Season) as x
where x.RWNUM<101
;



/*Question No : 4
Write a query to display Players RunsScored per season, sorted by Runsscored,Season,PlayerNane ; Display 251 to 300th row with out using fetch
Column display order : PlayerName ,Season, RunsScored , RowSnO
Tables to use : PlayerScoreCard,Match and Player
Hints
Need to use window fuctions*/
select * 
from
(select 
Row_Number() over (order by sum(psc.runsscored),m.season,p.playerName) as RWNUM,

p.PlayerName,m.Season,sum(psc.RunsScored) as Runsscored from PlayerScoreCard psc
join match m on m.MatchID=psc.MatchID
join player p on p.PlayerID=psc.PLayerID
group by p.PlayerName,m.Season) as x
where x.RWNUM between 251 and 300
;

5)
 SELECT T.TeamName, lag(m.matchdate) over(partition by m.season,t.teamname order by t.teamname, M.MATCHDATE) PreviousMatchDate,
M.MatchDate CURRENTMATCHDATE, datediff(Day,lag(m.matchdate) over(partition by m.season,t.teamname
order by t.teamname,m.matchid ),m.MatchDate) as CountOFDaysBetweenVictories
FROM TEAM T
JOIN MatchTeamResult M2 ON M2.TeamID=T.TeamID
JOIN MATCH M ON M.MatchID=M2.MatchID
WHERE M2.Result in ('Won', 'Won dl');


SQLF04

/*Question No : 1
Write a query to display TOP 5 instances of Batsman remaning not out for most number of innings , exclude innings 3 and 4 which is a record of super over
Column display order : BatsmanName,NoOFMatches,
Tables to use : PlayerScoreCard and Player
Hints
Get only rows where ballfaced>0 AND InningsID<3*/
1)
select *
from 
(select 
row_number() over (order by count(psc.MatchId) desc) as RWNUM,
p.PlayerName,count(psc.MatchID) as NoOFMatches 
from 
PlayerScoreCard psc
join player p on p.PlayerID=psc.PLayerID
where 
psc.InningsID<3 and psc.DismissalType is NULL and psc.BallFaced>0
group by 
p.PlayerName) as X

where x.RWNUM<6
;


/*Question No : 2
Write a query to list all players by season who has never bowled or batted in the season
Column display order : PlayerName , Season
Tables to use : PlayerScoreCard ,Player and PlayerSeason*/
select x.playerName,x.Season
from
(select ps.Season,p.playerName,sum(psc.BallsBowled) as Balls_bowled,
sum(psc.BallFaced) as Balls_Faced
from PlayerScoreCard psc
join player p on p.PlayerID=psc.PLayerID
join PlayerSeason ps on ps.PlayerID=psc.PLayerID
group by ps.Season,p.PlayerName
) as x
where x.Balls_bowled=0 or x.Balls_Faced=0
order by x.Season,x.PlayerName
;


/*Question No : 3
Write a query using set operator to Get list of players who Played both in 2015 and 2016
Column display order : PlayerName
Tables to use : Player2015,Player2016*/
select PlayerName from Player2015
intersect
select playerName from Player2016;


/*Question No : 4
Write a query using set operator to Get list of players who Played in 2015 bout not in 2016
Column display order : PlayerName
Tables to use : Player2015,Player2016*/
select playerName from player2015
except
select playerName from player2016;

/*Question No : 5
Write a query using set operator to Get list of players who Played both in 2015 abd 2016 but not both
Column display order : PlayerName
Tables to use : Player2015,Player2016*/
(select playerName from player2015
union
select playerName from player2016)
except
(select playerName from player2015
intersect
select playerName from player2016);


/*Question No : 6
Write a query using joins to Get list of players who Played for same team in 2015 abd 2016
Column display order : PlayerName
Tables to use : Player2015,Player2016*/
select p1.PlayerName from 
player2015 p1
join player2016 p2 on p2.PlayerName=p1.PlayerName and
p1.TeamName=p2.TeamName;


/*Question No : 7
Write a query using joins to Get list of players who Played for different teams in 2015 abd 2016
Column display order : PlayerName
Tables to use : Player2015,Player2016*/
select p1.PlayerName from 
player2015 p1
join player2016 p2 on p2.PlayerName=p1.PlayerName and
p1.TeamName<>p2.TeamName
;

/*Question No : 8
Write a query to Get No of valid ball Bowled by bowler per innings
Column display order : BowlerName,BowlingTeamName, MatchDate,InningID , BallsBowled
Tables to use : Player, BallByBallScoreCard , Team, Match
Hints
Ball is valid if it is not a wide or a NoBall
Each ball can have more than one row,one row could have wide or noball details and other could have byes,runs or wicket deatils
you need fist Calculate number of validball per over than aggregte to bowler or match or what every level needed*/
