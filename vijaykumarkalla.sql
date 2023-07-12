Select* from ECOMMERCE;

SELECT country  FROM ECOMMERCE;

-- query to find how many products were sold in february 2019

Select count(*) as Totalsold From ECOMMERCE where 
Date>='2019-02-01' And Date<'2019-03-01';