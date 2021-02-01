use test;

-- print given input string 'welcome' to desired outputs --

select rownum, 
substring('welcome', rownum, 1) as output1,
substring('welcome', 8 - rownum, 1) as output2,
substring('welcome', 1, rownum) as output3,
substring('welcome', rownum) as output4
from tab5 where rownum > 0 and rownum < 8;