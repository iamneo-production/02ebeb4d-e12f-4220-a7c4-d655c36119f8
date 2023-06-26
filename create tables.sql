create table customer(customer_id char(10) primary key,c_name varchar2(20),
c_email varchar2(20),contact_number number(10));
create table customerorder(order_id char(10) primary key,order_date date,customer_id char(10) references customer(customer_id),payment_id char(10));
