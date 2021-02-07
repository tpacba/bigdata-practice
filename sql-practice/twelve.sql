use test;

select * from emp_t;

-- write sql to list no_of_employees and name_of_employees reporting to each person --
with mgr_emp as (
	select a.ename as employee, b.ename as manager 
    from emp_t a, emp_t b 
    where a.mgr = b.empno)
select manager, count(employee) as no_of_employees, group_concat(employee) as names_of_employees 
from mgr_emp 
group by manager;
