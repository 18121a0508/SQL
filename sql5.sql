/*Write a query to split each word in player Name into a seperate row, row shall also have ordinal position of the word in the name starting from 1
Column display order : PlayerName, Word, WordNo
Tables to use : Player
Hints
use recursive CTE
will have to itterate Max 4 times as there are Max four words names*/

1)
select p.PlayerName,value,
row_number() over (partition by p.playerName order by p.playerName ) as WordNo
from player p
cross apply string_split(p.playerName,' ')

3)
select m.MatchDate,m.city,m.Venue,t1.TeamName as FirstTeamName,
t2.TeamName as SecondTeamName,t3.TeamName as TossWonByTeam,
t4.TeamName as TeamBattingFirst, t5.TeamName as MatchWonBy
from match m 

join team t1 on m.FirstTeamID=t1.TeamID
join team t2 on t2.TeamID=m.SecondTeamID
join MatchTeamResult mr1 on mr1.MatchID=m.MatchID and mr1.TossResult='won'
join team t3 on t3.TeamID=mr1.TeamID

join MatchTeamResult mr2 on mr2.MatchID=m.MatchID and mr2.Activity='bat'
join team t4 on t4.TeamID=mr2.TeamID

join MatchTeamResult mr3 on mr3.MatchID=m.MatchID and mr3.result='won'
join team t5 on t5.TeamID=mr3.TeamID

/*OR
with c1 as 
(select m1.MatchID,m1.TeamID,t1.TeamName as MatchWonBY,m1.TossResult
from MatchTeamResult m1
join team t1 on t1.TeamID=m1.TeamID and m1.TossResult='won'),

c2 as (select m2.MatchID,m2.TeamID,t2.TeamName as TeamBattingFirst,m2.Activity from MatchTeamResult m2
join team t2 on t2.teamId=m2.TeamID and m2.Activity='bat'
),

c3 as (select m3.MatchID,t3.TeamID,t3.TeamName as TossWonByTeam,m3.Result from MatchTeamResult m3
join team t3 on t3.TeamID=m3.TeamID and m3.Result='won'
),

c4 as(select m.matchId,m.MatchDate,m.City,m.Venue,
n1.TeamName as FirstTeamName,n2.TeamName as SecondTeamName
from match m 
join team n1 on n1.TeamID=m.FirstTeamID
join team n2 on n2.TeamID=m.SecondTeamID)

select c4.MatchDate,c4.City,c4.Venue,c4.FirstTeamName,c4.SecondTeamName,c3.TossWonByTeam,c2.TeamBattingFirst,c1.MatchWonBY
from c1
join c2 on c2.MatchID=c1.MatchID
join c3 on c3.MatchID=c1.MatchID
join c4 on c4.MatchID=c1.MatchID
*/

4)

with py as (select m.MatchID,m.MatchDate,m.city,m.Venue,t1.TeamName as FirstTeamName,
t2.TeamName as SecondTeamName,t3.TeamName as TossWonByTeam,
t4.TeamName as TeamBattingFirst, t5.TeamName as MatchWonBy

from match m 
join team t1 on m.FirstTeamID=t1.TeamID
join team t2 on t2.TeamID=m.SecondTeamID
join MatchTeamResult mr1 on mr1.MatchID=m.MatchID and mr1.TossResult='won'
join team t3 on t3.TeamID=mr1.TeamID

join MatchTeamResult mr2 on mr2.MatchID=m.MatchID and mr2.Activity='bat'
join team t4 on t4.TeamID=mr2.TeamID

join MatchTeamResult mr3 on mr3.MatchID=m.MatchID and mr3.result='won'
join team t5 on t5.TeamID=mr3.TeamID),
 
I1 as (select p.MatchID,p.InningsID,sum(p.RunsScored) as InningsIRuns,count(p.DismissalType) as InningsIWickets,sum(p.BallsBowled) as InningsIBalls
from PlayerScoreCard p
group by p.MatchID,p.InningsID),

I2 as (select p1.MatchID,p1.InningsID,sum(p1.RunsScored) as InningsIIRuns,count(p1.DismissalType) as InningsIIWickets,sum(p1.BallsBowled) as InningsIIBalls
from PlayerScoreCard p1
group by p1.MatchID,p1.InningsID)

select p.MatchDate,p.City,p.Venue,p.FirstTeamName,p.SecondTeamName,p.TossWonByTeam,
p.TeamBattingFirst,p.MatchWonBy,
c.InningsIRuns,c.InningsIWickets,c.InningsIBalls,
c1.InningsIIRuns,c1.InningsIIWickets,c1.InningsIIBalls
from I1 c
join py p on p.matchId=c.MatchID and c.InningsID=1
join I2 c1 on c1.MatchID=c.MatchID and c1.InningsID=2
order by p.matchId,c.InningsID,c1.InningsID
/*OR
with c1 as 
(select m1.MatchID,m1.TeamID,t1.TeamName as MatchWonBY,m1.TossResult
from MatchTeamResult m1
join team t1 on t1.TeamID=m1.TeamID and m1.TossResult='won'),

c2 as (select m2.MatchID,m2.TeamID,t2.TeamName as TeamBattingFirst,m2.Activity from MatchTeamResult m2
join team t2 on t2.teamId=m2.TeamID and m2.Activity='bat'
),

c3 as (select m3.MatchID,t3.TeamID,t3.TeamName as TossWonByTeam,m3.Result from MatchTeamResult m3
join team t3 on t3.TeamID=m3.TeamID and m3.Result='won'
),

c4 as(select m.matchId,m.MatchDate,m.City,m.Venue,
n1.TeamName as FirstTeamName,n2.TeamName as SecondTeamName
from match m 
join team n1 on n1.TeamID=m.FirstTeamID
join team n2 on n2.TeamID=m.SecondTeamID),

c5 as (select p.MatchID,sum(p.BallsBowled) as InningsIBalls,
sum(p.RunsScored) InningsIRuns,count(p.DismissalType) as InningsIWickets
from PlayerScoreCard p
where p.InningsID=1
group by p.MatchID),

c6 as (select ps.MatchID,sum(ps.BallsBowled) as InningsIIBalls,
sum(ps.RunsScored) InningsIIRuns,count(ps.DismissalType) as InningsIIWickets
from PlayerScoreCard ps
where ps.InningsID=2
group by ps.MatchID)

select c4.MatchDate,c4.City,c4.Venue,c4.FirstTeamName,c4.SecondTeamName,c3.TossWonByTeam,c2.TeamBattingFirst,c1.MatchWonBY,
c5.InningsIRuns,c5.InningsIWickets,c5.InningsIBalls,
c6.InningsIIRuns,c6.InningsIIWickets,c6.InningsIIBalls
from c1
join c2 on c2.MatchID=c1.MatchID
join c3 on c3.MatchID=c1.MatchID
join c4 on c4.MatchID=c1.MatchID
join c5 on c5.matchId=c1.matchId
join c6 on c6.matchId=c1.matchId

*/
5)
CREATE TABLE BattingScoreCard(
			MatchId INT NOT NULL,
			InningsId INT NOT NULL,
			RunsScored INT,
			BallsFaced INT,
			Boundaries INT,
			Sixes INT,
			PlayerId INT FOREIGN KEY REFERENCES PLAYER(PLAYERID),
			PlayingTeamId INT NOT NULL,
			BowlingTeamId INT NOT NULL,
			BowlerId INT,
			FielderId INT,
			DismissalType NVARCHAR(100)
			);


CREATE TABLE BowlingScoreCard(
			MatchId INT NOT NULL,
			InningsId INT NOT NULL,
			BallsBowled INT,
			BoundariesGiven INT,
			SixesGiven INT,
			Wides INT,
			Noballs INT ,
			BattingTeamId INT NOT NULL,
			BowlingTeamId INT NOT NULL,
			WicketsTacken INT
			);

insert into BattingScoreCard
select psc.MatchID, psc.InningsID, psc.RunsScored, psc.BallFaced, psc.Boundries, psc.Sixes, psc.PLayerID, 
	(select case when psc.PlayingTeamID != m.FirstTeamID then m.FirstTeamID else m.SecondTeamID end from match m where m.MatchID=psc.MatchID ) BattingTeam, 
	psc.PlayingTeamID, psc.bowlerid, psc.fielderid, psc.dismissaltype  from PlayerScoreCard psc;

insert into BowlingScoreCard
select psc.MatchID, psc.InningsID, psc.BallsBowled, psc.BoundriesGiven, psc.SixesGiven, psc.Wides, psc.Noballs, psc.PlayingTeamID, 
	(select case when psc.PlayingTeamID != m.FirstTeamID then m.FirstTeamID else m.SecondTeamID end from match m where m.MatchID=psc.MatchID ) BowlingTeamId, 
	psc.WicketsTaken  from PlayerScoreCard psc;

SELECT * FROM BattingScoreCard;
SELECT * FROM BowlingScoreCard;