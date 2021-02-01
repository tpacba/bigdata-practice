use test;

DROP TABLE tab2;
create table if not exists tab2(
	ename varchar(25),
	job varchar(25),
	sal int
)

select * from tab2;

insert into tab2(ename, job, sal) values ('KING', 'PRESIDENT', 5100);
insert into tab2(ename, job, sal) values ('BLAKE', 'MANAGER', 2850);
insert into tab2(ename, job, sal) values ('CLARK', 'MANAGER', 2550);
insert into tab2(ename, job, sal) values ('JONES', 'MANAGER', 2975);
insert into tab2(ename, job, sal) values ('SCOTT', 'ANALYST', 3000);
insert into tab2(ename, job, sal) values ('FORD', 'ANALYST', 3000);
insert into tab2(ename, job, sal) values ('SMITH', 'CLERK', 800);
insert into tab2(ename, job, sal) values ('ALLEN', 'SALESMAN', 1600);
insert into tab2(ename, job, sal) values ('WARD', 'SALESMAN', 1250);
insert into tab2(ename, job, sal) values ('MARTIN', 'SALESMAN', 1250);
insert into tab2(ename, job, sal) values ('TURNER', 'SALESMAN', 1500);
insert into tab2(ename, job, sal) values ('ADAMS', 'CLERK', 1100);
insert into tab2(ename, job, sal) values ('JAMES', 'CLERK', 950);
insert into tab2(ename, job, sal) values ('MILLER', 'CLERK', 1400);


-- SHOW EMPLOYEES GETTING SALARY GREAETER THAN AVERAGE SALARY of the job they are working in --
select * from tab2 a where a.sal > (select avg(b.sal) from tab2 b where a.job = b.job);
