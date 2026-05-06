select * from 
Sales.Orders 

--find the total sales across all orders
select 
SUM(sales) as totalsales
from sales.Orders

--find the total sales for each product 

select 
sum(sales) as totalsales,
productid
from sales.Orders
group by ProductID

--find total sales for each product
-- additionally provide such order id, order date --

select 
	OrderID,
	OrderDate,
	productid,
	sum(sales) over(partition by productid) totalsalesbyproducts
from sales.Orders

/* find the total sales across all orders 
  additionally provide details such order id, order date
*/

select	
	orderid,
	orderdate,
	sum(sales) over () totalsales
from Sales.Orders


/* find the total sales for each product,
	additionally provide details such order id & order date
*/

select 
* 
from 
Sales.Orders

select 
	orderid,
	orderdate,
	productid,
	orderstatus,
	sales,
	sum(sales) over (partition by productid) as totalsales,
	sum(sales) over (partition by productid, orderstatus) as totalsalesbyorderstatus
from sales.Orders


/* find the total sales for each combination of product and 
   and order status */

select 
	orderid,
	productid,
	sum(sales) over (partition by productid) totalsalesbycombination
from Sales.Orders


/* Rank each order based on their sales from highest to lowest,
additionally provide details such order id & order date */

select 
	orderid,
	orderdate,
	orderstatus,
	sales,
	sum(sales) over (partition by orderstatus order by orderdate
	rows between current row and 2 following) totalsales
from sales.Orders

select 
	orderid,
	orderdate,
	orderstatus,
	sales,
	sum(sales) over (partition by orderstatus order by orderdate
	rows between 2 preceding and current row) totalsales
from sales.Orders

-- alternative for preceding only

select 
	orderid,
	orderdate,
	orderstatus,
	sales,
	sum(sales) over (partition by orderstatus order by orderdate
	rows 2 preceding) totalsales
from sales.Orders

-- rows unbounded with preceding 

select 
	orderid,
	orderdate,
	orderstatus,
	sales,
	sum(sales) over (partition by orderstatus order by orderdate
	rows unbounded preceding) totalsales
from sales.Orders

/*
-- frame clause default row frame is 
-- Note : Default frame is only working with order by clause

1.We cannot use window functions in order to filter the data means in the
	row can only be used with select and order by clauses.
2.Window function nesting is not allowed means
	we cannot use the window function in the another window function.
3.First the filtering the and then it will execute the window functions
	so, that means first filtering and then agreegation.
4.we can you use the window functions with the group by but only
	if there is same column
*/

select 
	orderid,
	orderdate,
	orderstatus,
	sales,
	sum(sales) over (partition by orderstatus order by orderdate
	rows between unbounded preceding and current row) totalsales
from sales.Orders


-- reference for rule no 4 
-- Rank customers based on their total sales
-- The sum(sales) is the part of group by and as well as 
--	the part of window functions so it is allowed.

select 
	customerid,
	sum(sales) totalsaels,
	Rank() OVER (order by sum(sales) desc) Rankcustomers
from sales.Orders
group by CustomerID