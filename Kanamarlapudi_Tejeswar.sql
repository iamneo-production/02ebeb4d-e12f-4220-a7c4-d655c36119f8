select * from ECOMMERCE;

desc ECOMMERCE;

SELECT *
FROM user_ind_columns
WHERE index_name = 'INDEX_ON_DATE';

set TIMING ON;

/* 1.  write an sql query to how many products were sold in february 2019 ?*/
select sum(quantity) from ecommerce 
where purchase_date like '2019-02%';     

--optimized code
select sum(quantity) from ecommerce where purchase_date between '2019-02-01'
and '2019-02-29';

/* 2. write an sql query to total sales amount in each year ? */ 
SELECT CAST(purchase_date AS CHAR(4)) AS year,
       SUM(price * quantity) AS total_sale_amount
FROM ecommerce
GROUP BY CAST(purchase_date AS CHAR(4))
ORDER BY year; 

--optimized code
SELECT SUBSTR(purchase_date, 1, 4) AS sales_year, SUM(quantity * price) AS total_sales_amount
FROM ECOMMERCE
GROUP BY SUBSTR(purchase_date, 1, 4);

/* 3. write a sql query to what was the total sales amount of each product on a month-wise in the year 2019 ?*/
SELECT productno, TO_CHAR(TO_DATE(purchase_date, 'YYYY-MM-DD'), 'Month') AS month, SUM(price * quantity) AS total_sales
FROM ecommerce
WHERE purchase_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY productno, TO_CHAR(TO_DATE(purchase_date, 'YYYY-MM-DD'), 'Month');

--optimized code
select PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2) month, sum(quantity*price) total_sales 
from ECOMMERCE where substr(PURCHASE_DATE,1,4)='2019' 
group by productno,substr(PURCHASE_DATE,6,2);

/* 4. write a sql query to count cutomers from each country?*/
--optimized code
SELECT
  country,
  COUNT(DISTINCT customerno) AS customer_count
FROM
  ecommerce
GROUP BY
  country
ORDER BY
  country;

/* 5. write an sql query to list all unique product names sold from each year?*/
select distinct(substr(PURCHASE_DATE,1,4)),productname
from ecommerce order by substr(PURCHASE_DATE,1,4),PRODUCTNAME;

--optimized code
SELECT EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')) AS sales_year, PRODUCTNAME AS unique_product_names
FROM ecommerce
GROUP BY EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')) , PRODUCTNAME 
order by EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')) ;