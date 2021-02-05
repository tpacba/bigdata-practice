-- reverse string without using reverse function --

create temporary table char_table (
	id int auto_increment,
	letter varchar(1),
    primary key(id)
);

delimiter //
	create procedure split_to_char (phrase varchar(255))
    begin
		declare i int default 0;
        
        while i < length(phrase) do
			insert into char_table(letter) values (substring(phrase,length(phrase)-i,1));
            set i = i + 1;
        end while;
    end
//

drop table char_table;
truncate table char_table;
drop procedure split_to_char;

call split_to_char('welcome');
select * from char_table;