desc ECOMMERCE;

set TIMING ON;

-- 1.  write an sql query to how many products were sold in february 2019 ?
Select sum(QUANTITY) as TotalProductsSold FROM
ECOMMERCE 
WHERE PURCHASE_DATE >='2019-02-01'and PURCHASE_DATE<'2019-03-01'; 

-- 2. write an sql query to total sales amount in each year ?
SELECT SUBSTR(PURCHASE_DATE,1,4) as "YEAR" ,
sum(PRICE*QUANTITY) as TotalSalesAmount 
from ECOMMERCE
group by SUBSTR(PURCHASE_DATE,1,4); 

-- 3. write a sql query to what was the total sales amount of each product on a month-wise in the year 2019 ?
Select PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2) as "Month",
sum(PRICE*QUANTITY) as TOTAL_SALES_AMOUNT from ECOMMERCE
where SUBSTR(PURCHASE_DATE,1,4)='2019' 
group by PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2);

-- 4. write a sql query to count cutomers from each country?
SELECT
  country,
  COUNT(DISTINCT customerno) AS customer_count
FROM
  ecommerce
GROUP BY
  country
ORDER BY
  country ASC;

-- 5. write an sql query to list all unique product names sold from each year?
WITH CTE AS (
  	SELECT 
    PRODUCTNAME, 
    Extract(YEAR From To_DATE("PURCHASE_DATE", 'YYYY-MM-DD')) AS SALES_YEAR
  	FROM ECOMMERCE
)
SELECT 
	Distinct(PRODUCTNAME) AS UniqueProductName,
	SALES_YEAR
FROM CTE
GROUP BY SALES_YEAR, PRODUCTNAME
ORDER BY SALES_YEAR asc;