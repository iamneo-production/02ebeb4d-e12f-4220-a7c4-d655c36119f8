Select * from ECOMMERCE; /* query to retrive all columns*/ 

SELECT country  FROM ECOMMERCE; /*query to know countries present in the table*/


-- 1.Query to find how many products were sold in february 2019
SET TIMING ON;

Select
sum(QUANTITY) as TotalProductsSold FROM
 ECOMMERCE WHERE PURCHASE_DATE >='2019-02-01'
  and PURCHASE_DATE<'2019-03-01';  /*Time taken:00:00:00:04*/
 

        -- 2.Query to Total sale amount in each year

--  SELECT EXTRACT(YEAR FROM  TO_DATE("Date",'YYYY-MM-DD')) From ECOMMERCE; /*date extraction method */


Select EXTRACT(YEAR FROM  TO_DATE("PURCHASE_DATE",'YYYY-MM-DD')) as "YEAR" , 
    sum(PRICE*QUANTITY) as TotalSaleAmount from ECOMMERCE 
        group by EXTRACT(YEAR FROM  TO_DATE("PURCHASE_DATE",'YYYY-MM-DD'));  /*Time taken 00:00:00:31*/



   SELECT SUBSTR(PURCHASE_DATE,1,4) as "YEAR" ,
    sum(PRICE*QUANTITY) as TotalSalesAmount from ECOMMERCE
    group by SUBSTR(PURCHASE_DATE,1,4); /*00:00:00:14
     since it takes less time than the previous one so  it is more optimised query*/


    --  3.Query to find what was the total sales amount of each product on a month wise basis in 2019   


 select PRODUCTNO,Extract(Month From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')) as "Month",
  sum(PRICE*QUANTITY) as SALESAMOUNT from ECOMMERCE
  where Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD'))=2019 
  group by PRODUCTNO,Extract(Month From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')); /*Time taken:00:00:00:62*/


Select PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2) as "Month",
  sum(PRICE*QUANTITY) as SALES_AMOUNT from ECOMMERCE
  where SUBSTR(PURCHASE_DATE,1,4)='2019' group by PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2); /*00:00:00:26
   since it takes less time than the previous one so  it is more optimised query */
 

              
  --   4.query to count customers of each country


select COUNTRY,Count(Distinct(CUSTOMERNO)) as CUSTOMER_COUNT
from ECOMMERCE Group By COUNTRY; /* Time Taken :00:00:00:14*/



            --5 Query for all the Unique products name sold in each year
 
 select distinct(substr(PURCHASE_DATE,1,4)) as "year",PRODUCTNAME
 from ECOMMERCE order by substr(PURCHASE_DATE,1,4),PRODUCTNAME; /* Time Taken 00:00:00:42*/


 Select DISTINCT(PRODUCTNAME) as UniqueProductName,
 Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')) as "YEAR" FROM ECOMMERCE
 Order By Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')); /* Time Taken:00:00:00:11*/


 Select PRODUCTNAME as UniqueProductName,
 Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')) as "sALES_YEAR" FROM ECOMMERCE
 group by  Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')),PRODUCTNAME
 Order By Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')); 
 /*Time Taken:00:00:00:10*  since it takes less time than the previous one so  it is more optimised query*/
 
 



