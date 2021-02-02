use test;

create table tab8 (
	mail_id varchar(255)
);

insert into tab8(mail_id) values ('siva.k.academy@gmail.com');
insert into tab8(mail_id) values ('jeevan.anand@yahoo.com');
insert into tab8(mail_id) values ('ravi@outlook.com');
insert into tab8(mail_id) values ('tristan.malihan.pacba@yahoo.com');

-- extract first, middle, last name and domain --

with dn as (
	select 
		mail_id, 
		substring(mail_id, 1, regexp_instr(mail_id, '@') - 1) as user_name, 
        substring(mail_id, regexp_instr(mail_id, '@') + 1) as domain_name,
        length(mail_id) - length(replace(mail_id, '.','')) - 1 as no_periods
	from tab8
), fn as (
	select 
		mail_id,
        domain_name,
		no_periods, 
        user_name,
		case when no_periods = 0 then user_name
		when no_periods > 0 then substring(user_name,1,locate('.',user_name) - 1)
		else null
		end as first_name
	from dn
), mn as (
	select 
		mail_id,
        domain_name,
		no_periods, 
        user_name,
        first_name,
        case when no_periods > 1 then substring(replace(user_name, concat(first_name,'.'), ''), 1,locate('.',replace(user_name, concat(first_name,'.'), '')) - 1)
        else null
        end as middle_name
	from fn
)
select mail_id, domain_name, first_name, middle_name,
case when no_periods = 1 then replace(user_name, concat(first_name,'.'),'')
when no_periods > 1 then replace(user_name, concat(first_name,'.',middle_name,'.'),'')
else null
end as last_name
from mn;