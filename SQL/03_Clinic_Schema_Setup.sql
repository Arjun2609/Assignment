create database clinic_management_system

use clinic_management_system

create schema cms


-- Clinics
drop table if exists cms.clinics
create table cms.clinics (
    cid varchar(20) primary key,
    clinic_name varchar(100),
    city varchar(100),
    state varchar(100),
    country varchar(100)
);

-- Customers
drop table if exists cms.customer
create table cms.customer (
    uid varchar(20) primary key,
    name varchar(100),
    mobile varchar(20)
);

-- Clinic Sales
drop table if exists cms.clinic_sales
create table cms.clinic_sales (
    oid varchar(20) primary key,
    uid varchar(20) foreign key references cms.customer(uid),
    cid varchar(20) foreign key references cms.clinics(cid),
    amount decimal(10,2),
    datetime datetime,
    sales_channel varchar(50)
);

-- Expenses
drop table if exists cms.expenses
create table cms.expenses (
    eid varchar(20) primary key,
    cid varchar(20) foreign key references cms.clinics(cid),
    description varchar(200),
    amount decimal(10,2),
    datetime datetime
);


insert into cms.clinics (cid, clinic_name, city, state, country)
values ('cnc-0100001', 'XYZ clinic', 'lorem', 'ipsum', 'dolor');

insert into cms.clinics (cid, clinic_name, city, state, country)
values('cnc-0100002', 'HealthPlus Clinic', 'Mumbai', 'Maharashtra', 'India'),
('cnc-0100003', 'Care & Cure Clinic', 'Chennai', 'Tamil Nadu', 'India'),
('cnc-0100004', 'MediOne Clinic', 'Bangalore', 'Karnataka', 'India'),
('cnc-0100005', 'LifeCare Clinic', 'Delhi', 'Delhi', 'India');

insert into cms.customer (uid, name, mobile)
values ('bk-09f3e-95hj', 'Jon Doe', '9710646565');

insert into cms.customer (uid, name, mobile)
values('cust-001', 'Rahul Sharma', '9876543210'),
('cust-002', 'Priya Singh', '9988776655'),
('cust-003', 'Amit Verma', '9123456780'),
('cust-004', 'Sneha Reddy', '9871209876'),
('cust-005', 'John Doe', '9784563210'),
('cust-006', 'Ananya Mehta', '9900112233'),
('cust-007', 'Krishna Rao', '8899776655'),
('cust-008', 'Vijay Kumar', '9090909090'),
('cust-009', 'Meera Nair', '8765432109'),
('cust-010', 'Arjun Patel', '9098765432');

 
insert into cms.clinic_sales (oid, uid, cid, amount, datetime, sales_channel)
values ('ord-00100-00100', 'bk-09f3e-95hj', 'cnc-0100001', 24999, '2021-09-23 12:03:22', 'sodat');

insert into cms.clinic_sales (oid, uid, cid, amount, datetime, sales_channel)
values('ord-1001', 'cust-001', 'cnc-0100001', 2500, '2021-01-12 10:10:00', 'online'),
('ord-1002', 'cust-003', 'cnc-0100001', 1800, '2021-02-15 11:20:00', 'walkin'),
('ord-1003', 'cust-002', 'cnc-0100002', 3200, '2021-02-20 09:45:00', 'online'),
('ord-1004', 'cust-004', 'cnc-0100003', 2900, '2021-03-10 14:00:00', 'walkin'),
('ord-1005', 'cust-005', 'cnc-0100004', 4100, '2021-03-25 12:15:00', 'online'),

('ord-1006', 'cust-006', 'cnc-0100005', 1500, '2021-04-08 10:00:00', 'walkin'),
('ord-1007', 'cust-007', 'cnc-0100002', 5300, '2021-04-18 16:30:00', 'online'),
('ord-1008', 'cust-008', 'cnc-0100003', 2400, '2021-05-12 11:40:00', 'app'),
('ord-1009', 'cust-009', 'cnc-0100004', 1800, '2021-05-22 10:30:00', 'app'),
('ord-1010', 'cust-010', 'cnc-0100001', 3500, '2021-05-28 13:50:00', 'walkin'),

('ord-1011', 'cust-003', 'cnc-0100005', 2100, '2021-06-05 15:00:00', 'online'),
('ord-1012', 'cust-004', 'cnc-0100002', 4200, '2021-06-15 11:10:00', 'app'),
('ord-1013', 'cust-001', 'cnc-0100003', 3100, '2021-07-02 14:20:00', 'walkin'),
('ord-1014', 'cust-005', 'cnc-0100001', 2700, '2021-07-18 15:45:00', 'app'),
('ord-1015', 'cust-006', 'cnc-0100004', 3900, '2021-08-09 16:00:00', 'online'),

('ord-1016', 'cust-007', 'cnc-0100001', 2000, '2021-09-11 09:25:00', 'online'),
('ord-1017', 'cust-008', 'cnc-0100002', 3600, '2021-09-22 12:00:00', 'walkin'),
('ord-1018', 'cust-009', 'cnc-0100005', 2500, '2021-10-05 13:10:00', 'app'),
('ord-1019', 'cust-010', 'cnc-0100003', 3200, '2021-10-16 14:55:00', 'online'),
('ord-1020', 'cust-002', 'cnc-0100004', 4100, '2021-11-08 10:50:00', 'online'),

('ord-1021', 'cust-001', 'cnc-0100005', 1500, '2021-11-27 09:40:00', 'app'),
('ord-1022', 'cust-003', 'cnc-0100003', 1800, '2021-12-10 11:00:00', 'walkin'),
('ord-1023', 'cust-004', 'cnc-0100004', 2900, '2021-12-20 17:20:00', 'online'),

-- 2022 data
('ord-1024', 'cust-005', 'cnc-0100001', 3800, '2022-01-15 13:00:00', 'online'),
('ord-1025', 'cust-006', 'cnc-0100002', 2600, '2022-02-10 14:50:00', 'app'),
('ord-1026', 'cust-007', 'cnc-0100003', 3400, '2022-03-12 15:15:00', 'walkin'),
('ord-1027', 'cust-008', 'cnc-0100004', 2200, '2022-03-25 09:25:00', 'online'),
('ord-1028', 'cust-009', 'cnc-0100005', 2900, '2022-04-05 16:10:00', 'app'),
('ord-1029', 'cust-010', 'cnc-0100001', 3100, '2022-04-18 12:40:00', 'walkin'),
('ord-1030', 'cust-002', 'cnc-0100002', 3000, '2022-05-22 11:55:00', 'online');


insert into cms.expenses (eid, cid, description, amount, datetime)
values ('exp-0100-00100', 'cnc-0100001', 'first-aid supplies', 557, '2021-09-23 07:36:48');

insert into cms.expenses (eid, cid, description, amount, datetime)
values('exp-2001', 'cnc-0100001', 'Medicines restock', 900, '2021-01-10'),
('exp-2002', 'cnc-0100002', 'Electricity Bill', 1200, '2021-02-05'),
('exp-2003', 'cnc-0100003', 'Staff Salary', 5000, '2021-02-15'),
('exp-2004', 'cnc-0100004', 'Maintenance', 1400, '2021-03-12'),
('exp-2005', 'cnc-0100005', 'Equipment', 3000, '2021-03-18'),

('exp-2006', 'cnc-0100001', 'Cleaning', 700, '2021-04-12'),
('exp-2007', 'cnc-0100002', 'Medicines restock', 1500, '2021-04-22'),
('exp-2008', 'cnc-0100003', 'Internet Bill', 600, '2021-05-03'),
('exp-2009', 'cnc-0100004', 'Staff Salary', 5200, '2021-05-15'),
('exp-2010', 'cnc-0100005', 'Electricity Bill', 1300, '2021-06-01'),

('exp-2011', 'cnc-0100001', 'Equipment repair', 1800, '2021-06-10'),
('exp-2012', 'cnc-0100002', 'Maintenance', 900, '2021-07-05'),
('exp-2013', 'cnc-0100003', 'Medicines restock', 2100, '2021-07-20'),
('exp-2014', 'cnc-0100004', 'Cleaning', 650, '2021-08-02'),
('exp-2015', 'cnc-0100005', 'Staff Salary', 5500, '2021-08-18'),

('exp-2016', 'cnc-0100001', 'Internet Bill', 500, '2021-09-03'),
('exp-2017', 'cnc-0100002', 'Equipment', 2500, '2021-09-25'),
('exp-2018', 'cnc-0100003', 'Electricity Bill', 1100, '2021-10-11'),
('exp-2019', 'cnc-0100004', 'Medicines restock', 2000, '2021-11-06'),
('exp-2020', 'cnc-0100005', 'Maintenance', 800, '2021-12-10');

select * from cms.expenses
select * from cms.customer
select * from cms.clinics
select * from cms.clinic_sales



