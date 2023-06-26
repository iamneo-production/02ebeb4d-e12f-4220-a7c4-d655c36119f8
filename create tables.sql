create table customer(customer_id char(10) primary key,c_name varchar2(20),
c_email varchar2(20),contact_number number(10));
create table payment(payment_id char(10) primary key,payment_date date,
payment_type varchar(20) not null,
amount int);

