
--1. For every user in the system, get the user_id and last booked room_no
select u.user_id, b.room_no
from hms.users u
join (select user_id, max(booking_date) as last_date
from hms.bookings
group by user_id) x 
on u.user_id = x.user_id
join hms.bookings b 
on b.user_id = x.user_id 
and b.booking_date = x.last_date;

--2. Get booking_id and total billing amount of every booking created in November, 2021 
select b.booking_id,
sum(bc.item_quantity * i.item_rate) as total_amount
from hms.bookings b
join hms.booking_commercials bc on b.booking_id = bc.booking_id
join hms.items i on bc.item_id = i.item_id
where month(b.booking_date) = 11 and year(b.booking_date) = 2021
group by b.booking_id;

--3. Get bill_id & bill_amount for bills in October 2021 where bill_amount > 1000
select bc.bill_id,
sum(bc.item_quantity * i.item_rate) as bill_amount
from hms.booking_commercials bc
join hms.items i on bc.item_id = i.item_id
where month(bc.bill_date) = 10 and year(bc.bill_date) = 2021
group by bc.bill_id
having sum(bc.item_quantity * i.item_rate) > 1000;

--4. Determine the MOST ordered and LEAST ordered item for EACH MONTH of 2021
;with monthly as (
    select 
    month(bill_date) as month_no,
    item_id,
    sum(item_quantity) as total_qty
    from hms.booking_commercials
    group by month(bill_date), item_id
),
ranks as (
    select *,
    rank() over(partition by month_no order by total_qty desc) as rnk_max,
    rank() over(partition by month_no order by total_qty asc)  as rnk_min
    from monthly
)
select month_no, item_id, total_qty, 'most ordered' as category
from ranks where rnk_max = 1
union all
select month_no, item_id, total_qty, 'least ordered'
from ranks where rnk_min = 1;


--5. Find customers with the SECOND HIGHEST bill value for EACH MONTH of 2021

;with bills as (
    select 
	b.user_id,
    bc.bill_id,
    month(bc.bill_date) as month_no,
    sum(bc.item_quantity * i.item_rate) as bill_amount
    from hms.booking_commercials bc
    join hms.bookings b on bc.booking_id = b.booking_id
    join hms.items i on bc.item_id = i.item_id
    group by b.user_id, bc.bill_id, month(bc.bill_date)
),
rnk as (
    select *,
    dense_rank() over(partition by month_no order by bill_amount desc) as rnk_no
    from bills
)
select month_no, bill_id, user_id, bill_amount
from rnk
where rnk_no = 2;
