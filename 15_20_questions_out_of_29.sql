SELECT * from fact
SELECT * from Product
SELECT * from [Location]
-- select  Product_type AVG(Budget_Margin)
-- from fact
-- JOIN Product as a on fact.ProductId = a.ProductId
-- GROUP BY Product, Product_type
-- HAVING AVG(Budget_Margin)>100


SELECT distinct Product_Type, AVG(budget_margin)
from fact
JOIN Product on fact.ProductId = Product.ProductId
GROUP BY Product_Type
HAVING AVG(Budget_Margin)>100


-- 16. Display the rank without any gap to show the sales wise rank.
SELECT sales, 
RANK() OVER (ORDER BY sales DESC) as sales_wise_rank
from fact

SELECT sales,
RANK() over (ORDER BY sales ASC) as sales_wise_rank
from fact

SELECT sales,
DENSE_RANK() OVER (ORDER BY sales DESC) as sales_wise_rank
from fact

-- 17. Find the state wise profit and sales.
select state, profit, sales
from fact
JOIN Product on fact.ProductId = Product.ProductId
JOIN [Location] on fact.Area_Code = [Location].Area_Code


-- 18. Find the state wise profit and sales along with the product name.

SELECT state, profit, sales, product
from fact
JOIN Product on fact.ProductId = Product.ProductId
JOIN [Location] on fact.Area_Code = [Location].Area_Code


-- 19. If there is an increase in sales of 5%, calculate the increased sales.


SELECT sum(sales) * 1.05 as total_sales, 
sum(sales) * 0.05 as wothout_total,
sum(sales) as current_total_sales
from fact
GROUP BY Sales

-- 20. Find the maximum profit along with the product ID and product_type.

select  fact.ProductId, Product_Type, Profit
from fact
LEFT JOIN Product on fact.ProductId = Product.ProductId
where fact.Profit = (select MAX(Profit) from fact)

-- 21. Create a stored procedure to fetch the result according to the product type from Product Table.







-- 22. Write a query by creating a condition in which if the total expenses is less than
-- 60 then it is a profit or else loss.

SELECT total_expenses,
CASE
    WHEN total_expenses < 60 THEN 'profit'
    ELSE 'loss'
END 
from fact


SELECT total_expenses,
CASE WHEN total_expenses < 10 THEN 'disaster'
     WHEN total_expenses < 30 THEN 'loss'
     WHEN total_expenses < 70 then 'Managable'
     WHEN total_expenses < 90 THEN 'good'
     when total_expenses > 90 then 'profit'
END
from fact

-- 23. Give the total weekly sales value with the date and product ID details. 
-- Use roll-up to pull the data in hierarchical order.

select date, productid, SUM(Sales) as total_weekwise_sales, DATEPART(WEEK, [Date]) as Date
from fact
GROUP BY ROLLUP(date, ProductId, DATEPART(WEEK, [Date])) 

-- 24. Apply union and intersection operator on the tables which consist of attribute area code.

SELECT area_code from fact
UNION
SELECT area_code from [Location]


SELECT area_code FROM fact
INTERSECT
SELECT area_code from fact



-- 25. Create a user-defined function for the product table 
-- to fetch a particular product type based upon the user’s preference.




-- 27. Display the date, product ID and sales where total expenses are between 100 to 200.

SELECT date, productid, Sales
from fact
WHERE Total_Expenses BETWEEN 100 and 200


-- 28. Delete the records in the Product Table for regular type.



DELETE 
from Product
where [Type] = 'regular'

SELECT * from Product


-- 29. Display the ASCII value of the fifth character from the column Product.
SELECT Product,
    ASCII(SUBSTRING('product',5,1)) as asciivalue
FROM Product  

