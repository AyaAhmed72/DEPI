--Write a SQL query to retrieve all employees who were hired within the last 30 days from the current date.
--Instructions:
--1.	Use the SELECT statement to choose all relevant columns from the employees table.
--2.	Utilize a date function such as CURRENT_DATE or GETDATE() depending on your SQL dialect.
--3.	Apply date arithmetic to filter rows where the hire date is within the last 30 days.
--4.	Use the WHERE clause to compare hire dates.

CREATE TABLE Emp1(
   emp_id INT PRIMARY KEY IDENTITY(1, 1),
   FirstName NVARCHAR(50),
   last_name NVARCHAR(50),
   Department NVARCHAR(100),
   Email NVARCHAR(100) UNIQUE,
   managerID INT,
   salary INT,
   departmentID INT,
   HiringDate DATE
);

INSERT INTO Emp1 (FirstName, last_name, Department, Email, managerID, salary, departmentID, HiringDate)
VALUES 
('John', 'Doe', 'HR', 'john.doe@example.com', NULL, 60000, 1, '2020-01-15'),
('Jane', 'Smith', 'Finance', 'jane.smith@example.com', NULL, 75000, 2, '2019-05-20'),
('Robert', 'Brown', 'IT', 'robert.brown@example.com', 1, 80000, 3, '2018-03-30'),
('Emily', 'Davis', 'Marketing', 'emily.davis@example.com', 2, 55000, 4, '2021-10-10'),
('Michael', 'Wilson', 'HR', 'michael.wilson@example.com', 1, 62000, 1, '2023-01-01'),
('Sarah', 'Taylor', 'Finance', 'sarah.taylor@example.com', 2, 78000, 2, '2020-12-25'),
('Daniel', 'Moore', 'IT', 'daniel.moore@example.com', 3, 90000, 3, '2017-11-15');

SELECT emp_id,
       FirstName,
	   Department
FROM Emp1
WHERE DATEDIFF(DAY,DAY(HiringDate), GETDATE())<=30;

--Create a stored procedure named sp_get_employee_hours that retrieves the first name, last name, and total hours worked on projects for a given employee ID.
--Instructions:
--1.	Define the stored procedure using the CREATE PROCEDURE statement.
--2.	Include a parameter for the employee ID (emp_id).
--3.	Use a SELECT statement to fetch the required columns (fname, lname, total_hours) from the employees and works_on tables.
--4.	Join the tables on the appropriate keys (e.g., SSN = ESSN).
--5.	Sum the hours worked using the SUM() function and group by employee details.

CREATE TABLE works_on (
    ESSN INT, 
    Project_ID INT, 
    hours INT, 
    PRIMARY KEY (ESSN, Project_ID), -- Composite primary key
    FOREIGN KEY (ESSN) REFERENCES Emp1(emp_id)
);

CREATE PROCEDURE sp_get_employee_hours 
    @emp_id INT 
AS
BEGIN
    SELECT e.FirstName AS fname,
           e.last_name AS lname,
           SUM(w.hours) AS total_hours
    FROM Emp1 e 
    JOIN works_on w ON e.emp_id = w.ESSN 
    WHERE e.emp_id = @emp_id 
    GROUP BY e.FirstName, e.last_name; 
END;
EXEC sp_get_employee_hours @emp_id = 1; 

----Create a stored procedure named sp_department_employee_count that retrieves the department ID, department name, and the number of employees in each department, but only for departments with more than 5 employees.
----Instructions:
----1.	Define the stored procedure using the CREATE PROCEDURE statement.
----2.	Use a SELECT statement to fetch the department ID, department name, and count of employees.
----3.	Use a JOIN to connect the departments and employees tables on the department ID.
----4.	Use the GROUP BY clause to group results by department.
----5.	Apply the HAVING clause to filter departments with more than 5 employees.

CREATE PROCEDURE sp_department_employee_count
AS
BEGIN
    SELECT d.departmentID, 
	       d.name AS DepartmentName,
           COUNT(e.emp_id) AS employee_count  
    FROM Emp1 e  
    JOIN Department1 d ON e.departmentID = d.departmentID  
    GROUP BY d.departmentID, d.name  
    HAVING COUNT(e.emp_id) > 5;  
END;
EXEC sp_department_employee_count;
