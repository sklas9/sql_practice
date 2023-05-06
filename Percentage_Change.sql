create table Sales(
    ID int,
    Date date,
    Amount float
    )

with ranked as(
    select *, row_number() over(order by date) as row_num
	from Sales
    )
    
select new.Date, new.Amount as New_Amount, old.Amount as Original_Amount,
round((new.Amount - old.Amount)/old.Amount * 100) as Percentage_Change
from ranked new left join ranked old on new.row_num = old.row_num + 1
