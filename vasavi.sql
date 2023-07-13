set timing on;

select * from ecommerce;

--(1.How many products were sold in february 2019)

select SUM(Quantity) as soldproducts
from ecommerce where "Date" >='2019-02-01'
AND "Date" <'2019-03-01';


--(sql query to total sale amount in each year)





--(sql query to what was the total sales amount of 
--each product on a month_wise basis in the year 2019)







--(4.sql query to count the customers from each country)









--(5.sql query to list all the unique product names 
--sold from eachb year)