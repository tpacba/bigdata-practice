create table if not exists tab_chart(
	TYPE_OF_CHART varchar(100), 
    DATE_OF_CHART date, 
    TITLE varchar(100),
    ARTIST varchar(100)
);
truncate table tab_chart;

insert into tab_chart values('Albums','83-02-27','THRILLER','MICHAEL JACKSON');
insert into tab_chart values('Albums','83-03-06','WAR','U2');
insert into tab_chart values('Albums','83-03-13','THRILLER','MICHAEL JACKSON');
insert into tab_chart values('Albums','83-03-20','THE HURTING','TEARS FOR FEARS');
insert into tab_chart values('Albums','83-03-27','THE FINAL CUT','PINK FLOYD');
insert into tab_chart values('Albums','83-04-03','THE FINAL CUT','PINK FLOYD');
insert into tab_chart values('Albums','83-04-10','FASTER THAN THE SPEED OF NIGHT','BONNIE TYLER');
insert into tab_chart values('Albums','83-04-17','LET''S DANCE','DAVID BOWIE');
insert into tab_chart values('Albums','83-04-24','LET''S DANCE','DAVID BOWIE');
insert into tab_chart values('Albums','83-05-01','LET''S DANCE','DAVID BOWIE');
insert into tab_chart values('Albums','83-05-08','TRUE','SPANDAU BALLET');
insert into tab_chart values('Albums','83-05-13','THRILLER','MICHAEL JACKSON');
insert into tab_chart values('Albums','83-05-22','THRILLER','MICHAEL JACKSON');
insert into tab_chart values('Albums','83-05-29','THRILLER','SOME OTHER ARTIST');
insert into tab_chart values('Albums','83-06-05','THRILLER','MICHAEL JACKSON');
insert into tab_chart values('Albums','83-06-12','THRILLER','MICHAEL JACKSON');
insert into tab_chart values('Albums','83-06-19','SYNCHRONICITY','THE POLICE');
insert into tab_chart values('Albums','83-06-26','SYNCHRONICITY','THE POLICE');
insert into tab_chart values('Albums','83-07-03','FANTASTIC','WHAM!');

select * from tab_chart;

-- SQL to summarize data one row for continuous play of album --

select min(date_of_chart) as date, title, artist 
from tab_chart 
group by title, artist, week(date_of_chart)
order by date;