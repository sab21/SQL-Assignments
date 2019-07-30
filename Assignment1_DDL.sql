-----------------------------
--ctrl k c - shortcut to make a line into comment or --
--ctrl k u for uncomment
----Alt f1 to see the table structure



-----F5 OR	Execute for execution
-----------------q1----------
create database sabie



--DDL Assignment Please write SQL queries/commands for the following:
 --1. Create a Company database. 
 --2. Create department table with column names as follows: 
	--Column name Data type Constraint deptid int Primary key dname varchar(20) not null 
	--location varchar(20) not null 
 --3. Create employee table with column names as follows: 
	--Column name Data type Constraint empid int Primary key ename varchar(20) not null 
	--dob (date of birth) date salary float not null designation varchar(20) not null 
	--doj (date of join) date project varchar(20) manager varchar(20) mgrid int deptid int 
	--dname varchar(20) 4. Add column dept_head to department table, specify data type as varchar(15), 
	--constraint as Not Null. 
 --5. Change the data type of mgr_id from int to Varchar(15) 
 --6. Write the Syntax for DROP and TRUNCATE Command. 
 --7. What is the difference between DROP and TRUNCATE. 
 --8. What will happen if a column has UNIQUE KEY constraint?

--use database sabie
---------q2------------------
create table department
(deptid int Primary key,
 dname varchar(20) not null,
 location varchar(20) not null)

  select * from department

  sp_help department1
  -------------q3-------------------
  create table emp
  (empid int Primary key,
   ename varchar(20) not null,
   dob date,
   salary float not null,
   designation varchar(20) not null,
   doj date ,
   project varchar(20),
   manager varchar(20) ,
   mgrid int,
   deptid int ,
   dname varchar(20)
	)

-------------Q4------------------
	alter table department 
	add dept_head varchar (15) not null

	select *from department

--------------Q5------------------
alter table emp alter column mgrid varchar	(15)  

-----------------Q6-----------------
drop department1

truncate emp 
-----------------q7-----------------
-- drop will eliminate the whole table from data base whereas 
--truncate will only erase the records of the that table keeping the structure of the table intact.


------------Q8----------------------
-- Unique key constarint means the data in that field should be unique means there is no duplicate value.


