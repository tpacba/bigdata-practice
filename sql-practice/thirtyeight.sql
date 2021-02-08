-- SQL to Get all dates for the given input month and year | date range --

create temporary table if not exists current_month(
	current_month date
);
truncate table current_month;

drop procedure if exists days_31;
delimiter //
	create procedure days_31()
    begin
	declare i int default 0;
    declare dt date default sysdate();
    declare dr date default sysdate();
		while i <= 31 do
			insert into current_month(current_month) values (dt);
			insert into current_month(current_month) values (dr);
			set i = i + 1;
            set dt = date_add(dt, interval 1 day);
            set dr = date_add(dr, interval -1 day);
		end while;
	end
//

call days_31();

select * from current_month where month(current_month) = month(sysdate()) order by current_month;