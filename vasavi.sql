set timing on;

select * from ecommerce;

--(1.How many products were sold in february 2019)

select SUM(Quantity) as soldproducts
from ecommerce where "PURCHASE_DATE" >='2019-02-01'
AND "PURCHASE_DATE" <'2019-03-01';



--(2.sql query to total sale amount in each year)

select EXTRACT(year from To_Date("PURCHASE_DATE",'YYYY-MM-DD'))
as Sale_Year,sum(Quantity*Price) as Total_saleamount
from ECOMMERCE group by "PURCHASE_DATE";




--(3.sql query to what was the total sales amount of 
--each product on a month_wise basis in the year 2019)

SELECT EXTRACT(month from To_Date("PURCHASE_DATE",'YYYY-MM-DD'))as month_sales,
sum(Quantity*price)as total_sales,productno from Ecommerce WHERE
extract(year from To_Date("PURCHASE_DATE",'YYYY-MM-DD'))='2019'
GROUP BY PRODUCTNO,extract(month from To_Date("PURCHASE_DATE",'YYYY-MM-DD'));



--(4.sql query to count the customers from each country)


select COUNT (country) from ecommerce group by country;




--(5.sql query to list all the unique product names 
--sold from each year)

select distinct(PRODUCTNAME),EXTRACT(year from TO_Date
("PURCHASE_DATE",'YYYY-MM-DD')) 
as Sale_Year from ECOMMERCE;


