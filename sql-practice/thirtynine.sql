create table if not exists tab39(
	deptno int,
    ename varchar(200)
);
truncate table tab39;

-- create table if not exists tab39_reverse(
-- 	deptno int,
--     ename varchar(200)
-- );
-- truncate table tab39_reverse;

insert into tab39(deptno,ename) values (10, 'RAVI');
insert into tab39(deptno,ename) values (10, 'RAGHU');
insert into tab39(deptno,ename) values (10, 'RAJU');
insert into tab39(deptno,ename) values (20, 'MOHAN');
insert into tab39(deptno,ename) values (20, 'PRIYA');
insert into tab39(deptno,ename) values (30, 'PRAVEEN');

select * from tab39;
-- SQL to convert comma separated string to rows and vice versa --

select deptno, group_concat(ename) as ename
from tab39
group by deptno;

-- insert into tab39_reverse
-- select * 
-- from (select deptno, group_concat(ename) as ename
-- from tab39
-- group by deptno) subquery;

-- select * from tab39_reverse;