Select * from ECOMMERCE;

SELECT country  FROM ECOMMERCE;

select EXTRACT(Year from DATE) from ECOMMERCE;
-- query to find how many products were sold in february 2019
Select COUNT(*) as TOTAL FROM
 ECOMMERCE WHERE "Date" >='2019-02-01'
  and "Date"<'2019-03-01';