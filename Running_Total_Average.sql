/*Get running/ moving total and average*/

select *, 
sum(order_amount) over(order by order_id) as order_running_total, 
sum(order_amount) over(order by order_id rows between 4 preceding and current row) as running_total_5,
avg(order_amount) over(order by order_id rows between 4 preceding and current row) as running_average_5
from customer_orders;
