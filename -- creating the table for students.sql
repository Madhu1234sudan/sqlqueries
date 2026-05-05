-- creating the table for students
CREATE TABLE students(
    student_id INT PRIMARY KEY IDENTITY(101, 1),
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    age INT, 
    city VARCHAR(50),
    Email VARCHAR(100) UNIQUE
)
-- creating the table for courses
CREATE TABLE courses(
    course_id int PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(50),
    student_id INT FOREIGN KEY REFERENCES students (student_id),
    fees DECIMAL(10, 2),
    STATUS VARCHAR(30)
)
-- creating the table for grades
CREATE TABLE grades(
    grade_id int PRIMARY KEY,
    student_id INT FOREIGN KEY REFERENCES students (student_id),
    marks INT CHECK(marks!>100)
)

-- ALTER TABLE grades MODIFY COLUMN marks INT CHECK(marks<=100)

-- inserting the value for students table
INSERT INTO Students (FirstName, LastName, Age, City, Email) VALUES 
('Madhusudan', 'Somvanshi', 22, 'Pune', 'madhu@example.com'),
('Rahul', 'Sharma', 23, 'Mumbai', 'rahul@test.com'),
('Anjali', 'Patil', 21, 'Pune', 'anjali@dev.com'),
('Vikram', 'Singh', 25, 'Delhi', 'vikram@web.com'),
('Sana', 'Khan', 22, 'Bangalore', 'sana@it.com');

-- inserting the values for courses table
INSERT INTO Courses (course_name, student_id, fees, STATUS) VALUES 
('Python Basics', 101, 5000, 'Completed'),
('SQL Mastery', 101, 4000, 'Ongoing'),
('Machine Learning', 102, 12000, 'Ongoing'),
('Data Analytics', 103, 8000, 'Completed'),
('Web Dev', 105, 7000, 'Ongoing');

-- inserting the values for the grades table
INSERT INTO grades (grade_id, student_id, marks) VALUES 
(1, 101, 93),
(2, 102, 45),
(3, 103, 85),
(4, 105, 78);


-- getting the table description of the table
EXEC sp_help 'grades';


-- adding the constraint to the grades table
ALTER TABLE grades ADD CONSTRAINT marks CHECK(marks<=100)

-- droping the constraint of the table
ALTER TABLE grades DROP CONSTRAINT marks

-- Find all students who live in Pune:

SELECT * from students 
where city = 'pune';

-- Filtering with Multiple Conditions (AND / OR)
-- Find students who are from Pune AND older than 21:

SELECT firstname, age, city 
from students
WHERE city = 'pune' AND age > 21

-- The BETWEEN Operator
-- Useful for ranges (like ages or marks). Let's find students aged 22 to 24:

SELECT age 
from students
where age BETWEEN 22 and 24


-- fetch the first name and age of the students frm 22 to 24
SELECT age, firstname
from students
WHERE age BETWEEN 22 and 24

-- 2. The LIKE Operator (Pattern Matching)
-- Find any student whose Email ends with @test.com 

SELECT firstname
FROM students
where Email LIKE '%@test.com'