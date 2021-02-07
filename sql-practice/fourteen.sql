use test;

create table if not exists tab14 (
	tran_date date,
    tran_desc varchar(255),
    tran_amount int
);
truncate table tab14;

insert into tab14(tran_date, tran_desc, tran_amount) values ('2019-05-05', 'bill payment', 1000);
insert into tab14(tran_date, tran_desc, tran_amount) values ('2019-05-07', 'deposit', 5000);
insert into tab14(tran_date, tran_desc, tran_amount) values ('2019-05-09', 'fees payment', 2500);
insert into tab14(tran_date, tran_desc, tran_amount) values ('2019-05-12', 'bonus recieved', 3400);
insert into tab14(tran_date, tran_desc, tran_amount) values ('2019-05-13', 'bonus recieved', 3400);

select * from tab14;

-- write sql to generate all the date range for the transaction --

create temporary table if not exists month(
	tran_date date,
    tran_desc varchar(255),
    tran_amount int
);
truncate table month;

drop procedure if exists fill_days;
delimiter //
create procedure fill_days(start_date date, days int)
	begin
		declare i int default 1;
        declare dt date default start_date;
        
        while i<= days do
			insert into month(tran_date) values (dt);
            set i = i+1;
            set dt = date_add(dt, interval 1 day);
		end while;
    end
//

call fill_days('2019-05-01',31);

select 
	month.tran_date,
	tab14.tran_date,
    tab14.tran_desc,
    tab14.tran_amount 
from month 
left join tab14 
on tab14.tran_date = month.tran_date;