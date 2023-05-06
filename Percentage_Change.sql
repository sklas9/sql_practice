create table Sales(
    ID int,
    Date date,
    Amount float
    )
    
    
with combined as(
    select ID, lead(Amount,1,0) over(order by Date asc) as New_Amount
	from Sales
    )
    
select s.*, New_Amount, round((New_Amount - Amount)/Amount * 100,2) as Percentage_Change
from Sales s join combined c on s.ID = c.ID
order by date;

/* Alternative */


with ranked as(
    select *, row_number() over(order by date) as row_num
	from Sales
    )
    
select new.Date, new.Amount as New_Amount, old.Amount as Original_Amount,
round((new.Amount - old.Amount)/old.Amount * 100) as Percentage_Change
from ranked new left join ranked old on new.row_num = old.row_num + 1;
