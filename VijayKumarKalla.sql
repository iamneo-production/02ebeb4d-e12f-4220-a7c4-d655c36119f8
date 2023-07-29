-- 1.Query to find how many products were sold in february 2019
SET TIMING ON;

Select sum(QUANTITY) as TotalProductsSold FROM
 ECOMMERCE 
 WHERE PURCHASE_DATE >='2019-02-01'and 
  PURCHASE_DATE<'2019-03-01'; 
 

        -- 2.Write a sql Query to Total sale amount in each year

    SELECT SUBSTR(PURCHASE_DATE,1,4) as "YEAR" ,
    sum(PRICE*QUANTITY) as TotalSalesAmount 
    from ECOMMERCE
    group by SUBSTR(PURCHASE_DATE,1,4); 


    --3.Write a sql Query to find what was the total sales amount of each product on a month wise basis in 2019   

 Select PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2) as "Month",
  sum(PRICE*QUANTITY) as TOTAL_SALES_AMOUNT from ECOMMERCE
  where SUBSTR(PURCHASE_DATE,1,4)='2019' 
  group by PRODUCTNO,SUBSTR(PURCHASE_DATE,6,2);

              
  --   4.write a sql query to count customers of each country


   Select COUNTRY,Count(Distinct(CUSTOMERNO)) as CUSTOMER_COUNT
   from ECOMMERCE Group By COUNTRY ; 


    --5 Write Query for all the Unique products name sold in each year
 

 Select PRODUCTNAME as UniqueProductName,
 Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')) as "SALES_YEAR" FROM ECOMMERCE
 group by  Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')),PRODUCTNAME
 Order By Extract(YEAR From To_DATE("PURCHASE_DATE",'YYYY-MM-DD')); 
 
 
 



