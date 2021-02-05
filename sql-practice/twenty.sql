create table tab20a(
	emp_no int auto_increment,
    ename varchar(255),
    primary key(emp_no)
);

create table tab20b(
	empno1 int,
    ename1 varchar(255),
    empno2 int,
    ename2 varchar(255)
);

insert into tab20a(ename) select ename from emp_t; 
select * from tab20a;

-- write insert statement to split first table with one column to second table with two columns --

select * from tab20b;

insert into tab20b(empno1,ename1)
select emp_no,ename from 
(select * from tab20a order by emp_no)a;

insert into tab20b(empno2,ename2)
select emp_no,ename from 
(select * from tab20a order by emp_no desc)b;