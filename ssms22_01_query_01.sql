use SalesDB


select * 
from sales.orders

select 
FORMAT(orderdate, 'MMM yy') orderdate,
COUNT(*)
from Sales.Orders
group by format(orderdate, 'MMM yy')

