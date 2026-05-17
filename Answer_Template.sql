--SQL Advance Case Study


--Q1--BEGIN 
-- 1. List all the states in which we have customers who have bought cellphones
-- from 2005 till today.

                SELECT
                distinct dl.[State]
            FROM FACT_TRANSACTIONS ft 
            INNER JOIN DIM_LOCATION dl  
            ON ft.IDLocation  = dl.IDLocation
            WHERE ft.[Date] >= '2005-01-01'

--Q1--END

--Q2--BEGIN
-- What state in the US is buying the most 'Samsung' cell phones? 
  SELECT 
    distinct dl.[State],
    count(*) AS most_buying_cellphone
  FROM DIM_LOCATION dl 

--Q2--END

--Q3--BEGIN      
	










--Q3--END

--Q4--BEGIN







--Q4--END

--Q5--BEGIN














--Q5--END

--Q6--BEGIN












--Q6--END
	
--Q7--BEGIN  
	
	
















--Q7--END	
--Q8--BEGIN



















--Q8--END
--Q9--BEGIN
	

















--Q9--END

--Q10--BEGIN
	


















--Q10--END
	