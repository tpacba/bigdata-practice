use test;

CREATE TABLE stu_tab (
    sno     int,
    name   VARCHAR(30),
    mark   int,
    result varchar(1),
 dept   varchar(5),
 year     int
);

delimiter //
create procedure insert_values()
BEGIN
	declare i int default 1;
    
    while i <= 100 do
        INSERT INTO stu_tab (sno,name,mark,dept,year) 
        VALUES (i,concat('STUDENT_', i),(select FLOOR(RAND()*(99))+1),(select FLOOR(RAND()*(5))+1),(select FLOOR(RAND()*(4))+1));
		set i = i + 1;
    END while;
END
//

call insert_values();

drop table stu_tab
drop procedure insert_values
select * from stu_tab

update stu_tab set result='P' 
where mark >=35;
update stu_tab set result='F' 
where mark <35;

update stu_tab set dept='CSE' where dept='1';
update stu_tab set dept='ECE' where dept='2';
update stu_tab set dept='EEE' where dept='3';
update stu_tab set dept='MECH' where dept='4';
update stu_tab set dept='CVE' where dept='5';

-- write query to print year-wise and dept-wise --
select 
	dept, 
	sum(if(result = 'F' and year = 1, 1, 0)) as year1_fail, 
    sum(if(result = 'P' and year = 1, 1, 0)) as year1_pass,
    sum(if(result = 'F' and year = 2, 1, 0)) as year2_fail, 
    sum(if(result = 'P' and year = 2, 1, 0)) as year2_pass,
    sum(if(result = 'F' and year = 3, 1, 0)) as year3_fail, 
    sum(if(result = 'P' and year = 3, 1, 0)) as year3_pass,
    sum(if(result = 'F' and year = 4, 1, 0)) as year4_fail,
    sum(if(result = 'P' and year = 4, 1, 0)) as year4_pass
from stu_tab
group by dept;

select * from (select 
	year,
    sum(if(result = 'F' and dept = 'EEE', 1, 0)) as EEE_fail,
	sum(if(result = 'P' and dept = 'EEE', 1, 0)) as EEE_pass,
    sum(if(result = 'F' and dept = 'CSE', 1, 0)) as CSE_fail,
	sum(if(result = 'P' and dept = 'CSE', 1, 0)) as CSE_pass,
    sum(if(result = 'F' and dept = 'ECE', 1, 0)) as ECE_fail,
	sum(if(result = 'P' and dept = 'ECE', 1, 0)) as ECE_pass,
    sum(if(result = 'F' and dept = 'MECH', 1, 0)) as MECH_fail,
	sum(if(result = 'P' and dept = 'MECH', 1, 0)) as MECH_pass,
    sum(if(result = 'F' and dept = 'CVE', 1, 0)) as CVE_fail,
	sum(if(result = 'P' and dept = 'CVE', 1, 0)) as CVE_pass
from stu_tab
group by year) as temp_table order by year;