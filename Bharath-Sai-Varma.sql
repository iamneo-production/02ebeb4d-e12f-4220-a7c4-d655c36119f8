

--My queries 


--  1


select sum(quantity) total_products_sold 
from ECOMMERCE 
where PURCHASE_DATE >= '2019-02-01' 
and PURCHASE_DATE <'2019-03-01';

-- 2 

select substr(purchase_date, 1, 4) as sales_year , 
sum(quantity * price) as total_sales_amount
from ecommerce
group by substr(purchase_date, 1, 4);            

-- 3 

select productno,substr(purchase_date,6,2) month ,
sum(quantity*price) total_sales from ecommerce 
where substr(purchase_date,1,4)='2019' 
group by productno,substr(purchase_date,6,2);                         



-- 4

select country, count(distinct customerno) as customer_count
from ecommerce
group by country order by country; 

-- 5

select extract(year from to_date(purchase_date, 'yyyy-mm-dd')) as sales_year, 
productname as unique_product_names
from ecommerce
group by extract(year from to_date(purchase_date, 'yyyy-mm-dd')) , productname 
order by extract(year from to_date(purchase_date, 'yyyy-mm-dd')) ;