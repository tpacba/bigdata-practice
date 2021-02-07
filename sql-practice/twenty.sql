create table if not exists tab20a(
	emp_no int auto_increment,
    ename varchar(255)
);
truncate table tab20a;

create table if not exists tab20b(
	id int auto_increment,
	empno1 int,
    ename1 varchar(255),
    empno2 int,
    ename2 varchar(255),
    primary key(id)
);
truncate table tab20b;

insert into tab20a(ename) select ename from emp_t; 

select * from tab20a;

-- write insert statement to split first table with one column to second table with two columns --

select * from tab20b;
truncate table tab20b;
drop table tab20b;

alter table tab20a drop primary key;

insert into tab20b(empno1,ename1)
select a.emp_no,a.ename,b.emp_no,b.ename from 
(select * from tab20a order by emp_no)a, (select * from tab20a order by emp_no desc)b;