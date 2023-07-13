select * from ECOMMERCE;

select MON_FIELD from ECOMMERCE;
select "Date" from ECOMMERCE;
select YEAR_FIELD from ECOMMERCE;

desc ECOMMERCE;
select "Date"  from ECOMMERCE where "Date" like '2019-02-%';
select SUBSTR("Date",1,7) from ECOMMERCE;
select EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')) AS YEAR FROM ECOMMERCE;

/* 1.  write an sql query to how many products were sold in february 2019 ?*/

/* select sum(QUANTITY) total_products_sold from(
    select QUANTITY ,MON_FIELD,YEAR_FIELD from ECOMMERCE where MON_FIELD=2 and YEAR_FIELD=2019);
    using sub query*/

    select sum(QUANTITY) total_products_sold from ECOMMERCE where "Date" like '2019-02%';

 
/*select distinct(sum(QUANTITY) over(partition by MON_FIELD,YEAR_FIELD)) total_products_sold from ECOMMERCE
where MON_FIELD=2 and YEAR_FIELD=2019; using over clause*/
 select distinct(sum(QUANTITY) over(PARTITION by year_month)) total_products_sold,year_month from(
     select quantity,SUBSTR("Date",1,7) year_month from ECOMMERCE) where year_month='2019-02';

SELECT DISTINCT(SUM(quantity) OVER(PARTITION BY EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD')),
EXTRACT(MONTH from TO_DATE("Date",'YYYY-MM-DD')))) total_products_sold FROM ECOMMERCE WHERE EXTRACT(year from TO_DATE("Date",'YYYY-MM-DD'))=2019AND
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

