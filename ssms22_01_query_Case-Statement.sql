use SalesDB

-- Retrive the employee details with gender displayed as full text
SELECT 
employeeid,
firstname,
lastname,
gender,
CASE 
    when gender = 'F' THEN 'Female'
    when gender = 'M' THEN 'Male'
    ELSE 'N/A'
END as genderfulltext
from Sales.Employees


-- 





