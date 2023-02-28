/*
COMP 2521-001: Assingment 2
Coded by: Christopher Nottingham (Even) and Ope Lano (Odd)
*/
--1
SELECT COUNT(*) as Numbers_of_Courses_Without_Prerequisites
FROM university.course
WHERE prerequisite IS NULL; DONE
--2
SELECT DISTINCT YEAR(ENROLL_DATE) AS enrolled_date, YEAR(DATE_ADD(ENROLL_DATE, INTERVAL 4 YEAR)) AS graduation_year
FROM enrollment;
--3
SELECT DISTINCT STUDENT_ID AS Full_Time_Students
FROM university.enrollment, university.student
WHERE enrollment.student_id = student.student_id; **
--4
SELECT MIN(grade.numeric_grade) AS minimum_grade, AVG(grade.numeric_grade) AS average_grade, MAX(grade.numeric_grade) AS max_grade
FROM section, grade
WHERE section.section_id = 141 AND 
grade.section_id = section.section_id;

--5
SELECT max(EMPLOYER) as Company, COUNT(*) as Number_Of_Students_Employed
FROM university.student
GROUP BY employer
ORDER BY 2 DESC
LIMIT 1; DONE

--6
SELECT location, COUNT(location) AS frequency
FROM section
WHERE section_no = 3 AND
location LIKE "L%2%"
AND capacity >= 50
GROUP BY location;
--7
SELECT max(INSTRUCTOR_ID) AS Total_Number_Of_Instructors
FROM university.section, university.course
WHERE INSTRUCTOR_ID ; **

--8
SELECT DISTINCT section.section_id AS sections_with_enrolllments, section.modified_date AS day_of_most_recent_enrollment
FROM university.section, university.enrollment
WHERE section.section_id = enrollment.section_id;
--9

SELECT FIRST_NAME, LAST_NAME, course.description
FROM university.student, university.course, university.grade
WHERE F_GRADE IS NOT NULL; **
--10
SELECT description as Course_Description, prerequisite AS Course_Prerequisite
FROM course
WHERE prerequisite IS NULL;
--11
SELECT course.description as Course_Description, course_no as 
FROM university.course
WHERE prerequisite = 350; **
--12
SELECT g.student_id,c.description, g.grade_type_code, g.numeric_grade
FROM course AS c, section AS sec, grade AS g
WHERE g.grade_type_code IN ("HM","QZ")
AND sec.section_id = g.section_id 
AND g.student_id = 109;
--13
--14
SELECT c.description as course_name, MIN(g.numeric_grade) AS minimum_grade
FROM university.grade AS g, university.course AS c, university.section AS s
WHERE s.section_id = g.section_id  
AND s.course_no = c.course_no 
AND g.grade_type_code = "FI"
GROUP BY c.course_no
ORDER BY MIN(g.numeric_grade) DESC;
--15
--16
SELECT enrollment.student_id, course.description
FROM section, course, enrollment
WHERE section.course_no= course.course_no
AND section.section_id = enrollment.section_id
GROUP BY course.description;
HAVING course.description>1;
AND enrollment.student_id = 283; 
