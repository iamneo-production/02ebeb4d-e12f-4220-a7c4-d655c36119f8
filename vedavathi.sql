select * from ECOMMERCE;

select MON_FIELD from ECOMMERCE;
select "Date" from ECOMMERCE;
select YEAR_FIELD from ECOMMERCE;

desc ECOMMERCE;


/* write an sql query to how many products were sold in february 2019 ?*/

select sum(QUANTITY) total_products_sold from(
    select QUANTITY ,MON_FIELD,YEAR_FIELD from ECOMMERCE where MON_FIELD=2 and YEAR_FIELD=2019);/* using sub query*/

select distinct(sum(QUANTITY) over(partition by MON_FIELD,YEAR_FIELD)) total_products_sold,MON_FIELD,YEAR_FIELD from ECOMMERCE
where MON_FIELD=2 and YEAR_FIELD=2019; /* using over clause*/

