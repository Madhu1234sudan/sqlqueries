SELECT * 
FROM 
Sales.Orders

--  conversion 

select 
CONVERT(int, '123') as [string to int convert],
CONVERT(date, '2025-08-20') as [string to date convert],
creationtime,
CONVERT(date, creationtime) as [datetime to date convert]
from Sales.Orders




