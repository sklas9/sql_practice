/*
create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000);
*/

/*Find the new or returning customers count on each day*/

/*optimized version*/
with cust_first_purchase as (
	    select customer_id, min(order_date) as f_p_date
	    from customer_orders
	    group by customer_id
    )
    select co.order_date,
    sum(case when co.order_date=cfp.f_p_date then 1 else 0 end) as new_customer_count,
    sum(case when co.order_date!=cfp.f_p_date then 1 else 0 end) as returning_customer_count
    from customer_orders co
    join cust_first_purchase cfp
    on co.customer_id = cfp.customer_id
	group by co.order_date; 
	
	
	

#select * from customer_orders;
with cust_first_purchase as (
    select customer_id, min(order_date) as f_p_date
    from customer_orders
    group by customer_id
    )
select order_date, 
sum(case when customer_type='new customer' then 1 else 0 end) as new_customer_count,
sum(case when customer_type='returning customer' then 1 else 0 end) as returning_customer_count
from 
(
    select co.customer_id, co.order_date, cfp.f_p_date,
    case when co.order_date=cfp.f_p_date then 'new customer' else 'returning customer' end as customer_type
    from customer_orders co
    join cust_first_purchase cfp
    on co.customer_id = cfp.customer_id
) a
group by order_date;





