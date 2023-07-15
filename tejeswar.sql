select * from ECOMMERCE;

desc ECOMMERCE;

select PRODUCTNAME,PRODUCTNO
FROM ECOMMERCE;

select * 
from user_INDEXES 
where TABLE_NAME = 'ecommerce';

DESCRIBE ecommerce;

SELECT *
FROM user_indexes
WHERE index_name = 'INDEX_ON_DATE';

SELECT *
FROM user_indexes
WHERE index_name = 'INDEX_ON_COUNTRY';

WITH index_data AS (
    SELECT *
    FROM user_indexes
    WHERE index_name = 'INDEX_ON_DATE'
)
SELECT *
FROM index_data;

SELECT *
FROM user_ind_columns
WHERE index_name = 'INDEX_ON_DATE';