
/* 1.  write an sql query to how many products were sold in february 2019 ?*/


 select sum(QUANTITY) total_products_sold from ECOMMERCE where "Date" like '2019-02%';

SELECT SUM(QUANTITY) total_products_sold FROM ECOMMERCE WHERE EXTRACT(YEAR FROM TO_DATE("Date",'YYYY-MM-DD'))=2019 AND EXTRACT(MONTH from TO_DATE("Date",'YYYY-MM-DD'))=02;

 select distinct(sum(QUANTITY) over(PARTITION by year_month)) total_products_sold,year_month from(
     select quantity,SUBSTR("Date",1,7) year_month from ECOMMERCE) where year_month='2019-02';

SELECT DISTINCT(SUM(quantity) OVER(PARTITION BY EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')),
EXTRACT(MONTH from TO_DATE("Date",'YYYY-MM-DD')))) total_products_sold FROM ECOMMERCE WHERE EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD'))=2019 AND
EXTRACT(MONTH from TO_DATE("Date",'YYYY-MM-DD'))=02 ;


/* 2. write an sql query to total sales amount in each year ? */
select distinct(sum(QUANTITY*PRICE) over(partition by year)) total_sales,year from (
    select quantity,price,substr("Date",1,4) year from ECOMMERCE);

SELECT SUM(QUANTITY*PRICE) TOTAL_SALES,EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')) AS YEAR FROM ECOMMERCE GROUP BY 
EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')); 

SELECT DISTINCT(SUM(quantity*PRICE) OVER(PARTITION BY EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')))) TOTAL_SALES,
EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')) YEAR FROM ECOMMERCE;

/* 3. write a sql query to what was the total sales amount of each product on a month-wise in the year 2019 ?*/

SELECT DISTINCT(SUM(QUANTITY*PRICE) OVER(PARTITION BY MONTH ,PRODUCTNAME)) SALES_PER_MONTH,MONTH,PRODUCTNAME FROM(
    SELECT QUANTITY,PRICE,PRODUCTNAME,EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')) AS YEAR,EXTRACT(MONTH from TO_DATE("Date",'YYYY-MM-DD')) AS MONTH FROM ECOMMERCE
WHERE EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD'))=2019) ORDER BY MONTH;

SELECT DISTINCT(SUM(QUANTITY*PRICE) OVER(PARTITION BY EXTRACT(MONTH FROM TO_DATE("Date",'YYYY-MM-DD') ),PRODUCTNAME)) MON_SALES,PRODUCTNAME,
 EXTRACT(MONTH FROM TO_DATE("Date",'YYYY-MM-DD')) AS MONTH FROM(
    SELECT QUANTITY,PRICE,PRODUCTNAME,"Date" FROM ECOMMERCE WHERE "Date" LIKE '2019%') 
    ORDER BY  EXTRACT(MONTH FROM TO_DATE("Date",'YYYY-MM-DD'));


SELECT DISTINCT(SUM(QUANTITY*PRICE) OVER(PARTITION BY EXTRACT(MONTH FROM TO_DATE("Date",'YYYY-MM-DD') ),PRODUCTNAME)) MON_SALES,PRODUCTNAME,
 EXTRACT(MONTH FROM TO_DATE("Date",'YYYY-MM-DD')) AS MONTH FROM ECOMMERCE WHERE "Date" LIKE '2019%' 
    ORDER BY  EXTRACT(MONTH FROM TO_DATE("Date",'YYYY-MM-DD'));
    
    
select EXTRACT(Month FROM TO_DATE("Date", 'YYYY-MM-DD'))AS sales_month, PRODUCTNAME,
SUM(PRICE * QUANTITY) AS total_sales_amount
FROM ECOMMERCE
WHERE EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) = 2019
GROUP BY EXTRACT(MONTH FROM TO_DATE("Date", 'YYYY-MM-DD')),PRODUCTNAME ORDER BY  EXTRACT(MONTH FROM TO_DATE("Date",'YYYY-MM-DD')) ;

/* 4. write a sql query to count cutomers from each country?*/
select count(CUSTOMERNO) total_customers, country from ecommerce group by country order by country;


select distinct(count(CUSTOMERNO) over(partition by COUNTRY)) total_customers, country from ECOMMERCE order by country;

/* 5. write an sql query to list all unique product names sold from each year?*/
select distinct(PRODUCTNAME),EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')) AS YEAR from ECOMMERCE 
order by EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD'));

SELECT EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) AS sales_year, PRODUCTNAME AS unique_product_names
FROM ecommerce
GROUP BY EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) , PRODUCTNAME order by EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) ;