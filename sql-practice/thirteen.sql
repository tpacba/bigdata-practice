use test;

create table if not exists tab13a (
	service_code char(2),
    service_name varchar(255)
);
truncate table tab13a;

create table if not exists tab13b (
	product_code char(3),
    service_order varchar(255)
);
truncate table tab13b;

insert into tab13a (service_code,service_name) values ('a', 'service-a');
insert into tab13a (service_code,service_name) values ('b', 'service-b');
insert into tab13a (service_code,service_name) values ('c', 'service-c');
insert into tab13a (service_code,service_name) values ('d', 'service-d');

insert into tab13b (product_code, service_order) values ('p1', 'a,c');
insert into tab13b (product_code, service_order) values ('p2', 'c,b,d');
insert into tab13b (product_code, service_order) values ('p3', 'd,a,c,b');
insert into tab13b (product_code, service_order) values ('p4', 'a,b,c,d');
insert into tab13b (product_code, service_order) values ('p5', 'd,c,b,a,b');

-- write sql to replace the comma separate dcode with its respoective description --

select * from tab13b;
