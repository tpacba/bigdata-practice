create table if not exists tab23(
	name varchar(255),
    start_year int,
    end_year int
);
truncate table tab23;

insert into tab23(name, start_year, end_year) values ('swift',2007,2009);
insert into tab23(name, start_year, end_year) values ('swift',2009,2011);
insert into tab23(name, start_year, end_year) values ('swift',2011,2013);
insert into tab23(name, start_year, end_year) values ('maruti',2009,2011);
insert into tab23(name, start_year, end_year) values ('maruti',2013,2015);

select * from tab23;

-- Grouping The Range Data --

select name, min(start_year), max(start_year) from tab23 group by name;