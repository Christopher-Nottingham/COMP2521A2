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
FROM university.enrollment;
--3
SELECT student.student_id, enrollment.section_id,student.FIRST_NAME ,COUNT(*)
FROM universtiy.student, universtiy.enrollment
WHERE student.STUDENT_ID=enrollment.STUDENT_ID
GROUP BY student.student_id
HAVING COUNT(*)>=3;
--4
SELECT MIN(grade.numeric_grade) AS minimum_grade, AVG(grade.numeric_grade) AS average_grade, MAX(grade.numeric_grade) AS max_grade
FROM university.section, university.grade
WHERE section.section_id = 141 AND 
grade.section_id = section.section_id;

--5
SELECT max(EMPLOYER) as Company, COUNT(*) as Number_Of_Students_Employed
FROM university.student
GROUP BY employer
ORDER BY 2 DESC
LIMIT 1; 

--6 
SELECT location, COUNT(location) AS frequency
FROM university.section
WHERE section_no = 3 AND
location LIKE "L%2%"
AND capacity >= 50
GROUP BY location;
--7
SELECT COUNT(DISTINCT section.instructor_id) AS total_number_of_instructors_who_teach_at_least_one_section_of_a_course
From university.section;
--8
SELECT DISTINCT section.section_id AS sections_with_enrolllments, section.modified_date AS day_of_most_recent_enrollment
FROM university.section, university.enrollment
WHERE section.section_id = enrollment.section_id;
--9
SELECT section.instructor_id
FROM universtiy.section, universtiy.enrollment
WHERE section.section_id = enrollment.section_id
AND enrollment.FINAL_GRADE IS NOT NULL;
--10
SELECT description AS Course_Description, prerequisite AS Course_Prerequisite
FROM university.course
WHERE prerequisite IS NULL;
--11
SELECT course.description as Course_Description , instructor.last_name AS Instructor_Last_Name
FROM university.course, university.section, university.instructor
WHERE prerequisite = 350
AND course.course_no=section.course_no
AND section.instructor_id=instructor.instructor_id;
--12
SELECT g.student_id,c.description, g.grade_type_code, g.numeric_grade
FROM university.course AS c, university.section AS sec, university.grade AS g
WHERE g.grade_type_code IN ("HM","QZ")
AND sec.section_id = g.section_id 
AND g.student_id = 109;
--13
Select course.description,  grade.numeric_grade AS FINAL_EXAM_GRADE
FROM universtiy.student, universtiy.zipcode, universtiy.course, universtiy.section, universtiy.grade
WHERE zipcode.state = "NJ"
AND course.course_no = 350
AND course.course_no=section.course_no
AND grade.student_id = grade.student_id
AND grade.grade_type_code ="FI"
AND student.zip=zipcode.zip;
--14
SELECT c.description as course_name, MIN(g.numeric_grade) AS minimum_grade
FROM university.grade AS g, university.course AS c, university.section AS s
WHERE s.section_id = g.section_id  
AND s.course_no = c.course_no 
AND g.grade_type_code = "FI"
GROUP BY c.course_no
ORDER BY MIN(g.numeric_grade) DESC;
--15
SELECT section.SECTION_ID, GRADE_TYPE_CODE, PERCENT_OF_FINAL_GRADE
FROM section, grade_type_weight
WHERE section.section_id = grade_type_weight.section_id
AND section.section_id BETWEEN 95 AND 125;
--16
SELECT enrollment.student_id, course.description, COUNT(course.course_no) AS duplicates, section.section_id
FROM universtiy.enrollment, universtiy.section, universtiy.course
WHERE enrollment.section_id=section.section_id 
AND course.course_no=section.course_no
GROUP BY enrollment.student_id
HAVING duplicates>1;


