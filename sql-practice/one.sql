use test;

create table if not exists tab1(
	s_no int,
	col1 varchar(1),
	col2 varchar(1),
	col3 varchar(1),
	col4 varchar(1),
	col5 varchar(1)
);

truncate table tab1;

insert into tab1(s_no,col1,col2,col3,col4,col5) values (1,'a','b','c','d','e');
insert into tab1(s_no,col1,col2,col3,col4,col5) values (2,null,'a','b','c','d');
insert into tab1(s_no,col1,col2,col3,col4,col5) values (3,'e',null,null,null,'a');
insert into tab1(s_no,col1,col2,col3,col4,col5) values (4,null,'a','e',null,'d');
insert into tab1(s_no,col1,col2,col3,col4,col5) values (5,'e','d','c','b',null);

-- show rows that contain 'a' without using the 'OR' statement --
select * from tab1 where 'a' in (col1, col2,col3,col4,col5);