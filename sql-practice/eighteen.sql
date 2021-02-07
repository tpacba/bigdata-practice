-- sort the numbers in the comma separated list --
-- sort the characters in a given string --

create temporary table if not exists string_rows(
	letter varchar(1)
);
truncate table string_rows;

drop procedure if exists split_string;
delimiter //
create procedure split_string(list_string varchar(255))
begin
	declare i int default 1;
    while i <= length(replace(list_string,',','')) do
		insert into string_rows(letter) values (SUBSTRING_INDEX(SUBSTRING_INDEX(list_string, ',', i), ',', -1));
		set i = i + 1;
    end while;
end
//

call split_string('f,e,s,t,h,q,g,i,o');

select * from string_rows order by letter;