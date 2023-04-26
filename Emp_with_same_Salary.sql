/*all employees in a department with same salary*/

select * from emp;
with dupl_sal_dept as(
    select Salary, Dept_ID
    from emp
    group by Dept_ID, Salary
    having count(1) > 1
    )
    
select Emp_ID, Emp_Name, e.Dept_ID, e.Salary
from emp e join dupl_sal_dept d 
on e.Salary = d.Salary and e.Dept_ID = d.Dept_ID
