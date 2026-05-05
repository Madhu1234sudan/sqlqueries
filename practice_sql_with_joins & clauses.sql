SELECT * FROM students

-- Practice 1: Count Students per City
SELECT city,  COUNT(student_id) as total_students
from students
GROUP BY city

-- Practice 2: Total Fees per Course Status

select status, SUM(fees)
from courses
group by status 

-- select , sum(fees)
-- from courses
-- group by 

-- EXEC sp_help 'students';















-- Practice 2: Total Fees per Course Status
-- Let's see how much revenue is "Completed" vs. "Ongoing":

SELECT status, SUM(fees)
from courses
GROUP BY status

-- Challenge: Write a query to find the Average Marks for each student.

-- Join the Students and grades tables.

-- Group By the FirstName.

-- Use AVG(marks) to get the result.

select students.firstname, AVG(marks)
from students
INNER JOIN grades on students.student_id = grades.student_id
GROUP BY firstname

-- Level 1: Filtering & Sorting (Where, Operators, Order By)
-- The High-Value List: Find all courses where the fees are between 5000 and 15000. Sort the results from highest fee to lowest.

-- Location Check: Select all students who live in 'Pune' or 'Mumbai' and are older than 21.

-- Pattern Search: Find all students whose email contains the word 'dev'. (Hint: Use LIKE '%dev%').

select fees as coursefees
from courses
WHERE fees BETWEEN 5000 and 15000
ORDER BY fees DESC -- use asc for ascending order


select firstname
from students
WHERE city IN('pune', 'mumbai')
AND age > 21

select email, firstname, lastname as email_dev
from students
where Email LIKE('%dev%')


-- Level 2: Joins & Aliases
-- Enrollment Summary: Write a query to show the FirstName, CourseName, and Status for all students. 

-- Use Aliases so the headers look like: [Student], [Course Name], and [Enrollment Status].

-- The "Missing" Students: Use a LEFT JOIN to find students who haven't enrolled in any courses yet. 

-- (Hint: Filter for rows where course_name IS NULL).

SELECT students.firstname as Students, courses.course_name as Course_Name, courses.[STATUS] as Enrollment_Satus
from students
INNER JOIN courses on students.student_id = courses.student_id

-- SELECT * from courses

SELECT  courses.course_name as Not_Enrolled_Students
from students
LEFT JOIN courses on students.student_id = courses.student_id
WHERE course_name = null

-- Level 3: Group By & Aggregates (The Advanced Stuff)

-- Revenue Report: Find the total fees collected for each Status (Completed vs. Ongoing).

-- Performance Check: Find the Highest (MAX) and Lowest (MIN) marks in the grades table.

-- The "High Achievers" Group: Join Students and grades. Show the FirstName and AVG(marks), 

select first

-- but only for students whose average marks are greater than 80.

-- (Pro Hint: To filter after a Group By, you use the HAVING clause instead of WHERE!)

SELECT SUM(fees) as total_fees, status 
from courses
GROUP BY [STATUS]

SELECT * from grades

SELECT MAX(marks) as Highest, MIN(marks) as Lowest
from grades


--imp question
SELECT students.firstname, AVG(marks)
from students
INNER JOIN grades on students.student_id = grades.student_id
WHERE marks > 80
GROUP BY firstname


select,  max(salary)
from emp
group by salary()


select max(salary)
from emp>(select salary
            from emp)

SELECT salary 
from emp
limit 2 OFFSETS 1 
order by salary desc

select distinct salary
from emp
limit 2 offsets 1
order by salary desc