--1) TABLE SPORT
CREATE TABLE SPORT(
	SportID INT PRIMARY KEY,
	SportName VARCHAR(255))

INSERT INTO SPORT(SportID,SportName)
SELECT ROW_NUMBER() over (order by Sport) SportID, Sport as SportName
FROM athlete_eventsNew
group by Sport
order by Sport

--2) TABLE PLAYER
CREATE TABLE PLAYER(
	PlayerID INT PRIMARY KEY,
	PlayerName VARCHAR(255),
	Sex VARCHAR(255))

INSERT INTO PLAYER(PlayerID,PlayerName,Sex)
SELECT ID,Name,Sex FROM athlete_eventsNew
GROUP BY ID,Name,Sex
ORDER BY ID

--3) TABLE NOC
CREATE TABLE NOC(NOCID INT PRIMARY KEY,NOCNAME VARCHAR(255))

INSERT INTO NOC(NOCID,NOCNAME)
SELECT ROW_NUMBER() OVER (ORDER BY NOC) as NOCID,NOC NOCNAME
FROM athlete_eventsNew
GROUP BY NOC
ORDER BY NOC

--4) TABLE TEAM
CREATE TABLE TEAM(TeamID INT PRIMARY KEY,TeamName VARCHAR(255))

INSERT INTO TEAM(TeamID,TeamName)
SELECT ROW_NUMBER() OVER (ORDER BY TEAM) TEAMID,
Team TEAMNAME FROM athlete_eventsNew
GROUP BY TEAM
ORDER BY TEAM

--5) TABLE EVENT
CREATE TABLE EVENT(
	EVENTID int PRIMARY KEY,
	EVENTNAME VARCHAR(255),
	EVENTTYPE VARCHAR(255) CHECK (EVENTTYPE in ('Individual','Group')))

INSERT INTO EVENT(EVENTID,EVENTNAME,EVENTTYPE)
SELECT 
ROW_NUMBER() OVER (ORDER BY EVENT) EVENTID,
EVENT,
CASE
	WHEN EVENT LIKE '%Individual%' THEN 'Individual'
	ELSE 'Group'
END AS EVENTTYPE
FROM athlete_eventsNew 
GROUP BY EVENT 
ORDER BY EVENT

--6) TABLE PLAYER_YEAR_WISE_DATA
CREATE TABLE PLAYER_YEAR_WISE_DATA(
	PlayerYearWiseDataId INT PRIMARY KEY,
	PlayerID INT FOREIGN KEY REFERENCES PLAYER(PlayerID),
	Age VARCHAR(255),Year INT,Height VARCHAR(255),Weight VARCHAR(255))

INSERT INTO Player_Year_Wise_Data(PlayerYearWiseDataId,PlayerID,Age,Year,Height,Weight)
SELECT ROW_NUMBER() OVER(ORDER BY ID) SLNO,ID,Age,Year,Height,Weight FROM athlete_eventsNew
GROUP BY ID,Age,Year,Height,Weight
order by ID

--7) TABLE TEAMNOC
CREATE TABLE TEAMNOC(
TEAMNOCID INT PRIMARY KEY,
TEAMID int,
TeamName VARCHAR(255),
NOC VARCHAR(255))

INSERT INTO TEAMNOC(TEAMNOCID,TEAMID,TeamName,NOC)
SELECT ROW_NUMBER() OVER (ORDER BY TeamID) ID,
	T.TeamID,T.TeamName,x.NOC
FROM (SELECT Team,NOC FROM athlete_eventsNew GROUP BY TEAM,NOC) x
JOIN TEAM T ON T.TeamName=x.Team

--8) TABLE SPORTEVENT
CREATE TABLE SPORTEVENT(
	SPORTEVENTID int PRIMARY KEY,
	SPORTID int FOREIGN KEY REFERENCES SPORT(SPORTID),
	EVENTID int FOREIGN KEY REFERENCES EVENT(EVENTID))

INSERT INTO SPORTEVENT(SPORTEVENTID,SPORTID,EVENTID)
SELECT ROW_NUMBER() OVER(ORDER BY x.Sport,x.Event) as SPORTEVENTID,S.SportID,E.EventID
FROM (SELECT SPORT,EVENT 
	FROM athlete_eventsNew
	GROUP BY SPORT,EVENT) x
JOIN Sport S on S.SportName=x.Sport
JOIN Event E on E.EventName=x.Event

--9) TABLE SEASON
CREATE TABLE SEASON(SEASONID int PRIMARY KEY,SeasonName VARCHAR(255))

INSERT INTO SEASON(SEASONID,SeasonName)
SELECT ROW_NUMBER() OVER(ORDER BY Season) SeasonID,Season
FROM athlete_eventsNew
Group BY Season

--10) TABLE GAMES
CREATE TABLE GAMES(
	GameID INT PRIMARY KEY,
	GameName VARCHAR(255),
	Year INT,
	SeasonID INT FOREIGN KEY REFERENCES Season(SeasonID),
	City VARCHAR(255))

INSERT INTO Games(GameID,GameName,Year,SeasonID,City)
SELECT ROW_NUMBER() OVER(ORDER BY x.Games) GameID,
x.Games,x.Year,S.SeasonID,x.City
FROM (SELECT Games,Year,Season,City
FROM athlete_eventsNew
GROUP BY Games,Year,Season,City) x
JOIN Season S on S.SeasonName=x.Season

--11) TABLE YearSeason
CREATE TABLE YearSeason(
	YearSeasonID INT PRIMARY KEY,
	Year INT,
	Season VARCHAR(255))

INSERT INTO YearSeason(YEARSEASONID,Year,Season)
SELECT ROW_NUMBER() OVER(ORDER BY Year,Season)
YEAR,Season 
FROM athlete_eventsNew
GROUP BY YEAR,Season

--12) TABLE PLAYER_DATA
CREATE TABLE PLAYER_DATA(
	PLAYERDATAID INT PRIMARY KEY,
	PlayerID INT FOREIGN KEY REFERENCES PLAYER(PlayerID),
	Age VARCHAR(255),	Height VARCHAR(255),	Weight VARCHAR(255),
	YearSeasonID INT FOREIGN KEY REFERENCES YearSeason(YearSeasonID))

INSERT INTO PLAYER_DATA(PlayerdataID,PlayerID,Age,Height,Weight,YearSeasonID)
SELECT ROW_NUMBER() OVER(ORDER BY x.ID) RWNO,
x.ID,x.Age,x.Height,x.Weight,YS.YearSeasonID
FROM (SELECT ID,Age,Year,Season,Height,Weight FROM athlete_eventsNew
GROUP BY ID,Age,Year,Season,Height,Weight) x
JOIN YEARSEASON YS ON x.Year=YS.Year AND x.Season=YS.Season

--13) TABLE GAMEPLAYER
CREATE TABLE GAMEPLAYER(
	GamePlayerID INT PRIMARY KEY,
	GameID INT FOREIGN KEY REFERENCES Games(GameID),
	PlayerID INT FOREIGN KEY REFERENCES Player(PlayerID))

INSERT INTO GAMEPLAYER(GamePlayerID,GameID,PlayerID)
SELECT ROW_NUMBER() OVER(ORDER BY x.ID) RWNO,G.GameID,x.ID
FROM (SELECT ID,Games,City FROM athlete_eventsNew
GROUP BY ID,Games,City) x
JOIN GAMES G on x.Games=G.GameName and x.City=G.City

--14) TABLE GameTeamPlayer
CREATE TABLE GameTeamPlayer(
	GameTeamPlayerID INT PRIMARY KEY,
	GamePlayerID INT FOREIGN KEY REFERENCES GamePlayer(GamePlayerID),
	TeamNOCID INT FOREIGN KEY REFERENCES TeamNOC(TeamNOCID))

INSERT INTO GameTeamPlayer(GameTeamPlayerID,GamePlayerID,TeamNOCID)
SELECT ROW_NUMBER() OVER(ORDER BY GP.GamePlayerID) RWNO,
	GP.GamePlayerID,TN.TEAMNOCID
FROM (SELECT ID,GAMES,City,Team,NOC 
	FROM athlete_eventsNew
	GROUP BY ID,GAMES,City,Team,NOC) x
JOIN Games G ON G.GameName=x.Games and G.City=x.City
JOIN TEAMNOC TN ON TN.TeamName=x.Team and TN.NOC=x.NOC
JOIN GamePlayer GP ON GP.GameID=G.GameID and GP.PlayerID=x.ID

--15) TABLE GameSport
CREATE TABLE GameSport(
	GameSportID INT PRIMARY KEY,
	GameID INT FOREIGN KEY REFERENCES Games(GameID),
	SportID INT FOREIGN KEY REFERENCES Sport(SportID))

INSERT INTO GameSport(GameSportID,GameID,SportID)
SELECT ROW_NUMBER() OVER(ORDER BY G.GameID,S.SportID) RWNO,
G.GameID,S.SportID 
FROM (SELECT Games,City,Sport FROM athlete_eventsNew
GROUP BY Games,City,Sport) x
JOIN Sport S ON S.SportName=x.Sport
JOIN Games G ON G.GameName=x.Games and G.City=x.City

--16) TABLE GameSportEvent
CREATE TABLE GameSportEvent(
	GameSportEventID INT PRIMARY KEY,
	GameSportID INT FOREIGN KEY REFERENCES GameSport(GameSportID),
	EventID INT FOREIGN KEY REFERENCES Event(EventID))

INSERT INTO GameSportEvent(GameSportEventID,GameSportID,EventID)
SELECT ROW_NUMBER() OVER(ORDER BY GS.GameSportID,E.EventID) RWNO,GS.GameSportID,E.EVENTID
FROM (SELECT Games,City,Sport,Event
	FROM athlete_eventsNew
	GROUP BY Games,City,Sport,Event) x
JOIN Sport S ON S.SportName=x.Sport
JOIN Event E ON E.EVENTNAME=x.Event
JOIN Games G ON G.GameName=x.Games and G.City=x.City
JOIN GameSport GS ON GS.GameID=G.GameID and GS.SportID=S.SportID

--17) TABLE GameSportEventParticipant
CREATE TABLE GameSportEventParticipant(
	GameSportEventParticipantID INT PRIMARY KEY,
	GameTeamPlayerID INT FOREIGN KEY REFERENCES GameTeamPlayer(GameTeamPlayerID),
	SportEventID INT FOREIGN KEY REFERENCES SportEvent(SportEventID),
	Medal VARCHAR(255))

INSERT INTO GameSportEventParticipant(GameSportEventParticipantID,GameTeamPlayerID,SportEventID,Medal)
SELECT 
ROW_NUMBER() OVER(ORDER BY GTP.GameTeamPlayerID,SE.SportEventID) RWNO, 
GTP.GameTeamPlayerID,SE.SportEventID,x.Medal 
FROM (SELECT ID,Team,NOC,Games,City,Sport,Event,Medal 
	FROM athlete_eventsNew
	GROUP BY ID,Team,NOC,Games,City,Sport,Event,Medal) x
JOIN TeamNOC TN ON x.Team=TN.TeamName AND x.NOC=TN.NOC
JOIN Games G ON x.Games=G.GameName AND x.City=G.City
JOIN Sport S ON x.Sport=S.SportName
JOIN Event E ON x.Event=E.EVENTNAME 
JOIN SportEvent SE ON SE.SportID=S.SportID AND SE.EVENTID=E.EVENTID
JOIN GamePlayer GP ON GP.PlayerID=x.ID AND GP.GameID=G.GameID 
JOIN GameTeamPlayer GTP ON GTP.GamePlayerID=GP.GamePlayerID AND GTP.TeamNOCID=TN.TEAMNOCID