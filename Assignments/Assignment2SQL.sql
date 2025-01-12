--Question: Write a SQL query to retrieve the emp_id, last_name,
--and salary of employees whose salary is between 2,000 and 5,000 and do not have a manager ID of 101 or 200.

--Instructions:
--1. Use the SELECT statement to specify the columns: emp_id, last_name, and salary.
--2. Filter the results using the WHERE clause with the BETWEEN operator to set the salary range.
--3. Use the NOT IN clause to exclude certain manager IDs.
--4. Combine conditions using the AND logical operator.

--Switch to Aya database --> for the assignments (instead of Master)
CREATE TABLE employer(
   emp_id INT PRIMARY KEY IDENTITY(1, 1),
   FirstName NVARCHAR(50),
   last_name NVARCHAR(50),
   Department NVARCHAR(100),
   Email NVARCHAR(100) UNIQUE,
   managerID INT,
   salary INT,
   departmentID INT
);
SELECT emp_id, 
       last_name, 
       salary
FROM employer e
WHERE salary BETWEEN 2000 AND 5000
  AND managerID NOT IN (101, 200);

--Use aliases for table names for better readability.

--Instructions:
--1. Use the SELECT statement to specify the columns: employee.name and department.name.
--2. Use the FROM clause to include the tables employees and departments.
--3. Use an INNER JOIN to connect the employees and departments tables based on the department IDs.
--4. Use table aliases (e.g., e for employees, d for departments) to shorten the table names in the query.
--5. Order the results by department name in ascending order.

CREATE TABLE Department1(
   departmentID INT PRIMARY KEY IDENTITY(1, 1),
   name NVARCHAR(50),
   managerID INT
);
SELECT E.FirstName,
       D.name 
FROM employer E
INNER JOIN Department1 D ON E.departmentID=D.departmentID
ORDER BY D.name ASC;

--Write a SQL query to find the number of employees and the average salary for each department. Ensure that the results are grouped by department ID.

--Instructions:
--1.	Use the SELECT statement to specify the department ID, the count of employees, and the average salary.
--2.	Use the GROUP BY clause to group the results by department ID.
--3.	Use the COUNT() function to find the number of employees in each department.
--4.	Use the AVG() function to calculate the average salary in each department.

SELECT departmentID,
       MAX(emp_id) AS Employees_Count,
	   AVG(salary) AS AVGSalary
FROM employer 
GROUP BY departmentID;