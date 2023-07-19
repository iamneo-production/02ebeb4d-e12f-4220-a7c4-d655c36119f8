select * from ecommerce;

desc ecommerce; 

-- 1. Query to Show How many products were sold in February 2019--
--
set timing on;
select sum(quantity) from ECOMMERCE
where PURCHASE_DATE >='2019-02-01' and PURCHASE_DATE<'2019-03-01'; --optimized--

set timing on;
select sum(quantity) from ecommerce 
where purchase_date between '2019-02-01' and '2019-02-28'; 

set timing on;
select sum(quantity) from ECOMMERCE
where purchase_date like '2019-02%';
--


-- 2. Query to Show Total sale amount in each year--
--
set timing on;
select sum(quantity*price) as totalsales,substr(purchase_date,1,4) as year
from ecommerce 
group by substr(purchase_date,1,4);      --optimized--

set timing on;
select sum(quantity*price) as totalsales,extract(year from to_date(purchase_date,'YYYY-MM-DD')) as year
from ecommerce 
group by extract(year from to_date(purchase_date,'YYYY-MM-DD'));
--


/* 3. Query to Show What was the total sales amount of each product 
      on a month-wise basis in the year 2019 */
--
set timing on;
select productno,sum(quantity*price) as totalsales,substr(purchase_date,6,2) as month
from ecommerce 
where substr(purchase_date,1,4)='2019'
group by substr(purchase_date,6,2),productno
order by substr(purchase_date,6,2),productno;    --optimized--

set timing on;
select productno,sum(quantity*price) as totalsales,extract(month from to_date(PURCHASE_DATE,'yyyy-mm-dd')) as month
from ecommerce 
where extract(year from to_date(purchase_date,'yyyy-mm-dd'))= 2019
group by extract(month from to_date(PURCHASE_DATE,'yyyy-mm-dd')),productno
order by extract(month from to_date(PURCHASE_DATE,'yyyy-mm-dd')),productno;
--


-- 4. Query to Count the Customers from each country--
--
set timing on;
select country,count(customerno) from ecommerce 
group by country;

--Here the count includes the count of customers even if the customers has more than one transaction.--

select country, count(distinct customerno) as customers
from ecommerce
group by country;
 /* distinct keyword is used within 'count' function to make sure that each customer
   is counted only once even when the have multiple transactions in the table.*/
--


--5. Query to list all the unique product names sold from each year--
--
set timing on;
select distinct productname as unique_products,extract(YEAR FROM TO_DATE(purchase_date, 'YYYY-MM-DD')) as year 
from ecommerce
order by extract(YEAR FROM TO_DATE(purchase_date, 'YYYY-MM-DD')),productname;  --optimized--

set timing on;
select productname as unique_products,extract(YEAR FROM TO_DATE(purchase_date, 'YYYY-MM-DD')) as year 
from ecommerce
group by extract(YEAR FROM TO_DATE(purchase_date, 'YYYY-MM-DD')),productname
order by extract(YEAR FROM TO_DATE(purchase_date, 'YYYY-MM-DD')),productname;  --optimized--

set timing on;
select distinct productname,substr(purchase_date,1,4)
from ecommerce
order by productname,substr(purchase_date,1,4);
--




