/* new and returning cust DB, added a few entries manually for edge cases */
/* Rank only the duplicate entries. An entry is duplicate if all 3 columns except order_id are same */

WITH Dupl_Cust AS
(
    SELECT customer_id, order_date, order_amount, RANK() OVER(ORDER BY customer_id) AS dupl_rank
    FROM customer_orders
    GROUP BY customer_id, order_date, order_amount
    HAVING COUNT(1) > 1
 )
 
 SELECT c.*, dc.dupl_rank
 FROM customer_orders c 
 LEFT JOIN Dupl_Cust dc
 ON c.customer_id = dc.customer_id and c.order_date = dc.order_date and c.order_amount = dc.order_amount;
 
 
 
