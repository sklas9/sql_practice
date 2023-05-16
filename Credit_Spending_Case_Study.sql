/*
Data source - https://www.kaggle.com/datasets/thedevastator/analyzing-credit-card-spending-habits-in-india?resource=download

2. write a query to print highest spend month and amount spent in that month for each card type
3. write a query to print the transaction details(all columns from the table) for each card type when
it reaches a cumulative of 1000000 total spends(We should have 4 rows in the o/p one for each card type)
4. write a query to find city which had lowest percentage spend for gold card type
5. write a query to print 3 columns: city, highest_expense_type , lowest_expense_type (example format : Delhi , bills, Fuel)
6. write a query to find percentage contribution of spends by females for each expense type
7. which card and expense type combination saw highest month over month growth in Jan-2014
8. during weekends which city has highest total spend to total no of transcations ratio 
9. which city took least number of days to reach its 500th transaction after first transaction in that city
*/

create table CC_Spending(
    City varchar(50),
    Date date,
    Card_Type varchar(25),
    Exp_Type varchar(25),
    Gender varchar(25),
    Amount float
    );
    
   /* 1. write a query to print top 5 cities with highest spends and their percentage contribution of total credit card spends */
with City_Spend as(
    select City, sum(Amount) as Total_Amount, dense_rank() over (order by sum(Amount) desc) as City_Rank
	from CC_Spending
	group by City
    )

select City, Total_Amount, City_Rank, Total_Amount / (select sum(Amount) from CC_Spending) * 100 as Percentage_Contribution
from City_Spend
where City_Rank <=5;

    
