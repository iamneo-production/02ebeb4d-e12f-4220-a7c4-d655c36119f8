


-- 1.  write an sql query to how many products were sold in february 2019 ?

select sum(quantity) as total_productssold from ECOMMERCE where PURCHASE_DATE >= '2019-02-01' and PURCHASE_DATE <'2019-03-01';

--2. write an sql query to total sales amount in each year ? 


SELECT SUBSTR(purchase_date, 1, 4) AS sales_year, SUM(quantity * price) AS total_salesamount
FROM ECOMMERCE
GROUP BY SUBSTR(purchase_date, 1, 4);

-- 3. write a sql query to what was the total sales amount of each product on a month-wise in the year 2019 ?

select PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2) as "month", sum(quantity*price) as total_sales from ECOMMERCE
where substr(PURCHASE_DATE,1,4)='2019' 
group by productno,substr(PURCHASE_DATE,6,2);


--4. write a sql query to count cutomers from each country?

SELECT country, COUNT(DISTINCT CUSTOMERNO) AS customer_count
FROM ECOMMERCE
GROUP BY country order by country asc;

-- 5. write an sql query to list all unique product names sold from each year?


with CTE AS(SELECT PRODUCTNAME,EXTRACT(YEAR FROM TO_DATE("PURCHASE_DATE",'YYYY-MM-DD')) AS SALES_YEAR FROM ECOMMERCE)
SELECT DISTINCT(PRODUCTNAME) AS UNIQUE_PRODUCTNAME,SALES_YEAR FROM CTE
GROUP BY SALES_YEAR,PRODUCTNAME
ORDER BY SALES_YEAR asc;