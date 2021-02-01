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
insert into tab2(ename, job, sal) values ('JONES', 'MANAGER', 2550);
insert into tab2(ename, job, sal) values ('SCOTT', 'ANALYST', 2550);