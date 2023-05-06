WITH emp_ranking as
(
    select *,rank() over(order by Emp_ID) as r
	from emp
)
select * from emp_ranking 
where r = 1 or r = (select max(r) from emp_ranking);
