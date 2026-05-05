use salesDB

select * 
from sales.Orders

-- NUll Functions --

-- 1. isnull(value, replacement):- 
		
-- 2. coalesce(value1, value2, value3, ...)

-- Null Handling Data Agreegation 

-- find the average scores of customers

select 
customerid,
score,
avg(score) over() avgscore,
avg(coalesce(score,0)) over() avgscore2,
coalesce(score,0) as score2
from Sales.Customers


-- Display the full name of customers in a single field
-- by mergin their first and last name,
-- and add 10 bonus points to each customer's score.

select 
CustomerID
firstname,
LastName,
FirstName + ' ' + coalesce(LastName, ' ' ) as fullname,
Score,
coalesce(score, 0) + 10 as scorewithbonus
from sales.Customers

-- sort the customers from lowest to highest scores,
-- with nulls appearing last

select 
CustomerID,
score
from
Sales.Customers
order by case when score is null then 1 else 0 end, score

-- 3. nullif(value1, value2):-

-- find the sales price for each by dividing sales by quantity

select 
OrderID,
sales,
quantity,
sales/ nullif(quantity, 0) as price
from 
Sales.Orders


-- 4. value is null() , values is not null()

-- identify the customers who have no score

select 
*
from 
Sales.Customers
where score is null

-- list all customers who have score

select 
* 
from 
sales.Customers
where score is not null

--list all the details for customers who have not placed any orders . left anti join

select 
c.* ,
o.OrderID
from Sales.Customers as c
left join 
sales.Orders as o
on c.CustomerID = o.CustomerID
where o.CustomerID is null


 