--Assignment Questions:

--1.	Basic SQL Queries:
-- Write a SQL query to retrieve all columns from a table named employees.
-- Write a SQL query to retrieve the emp_id, emp_name, and dept_id from the employees table, where the location is 'Cairo'.
--2.	DISTINCT Keyword:
--	Write a SQL query that displays distinct dept_id values from the employees table.
--3.	Data Definition Language (DDL):
----	Write a SQL query to create a table students with the following columns: ID (Primary Key), First_Name (not null), Last_Name (default 'Unknown'), Address (default 'N/A'), City (default 'N/A'), and Birth_Date.
----	Write a SQL query to drop the students table.
--4.	Data Manipulation Language (DML):
--	Write a SQL query to insert the following values into the students table: ('Ahmed', 'Ali', 'Downtown', 'Cairo', '1995-01-01').
--	Write a SQL query to update the Address of the student with Last_Name = 'Ahmed' to 'Garden City'.
--5.	Transaction Control:
--Write a SQL query to delete the rows from the students table where City is 'Cairo', and then rollback the transaction.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Assignment Solution:

--Create a database to switch to it (instead of working on master)
--CREATE DATABASE Aya;
--Go
--USE Aya; --change master to Aya
--Go

--CREATE TABLE employees(
--     emp_id INT PRIMARY KEY IDENTITY(1, 1),
--	   emp_name NVARCHAR(50),
--	   dept_id INT,
--	   location NVARCHAR(50)
--);
--Part 1
-- Write a SQL query to retrieve all columns from a table named employees.
--SELECT * --*=ALL
--FROM employees;

--INSERT INTO employees (emp_name, dept_id, location)
--VALUES
--('Ali', 1, 'Cairo'),
--('Ahmed', 2, 'Aswan');

-- Write a SQL query to retrieve the emp_id, emp_name, and dept_id from the employees table, where the location is 'Cairo'.
--SELECT *
--FROM employees
--WHERE location='Cairo';

--Part 2
----	Write a SQL query that displays distinct dept_id values from the employees table.
--SELECT DISTINCT dept_id
--FROM employees;

--Part 3
--	Write a SQL query to create a table students with: ID (Primary Key), First_Name (not null), Last_Name (default 'Unknown'), Address (default 'N/A'), City (default 'N/A'), and Birth_Date.
--CREATE TABLE students (
--    ID INT PRIMARY KEY IDENTITY(1, 1),
--    First_Name NVARCHAR(50) NOT NULL,
--    Last_Name NVARCHAR(50) DEFAULT 'Unknown',
--    Address NVARCHAR(100) DEFAULT 'N/A',
--    City NVARCHAR(50) DEFAULT 'N/A',
--    Birth_Date DATE
--);

--	Write a SQL query to drop the students table.
--DROP TABLE students;

--Part 4
--CREATE TABLE students (
--    ID INT PRIMARY KEY IDENTITY(1, 1),
--    First_Name NVARCHAR(50) NOT NULL,
--    Last_Name NVARCHAR(50) DEFAULT 'Unknown',
--    Address NVARCHAR(100) DEFAULT 'N/A',
--    City NVARCHAR(50) DEFAULT 'N/A',
--    Birth_Date DATE
--);
--	Write a SQL query to insert the following values into the students table: ('Ahmed', 'Ali', 'Downtown', 'Cairo', '1995-01-01').
--INSERT INTO students (First_Name, Last_Name, Address, City, Birth_Date)
--VALUES
--('Ahmed', 'Ali', 'Downtown', 'Cairo', '1995-01-01');

--	Write a SQL query to update the Address of the student with Last_Name = 'Ahmed' to 'Garden City'.
-- I will make it First_name='Ahmed' bec I have a student with firstname Ahmed not the last
--UPDATE students
--SET Address = 'Garden City'
--WHERE First_Name = 'Ahmed'; --constraint

--Part 5
--Write a SQL query to delete the rows from the students table where City is 'Cairo', and then rollback the transaction.
--BEGIN TRANSACTION
--DELETE FROM students WHERE City = 'Cairo';
--ROLLBACK;