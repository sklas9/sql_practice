/*Fince the employees currently present in the office */

create table Office ( 
  Emp_id int
, status varchar(10)
, time datetime);

insert into Office values ('1', 'in', '2019-12-22 09:00:00');
insert into Office values ('1', 'out', '2019-12-22 09:15:00');
insert into Office values ('2', 'in', '2019-12-22 09:00:00');
insert into Office values ('2', 'out', '2019-12-22 09:15:00');
insert into Office values ('2', 'in', '2019-12-22 09:30:00');
insert into Office values ('3', 'out', '2019-12-22 09:00:00');
insert into Office values ('3', 'in', '2019-12-22 09:15:00');
insert into Office values ('3', 'out', '2019-12-22 09:30:00');
insert into Office values ('3', 'in', '2019-12-22 09:45:00');
insert into Office values ('4', 'in', '2019-12-22 09:45:00');
insert into Office values ('5', 'out', '2019-12-22 09:40:00');


select Emp_ID 
from 
(
    select *, DENSE_RANK() OVER(PARTITION BY Emp_ID ORDER BY time DESC) as Rnk 
	from Office
) a
where Rnk = 1 and status = 'in';


select Emp_ID, 
max(case when status = 'in' then time end) as in_time,
max(case when status = 'out' then time end) as out_time
from Office 
group by Emp_ID
having in_time > out_time or out_time is null
order by Emp_ID;


