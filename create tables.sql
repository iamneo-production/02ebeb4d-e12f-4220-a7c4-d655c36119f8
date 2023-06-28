create table customer(customer_id char(10) primary key,c_name varchar2(20)not null,
c_email varchar2(20)not null,contact_number number(10));

create table payment(payment_id char(10) primary key,payment_date date,
payment_type varchar(20) not null,
amount int);

create table seller(seller_id CHAR(20) PRIMARY KEY,s_name VARCHAR2(20));

create table  deal(
  deal_id char(6) primary key,
  dis_percentage int not null );
create table brand(
  brand_id char(6) primary key,
  b_name varchar(20) not null);


create table shipper(
  shipper_id char(6) primary key,
  sh_name varchar(20) not null;

create table location(
  pincode number(6) primary key,
  state varchar2(20) not null,
  city varchar2(20) not null,
  area_name varchar2(20) not null
);
