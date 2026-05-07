use SalesDB

select * 
from Sales.Orders


-- Window Agreegated Functions
-- 1. COUNT() Function: 

select 
	OrderID,
	OrderDate,
	Sales,
	AVG(sales) over(partition by sales ) as avgsales  
from Sales.Orders


-- Find the total number of orders

select 
count(*) totalorders
from sales.Orders

-- find the total number of order for each customers

select 
	OrderID,
	OrderDate,
	CustomerID,
	count(*) over() totalorders,
	count(*) over(partition by customerid) as customers
from sales.Orders

-- to check the uniquqness of the primary key 

select 
	OrderID,
	count(*) over (partition by orderid) checkpk
from Sales.Orders

/* Use cases of count() function 
 1. overall analysis
 2. category analysis
 3. Quality checks : identify nulls
 4. Quality checks : identify duplicates.
*/

/* 2. SUM() Function : 
	>> it ignore the nulls and only accepts the integer data
*/

/* find the total sales across all orders
	and the total sales for each product
	additionally provide detials such order id, order date */

SELECT 
	ORDERID,
	Orderdate,
	sales,
	productid,
	sum(sales) over () Totalsales,
	sum(sales) over (partition by productid) salesbyproducts
from Sales.Orders


-- Find the percentage contribution of each product's sales to the total sales

select 
	OrderID,
	ProductID,
	sales,
	sum(sales) over () totalsales,
	ROUND(cast(sales as float) / sum(sales) over() * 100, 2) as percentage
from Sales.Orders

-- AVG() Functions : 

-- find the average sales across all orders 
-- and find the average sales for each product
-- additionally provide details such order id, order date

select 
	orderid,
	OrderDate,
	sales,
	productid,
	AVG(sales) over () Avgsales,
	AVG(sales) over (partition by productid) as avgsalesbyproducts 
from Sales.Orders

-- with the nulls handling 
select 
	customerid,
	lastname,
	score,
	coalesce(score, 0) as customerscore, -- to handle the nulls inside the table
	AVG(Score) over () Avgsales
from Sales.Customers



-- Find all orders where sales are higher than the average sales across all orders

select 
* 
from (
		select 
			orderid,
			productid,
			sales,
			AVG(sales) over () avgsales
		from Sales.Orders
	) t where Sales > avgsales



-- MIN() Function : 

-- Find the highest and lowest sales of all orders
-- ind the highest and lowest sales for each product
-- additionally provide details such order id, order date

select 
	orderid,
	OrderDate,
	ProductID,
	Sales,
	Max(sales) over () highestsales,
	Min(sales) over () lowestsales,
	Max(sales) over (partition by productid) highestsalesbyproduct,
	Min(sales) over (partition by productid) lowestsalesbyproduct 
from sales.Orders


-- show the employees who have the highest salaries
select 
* 
from(
	select 
	*,
	max(salary) over () highestsalary
	from sales.Employees
)t where Salary = highestsalary

--find the deviation of each sales from the minimum and maximum sales amounts


select 
	orderid,
	OrderDate,
	ProductID,
	Sales,
	Max(sales) over () highestsales,
	Min(sales) over () lowestsales,
	Sales - Min(sales) over () deviationfrommin,
	Max(sales) over () - sales deviationfrommax
from sales.Orders


-- Running total and Rolling total

