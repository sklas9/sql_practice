/*Query to find highest and lowest earning employees in each dept */

select Emp_Name, Dept_ID, Salary
from(
    select Emp_Name, Dept_ID, Salary,
    rank() over(partition by Dept_ID order by Salary asc) as ra,
    rank() over(partition by Dept_ID ORDER by Salary desc) as rd
    from emp 
    group by Emp_Name, Dept_ID, Salary
    ) a
where ra = 1 or rd = 1
order by Dept_ID,Salary
