
-- Create a database and create the table named EMPLOYEE, insert the employee details below and assign a primary key.
create database sql1;

USE SQL1;
CREATE TABLE employees (
    empno INT PRIMARY KEY,
    ename VARCHAR(20) NOT NULL,
    job VARCHAR(20) NOT NULL,
    mgr INT,
    hiredate DATE NOT NULL,
    sal DECIMAL (6,2),
    comm DECIMAL (6,2),
    deptno INT
);

INSERT INTO employees (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES 
(8369, 'SMITH', 'CLERK', 8902, '1990-12-18', 800.00, NULL, 20),
(8499, 'ANYA', 'SALESMAN', 8698, '1991-02-20', 1600.00, 300.00, 30), 
(8521, 'SETH', 'SALESMAN', 8698, '1991-02-22', 1250.00, 500.00, 30), 
(8566, 'MAHADEVAN', 'MANAGER', 8839, '1991-04-02', 2985.00, NULL, 20),
(8654, 'MOMIN', 'SALESMAN', 8698, '1991-09-28', 1250.00, 1400.00, 30),
(8698, 'BINA', 'MANAGER', 8839, '1991-05-01', 2850.00, NULL, 30),
(8882, 'SHIVANSH', 'MANAGER', 8839, '1991-06-09', 2450.00, NULL, 10),
(8888, 'SCOTT', 'ANALYST', 8566, '1992-12-09', 3000.00, NULL, 20),
(8839, 'AMIR', 'PRESIDENT', NULL, '1991-11-18', 5000.00, NULL, 10),
(8844, 'KULDEEP', 'SALESMAN', 8698, '1991-09-08', 1500.00, 0.00, 30);


-- Return only the jobs from the table. List them only once
use sql1;
SELECT DISTINCT ( JOB) FROM employees;

-- Return all records from the table.
SELECT * FROM employees;

-- Return employee name and salary of employees whose salaries are greater than or equal to 2200.
SELECT ename AS 'Employee Name', sal AS 'SALARY'
FROM employees 
WHERE sal >= 2200;

-- Return employee name and salary of those employees who do not have their salary in the range of 2500 to 4000.
SELECT ename AS 'Employee Name', sal AS 'SALARY'
FROM employees 
WHERE sal NOT BETWEEN 2200 AND 4000;

-- Return employee name whose name contains “I” as third character.
SELECT ename AS 'Employee Name'
FROM employees 
WHERE ename like '__I%';

-- Return employee name whose name contains” M” as first and “H” as third character.
SELECT ename as 'Employee Name'
FROM employees
WHERE ename LIKE 'M_H%';

-- Count the number of employees in each department, with the department number along with the employee count.
SELECT deptno AS 'Department Number', COUNT(ename) AS 
'Employees Count Per Department' FROM employees
GROUP BY deptno;

-- Return employee name and hire dates of employees hired after 1991-01-01.
SELECT ename as 'Employee Name', hiredate as 'Date Hired' 
FROM employees
where hiredate> '1991-01-01';

-- Calculate the average salary of all employees.
SELECT AVG(sal) as 'AVERAGE SALARY' FROM employees;

-------------------------------------------------------------------------------------------------
-- Create the following tables and name them student and project respectively.
use sql1;
create table student(
stdid int auto_increment unique not null primary key,
fname varchar (10),
lname varchar (10),
credits int,
dept varchar (10),
gender VARCHAR(1) 
);

insert into student( stdid, fname, lname, credits,dept,gender)
values 
(100 ,'Mary','Copper', '6000','Drama','F'),
(101,'Mike','Carpen', '5000','Maths','M'),
(102 ,'Ryan','Smith', '10000','Drama','M'),
(103 ,'Tom','Randall', '4800','Maths','M'),
(104 ,'Ashley','Brown', '5000','Science','F')
;


create table project(
project_id int auto_increment not null primary key,
stdid int references student,
projectname varchar (50)
);

insert into project(project_id, stdid,projectname)
values 
(1, 100, 'Shakespeare'),
(2, 100, 'Greek Tragedy'),
(3, 100, 'Disaster'),
(4, 101, 'Trigonometry'),
(5, 102 , 'Wizard of Oz'),
(6, 102, 'Creative Dramatics'),
(7, 102, 'Modern Art'),
(8,106 , 'Natural Language Processing'),
(9,104 , 'Gravity')
;

-- Return the project names along with the corresponding student details (first name, last name) for all projects. 
Select projectname as ' Project Name',
	   fname 'First Name', 
       lname as 'Last Name'
from project pro
join student stu
on pro.stdid=stu.stdid;

-- Return the project names and the corresponding student details (first name, last name) for projects assigned to students in the "Maths" department. 
Select projectname as ' Project Name',
	   fname 'First Name', 
       lname as 'Last Name'
from project pro
join student stu
on pro.stdid=stu.stdid
where dept='Maths';

-- Return all students along with the project names (if any) they are assigned to but group by dept
Select projectname as ' Project Name',
	   fname 'First Name', 
       lname as 'Last Name'
from project pro
join student stu
on pro.stdid=stu.stdid
group by dept;

-- Return all students along with the project names (if any) they are assigned to
Select fname as ' First Name',
       lname as 'Last Name',
       projectname as ' Project Name'
from student stu
left join project pro
on stu.stdid=pro.stdid;


-- Return all students and the project names (if any) they are assigned to, but only for the students in the "Drama" department.
select fname as 'First Name',
	   lname as  'Last Name',
       dept  as 'Department',
       projectname as 'Project Name'
from student
left join project
on student.stdid=project.stdid
where dept='Drama';
	
-- Return the total number of projects each student is assigned to, along with their details (first name, last name). 
select fname as 'First Name',
	   lname as 'Last Name',
       count(project_id) as 'Project Count'
from student
left join project
on student.stdid=project.stdid
group by student.stdid;

-- Return all students with the gender “F”, with their total credits 
select stdid as 'Student No',
       fname as ' First Name',
       lname as 'Last Name',
	   credits as 'Credits',
       gender as 'Gender'
from student
where gender='F';

-- Return all students whose last name ends with "pen". 
select stdid as 'Student No',
       fname as ' First Name',
       lname as 'Last Name'
from student
where lname like'%pen';

-- Return the names of students with the gender “M”, with more than 4999 credits, sorted alphabetically by their first names. 
select stdid as 'Student No',
       fname as ' First Name',
       lname as 'Last Name',
       gender as 'Gender'
from student
where gender ='M' and credits > '4999'
Order by fname;

-- Return all students' details and sort them based on their credits in descending order. 
select  *from student
Order by credits desc;

or 


select credits as 'Credits',
       stdid as 'Student ID',
	   fname as 'First Name',
       lname as 'Last Name',
	   dept 'Department',
       gender 'Gender'
from student
Order by credits desc;

