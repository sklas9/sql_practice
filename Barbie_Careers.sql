/* Source - https://community.alteryx.com/t5/Weekly-Challenge/Challenge-364-Career-Minded-Barbie/td-p/1103358
For this challenge, first determine which career Barbie had more than twice between the years 2017 and 2019.
Next, calculate by job type how many different types of jobs Barbie held over the years from 1959 through 2020, including the percentage of each. 
*/

create table(
ID int,
Type varchar(25),
Career varchar(50),
Year int
);

select Career, count(Career) as Career_Count
from Barbie_Careers
where Year between 2017 and 2019
group by Career
having Career_Count > 2;

select Type, count(Type) as Count_Type, ( count(Type)/(sum(count(Type)) over()) )*100 as Percentage_Type
from Barbie_Careers
group by Type;
