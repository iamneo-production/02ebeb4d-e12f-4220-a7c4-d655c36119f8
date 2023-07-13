Select * from ECOMMERCE;

SELECT country  FROM ECOMMERCE;


-- 1.query to find how many products were sold in february 2019
SET TIMING ON;
Select
sum(QUANTITY) as TotalProductsSold FROM
 ECOMMERCE WHERE "Date" >='2019-02-01'
  and "Date"<'2019-03-01';


-- 2.query to Total sale amount in each year

--  SELECT EXTRACT(YEAR FROM  TO_DATE("Date",'YYYY-MM-DD')) From ECOMMERCE; /*date extraction method in oracle*/

Select EXTRACT(YEAR FROM  TO_DATE("Date",'YYYY-MM-DD')) as "YEAR" , 
    sum(PRICE*QUANTITY) as TotalSaleAmount from ECOMMERCE 
        group by EXTRACT(YEAR FROM  TO_DATE("Date",'YYYY-MM-DD'));
 


--  3.Query to find what was the total sales amount of each product on a month wise basis in 2019


