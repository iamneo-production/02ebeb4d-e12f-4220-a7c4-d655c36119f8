
-- 1. Query to Show How many products were sold in February 2019

select sum(quantity) from ECOMMERCE
where PURCHASE_DATE >='2019-02-01' and PURCHASE_DATE<'2019-03-01'; 

-- 2. Query to Show Total sale amount in each year--

select sum(quantity*price) as totalsales,substr(purchase_date,1,4) as "year" from ecommerce group by substr(purchase_date,1,4);      


/* 3. Query to Show What was the total sales amount of each product 
      on a month-wise basis in the year 2019 */

select productno,sum(quantity*price) as totalsales,substr(purchase_date,6,2) as "month"
from ecommerce 
where substr(purchase_date,1,4)='2019' group by substr(purchase_date,6,2),productno;  
 

-- 4. Query to Count the Customers from each country


select country, count(distinct customerno) as customers
from ecommerce
group by country ASC;
 /* distinct keyword is used within 'count' function to make sure that each customer
   is counted only once even when the customer have multiple transactions in the table.*/


--5. Query to list all the unique product names sold from each year

with CTE AS
(
SELECT PRODUCTNAME,EXTRACT(YEAR FROM TO_DATE("PURCHASE_DATE",'YYYY-MM-DD')) AS SALES_YEAR 
FROM ECOMMERCE
)
SELECT DISTINCT(PRODUCTNAME) AS UNIQUEPRODUCT_NAME,
SALES_YEAR 
FROM CTE
GROUP BY SALES_YEAR,
PRODUCTNAME 
ORDER BY SALES_YEAR asc;






