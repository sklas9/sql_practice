/* Source - https://community.alteryx.com/t5/Weekly-Challenge/Challenge-88-Counting-Combinations/m-p/84007
 Each transaction contains a list of items that a customer purchased at the market.
 How many combinations of the same objects were purchased?
 In this case, the order does not matter.  That is, the combination of "carrots, tea, shampoo" is the same as "shampoo, carrots, tea".    

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
