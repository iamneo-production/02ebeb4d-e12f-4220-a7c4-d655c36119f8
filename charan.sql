/*select * from ecommerce*/ ;

/*desc ECOMMERCE ; */

/*--------- 1 ----------*/

select count(*) as Sold_Products  from ECOMMERCE
WHERE SUBSTR2("Date" ,1 ,7 ) = '2019-02';

/*---------- 2 ---------*/

select SUM(Price*QUANTITY) as Total_Price from ECOMMERCE
group by EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD'));


/*---------- 3 ---------*/

select EXTRACT(Month FROM TO_DATE("Date", 'YYYY-MM-DD'))AS sales_month, PRODUCTNAME,
SUM(PRICE * QUANTITY) AS total_sales_amount
FROM ECOMMERCE
WHERE EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) = 2019
GROUP BY EXTRACT(MONTH FROM TO_DATE("Date", 'YYYY-MM-DD')),PRODUCTNAME;

/*----------- 4 ----------*/

select distinct country , count(*) from ECOMMERCE
group by COUNTRY
order by country;

/*------------ 5 ----------*/

SELECT EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) AS sales_year, PRODUCTNAME AS unique_product_names
FROM ecommerce
GROUP BY EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) , PRODUCTNAME 
order by EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD'));

select distinct(PRODUCTNAME),EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')) AS YEAR from ECOMMERCE 
order by EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD'));