select * from ecommerce;

desc ecommerce; 

/*query to show how many products were sold in february 2019*/
--
set timing on;
select sum(quantity) from ECOMMERCE
where PURCHASE_DATE >='2019-02-01' and PURCHASE_DATE<'2019-03-01';

set timing on;
select sum(quantity) from ecommerce 
where purchase_date between '2019-02-01' and '2019-02-28';
--

/* Query to Total sale amount in each year*/
--
set timing on;
select sum(quantity*price),extract(year from to_date(purchase_date,'YYYY-MM-DD'))
FROM ECOMMERCE 
GROUP BY extract(year from to_date(purchase_date,'YYYY-MM-DD'));

SET TIMING ON;
Select substr(purchase_date,1,4),sum(quantity*price)
from ecommerce group by substr(purchase_date,1,4);
--

/*query to what was the total sales amount of each product 
on a month-wise basis in the year 2019*/
--
set timing on;
select productno,sum(quantity*price),substr(purchase_date,6,2) 
from ecommerce 
where substr(purchase_date,1,4)='2019'
group by substr(purchase_date,6,2),productno
order by substr(purchase_date,6,2),productno;

/*query to count the customers from each country*/
set timing on;
select country,count(CUSTOMERNO) from ecommerce 
group by country;
--

/*query to list all the unique product names sold from each year*/
--
set timing on;
select distinct(substr(purchase_date,1,4)),PRODUCTNAME
from ecommerce
order by substr(purchase_date,1,4),productname;

set timing on;
select extract(YEAR FROM TO_DATE(purchase_date, 'YYYY-MM-DD')) as year, productname as unique_products from ecommerce
group by extract(YEAR FROM TO_DATE(purchase_date, 'YYYY-MM-DD')), productname 
order by extract(YEAR FROM TO_DATE(purchase_date, 'YYYY-MM-DD'));
--