/*For every customer that bought photoshop, return a list of customers and the total spent on all products except photoshop */
create table Adobe_Transactions(
    Cust_ID varchar(10),
    Product varchar(10),
    Revenue double
    )
    
    INSERT INTO `Adobe_Transactions` (`Cust_ID`, `Product`, `Revenue`) VALUES ('100', 'Photoshop', '1500'), 
    ('1', 'Premier Pro', '2500'), ('1', 'After Effects', '1000'), ('23', 'Premier Pro', '2500'), 
    ('12', 'Photoshop', '1500'), ('12', 'Illustrator', '1200') 
    
    select Cust_ID, sum(Revenue) as Total_Revenue
    from Adobe_Transactions 
    where Cust_ID in (select Cust_ID from Adobe_Transactions where Product='Photoshop')
    and Product <> 'Photoshop'
    group by Cust_ID
    order by Total_Revenue DESC 
