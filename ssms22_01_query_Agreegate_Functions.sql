use SalesDB


--return the count of all orders in the Sales.Orders table
select 
COUNT(*) as totalorders
from Sales.Orders

-- return the sum of the Sales column for all orders in the Sales.Orders table

select
SUM(Sales) as totalsales
from Sales.Orders


-- return the average of the Sales column for all orders in the Sales.Orders table

select
avg(sales) as avgsales
from sales.Orders


-- anayze the scores in customer table and return the minimum, maximum and average score for customers in each country

select 
Country,
MIN(score) as minimumscore,
MAX(score) as maximumscore,
avg(score) as avgscore
from Sales.Customers
group by Country