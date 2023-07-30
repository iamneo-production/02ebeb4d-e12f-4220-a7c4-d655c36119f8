
--(1.How many products were sold in february 2019)

    SET TIMING ON;

    Select sum(QUANTITY) as ProductsSold FROM ECOMMERCE 
    WHERE PURCHASE_DATE >='2019-02-01'and PURCHASE_DATE<'2019-03-01'; 

--(2.sql query to total sale amount in each year)

SELECT SUBSTR(PURCHASE_DATE,1,4) as "YEAR" ,
sum(PRICE*QUANTITY) as SalesAmount 
from ECOMMERCE
group by SUBSTR(PURCHASE_DATE,1,4); 

--(3.sql query to what was the total sales amount of each product on a month_wise basis in the year 2019)

Select PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2) as "Month",
    sum(PRICE*QUANTITY) as SALESAMOUNT from ECOMMERCE
    where SUBSTR(PURCHASE_DATE,1,4)='2019' 
    group by PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2);


--(4.sql query to count the customers from each country)

select COUNTRY,Count(Distinct(CUSTOMERNO)) as CUSTOMER_COUNT from ECOMMERCE Group By COUNTRY order by COUNTRY asc ; 


--(5.sql query to list all the unique product names sold from each year)

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



