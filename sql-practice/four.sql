use test;

create table if not exists tab4(
	match_no int not null auto_increment primary key,
    team_a varchar(25),
    team_b varchar(25),
    winner varchar(25)
)

select * from tab4;

insert into tab4(team_a, team_b, winner) values ('west','sri','west');
insert into tab4(team_a, team_b, winner) values ('ind','sri','ind');
insert into tab4(team_a, team_b, winner) values ('aus','sri','aus');
insert into tab4(team_a, team_b, winner) values ('west','sri','sri');
insert into tab4(team_a, team_b, winner) values ('aus','ind','aus');
insert into tab4(team_a, team_b, winner) values ('west','sri','west');
insert into tab4(team_a, team_b, winner) values ('ind','west','west');
insert into tab4(team_a, team_b, winner) values ('west','aus','aus');
insert into tab4(team_a, team_b, winner) values ('west','ind','ind');
insert into tab4(team_a, team_b, winner) values ('aus','west','west');
insert into tab4(team_a, team_b, winner) values ('west','sri','west');
insert into tab4(team_a, team_b, winner) values ('ind','aus','ind');
insert into tab4(team_a, team_b, winner) values ('sri','new','sri');
insert into tab4(team_a, team_b, winner) values ('new','ind','ind');

-- display number of matches played by each team, number of matches won by each team, number of matches lost by each team --

with matches_played as (select team_name, count(*) as no_of_matches_played from (
	select team_a as team_name from tab4 union all select team_b from tab4
) as games_played_table group by team_name),
matches_won as (select winner as team_name, count(*) as no_of_matches_won from tab4 group by winner)
select 
	matches_played.team_name, 
    no_of_matches_played, 
    ifnull(no_of_matches_won,0) as no_of_matches_won,
    no_of_matches_played - ifnull(no_of_matches_won,0) as no_of_matches_lost
from matches_played left join matches_won on matches_played.team_name = matches_won.team_name;
