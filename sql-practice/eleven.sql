use test;

create table if not exists tab11 (
	city_id int auto_increment primary key,
    city_name varchar(255)
);

insert INTO tab11(city_name) values ('DEHLI');
insert INTO tab11(city_name) values ('CHENNAI');
insert INTO tab11(city_name) values ('MUMBAI');
insert INTO tab11(city_name) values ('KOLKATA');

-- print all the possible paths for given cities --
SELECT * FROM tab11 a, tab11 b where a.city_name > b.city_name;