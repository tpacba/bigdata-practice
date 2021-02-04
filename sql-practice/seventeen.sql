-- write sql to find list of combinations where third is sum of first and second --
with t as (
select level r
from dual
connect by level <=6)
select t1.r ROLL1,t2.r ROLL2,t1.r + t2.r ROLL3
from t t1,t t2
where t1.r + t2.r in( 6,5,4,3,2)
order by t1.r + t2.r desc;

with t as (select level r
from dual
connect by level<=6)
select t1.r as ROLL1, t2.r as ROLL2, t3.r as ROLL3
from t t1, t t2, t t3
where (t3.r = t1.r+t2.r)
order by 3 desc; 

with t as (
select level r
from dual
connect by level <=6)
select t1.r ROLL1,t2.r ROLL2,t1.r + t2.r ROLL3
from t t1,t t2
where t1.r + t2.r <= 6
order by t1.r + t2.r desc;


with t as (select level r
from dual
connect by level<=6)
select t1.r as ROLL1, t2.r as ROLL2, t3.r as ROLL3
from t t1, t t2, t t3
where (t3.r = t1.r+t2.r or t2.r = t1.r+t3.r or t1.r = t2.r+t3.r)
order by 3 desc;