create table if not exists tab22(
	rownum int auto_increment,
    c int,
    primary key(rownum)
);
truncate table tab22;

insert into tab22(c) values (1);
insert into tab22(c) values (2);
insert into tab22(c) values (3);
insert into tab22(c) values (5);
insert into tab22(c) values (6);
insert into tab22(c) values (7);
insert into tab22(c) values (9);
insert into tab22(c) values (10);
insert into tab22(c) values (11);
insert into tab22(c) values (13);
insert into tab22(c) values (14);
insert into tab22(c) values (16);
insert into tab22(c) values (18);
insert into tab22(c) values (19);
insert into tab22(c) values (20);

select c from tab22;
-- Compute the start and end value of group in given seq --

select min(c) as start_range, max(c) as end_range 
from tab22
group by c-rownum;
