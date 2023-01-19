1)
create or alter function GetBallsBowledInOver(
@MatchId as int,
@InningsId as int,
@OverNo as int
)
returns int as
begin
	return (select sum(@@ROWCOUNT) 
			from BallByBallScoreCard bbsc 
			where bbsc.MatchID=@MatchId and bbsc.InningsID=@InningsId and bbsc.OverNO=@OverNo and 
			bbsc.ScoringType not in ('wide','noball'));
end;
/*select dbo.getballsbowledinover(1,1,2) as Valid_Balls */

2)
create or alter function ReverseWords(@Statement as Nvarchar(4000))
returns varchar(max)
as
begin
declare @string Nvarchar(4000)=''
declare @temp as int

while len(@Statement)>0
begin
	set @temp=CHARINDEX(' ',@Statement)
	if @temp>0
	begin
		set @string=substring(@Statement,0,@temp)+' '+@string
		set @Statement=substring(@Statement,@temp+1,len(@Statement))
	end
	else
	begin
		set @string=@Statement+' '+@string
		set @Statement=''
	end
end
return @string;
end;
/*select dbo.ReverseWords('I have marbles for 4 rupees') as Reversed */

3)
create or alter function GetInningsRunRate(
@MatchId int,
@InningsId int)
returns Dec(5,2)
as
begin
	return(select cast(sum(b.score) as float)/count(distinct(b.OverNO)) from BallByBallScoreCard b
			where b.MatchID=@MatchId and b.InningsID=@InningsId
			);
end;

/*select dbo.GetInningsRunRate(1,2) as RunRate*/

4)
create or alter function GetInningsBattingScoreCard(@MatchId as int,@InningsId as int)
returns table
as
	return
		select p.PlayerName,ps.DismissalType,pf.PlayerName as Fielder,pb.PlayerName as Bowler,
		ps.RunsScored,ps.BallFaced,
		case 
			when ps.BallFaced=0 then NULL
			else
				cast(cast(ps.RunsScored as float)/ps.BallFaced as float)*100
		end as StrikeRate
		from 
		PlayerScoreCard ps
		join player p on p.PLayerID=ps.PLayerID 
		join player pb on pb.PlayerID=ps.BowlerID
		join player pf on pf.PlayerID=ps.FielderID
		where ps.MatchID=@MatchId and ps.InningsID=@InningsId

/*
select * from GetInningsBattingScoreCard(423,2);*/

