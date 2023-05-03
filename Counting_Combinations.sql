/* Source - https://community.alteryx.com/t5/Weekly-Challenge/Challenge-88-Counting-Combinations/m-p/84007
 Each transaction contains a list of items that a customer purchased at the market.
 How many combinations of the same objects were purchased?
 In this case, the order does not matter.  That is, the combination of "carrots, tea, shampoo" is the same as "shampoo, carrots, tea".    

INCOMPLETE
*/

create table Grocery_Transactions(
    ID int,
    Item_Number_1 varchar(50),
    Item_Number_2 varchar(50),
    Item_Number_3 varchar(50),
    Item_Number_4 varchar(50),
    Item_Number_5 varchar(50),
    Item_Number_6 varchar(50),
    Item_Number_7 varchar(50),
    Item_Number_8 varchar(50)
    )
    
    
SELECT * FROM `Grocery_Transactions` WHERE 1;
select all_items, count(1)
from(
    select concat(Item_Number_1,', ',Item_Number_2,', ', Item_Number_3,', ',Item_Number_4,', ',Item_Number_5,', ',Item_Number_6,', ', Item_Number_7,', ',Item_Number_8) as all_items
from Grocery_Transactions
    ) a
group by all_items;



        /*pivot down data*/
        select ID, Item_Number_1 as items
        from Grocery_Transactions
        union 
        select ID, Item_Number_2 as items
        from Grocery_Transactions
        union 
        select ID, Item_Number_3 as items
        from Grocery_Transactions
        union 
        select ID, Item_Number_4 as items
        from Grocery_Transactions
        union 
        select ID, Item_Number_5 as items
        from Grocery_Transactions
        union 
        select ID, Item_Number_6 as items
        from Grocery_Transactions
        union 
        select ID, Item_Number_7 as items
        from Grocery_Transactions
        union 
        select ID, Item_Number_8 as items 
        from Grocery_Transactions
        order by ID, items asc
