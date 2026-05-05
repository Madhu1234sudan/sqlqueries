CREATE TABLE grades(
    grade_id int PRIMARY KEY,
    student_id INT FOREIGN KEY REFERENCES students (student_id),
    marks INT CHECK(marks!>100)
)

ALTER TABLE grades ADD CONSTRAINT marks CHECK(marks<-100)

EXEC sp_help 'Students';

select * from Students