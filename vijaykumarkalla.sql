Select * from ECOMMERCE;

SELECT country  FROM ECOMMERCE;


-- query to find how many products were sold in february 2019
Select
sum(QUANTITY) as TotalProducts FROM
 ECOMMERCE WHERE "Date" >='2019-02-01'
  and "Date"<'2019-03-01';