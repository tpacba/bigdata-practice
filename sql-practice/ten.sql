use test;

CREATE TABLE student (
    sno     int,
    name   VARCHAR(30),
    mark   int,
    result varchar(1),
 dept   varchar(5),
 year     int
);

delimiter $$
create procedure insert_values()
BEGIN
	declare i int default 1;
    
    while i <= 1000 do
        INSERT INTO student (sno,name,mark,dept,year) 
        VALUES (i,'STUDENT_'|| i,truncate(dbms_random.value(1,100)),truncate(dbms_random.value(1,6)),truncate(dbms_random.value(1,5)));
		set i = i + 1;
    END while;
    commit;
END;
delimiter;

call insert_values();

update student set result='P' 
where mark >=35;
update student set result='F' 
where mark <35;

update student set dept='CSE' where dept='1';
update student set dept='ECE' where dept='2';
update student set dept='EEE' where dept='3';
update student set dept='MECH' where dept='4';
update student set dept='CVE' where dept='5';