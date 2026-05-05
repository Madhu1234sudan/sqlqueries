SELECT * from courses
-- Write a query to select the course_name and fees from the Courses table 
-- where the fees are greater than 5000 AND the status is 'Ongoing'.

SELECT course_name, fees
FROM courses
WHERE fees > 5000 AND status = 'ongoing'

-- Task: Show the Student's name alongside the course they are taking.
SELECT students.firstname, students.lastname, courses.course_id, courses.course_name, courses.fees
from students
INNER JOIN courses on students.student_id = courses.student_id

-- Task: List every student, even if they aren't enrolled in anything yet.

SELECT students.firstname, students.lastname, students.student_id, courses.course_id, courses.course_name, courses.fees
from students
LEFT JOIN courses on students.student_id = courses.student_id

-- Challenge: Write a query that shows:

-- FirstName (from Students)

-- course_name (from Courses)

-- marks (from Grades)

SELECT students.firstname, courses.course_name, grades.marks
from students
INNER JOIN courses on students.student_id = courses.student_id 
INNER JOIN grades on students.student_id = grades.student_id



select * from grades

select * from students