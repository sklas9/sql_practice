/* Employees and Managers are stored in the same table, compute who is whose manager*/

select e.Emp_Name, m.Emp_Name
from emp e join emp m on e.Manager_ID = m.Emp_ID;
