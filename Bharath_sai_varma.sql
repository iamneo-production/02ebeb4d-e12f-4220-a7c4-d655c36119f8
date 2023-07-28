--1.Write a SQL query to find out how many products were sold in February 2019

	select sum(quantity)
        from ecommerce
        where purchase_date between '2019-02-01' and '2019-02-29';



--2. Write a SQL query to find out Total Sale amount in each year

	select substr(purchase_date,1,4) as sales_year,sum(quantity*price) as totamount
	from ecommerce group by substr(purchase_date,1,4);



--3.Write a SQL query to find out the total sales amount of each product on a month-wise basis in the year 2019

	select substr(PURCHASE_DATE,6,2),productno,sum(price*QUANTITY)
	from ECOMMERCE where substr(purchase_date,1,4)='2019'
	group by substr(PURCHASE_DATE,6,2),
	PRODUCTNO order by substr(PURCHASE_DATE,6,2),PRODUCTNO; 



--4.Write the SQL query to count the customers from each country

	select country,count(distinct customerno)
	from ecommerce
	group by country;



--5.Write a SQL query to list all the unique product names sold from each year

	select extract(year from to_date(PURCHASE_DATE,'yyyy-mm-dd')),productname
	from ecommerce
	group by extract(year from to_date(PURCHASE_DATE,'yyyy-mm-dd')),productname
	order by EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'yyyy-mm-dd')),PRODUCTNAME;