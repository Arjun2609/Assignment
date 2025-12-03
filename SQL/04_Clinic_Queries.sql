use clinic_management_system

--1. Revenue from each sales channel for a given year
select 
    sales_channel,
    sum(amount) as total_revenue
from cms.clinic_sales
where year(datetime) = 2021
group by sales_channel;

--2. Top 10 most valuable customers for a given year
select top 10
    cs.uid,
    c.name,
    sum(cs.amount) as total_spent
from cms.clinic_sales cs
join cms.customer c 
    on cs.uid = c.uid
where year(cs.datetime) = 2021
group by cs.uid, c.name
order by total_spent desc;


--3. Month-wise revenue, expense, profit & status (2021)
with revenue as (
    select
    concat(year(datetime), '-', right('0' + cast(month(datetime) as varchar(2)), 2)) as month,
    sum(amount) as total_revenue
    from cms.clinic_sales
    where year(datetime) = 2021
    group by year(datetime), month(datetime)
),
expense as (
    select
    concat(year(datetime), '-', right('0' + cast(month(datetime) as varchar(2)), 2)) as month,
    sum(amount) as total_expenses
    from cms.expenses
    where year(datetime) = 2021
    group by year(datetime), month(datetime)
)
select
    coalesce(r.month, e.month) as month,
    coalesce(r.total_revenue, 0) as revenue,
    coalesce(e.total_expenses, 0) as expenses,
    coalesce(r.total_revenue, 0) - coalesce(e.total_expenses, 0) as profit,
    case
        when coalesce(r.total_revenue, 0) - coalesce(e.total_expenses, 0) > 0
        then 'profitable'
        else 'not-profitable'
    end as status
from revenue r
full join expense e 
on r.month = e.month
order by month;

--4. For each city, find the most profitable clinic for a given month
with revenue as (
    select
        cid,
        sum(amount) as total_revenue
    from cms.clinic_sales
    where year(datetime) = 2021 and month(datetime) = 9
    group by cid
),
expense as (
    select
        cid,
        sum(amount) as total_expenses
    from cms.expenses
	where year(datetime) = 2021 and month(datetime) = 9
    group by cid
),
profit as (
    select
        c.cid,
        c.city,
        coalesce(r.total_revenue, 0) as revenue,
        coalesce(e.total_expenses, 0) as expenses,
        coalesce(r.total_revenue, 0) - coalesce(e.total_expenses, 0) as profit
    from cms.clinics c
    left join revenue r on c.cid = r.cid
    left join expense e on c.cid = e.cid
)
select p.*
from profit p
where profit = (
    select max(p2.profit)
    from profit p2
    where p2.city = p.city
)
order by city;



--5. For each state, find the second least profitable clinic for a given month
with rev as (
    select 
    cs.cid,
    sum(cs.amount) as revenue
    from cms.clinic_sales cs
    where year(cs.datetime) = 2021 and month(cs.datetime) = 9
    group by cs.cid
),
exp as (
    select 
    e.cid,
    sum(e.amount) as expense
    from cms.expenses e
    where year(e.datetime) = 2021 and month(e.datetime) = 9
    group by e.cid
),
profit as (
    select 
        c.cid,
        c.state,
        isnull(r.revenue, 0) -
        isnull(e.expense, 0) as profit
    from cms.clinics c
    left join rev r on c.cid = r.cid
    left join exp e on c.cid = e.cid
)
select state, cid, profit
from (
    select
        state,
        cid,
        profit,
        row_number() over (partition by state order by profit asc) as rn
    from profit
) x
where rn = 2;
