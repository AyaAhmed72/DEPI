--DCL part
--create user to be able to grant, revoke him
-- pass has to be in single quotation
--CREATE LOGIN TempUser WITH PASSWORD = '1a_A23456789';
--determine database name (instead of master)
--USE foe_db;
--create user in this db
--CREATE USER FOE_TEMP_USER FOR LOGIN TempUser;

--select from subjects table
--GRANT SELECT ON Subjects TO FOE_TEMP_USER;

--REVOKE SELECT ON Subjects FROM FOE_TEMP_USER;
--END of DCL

--TCL (use DML commands)
--savepoint not working in Microsoft SQL
--COMMIT, ROLLBACK only
--BEGIN TRANSACTION;
--DML Command
--INSERT INTO Grades (StudentID, SubjectID, Grade)
--VALUES (1, 10, 'A');
--COMMIT;

--BEGIN TRANSACTION;
--not in the storage in the DBMS only
--DELETE FROM Grades WHERE GradeID = 15;
--ROLLBACK;

--no rollback -->sm3t in the storage
--DELETE FROM Grades WHERE GradeID = 15;

--BEGIN TRANSACTION;
--DELETE FROM Grades WHERE GradeID = 16;
--SELECT GradeID FROM Grades;
--ROLLBACK; --16 is there bec we do rollback ("undo")

--Another way than ERD -->schema diagram
--in schema diagram if sth underline --> pk
--if two underlined --> composite keys (look at them together)
--SELECT DISTINCT ProfessorID
--FROM Subjects

--CREATE TABLE ProfessorSubjects(
--	ProfessorID INT NOT NULL,
--	SubjectID INT NOT NULL,
--composite keys
--	PRIMARY KEY (ProfessorID, SubjectID),
--	FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID), 
--	FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
--);

--New session
-- Question: Retrieve all male students.
--*="all" can determine some col names select col1, col2, col3
--SELECT *
--FROM Students
--WHERE Gender = 'M'; --> semi colon indicates end of select statement

-- Question: Retrieve all subjects that have 
--    more than 3 credits.
SELECT *
FROM Subjects
WHERE Credits > 3;

-- Question: Retrieve all sections with a 
-- capacity of 30 or more students.
SELECT *
FROM Sections
WHERE Capacity >= 30;

-- Question: Retrieve all grades with GradeID
--   less than 3.
SELECT *
FROM Grades
WHERE GradeID < 3;

-- Question: Retrieve all students born on 
--   or before January 1, 2002.
SELECT *
FROM Students
WHERE BirthDate <= '2002-01-01';

-- Question: Retrieve all professors who are
--   not in the Physics department.
SELECT * 
FROM Professors
WHERE Department <> 'Physics'; --> not equal <>

-- Question: Retrieve all students born 
--   between January 1, 2003, and 
--     December 31, 2005.
SELECT *
FROM Students
WHERE BirthDate BETWEEN '2003-01-01' AND '2005-12-31';

-- Question: Retrieve all professors who are
--   in the Math, Computer Science, or 
--     Engineering departments.
SELECT *
FROM Professors
--gives prof of cs only
WHERE Department IN ('Math', 'Computer Science', 'Engineering');

-- Question: Retrieve all subjects with credits 
--   greater than or equal to the capacity of 
--   all sections.
SELECT *
FROM Subjects
WHERE Credits >= ALL (SELECT Capacity / 10 AS cap2 FROM Sections);


-- Question: Retrieve all professors whose first name
--   starts with "A" and is followed by exactly 4 
--   characters.
SELECT *
FROM Professors
-- underscore is for the char, % for the num 
WHERE FirstName LIKE 'A____';

-- Question: Retrieve all students whose email 
--    address ends with "@gmail.com".
SELECT *
FROM Students
WHERE Email LIKE '%@gmail.com';

-- Question: Retrieve all male students born after
--   January 1, 2000.
SELECT *
FROM Students
WHERE Gender = 'M' AND BirthDate > '2000-01-01';

-- Question: Retrieve all sections with a capacity
-- of less than 30 or greater than 100.
SELECT *
FROM Sections
WHERE Capacity < 30 
	OR Capacity > 100;

-- Question: Retrieve all professors 
--   not in the Computer Science department.
SELECT *
FROM Professors
--NOT used when there is more than one condition
--in this specific instance, can use <> instead of NOT ... =
WHERE NOT Department = 'Computer Science'

-- Question: Retrieve all students born after 
--   January 1, 2000, who are either male 
--   or do not have a Gmail email address.
SELECT *
FROM Students
WHERE BirthDate > '2000-01-01'
	AND (Gender = 'M' OR NOT Email LIKE '%gmail.com');

-- Question: Retrieve the name of each subject 
--   and add 2 to its credits.
SELECT SubjectName,
		Credits + 2 AS Adjusted_Credits
FROM Subjects;


-- Question: Retrieve the name of each section 
-- and subtract 10 from its capacity.
SELECT SectionName,
		Capacity - 10 AS RemainingCapacity
FROM Sections;


-- Question: Retrieve the name of each section 
--   and double its capacity.
SELECT SectionName,
		Capacity * 2 AS DoubledCapacity
FROM Sections;

-- Question: Retrieve the name of each section 
--   and divide its capacity by 5 to form teams of 5.
SELECT SectionName,
		Capacity / 5 AS TeamsOfFive
FROM Sections;

-- Question: Retrieve the name of sections where 
--   the capacity is odd, along with the remainder 
--   when divided by 2.
SELECT SectionName,
		Capacity % 2 AS Remainder
FROM Sections
WHERE Capacity % 2 = 1;


-- Question: Retrieve the name of each section and 
-- calculate its adjusted capacity by 
--  subtracting 10 and doubling the result.
SELECT SectionName,
--order of capacity take it into consideration
		(Capacity - 10) * 2 AS AdjectedCapacity
FROM Sections;


-- Question: Retrieve the first name, last name, 
--   and current age of each student.
SELECT FirstName, LastName,
--differenve of birthdate and date of today w.r.t the year
		DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Students


-- Question: Retrieve the name of sections where 
-- doubling the capacity results in a value greater 
--  than 70.
SELECT SectionName,
		Capacity * 2 AS DoubledCapacity
FROM Sections
WHERE Capacity * 2 > 70;

