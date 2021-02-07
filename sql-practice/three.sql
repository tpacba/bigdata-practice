use test;

create table if not exists tab3a (
	c1 char(1)
);

create table if not exists tab3b (
	c1 char(1)
);

truncate table tab3a;
truncate table tab3b;

insert into tab3a(c1) values ('A');
insert into tab3a(c1) values ('B');
insert into tab3a(c1) values ('C');
insert into tab3a(c1) values ('D');
insert into tab3a(c1) values ('E');

insert into tab3b(c1) values ('A');
insert into tab3b(c1) values ('C');
insert into tab3b(c1) values ('E');
insert into tab3b(c1) values ('G');

select * from tab3a;
select * from tab3b;

-- select data from tab3a that don't exits in tab3b without using 'NOT' keyword --

select * 
from tab3a
where 1 > 
	(select count(*) 
    from tab3b 
    where tab3a.c1 = tab3b.c1
    );