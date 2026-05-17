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
 with most_buying_samsung_cellphones AS(
     SELECT 
    dl.[State],
    count(*) AS most_buying_cellphone
  FROM DIM_LOCATION dl 
  INNER JOIN FACT_TRANSACTIONS ft  
  ON dl.IDLocation = ft.IDLocation
  INNER JOIN DIM_MODEL m 
  ON ft.IDModel = m.IDModel
  INNER JOIN DIM_MANUFACTURER dm 
  ON m.IDManufacturer = dm.IDManufacturer
  WHERE dm.Manufacturer_Name = 'Samsung'
  GROUP BY dl.[State], dl.Country
 )
 SELECT 
        distinct [State]
 FROM most_buying_samsung_cellphones
 WHERE most_buying_cellphone = (select 
                                    MAX(most_buying_cellphone)
                                FROM most_buying_samsung_cellphones)


--Q2--END

--Q3--BEGIN      
-- 3. Show the number of transactions for each model per zip code per state.
WITH number_of_transactions AS (
    SELECT
    m.model_name,
    dl.zipcode,
    dl.state,
    COUNT(*)  as total_transactions
FROM FACT_TRANSACTIONS ft
INNER JOIN DIM_MODEL m  
ON ft.IDModel = m.IDModel 
INNER JOIN DIM_LOCATION dl 
ON ft.IDLocation = dl.IDLocation
GROUP BY m.Model_Name, dl.ZipCode, dl.[State]
)
SELECT 
    total_transactions
FROM number_of_transactions 

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
	