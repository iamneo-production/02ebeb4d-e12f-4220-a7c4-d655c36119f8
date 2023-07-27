--                  1.Write a SQL query to find out how many products were sold in February 2019

--Least optimized query
        Select sum(quantity) from ecommerce
        Where extract(year from to_date(PURCHASE_DATE,'yyyy-mm-dd'))=2019
        And extract (month from to_date(PURCHASE_DATE,'yyyy-mm-dd'))=02;

/* More optimized query
This query is more optimized than the previous one since it uses a CTE to preprocess
the PURCHASE_DATE column into date dataype and then filters the result using EXTRACT funtion.
*/
         with ecommerce_updated as
        (
        select to_date(purchase_date,'yyyy-mm-dd') as purchase_date,
                quantity
        from ecommerce
        )
        select sum(quantity)
        from ecommerce_updated
        where extract(year from purchase_date)=2019 and 
                extract(month from purchase_date)=02;

/* More optimized query
This query is more optimzied than the previous one since,it directly uses the SUBSTR function
without any preprocessing and filters data based on the result of function */

        SELECT sum(quantity) AS products_sold
        FROM ecommerce
        WHERE SUBSTR(purchase_date, 1, 7) = '2019-02';

/* Better optimized query
This query is more optimized than the previous one since it perfectly uses the PURCHASE_DATE
index without going through full table scan*/

        select sum(quantity) 
        from ecommerce
        where purchase_date like '2019-02%';

/* Best optimized query
This query is more optimized than the previous one .Beacause,the previous query contains a 
wildcard operator '%',which prevents the database to use and index fully.*/
	select sum(quantity)
        from ecommerce
        where purchase_date between '2019-02-01' and '2019-02-29';





--                  2. Write a SQL query to find out Total Sale amount in each year

--Least Optimized Code
        select sum(quantity*price),extract(year from to_date(substr(purchase_date,1,4),'yyyy')) 
        from ecommerce  group by extract(year from to_date(substr(purchase_date,1,4),'yyyy'));

/*This query is more optimized than the previous code,since this code avoid using SUBSTR function 
and directly converts PURCHASE_DATE column into date datatype.*/
	select sum(quantity*price),extract(year from to_date(purchase_date,'yyyy-mm-dd'))
	from ecommerce group by extract(year from to_date(purchase_date,'yyyy-mm-dd'));

/* Best Optimized query
This query is the most optimzied query since we are directly using SUBSTR function to find out year
from a date without using any other function .*/
	select substr(purchase_date,1,4) as sales_year,sum(quantity*price) as totamount
	from ecommerce group by substr(purchase_date,1,4);




/*                 3.Write a SQL query to find out the total sales amount of each product on a month-wise basis in the year 2019*/ 

--Least Optimized Code
	select extract(month from to_date(PURCHASE_DATE,'yyyy-mm-dd')) as month,productno,sum(price*QUANTITY) from 	ecommerce where extract(year from to_date(purchase_date,'yyyy-mm-dd'))=2019
	group by extract(month from to_date(PURCHASE_DATE,'yyyy-mm-dd')),PRODUCTNO
	order by month,PRODUCTNO;

/*This query is more optimized than the previous query since ,this query avoids using EXTRACT function and
directly uses SUBSTR function to fetch year from date*/
	select substr(PURCHASE_DATE,6,2),productno,sum(price*QUANTITY)
	from ECOMMERCE where PURCHASE_DATE like '2019-%'
	group by substr(PURCHASE_DATE,6,2),PRODUCTNO
	order by substr(PURCHASE_DATE,6,2),PRODUCTNO;

/*Best Optimized Code
This query is the most Optimized query since,along with EXTRACT functions,this query also avoid using '%' 
operator,which highly affects the usage of index for a query.*/
	select substr(PURCHASE_DATE,6,2),productno,sum(price*QUANTITY)
	from ECOMMERCE where substr(purchase_date,1,4)='2019'
	group by substr(PURCHASE_DATE,6,2),
	PRODUCTNO order by substr(PURCHASE_DATE,6,2),PRODUCTNO; 




--                 4.Write the SQL query to count the customers from each country
--Best Optimized Code
	select country,count(distinct customerno)
	from ecommerce
	group by country;



--                 5.Write a SQL query to list all the unique product names sold from each year
--Least Optimized Code
	select distinct(extract(year from to_date(purchase_date,'yyyy-mm-dd'))),
	PRODUCTNAME from ECOMMERCE order by
	extract(year from to_date(purchase_date,'yyyy-mm-dd')),productname;

/*This query is more optimized than the previous query since ,this query avoids using two different
functions and gets the result using single SUBSTR function*/
	select distinct(substr(PURCHASE_DATE,1,4)),productname
	from ecommerce order by substr(PURCHASE_DATE,1,4),PRODUCTNAME;

/*Best Optimized Code
This query is the most optimized code,because ,even though there are 2 functions involved in the query,
it avoids using DISTINCT operator which is time expensive.Instead of DISTINCT ,it uses GROUP BY
and fetches the result.*/
	select extract(year from to_date(PURCHASE_DATE,'yyyy-mm-dd')),productname
	from ecommerce
	group by extract(year from to_date(PURCHASE_DATE,'yyyy-mm-dd')),productname
	order by EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'yyyy-mm-dd')),PRODUCTNAME;