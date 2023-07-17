set TIMING on;
desc ECOMMERCE;

/* 1.  write an sql query to how many products were sold in february 2019 ?*/


SELECT SUM(QUANTITY) total_products_sold FROM ECOMMERCE WHERE EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD'))=2019 AND EXTRACT(MONTH from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD'))=02;


SELECT DISTINCT(SUM(quantity) OVER(PARTITION BY EXTRACT(year from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')),
EXTRACT(MONTH from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')))) total_products_sold FROM ECOMMERCE WHERE EXTRACT(year from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD'))=2019 AND
EXTRACT(MONTH from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD'))=02 ;


/* 2. write an sql query to total sales amount in each year ? */


SELECT SUM(QUANTITY*PRICE) TOTAL_SALES,EXTRACT(year from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS YEAR FROM ECOMMERCE GROUP BY 
EXTRACT(year from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')); 


/* 3. write a sql query to what was the total sales amount of each product on a month-wise in the year 2019 ?*/

select PRODUCTNAME,sum(QUANTITY*price) sales,EXTRACT(Month FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD'))AS sales_month from ECOMMERCE
where PURCHASE_DATE like '2019%'
GROUP BY EXTRACT(MONTH FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')),PRODUCTNAME ORDER BY  EXTRACT(MONTH FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) ;


    
    
select EXTRACT(Month FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD'))AS sales_month, PRODUCTNAME,
SUM(PRICE * QUANTITY) AS total_sales_amount FROM ECOMMERCE
WHERE EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')) = 2019
GROUP BY EXTRACT(MONTH FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')),PRODUCTNAME ORDER BY  EXTRACT(MONTH FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) ;

/* 4. write a sql query to count cutomers from each country?*/

select count(CUSTOMERNO) total_customers, country from ecommerce group by country order by country;


/* 5. write an sql query to list all unique product names sold from each year?*/
select distinct(PRODUCTNAME),EXTRACT(year from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS YEAR from ECOMMERCE 
order by EXTRACT(year from TO_DATE(PURCHASE_DATE,'YYYY-MM-DD'));

SELECT EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')) AS sales_year, PRODUCTNAME AS unique_product_names
FROM ecommerce
GROUP BY EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')) , PRODUCTNAME order by EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE, 'YYYY-MM-DD')) ;