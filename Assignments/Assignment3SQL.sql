--Create a simple view named vw_employee_details that displays the first name, last name, and department name of employees.
--Instructions:
--1.	Use the CREATE VIEW statement to define a new view.
--2.	Select the columns fname, lname, and dname (department name) from the appropriate tables.
--3.	Use JOIN to connect the employees and departments tables using the department ID.

CREATE VIEW vw_employee_details AS
SELECT E.FirstName, 
       E.last_name, 
	   E.Department
FROM employer E
JOIN Department1 D ON E.departmentID = D.departmentID ;

--Modify the existing view vw_work_hrs to only include employees working in department number 5.
--Instructions:
--1.	Use the CREATE OR REPLACE VIEW statement to update the view.
--2.	Filter the results using the WHERE clause to include only employees with department number 5.
--3.	Ensure that the columns selected are fname, lname, pname, and hours.
--Msg 102, Level 15, State 1, Line 20 Incorrect syntax near 'REPLACE'.
--CREATE OR REPLACE VIEW vw_employee_details AS
--ALTER TABLE employer
--ADD pname VARCHAR(100),   
--    hours INT;            
--CREATE VIEW vw_employee_details AS
--SELECT E.FirstName AS fname, 
--       E.last_name AS lname,
--	     E.pname AS pname, 
--       E.hours
--FROM employer E
--JOIN Department1 D ON E.departmentID = D.departmentID
--WHERE E.departmentID = 5;

--Msg 2714, Level 16, State 3, Procedure vw_employee_details, Line 1 [Batch Start Line 24]
--There is already an object named 'vw_employee_details' in the database.

DROP VIEW vw_employee_details;

CREATE VIEW vw_employee_details AS
SELECT E.FirstName AS fname, 
       E.last_name AS lname, 
       E.pname,          -- Project name
       E.hours         -- Hours worked
FROM employer E
JOIN Department1 D ON E.departmentID = D.departmentID
WHERE E.departmentID = 5;

--Create a view named vw_high_status_suppliers to display all suppliers with a status greater than 15, 
--and ensure that any updates or inserts through the view still meet the status condition.
--Instructions:
--1.	Use the CREATE VIEW statement to define the view.
--2.	Include the WITH CHECK OPTION to enforce that all modifications through the view adhere to the condition that status must be greater than 15.
--3.	Use a SELECT statement to pull all columns from the suppliers table.

CREATE TABLE suppliers (
    SupplierID INT PRIMARY KEY identity(1,1),         
    SupplierName VARCHAR(50) NOT NULL, 
    ContactInfo VARCHAR(100),           
    Status INT NOT NULL                 
);

CREATE VIEW vw_high_status_suppliers AS
SELECT *
FROM suppliers
WHERE Status>15
WITH CHECK OPTION;