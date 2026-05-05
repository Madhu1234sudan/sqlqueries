use SalesDB

-- datatype conversion
select
CAST('123' as int) as [string to integer],
CAST(GETDATE() as varchar) as [date to strings]


--DATEADD(part, interval, date)

select
orderid,
orderdate,
dateadd(year, 2, orderdate) as twoyearslater,
dateadd(day, -10, orderdate) as Tendaysbefore
from Sales.Orders

--DATEDIFF(part, start_date, end_date) DIFFERENCE BETWEEN TWO DATES

select 
orderid,
orderdate,
shipdate,
DATEDIFF(year, OrderDate, ShipDate),
DATEDIFF(MONTH, OrderDate, ShipDate),
DATEDIFF(DAY, OrderDate, ShipDate)
from Sales.Orders

-- Calculate the age of employees

select
EmployeeID,
BirthDate,
DATEDIFF(year, BirthDate, GETDATE()) as Age
from Sales.Employees

-- find the average shipping duration in days for each month

select 
MONTH(orderdate) as orderdate,
avg(DATEDIFF(day, OrderDate, ShipDate)) as average_shiping_day
from sales.Orders
group by MONTH(orderdate)


--find the number of days between each order and the previous order

select 
orderid,
orderdate as CurrentDate,
lag(orderdate) over (order by orderdate) prevoius_order,
DATEDIFF(day, lag(orderdate) over (order by orderdate), OrderDate) as no_of_days
from sales.orders


-- DATE VALIDATION

-- ISDATE(VALUE)

SELECT
ISDATE('123') as date_validation,
ISDATE(GETDATE()) as date_validation,
ISDATE('2025-08-20') as datecheck1,
ISDATE('20-08-2025') as datecheck2,
ISDATE('2025') as datecheck3,
ISDATE('08') as datecheck4