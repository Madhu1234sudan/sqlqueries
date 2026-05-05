SELECT * from Programmer

SELECT * from Studies

SELECT * from Software

-- 1. Find out the selling cost average for packages developed in Pascal.

SELECT DEVELOPIN, avg(scost)
from Software
WHERE DEVELOPIN = 'PASCAL'
GROUP BY DEVELOPIN


-- 2. Display the names and ages of all programmers.

SELECT PNAME, MAX(DATEDIFF(YY,DOB,GETDATE()))
FROM Programmer
GROUP BY PNAME

-- 3. Display the names of those who have done the DAP Course.

SELECT PNAME
FROM Studies
WHERE COURSE = 'DAP'

-- 4. Display the names and date of birth of all programmers born in January.

SELECT PNAME, DOB
FROM Programmer
WHERE MONTH(DOB) = 1

-- 5. What is the highest number of copies sold by a package?

SELECT  max(sold)
from Software


-- 6. Display lowest course fee.

SELECT min(course_fee) as minimum_course_fee
from Studies


-- 7. How many programmers have done the PGDCA Course?

SELECT PNAME
from Studies
WHERE COURSE = 'PGDCA'

-- 8. How much revenue has been earned through sales of packages developed in C?

SELECT SUM(sold * scost) as Total_Revenue
from Software
where DEVELOPIN = 'C'

-- 9. Display the details of the software developed by Ramesh.

SELECT * 
from Software
WHERE PNAME = 'Ramesh'


-- 10. How many programmers studied at Sabhari?

SELECT COUNT(pname)
from Studies
where INSTITUTE = 'Sabhari'

-- 11. Display details of packages whose sales crossed the 2000 mark.

SELECT title, SCOST
from Software
WHERE SCOST > 2000

-- 12. Display the details of packages for which development costs have been recovered.

SELECT * 
from Software
WHERE SCOST * SOLD > DCOST

-- 13. What is the cost of the costliest software development in Basic?

SELECT DEVELOPIN, MAX(DCOST) AS maximum_dcost
FROM Software
WHERE DEVELOPIN = 'BASIC'
GROUP BY DEVELOPIN

-- 14. How many packages have been developed in dBase?

SELECT COUNT(TITLE) AS NO_OF_DBASE_PACKAGES, DEVELOPIN
FROM Software
WHERE DEVELOPIN = 'DBASE'
GROUP BY DEVELOPIN

-- 15. How many programmers studied in Pragathi?

select pname, institute
from Studies
where INSTITUTE = 'Pragathi'

-- 16. How many programmers paid 5000 to 10000 for their course?

select pname, COURSE_FEE 
from Studies
where course_fee BETWEEN 5000 and 10000

-- 17. What is the average course fee?

SELECT avg(course_fee) as average_fees
from studies


-- 18. Display the details of the programmers knowing C.

select *
from Programmer
where prof1 = 'c'

-- 19. How many programmers know either COBOL or Pascal?

select pname, prof1  
from programmer 
where prof1 = 'cobol' or prof1 = 'pascal'

-- 20. How many programmers don’t know Pascal and C?

select pname
from programmer 
where prof1 not in('pascal', 'c')


-- 21. How old is the oldest male programmer?

SELECT max(datediff(YY, dob, GETDATE())) as oldest_male_programmer
from Programmer
where GENDER = 'M'

-- 22. What is the average age of female programmers?

select  AVG(datediff(yy, dob, getdate())) as avg_age_of_female_programmer
from Programmer
where gender = 'F'
-- group by AVG(datediff(yy, dob, getdate()))

select pname, datediff(yy, dob, getdate()) as age
from Programmer
where gender = 'f'
-- datediff(yy, dob, getdate()) is for calculating the age 

-- 23. Calculate the experience in years for each programmer and display with their names 
-- in descending order.

select pname, datediff(yy, doj, getdate()) as Experience_in_years
from programmer 
ORDER BY datediff(yy, doj, getdate()) DESC


-- 24. Who are the programmers who celebrate their birthdays during the current month?

SELECT pname 
from programmer 
where MONTH(DOB) = format(getdate(), 'MM')
 

select MONTH(dob) -- it will return the month of the dob
from programmer
where pname = 'anand'


select format(getdate(), 'MM') -- it will return the current month '04'
from programmer
where pname = 'anand'


select datename(month, getdate()) -- it will return the current month 'april'
from programmer 
where pname = 'anand'

-- 25. How many female programmers are there?

select count(gender)
from programmer
where gender = 'f'

-- 26. What are the languages studied by male programmers?

select prof1 
from programmer 
where gender = 'm'

-- 27. What is the average salary?

select avg(salary)
from programmer 


-- 28. How many people draw a salary between 2000 to 4000?

select count(pname) 
from programmer 
where salary BETWEEN 2000 and 4000

-- 29. Display the details of those who don’t know Clipper, COBOL or Pascal.

select *
from programmer 
where prof1 not in('clipper', 'cobol', 'pascal')


-- 30. Display the cost of packages developed by each programmer.

select  pname, sum(dcost) as total_development_cost   
from software
GROUP BY pname

-- 31. Display the sales value of the packages developed by each programmer.

select pname, sum(scost * sold)
from software 
group by pname  

-- 32. Display the number of packages sold by each programmer.

select pname, sum(sold)
from software 
group by pname

-- 33. Display the sales cost of the packages developed by each programmer language wise.

select developin, pname, sum(sold * scost) as sales_cost_developer_by_each_programmer
from software 
group by developin, pname

-- 34. Display each language name with the average development cost, 
-- average selling cost and average price per copy.

select developin, avg(dcost) as average_development_cost, avg(scost) as average_selling_cost, avg(scost ) average_per_copy
from software 
group by developin

-- 35. Display each programmer’s name and the costliest and cheapest packages developed by him or her.

select pname,  max(dcost) as costliest, min(dcost) as cheapest 
from Software
group by pname 

-- 36. Display each institute’s name with the number of courses and the average cost per course.

select institute, count(distinct course) as no_of_courses, avg(course_fee) avg_cost_per_course
from studies 
group by institute 

-- 37. Display each institute’s name with the number of students.

select institute, count(pname)
from studies 
group by institute


-- 38. Display names of male and female programmers along with their gender.

select pname, gender 
from programmer 


-- 39. Display the name of programmers and their packages.

select pname, title as programmers_packages
from software


-- 40. Display the number of packages in each language except C and C++. 

select developin, count(title) as no_of_packages 
from software 
where developin not in ('c', 'cpp')
group by developin

-- 41. Display the number of packages in each language for which development cost is less than 1000

select developin, count(title) as package_count
from software 
where dcost < 1000
group by developin

-- 42. Display the average difference between SCOST and DCOST for each package.

select title, avg(dcost - scost) as average_difference
from software
group by title


-- 43. Display the total SCOST, DCOST and the amount to be recovered 
-- for each programmer whose cost has not yet been recovered.

SELECT pname, sum(scost) as service_cost, sum(DCOST) as development_cost, (sum(dcost) - sum(scost*sold)) as amount_to_be_recovered
from software
group by pname
HAVING sum(dcost) > sum(scost * sold)


-- 44. Display the highest, lowest and average salaries for those earning more than 2000.

select pname, MAX(salary) as Highest, MIN(salary) as Lowest, avg(salary) as average_salaries_more_than_2000
from Programmer
--  
where salary > 2000
group by pname


-- 45. Who is the highest paid C programmer

select pname, prof1, max(salary) as highest_paid_c_programmer
from programmer 
where prof1 = 'c'
GROUP BY pname, prof1  


-- 46. Who is the highest paid female COBOL programmer?

select pname, prof1, gender, max(salary) as highest_paid_cobol_programmer
from programmer 
where gender = 'f' and prof1 = 'cobol'
group by pname, prof1, gender

-- 47. Display the names of the highest paid programmers for each language.

select pname, prof1, max(salary) as highest_paid_programmer 
from programmer 
group by prof1, pname 

select top 1 pname, PROF1 
from Programmer
group by pname, PROF1 
order by max(salary) DESC

SELECT pname, prof1, salary
FROM programmer p
WHERE salary = (
    SELECT MAX(salary)
    FROM programmer
    WHERE PNAME = p.PROF1
);


-- corrected version

with programmer_n_prof
as(
    select pname, prof1 as prof, salary 
    from programmer 
    UNION
    select pname, prof2, salary 
    from programmer
)
select prof as [language], pname as highest_paid_programmer 
from(
    select *, 
    DENSE_RANK() over (partition by prof order by salary desc) as sal_rank
    from programmer_n_prof) subqueryalias
    where sal_rank = 1


-- 48. Who is the least experienced programmer?
select pname, min(DATEDIFF(YY, doj, getdate())) as least_experienced_programmer, pname
from programmer 
group by  pname



select pname, datediff(yy, doj, getdate()) as experience
from programmer 
where datediff (yy, doj, getdate()) = (select MIN(datediff(yy, doj, getdate()))
                from programmer )

-- who is the highest experienced programmer

select pname, datediff(yy, doj, getdate()) as experience 
from programmer 
where datediff(yy, doj, getdate()) = (select max(datediff(yy, doj, getdate()))
                                        from programmer )

-- 49. Who is the most experienced male programmer knowing PASCAL?
select pname,  datediff(yy, doj, getdate()) as highest_experienced_pascle_programmer
from programmer 
where gender = 'm'
and 
prof1 = 'pascle'
and 
doj = (select min(doj)
            from programmer 
            where gender = 'm'
            and 
            prof1 = 'pascle')


select pname, gender, datediff(yy, doj, getdate()) as highest_experienced_pascle_programmer
from programmer
where gender = 'M'
and 
prof1 = 'pascal' 
and 
datediff(yy,doj,getdate()) = (select max(datediff(yy, doj, getdate()))
        from programmer 
        where gender = 'm'
        and 
        prof1 = 'pascal')

-- 50. Which language is known by only one programmer?

select prof1
from programmer 
group by prof1 
having count(pname) = 1

-- 51. Who is the above programmer referred in 50?

select pname, prof1 
from programmer 
where prof1 in (select prof1 
                from programmer 
                group by prof1 
                having count(pname) = 1)


-- 52. Who is the youngest programmer knowing dBase?

select pname, prof2, datediff(yy, dob, getdate()) as youngest_dbase_programmer
from programmer 
where prof2 = 'dbase'
and 
datediff(yy, dob, getdate()) = (select min(datediff(yy,dob,getdate()))
                                from programmer 
                                where prof2 = 'dbase')

-- 53. Which female programmer earning more than 3000 does not know C, C++, Oracle or dBase?

select pname, gender
from programmer 
where gender = 'f'
and 
salary > 3000 
and 
prof2 not in ('c', 'cpp', 'oracle', 'dbase')


-- 54. Which institute has the most number of students?

select top 1 institute
from studies 
group by institute 
order by count(pname) desc

-- which institute has the least number of students?

select top 3 institute
from studies 
group by institute 
order by count(pname) ASC


-- 55. What is the costliest course?

select pname,institute, course, course_fee
from studies 
where course_fee = (select max(course_fee)
                    from studies)

-- 56. Which course has been done by the most number of students?

select top 1 course 
from studies 
group by course 
order by count(pname) desc 


-- 57. Which institute conducts the costliest course?

select institute, course_fee as costliest_course 
from studies 
where course_fee = (select max(course_fee)
                        from Studies
                         )

-- 58. Display the name of the institute and the course which has below average course fee.

select course, institute, course_fee as below_average_course_fee
from studies 
where course_fee < (select AVG(COURSE_FEE)
                        from studies)

        -- using window funciton over():
select distinct institute, course_fee  
from (select course_fee, course, institute, avg(course_fee) over() as avg_course_fee 
        from studies 
         ) as below_average_course_fee
where course_fee < avg_course_fee

-- 59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fee

select course as within_1000
from studies 
where course_fee BETWEEN (select avg(course_fee)) -1000 and 
                        (select avg(course_fee)) + 1000


-- 60. Which package has the highest development cost?

select title, dcost as highest_development_cost
from software 
where dcost = (select max(dcost)
                from software)

-- 61. Which course has below average number of students?
with course_enrollment as (
        select course, count(pname) as students_count
        from studies 
        group by course 
)

select course 
from course_enrollment
where students_count < (select avg(cast(students_count as float)) from course_enrollment)


-- for checking the average of actual no of students 
with course_enrollment as (
    select course, count(pname) as students_count
    from studies 
    group by course 
)
select 
    course, 
    students_count, 
    (select avg(cast(students_count as float)) from course_enrollment) as actual_avg
from course_enrollment;

-- 62. Which package has the lowest selling cost?

select distinct pname, title,  scost as lowest_selling_cost 
from software 
where scost = (select min(scost) 
                from software)

-- 63. Who developed the package that has sold the least number of copies?

select distinct pname, sold as least_numbers_of_copies 
from software 
where sold = (select min(sold)
                from software )

-- 64. Which language has been used to develop the package which has the highest sales amount?

select top 1  developin 
from software 
order by (scost*sold) DESC

-- -- 65. How many copies of the package 
-- that has the least difference 
-- between development and selling cost 
-- were sold?

SELECT TOP 1 
    title, 
    sold
FROM 
    software
ORDER BY 
    ABS(scost - dcost) ASC;


-- 66. Which is the costliest package developed in Pascal?

select  developin, dcost,  title as costliest_package
from software  
where dcost = (select max(dcost) 
                from software )

-- 67. Which language was used to develop the most number of packages?

select title, developin as most_number_packages
from software 
where developin = (select count(developin) 
                        from software )


-- 68. Which programmer has developed the highest number of packages?

select pname, count(title) as highest_number_of_packages
from software 
group by pname
having count(title) =  (select max(package_count) 
                        from 
                        (select pname, count(title)as package_count
                        from software 
                        group by pname) as counts)

-- 69. Who is the author of the costliest package?

select pname, max(dcost) as costliest_package
from software 
group by pname
having max(dcost) =(select max(dcost)
                from software)


-- 70. Display the names of the packages which have sold less than the average number of copies.


select title, sold as sold_less_than_avg
from software
where sold <(select avg(sold)
            from software)

-- 71. Who are the authors of the packages which have recovered more than double the development cost?

select distinct  pname, title, dcost 
from software
where scost * sold > 2 * dcost 


-- 72. Display the programmer names and the cheapest packages developed by them in each language.

select pname, developin, min(dcost)
from software 
group by pname, developin 
having min(dcost)=(select min(dcost) 
                    from software) 


-- 73. Display the language used by each programmer 
-- to develop the highest selling and lowest selling package.

select pname, developin, scost 
from software
where scost = (select max(scost)
                from software 
                where pname = software.pname)

                or scost = 
                (select min(scost)
                from software 
                where pname = software.pname)

-- 74. Who is the youngest male programmer born in 1965?

select pname, gender, min(datediff(yy, dob, getdate())) as minimum_youngest_programmer
from programmer 
where gender = 'm' 
and 
year(dob) = 1965
group by pname, gender 



SELECT pname, gender, dob
FROM programmer
WHERE gender = 'M'
AND YEAR(dob) = 1965
AND dob =
(
    SELECT MAX(dob)
    FROM programmer
    WHERE gender = 'M'
    AND YEAR(dob) = 1965
);

-- 75. Who is the oldest female programmer who joined in 1992?

select pname, gender, doj
from programmer 
where gender = 'f'
and 
year(doj) = 1992
and doj = 
            (select max(doj) 
            from programmer 
            where gender = 'f'
            and 
            year(doj) = 1992)









select pname, gender, doj
from programmer 
where gender = 'f'
and 
year(doj) = 1992
and 
doj = (select max(doj)
        from programmer 
        where gender = 'f'
        and 
        year(doj) = 1992)


-- 76. In which year was the most number of programmers born?

select pname, max(no_of_programmers) 
from programmer 
group by pname 
having max(count) = (select count(born_years) as no_of_programmers
                                from (select  year(dob)as born_years
                                from programmer
                                ) as most_programmer )

select year(dob) as birth_year, count(*) as number_of_programmers 
from programmer 
group by year(dob)
having count(*) = (select max(year_count) 
                    from (
                        select count(*) as year_count
                        from programmer 
                        group by year(dob)
                    )as counts)

-- 77. In which month did the most number of programmers join?

select month(doj) as join_month, count(*) as number_of_programmer 
from programmer 
group by month(doj)
having count(*) = (select max(month_count) 
                    from (select count(*) as month_count
                            from programmer 
                            group by month(doj)
                            )
                        as counts )

-- 78. In which language are most of the programmer’s proficient?
select prof1 as proficiency
from programmer
having max(prof1) = (select pname, max(complete_count)
                             from (select pname, count(prof1) as complete_count
                                            from programmer 
                                            group by count(prof1)
                                            having count(prof1) = (select prof1 from programmer 
                                                                    union ALL
                                                                    select prof2 from programmer as language_count) )as counts)


select top 1 proficiency, count(*) as known_by_count
from(
        select prof1 as proficiency
        from programmer
        UNION ALL
        select prof2 
        from programmer 
    ) languages 
    group by proficiency
    order by count(*) DESC

-- 79. Who are the male programmers earning below the average salary of female programmers?
select * from programmer 


select pname 
from programmer 
where gender = 'M'
and salary<(
    select avg(salary)
    from programmer
    where gender = 'F' 
)

-- 80. Who are the female programmers earning more than the highest paid male programmer?


select pname 
from Programmer
where gender = 'F'
and salary > (
select max(salary) as highest_paid_mail_programmer
        from Programmer 
        where gender = 'M'
)

-- 81. Which language has been stated as the proficiency by most of the programmers?
        with all_prof as (
            select prof1 from Programmer
            UNION ALL
            select prof2 from Programmer)
        select count(prof1) 
        from programmer 
        where
                                            
