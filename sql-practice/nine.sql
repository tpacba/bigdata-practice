use test;

create table if not exists emp_t(empno int,
                   ename varchar(100),
                   mgr   int,
                   sal   int);
truncate table emp_t;

Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7839,'KING',null,1000);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7698,'BLAKE',7839,700);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7782,'CLARK',7839,500);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7566,'JONES',7839,800);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7788,'SCOTT',7566,200);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7902,'FORD',7566,100);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7369,'SMITH',7902,75);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7499,'ALLEN',7698,100);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7521,'WARD',7698,200);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7654,'MARTIN',7698,150);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7844,'TURNER',7698,150);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7876,'ADAMS',7788,50);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7900,'JAMES',7698,100);
Insert into EMP_T (EMPNO,ENAME,MGR,SAL) values (7934,'MILLER',7782,300);

select * from emp_t;

-- write a sql to compute the group salary of all the employees --

select *
from emp_t as t1
left join emp_t as t2 on t2.mgr = t1.empno
left join emp_t as t3 on t3.mgr = t2.empno
left join emp_t as t4 on t4.mgr = t3.empno
where t1.empno = 7839;

with recursive employee_paths (empno, ename, sal, path) as 
(
	select empno, ename, sal, cast(empno as char(200))
    from emp_t
    where empno = 7839
    union all
    select emp_t.empno, emp_t.ename, emp_t.sal, concat(employee_paths.path, ',', emp_t.empno)
    from employee_paths join emp_t
    on employee_paths.empno = emp_t.mgr
)
select * from employee_paths;