SELECT * FROM tab4;

-- write sql query to find played, won, lost group by each team --

select 
	team_name, 
    matches_played, 
    ifnull(wins, 0) as wins, 
    ifnull(matches_played - wins, matches_played) as losses 
from (
	(select winner, count(winner) as wins 
    from tab4 
    group by winner) as a 
    right join
	(select team_name, count(*) as matches_played 
    from (
		select team_a as team_name 
		from tab4 
        union all 
        select team_b 
        from tab4
	) as a 
	group by team_name) as b 
    on a.winner = b.team_name
);