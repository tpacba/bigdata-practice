create table if not exists tab37(
	ename varchar(255)
);
truncate table tab37;

insert into tab37(ename) values ('subhashis oracle');
insert into tab37(ename) values ('mohammad fazil');
insert into tab37(ename) values ('sai naveen kumar');

select * from tab37;

-- SQL to count number of occurrences of a vowels in a string Part2 --

select 
	ename,
    length(ename) - length(replace(ename, 'a','')) as a,
    length(ename) - length(replace(ename, 'e','')) as e,
    length(ename) - length(replace(ename, 'i','')) as i,
    length(ename) - length(replace(ename, 'o','')) as o,
    length(ename) - length(replace(ename, 'u','')) as u
from tab37;