create database hotel_management_system
go

use hotel_management_system

create schema hms
go

--DDL Queries

drop table if exists hms.users;
create table hms.users(user_id varchar(20) primary key, name varchar(20),phone_number bigint, mail_id varchar(150), billing_address text)

drop table if exists hms.bookings;
create table hms.bookings(booking_id varchar(20) primary key, booking_date datetime, room_no varchar(20), user_id varchar(20) foreign key (user_id) references hms.users(user_id))

drop table if exists hms.items;
create table hms.items(item_id varchar(20) primary key, item_name varchar(20),item_rate int)

drop table if exists hms.booking_commercials;
create table hms.booking_commercials(id varchar(20) primary key, booking_id varchar(20) foreign key (booking_id) references hms.bookings(booking_id),bill_id varchar(20), bill_date datetime,item_id varchar(20) foreign key (item_id) references hms.items(item_id),item_quantity float)

--DML Queries

--Insert into Users Table
insert into hms.users values('21wrcxuy-67erfn','John Doe',9710646565,'john.doe@example.com','')

insert into hms.users values('22ercxuz-66erfm','Peter',9791013111,'peter@example.com','')

--Insert into Bookings table
insert into hms.bookings values('bk-09f3e-95hj','2021-09-23 7:36:48','rm-bhf9-aerjn','21wrcxuy-67erfn')
insert into hms.bookings values('bk-q034-q4o','2021-09-23 7:36:48','sn-cig9-bfsko','22ercxuz-66erfm')
insert into hms.bookings values ('bk-nov01-001','2021-11-05 11:00:00','rm-nov-101','21wrcxuy-67erfn');
insert into hms.bookings values ('bk-nov01-002','2021-11-18 16:30:00','rm-nov-102','22ercxuz-66erfm');
insert into hms.bookings values ('bk-oct01-001','2021-10-15 10:00:00','rm-oct-100','21wrcxuy-67erfn');
insert into hms.bookings values ('bk-oct01-002','2021-10-20 09:30:00','rm-oct-200','22ercxuz-66erfm');
insert into hms.bookings values ('bk-dec01-001','2021-12-10 12:00:00','rm-dec-101','21wrcxuy-67erfn');
insert into hms.bookings values ('bk-sep-extra','2021-09-25 15:00:00','rm-sep-400','21wrcxuy-67erfn');

--Insert into Items Table
insert into hms.items values('itm-a9e8-q8fu','Tawa Paratha',18)
insert into hms.items values('itm-a07vh-aer8','Mix Veg',89)
insert into hms.items values('itm-w978-23u4','Naan',50)
 
--Insert into Booking_Commercials
insert into hms.booking_commercials values('q34r-3q4o8-q34u','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a9e8-q8fu',3)
insert into hms.booking_commercials values('q3o4-ahf32-o2u4','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a07vh-aer8',1)
insert into hms.booking_commercials values('134lr-oyfo8-3qk4','bk-q034-q4o','bl-34qhd-r7h8','2021-09-23 12:05:37','itm-w978-23u4',0.5)
insert into hms.booking_commercials values ('oct-bc01','bk-oct01-001','bl-oct-001','2021-10-15 12:00:00','itm-a9e8-q8fu',20);
insert into hms.booking_commercials values ('nov-bc01','bk-nov01-001','bl-nov-001','2021-11-05 13:00:00','itm-a9e8-q8fu',5);
insert into hms.booking_commercials values ('nov-bc02','bk-nov01-001','bl-nov-001','2021-11-05 13:00:00','itm-a07vh-aer8',2);
insert into hms.booking_commercials values ('nov-bc03','bk-nov01-002','bl-nov-002','2021-11-18 17:00:00','itm-w978-23u4',30);
insert into hms.booking_commercials values ('oct-bc02','bk-oct01-001','bl-oct-001','2021-10-15 12:00:00','itm-a07vh-aer8',10);
insert into hms.booking_commercials values ('oct-bc03','bk-oct01-002','bl-oct-002','2021-10-20 13:00:00','itm-w978-23u4',25);
insert into hms.booking_commercials values ('dec-bc01','bk-dec01-001','bl-dec-001','2021-12-10 14:00:00','itm-a9e8-q8fu',20);
insert into hms.booking_commercials values ('dec-bc02','bk-dec01-001','bl-dec-001','2021-12-10 14:00:00','itm-w978-23u4',3);
insert into hms.booking_commercials values ('sep-bc04','bk-sep-extra','bl-sep-004','2021-09-25 15:30:00','itm-a07vh-aer8',7);


--Select Queries
select * from hms.users
select * from hms.bookings
select * from hms.items
select * from hms.booking_commercials

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- For understanding, I have added more data to the tables.

