/*select * from ECOMMERCE;*/

/*sql query to how many products were sold in feb 2019*/

set timing on;
select sum(quantity) from ECOMMERCE
where extract(year from to_Date(purchase_date, 'yyyy-mm-dd'))
=2019 and extract(month from to_date(purchase_date, 'yyyy-mm-dd'))=02;

select sum(quantity) from ecommerce where purchase_date like '2019-02%';

select sum(quantity) from ecommerce where purchase_date between '2019-02-01'
and '2019-02-29';  /*optimized*/

select sum(quantity) from ecommerce where substr(purchase_date,1,7)='2019-02';

/*--2--*/
set timing on;
select sum(quantity*price),extract(year from to_date(substr(purchase_date,1,4),'yyyy')) 
from ecommerce  group by extract(year from to_date(substr(purchase_date,1,4),'yyyy'));

select sum(quantity*price),extract(year from to_date(purchase_date,'yyyy-mm-dd'))
from ecommerce group by extract(year from to_date(purchase_date,'yyyy-mm-dd'));

select substr(purchase_date,1,4) as sales_year,sum(quantity*price) as totamount
from ecommerce group by substr(purchase_date,1,4); --optimized--

--3--
select extract(month from to_date(PURCHASE_DATE,'yyyy-mm-dd')) as month,productno,sum(price*QUANTITY) from ecommerce 
where extract(year from to_date(purchase_date,'yyyy-mm-dd'))=2019
group by extract(month from to_date(PURCHASE_DATE,'yyyy-mm-dd')),PRODUCTNO
order by month,PRODUCTNO;

select substr(PURCHASE_DATE,6,2),productno,sum(price*QUANTITY)
from ECOMMERCE where substr(purchase_date,1,4)='2019'
group by substr(PURCHASE_DATE,6,2),
PRODUCTNO order by substr(PURCHASE_DATE,6,2),PRODUCTNO; --opt--

select substr(PURCHASE_DATE,6,2),productno,sum(price*QUANTITY)
from ECOMMERCE where PURCHASE_DATE like '2019-%'
group by substr(PURCHASE_DATE,6,2),PRODUCTNO
order by substr(PURCHASE_DATE,6,2),PRODUCTNO;

--4--
select  country,count(customerno) from ECOMMERCE group by country;

SELECT country, COUNT(*) AS customerno
FROM ecommerce
GROUP BY country;--opt--

/*SELECT country, COUNT(DISTINCT customerno) AS customer_count
FROM ecommerce
GROUP BY country
ORDER BY customer_count;*/

--5--
select distinct(extract(year from to_date(purchase_date,'yyyy-mm-dd'))),
PRODUCTNAME from ECOMMERCE order by
extract(year from to_date(purchase_date,'yyyy-mm-dd')),productname;


select distinct(substr(PURCHASE_DATE,1,4)),productname
from ecommerce order by substr(PURCHASE_DATE,1,4),PRODUCTNAME;--opt--


select * from ecommerce;

select extract(year from to_date(PURCHASE_DATE,'yyyy-mm-dd')),productname
from ecommerce
group by extract(year from to_date(PURCHASE_DATE,'yyyy-mm-dd')),productname
order by EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'yyyy-mm-dd')),PRODUCTNAME;