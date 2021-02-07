use test;

create table if not exists tab7 (
	mail_id varchar(255)
);
truncate table tab7;

insert into tab7(mail_id) values ('siva.k.academy@gmail.com');
insert into tab7(mail_id) values ('jeevan.anand.kumar@yahoo.com');
insert into tab7(mail_id) values ('ravi.guru.raj@outlook.com');

-- write a query to extract first, middle, last name and email domain from given email id --

with fn as (
	select 
		mail_id as email,
		substring(mail_id,1,regexp_instr(mail_id, '\\.') - 1) as first_name
	from tab7
),
mn as (
	select 
		email, 
		first_name,
        substring(replace(email,concat(first_name,'.'),''), 1, regexp_instr(replace(email,concat(first_name,'.'),''), '\\.') - 1) as middle_name
	from fn
),
ln as (
	select email,
		first_name,
		middle_name,
		substring(email, length(concat(first_name,'.',middle_name)) + 2,regexp_instr(email,'@') - (length(concat(first_name,'.',middle_name)) + 2)) as last_name
	from mn
) select 
	email,
    first_name,
    middle_name,
    last_name,
    substring(email, regexp_instr(email,'@') + 1) as domain_name
 from ln;