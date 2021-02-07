-- reverse string without using reverse function --

create temporary table if not exists char_table (
	id int auto_increment,
	letter varchar(1),
    primary key(id)
);
truncate table char_table;

drop procedure if exists split_to_char;
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

call split_to_char('welcome');

select * from char_table;