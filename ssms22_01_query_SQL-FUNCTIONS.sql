SELECT 
	DATEDIFF(YEAR, hire_date, GETDATE()) AS years_worked
FROM Employees