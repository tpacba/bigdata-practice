DROP TABLE emp;

CREATE TABLE emp (
	empno NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY,
	ename varchar2(10),
	job varchar2(9),
	mgr NUMBER(4),
	hiredate DATE,
	sal number(7,2),
	comm NUMBER(7,2),
	deptno number(2)
);


INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87','dd-mm-rr')-85,3000,NULL,20);
INSERT INTO emp VALUES (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,to_date('13-JUL-87', 'dd-mm-rr')-51,1100,NULL,20);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

SELECT * FROM emp;

-- assign a sequential order, or rank, to people within a department based on salary

SELECT empno, deptno, sal, RANK() OVER (PARTITION BY deptno ORDER BY sal desc) AS rankings FROM emp;

-- assign the rank in the inline view, then uses that rank to restrict the rows to the bottom 2 (worst paid) employees in each department

SELECT * FROM (SELECT empno, deptno, sal, Rank() OVER (PARTITION BY deptno ORDER BY sal) AS rankings FROM emp) WHERE RANKINGS <= 2;

-- assign consecutive ranks

SELECT empno, deptno, sal, Dense_RANK() OVER (PARTITION BY deptno ORDER BY sal desc) AS rankings FROM emp;

--  assign the dense rank in the inline view, then uses that rank to restrict the rows to the top 2 (best paid) employees in each department

SELECT * FROM (SELECT empno, deptno, sal, dense_rank() OVER (PARTITION BY deptno ORDER BY sal desc) AS rankings FROM emp) WHERE rankings <=2;

-- return the salary from the previous row to calculate the difference between the salary of the current row and that of the previous row

SELECT empno, ename, job, sal, lag(sal,1,0) OVER (ORDER BY sal) AS previous_salary, sal - lag(sal,1,0) OVER (ORDER BY sal) AS difference_sal FROM emp;

-- partition by department, so the SAL_PREV column has a default value of "0" for the first row in each department

SELECT deptno, empno, ename, job, sal, lag(sal,1,0) OVER (PARTITION BY deptno ORDER BY sal) AS previous_salary, sal - lag(sal,1,0) OVER (PARTITION BY deptno ORDER BY sal) AS difference_sal FROM emp;

-- return the salary from the next row to calculate the difference between the salary of the current row and the following row

SELECT empno, ename, job, sal, lead(sal,1,0) OVER (ORDER BY sal) AS next_salary, lead(sal,1,0) OVER (ORDER BY sal) - sal AS difference_salary FROM emp;

-- partition by department, so the SAL_NEXT column has a default value of "0" for the last row in each department

SELECT deptno, empno, ename, job, sal, lead(sal,1,0) OVER (PARTITION BY deptno ORDER BY sal) AS next_salary FROM emp;





