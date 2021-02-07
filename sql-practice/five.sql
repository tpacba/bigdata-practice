use test;

-- write a query to print numbers 1 to n --

create table if not exists tab5(
	rownum int
);
truncate table tab5;

drop procedure if exists num_iteration;
delimiter //
create procedure num_iteration(n int)
begin
	declare i int default 0;
    while i <= n do
		insert into tab5(rownum) values (i);
        set i = i + 1;
    end while;
end
//

call num_iteration(10);

select * from tab5;