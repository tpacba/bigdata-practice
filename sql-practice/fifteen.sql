-- write sql to find number of monday, tuesday,wednesday... in month --
create table if not exists month_in (
	tran_date date,
    month int,
    day_of_week int
);
truncate table month_in;

drop procedure if exists month;
delimiter //
create procedure month(today date)
begin
	declare i int default 1;
    declare dt_forward date default today;
    declare dt_backward date default today;
    
    while i <= 31 do 
		insert into month_in(tran_date) values (dt_forward);
        insert into month_in(tran_date) values (dt_backward);
        set i = i+1;
        set dt_forward = date_add(dt_forward, interval 1 day);
		set dt_backward = date_add(dt_backward, interval -1 day);
    end while;
end
//

call month(sysdate());

select * from month_in;

select 
	day_of_week, 
	count(day_of_week) 
from (
    select 
		tran_date, 
		month(tran_date) as num_of_month, 
		case
			when dayofweek(tran_date) = 1 then 'sunday'
			when dayofweek(tran_date) = 2 then 'monday'
			when dayofweek(tran_date) = 3 then 'tuesday'
			when dayofweek(tran_date) = 4 then 'wednesday'
			when dayofweek(tran_date) = 5 then 'thursday'
			when dayofweek(tran_date) = 6 then 'friday'
			when dayofweek(tran_date) = 7 then 'saturday'
		end as day_of_week
	from month_in 
	order by tran_date
) as a
where num_of_month = 2
group by day_of_week;