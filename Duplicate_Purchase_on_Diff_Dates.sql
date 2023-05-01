/* Source - https://datalemur.com/questions/sql-repeat-purchases */

create table Purchases(
    Cust_ID int,
    Product_ID int,
    Quantity int,
    Purchase_Date datetime
    );

select Cust_ID, Product_ID, count(distinct Purchase_Date) as cnt_same_prod_diff_day
from Purchases
group by Cust_ID, Product_ID
having cnt_same_prod_diff_day > 1
