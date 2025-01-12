-- - SELECT with ORDER BY
-- Question: Retrieve the ID, first name, and last name of
--		students, sorted alphabetically by their first names.
SELECT StudentID, FirstName, LastName
FROM Students
–- order them ASCENDINGLY (A TO Z)
ORDER BY FirstName ASC;


-- Question: Retrieve the ID, name, and credits of subjects, 
--  sorted by credits in descending order.
SELECT SubjectID, SubjectName, Credits
FROM Subjects
ORDER BY Credits DESC;


-- Question: Retrieve the ID, first name, last name, and 
-- department of professors, sorted by department (ascending)
---  and last name (descending).
SELECT ProfessorID, FirstName, LastName, Department
FROM Professors
ORDER BY Department ASC, LastName DESC, FirstName ASC;


-- Question: Retrieve the ID, name, and adjusted credits 
--  (credits + 2) of subjects, sorted by adjusted credits 
--   in descending order.
SELECT SubjectID, SubjectName, Credits + 2 AS Adjested_Credits
FROM Subjects
ORDER BY Adjested_Credits DESC;


-- Question: Retrieve the ID, first name, last name, and 
--   birthdate of students, sorted by birthdate 
--    in ascending order.
SELECT StudentID, FirstName, LastName, BirthDate
FROM Students
ORDER BY BirthDate ASC;


-- Question: Retrieve the ID, student ID, subject ID, 
--   and grade from grades, sorted by grade (ascending) 
--     and subject ID (descending).
– ALL columns just write *
SELECT *
FROM Grades
ORDER BY Grade ASC, SubjectID DESC;


-- Question: Retrieve the ID, name, and remaining capacity 
--    (capacity - 10) of sections, sorted by remaining 
--      capacity in descending order.
SELECT SectionID, SectionName, Capacity - 10 AS Rem_Cap
FROM Sections
ORDER BY Rem_Cap DESC;




-- Question: Retrieve the ID, first name, last name, 
--   and email of professors, sorted by the first character
--     of their email in ascending order.
SELECT ProfessorID, FirstName, LastName, Email
FROM Professors
– left takes 1 char from the email and sort by it
ORDER BY LEFT(Email, 1) ASC;



-- - EQUI and NON-EQUI JOINS


-- Question: Which students are enrolled in which subjects, 
--   along with their grades?
– go to another table → join (equi_join)
– students.column_name to avoid confusion if similar col_name exists
SELECT Students.StudentID,
		Students.FirstName,
		Students.LastName,
		Subjects.SubjectName,
		Grades.Grade
FROM Grades
– double inner join
INNER JOIN Students ON Grades.StudentID = Students.StudentID
INNER JOIN Subjects ON Grades.SubjectID = Subjects.SubjectID


-- Question: Which professors teach which subjects?
SELECT Professors.FirstName,
		Professors.LastName,
		Subjects.SubjectName
FROM Professors
– order does not differ (get matches)
INNER JOIN Subjects ON Professors.ProfessorID = Subjects.ProfessorID


-- Question: List all students and their grades where the grade
--    is not 'A'.
SELECT Students.StudentID,
		Students.FirstName,
		Students.LastName,
		Grades.Grade
FROM Grades
INNER JOIN Students ON Grades.StudentID = Students.StudentID
-- constraint
WHERE Grades.Grade <> 'A'
ORDER BY Students.FirstName ASC;


-- Question: List all sections where the capacity is greater 
--   than 30.
SELECT SectionID, SectionName, Capacity
FROM Sections
Where Capacity > 30;



-- - EQUI JOIN Types

-- Question: List all professors and the subjects they teach,
--   including professors not teaching any subject.  
-- Table alias used for select statements only (local variable)
SELECT p.ProfessorID, 
		p.FirstName, 
		p.LastName,
		s.SubjectName
FROM Professors p 
-- Like prof return all its values
LEFT JOIN Subjects s ON p.ProfessorID = S.ProfessorID;


-- Question: List all subjects and the professors teaching them,
--    including subjects with no assigned professor.  
--INSERT INTO Subjects (SubjectName, SectionID, Credits)
--VALUES ('Machine Learning', 3, 6);

SELECT  s.SubjectName,
		p.FirstName
FROM Professors p
RIGHT JOIN Subjects s ON p.ProfessorID = s.ProfessorID;

-- Question: Which students share the same birth date?  
-- comparing table with itself → self join
SELECT A.StudentID AS Student1_ID,
		A.FirstName AS Student1_Name,
		B.StudentID AS Student2_ID,
		B.FirstName AS Student2_Name
FROM Students A
INNER JOIN Students B
ON A.BirthDate = B.BirthDate AND A.StudentID <> B.StudentID;
 -- to not work on the same student


-- Question: Which sections have the same capacity?  
SELECT A.SectionName AS Section1_name,
		A.Capacity AS Section1_Capacity,
		B.SectionName AS Section2_name,
		B.Capacity AS Section2_Capacity
FROM Sections A
INNER JOIN Sections B
ON A.Capacity = B.Capacity AND A.SectionID <> B.SectionID;


-- Question: Pair all professors with all sections regardless
--    of assignment.  
SELECT Professors.ProfessorID,
		Professors.FirstName,
		Professors.LastName,
		Sections.SectionID,
		Sections.SectionName
FROM Professors, Sections;



-- Question: Pair all students with all subjects regardless of
--   enrollment. 
-- cartesian join 
SELECT Students.StudentID,
		Students.FirstName AS StudentName,
		Subjects.SubjectID,
		Subjects.SubjectName
FROM Students, Subjects;






-- Table Alias
-- Question 1: What are the names of students and the sections they are in, using aliases for both tables?

SELECT s.student_name AS StudentName,
       sec.section_name AS SectionName
FROM students s
INNER JOIN sections sec
ON s.section_id = sec.section_id;

-- Question 2: What are the details of subjects taught by professors, using aliases for better readability?
SELECT S.SubjectName,
       S.SectionID,
       S. credits,
       P. professorID
FROM Subjects S
INNER JOIN Professor P ON S.professorID = P.professorID;

-- Question 3: What are the grades of students in specific subjects, with aliases used to clarify tables?
SELECT S. StudentID,
       S.FirstName,
       S.LastName,
       G.Grade
FROM Students S
INNER JOIN Grades G on S.StudentID= G.StudentID;

-- LEFT JOIN, RIGHT JOIN, and FULL JOIN 

-- Question 1: Which students have a section assigned, and which don't?

SELECT Sec.SectionName,
       Stud.FirstName,
       Stud.LastName
FROM Students AS Stud




-- Question 2: What are the grades of all students, including those who don't have grades assigned?
SELECT Stud.FirstName,
       Stud.LastName,
       G.Grade
FROM Students Stud
LEFT JOIN Grades G ON Stud.StudentID = G.StudentID;
-- Question 3: What subjects are assigned to a professor, including subjects that aren't assigned to anyone?

SELECT Sub.SubjectName,
       P.FirstName
FROM Subjects Sub
LEFT JOIN Professor P ON Sub.ProfessorID = P.ProfessorID;

-- Question 1: Which professors have sections assigned, and which sections do not have a professor?

SELECT Sub.SubjectName,
       P.FirstName
FROM Professor P
LEFT JOIN Subjects Sub ON P.ProfessorID = Sub.ProfessorID;


-- Question 2: What grades are assigned for each subject, including subjects without grades?

SELECT Sub.SubjectName,
       G.Grade
FROM Subjects Sub
LEFT JOIN Grades G ON Sub.SubjectID = G.SubjectID;

-- Question 3: Which sections have students assigned, and which sections do not have students?

SELECT Sec.SectionName, 
FROM Sections AS Sec 
LEFT JOIN Subjects AS Sub ON Sec.SectionID = Sub.SectionID,
LEFT JOIN Enrollments AS En ON Sub.SubjectID = En.CourseID;

-- Question 1: Which students and professors are associated with sections, and which are not?

-- Question 2: What are the grades and subjects, including subjects or grades that are unmatched?

SELECT Sub.SubjectName, 
       G.Grade
FROM Subjects Sub
Full OUTER JOIN Grades G ON Sub.SubjectID = G.SubjectID;

-- Question 3: Which students and sections are related, and which are not, in the overall assignment of sections?
SELECT S.SectionName, 
       Stud.FirstName
FROM Sections Sec
LEFT JOIN Subjects Sub ON Sec.SectionID = Sub.SectionID 
LEFT JOIN Enrollments En ON Sub.SubjectID = En.CourseID 
LEFT JOIN Students Stud ON En.StudentID = Stud.StudentID;

-- Sub-Query (Nested Query) with WHERE, HAVING and FROM (Inline View) clauses 

-- Question: Which students are in sections with a capacity greater than 30?
SELECT Stud.FirstName,
       Stud.LastName
FROM Students Stud
INNER JOIN Enrollments En ON Stud.StudentID = En.StudentID
INNER JOIN Courses C ON En.CourseID = C.CourseID
INNER JOIN CourseSubjects CS ON C.CourseID = CS.CourseID
INNER JOIN Subjects Sub ON CS.SubjectID = Sub.SubjectID
INNER JOIN Sections Sec ON Sub.SectionID = Sec.SectionID
WHERE (Sec.Capacity > 30);

-- Question: Which subjects have an average grade of 'A' across all students?
SELECT Sub.SubjectName
FROM Subjects Sub
INNER JOIN Grades G ON Sub.SubjectID = G.SubjectID
GROUP BY Sub.SubjectName
HAVING AVG(G.Grade) = 4.0; -- 'A' → 4.0

-- Question: What is the average grade count for each section?
SELECT Sec.SectionName,
      AVG(G.Grade) AverageGrade
FROM Sections Sec
INNER JOIN Subjects Sub ON Sec.SectionID = Sub.SectionID
INNER JOIN Grades G ON Sub.SubjectID = G.SubjectID
GROUP BY Sec.SectionName;

-- UNION and UNION ALL
-- Question: Retrieve a list of all unique student names and professor names in the faculty.

SELECT DISTINCT StudentName Stud_Name
FROM Students
UNION
SELECT DISTINCT ProfessorName Prof_Name
FROM Professors;

-- Question: Retrieve a list of all student names and professor names, including duplicates.

SELECT StudentName Stud_Name
FROM Students
UNION
SELECT ProfessorName Prof_Name
FROM Professors;

-- Aggregate Functions (COUNT , SUM , MAX, MIN and AVG)
-- Question: How many students are there in the Students table?
SELECT COUNT(*) TotalStudents
FROM Students;
-- Question: How many sections exist in the Sections table?
SELECT COUNT(*) TotalSections
FROM Sections;
-- Question: How many grades are recorded in the Grades table?
SELECT COUNT(*) TotalGrades
FROM Grades;
-- Question: What is the total capacity of all sections combined?
SELECT SUM(Capacity)TotalCapacity
FROM Sections;
-- Question: What is the total number of credits for all subjects?
SELECT SUM(Credits) TotalCredits
FROM Subjects;
-- Question: What is the total number of seats occupied (calculated as Grades recorded)?
–checking number of enrollments
SELECT COUNT(*) TotalOccupiedSeats
FROM Enrollments;
-- Question: What is the highest capacity of any section?
SELECT MAX(Capacity) HighestCapacity
FROM Sections;
-- Question: What is the maximum number of credits offered by any subject?
SELECT MAX(Credits) HighestCredits
FROM Subjects;
-- Question: What is the most recent birth year among students?
SELECT YEAR(MAX(Birthdate))MostRecentBirthYear
FROM Students;
-- Question: What is the smallest section capacity?
SELECT Min(Capacity) LowestCapacity
FROM Sections;
-- Question: What is the earliest birth year among students?
SELECT YEAR(Min(Birthdate)) EarliestBirthYear
FROM Students;
-- Question: What is the smallest number of credits assigned to any subject?
SELECT Min(Credits) LowestCredits
FROM Subjects;
-- Question: What is the average capacity of all sections?
SELECT AVG(Capacity) AvgCapacity
FROM Sections;
-- Question: What is the average number of credits across all subjects?
SELECT AVG(Credits) AvgCredits
FROM Sections;
-- Question: What is the average age of students (assuming 'BirthDate' can be used for calculations)?
SELECT AVG(DATEDIFF(YEAR, BirthDate, GETDATE()))AvgAge
FROM Students;
-- Question: What is the average length of first names of professors?
SELECT AVG(LEN(FirstName))AvgFirstNameLength
FROM Professors;
-- Question: What is the rounded average capacity of all sections to the nearest whole number?
--ROUND(..., 0) rounds the average to the nearest whole number
SELECT ROUND(AVG(Capacity), 0) RoundedAvgCapacity
FROM Sections;
-- Question: What is the ceiling value of the average number of credits across all subjects?
SELECT CEILING(AVG(Credits)) CeilingAvgCredits
FROM Subjects;
-- GROUP BY with and without HAVING clause
-- Question: What is the total capacity for each section?
SELECT SectionName, SUM(Capacity) TotalCapacity
FROM Sections
GROUP BY SectionName;
-- Question: What is the average number of credits for each department offering subjects?
SELECT Department, AVG(Credits) AvgCredits
FROM Subjects
GROUP BY Department;
-- Question: What is the total capacity for sections where the total capacity exceeds 50?
SELECT SectionName, SUM(Capacity) TotalCapacity
FROM Sections
GROUP BY SectionName
HAVING SUM(Capacity) > 50;
-- Question: Which departments have an average number of credits greater than 3 for their subjects?
SELECT Department, AVG(Credits) AvgCredits
FROM Subjects
GROUP BY Department
HAVING AVG(Credits) > 3;
-- Question: Which departments have more than 3 subjects?
SELECT Department, COUNT(*) SubjectCount
FROM Subjects
GROUP BY Department
HAVING COUNT(*) > 3;
-- Question: What is the maximum capacity of sections grouped by section name where the maximum capacity is greater than 50?
SELECT SectionName, MAX(Capacity) MaxCapacity
FROM Sections
GROUP BY SectionName
HAVING MAX(Capacity) > 50;
-- Question: Which subjects have a minimum grade below 'B' in their grades?
SELECT SubjectName
FROM Grades
GROUP BY SubjectName
HAVING MIN(Grade) < 'B';
-- Question: What is the total credits for each department where the total credits exceed 10?
SELECT Department, SUM(Credits) TotalCredits
FROM Subjects
GROUP BY Department
HAVING SUM(Credits) > 10;
-- Question: Which sections have an average capacity above 40?
SELECT SectionName, AVG(Capacity) AvgCapacity
FROM Sections
GROUP BY SectionName
HAVING AVG(Capacity) > 40;
-- Question: Count distinct grades per subject where the count is greater than 2.
SELECT SubjectName, COUNT(DISTINCT Grade) DistinctGradeCount
FROM Grades
GROUP BY SubjectName
HAVING COUNT(DISTINCT Grade) > 2;


