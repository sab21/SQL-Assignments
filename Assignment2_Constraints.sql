--department --alt f1 for 

----Constraint Assignments

--Please write SQL queries/commands for the following: 
--1. Why do we use Constraints? 
--2. Create Security table with column names as follows: 
--Column name Data type Constraint Scty_code Varchar(10) Primary Key 
--Sec_name Varchar(10) Not Null Company Varchar(20) Not Null Tin_Number Varchar(12) Unique
-- Sedol_code int Head_office Varchar(15) Not Null Date_inc Date CHECK Date_inc > ’01-Jan-1850’ 
--3. Create SCTY_PRICE table with column names as follows: 
-- Column name Data type Constraint Sec_id Varchar(10) Foreign Key (Referencing Scty_code of Security Table) 
-- Prc_date Date Not Null Mkt_Price float Not Null Currency Varchar(10) Not Null Pricing_factor float Default 
--4. Add Not Null constraint to Sedol_code column of Security Table. 
--5. Add Default Constraint (Default value should be 1) to Pricing_factor column of SCTY_Price table.
--6. What is a PRIMARY KEY Constraint? Explain how to add a PRIMARY KEY constraint to an 
--existing column of a table by taking an example. 
--7. What is the difference between UNIQUE and PRIMARY KEY Constraint. 
--8. What is a FOREIGN KEY Constraint? Explain how to add a FOREIGN KEY constraint to an 
--existing column of a table by taking an example. 
--9. What is a CHECK Constraint? Explain how to add a CHECK constraint to an 
--existing column of a table by taking an example. 
--10. What is a DEFAULT Constraint? Explain how to add a DEFAULT constraint to an 
--existing column of a table by taking an example.
-----------------Question 1------------------

--Constraints are rules and regulation in SQl which help us in maintaining data integrity of our 
--table so that only proper and valid data can be recorded into it.


---------------------------question 2---------------

create table Security_Table
(
	Scty_code Varchar(10) Primary Key,
	Sec_name Varchar(10) Not Null,
	Company Varchar(20) Not Null,
	Tin_Number Varchar(12) Unique ,
	Sedol_code int ,
	Head_office Varchar(15) Not Null,
	Date_inc Date CHECK (Date_inc> '01-Jan-1850')
)

--alter table Security_Table
--alter column date_inc date check (Date_inc> '01-Jan-2015')
--if there is already a constraint can we modify of drop constraint???


----------------------Q3------------------------
create table scty_price(
	Sec_id Varchar(10) Foreign Key References Security_Table (Scty_code),
	Prc_date Date Not Null,
	Mkt_Price float Not Null ,
	Currency Varchar(10) Not Null,
	Pricing_factor float
)



----------------------Q4----------------------------
alter table security_table alter column sedol_code  int not null


--------------------Q5-------------------------------


alter table SCTY_price
add constraint DF_SCTY_Price_Pricing_Factor 
default 1 for pricing_factor


-------------------------Q6------------------------
--Primary Key can be considered as identifier of the table. The column under PK constarint 
--cannot be NULL and should be distinct,and Only one PK is allowed per table,
--so the value there can be used to identify the row.

-------------example of Q6
--Lets create a Student table with student id name age branch branch id FY and then add PK to student id later

create table student
(
	student_id int,
	student_name varchar(15) not null,
	age int,
	branch_name varchar(12) not null,
	branch_id int not null,
	yoj int ---year of joining
)		
---add constraint to student id
alter table student add constraint PK_student_student_id Primary key (student_id)
--In first go it wont take as the student id in student can take null values
-- so 1st we have to make it as not null

alter table student alter column student_id int not null
alter table student add constraint PK_student_student_id Primary key (student_id)
--now the PK constarint has been added to student id


------------------Q7---------------------------
--Difference between					 Unique			and					Primary Key
--						It can take null Values						whereas it wont take null values

--						multiple unique constarint					Only ONE PK constarint can be given 
--						can be added in a table						per table

---------------Q8----------------------------------

--Foreign Key  in a secondary table can be understood as reference key which detects data from the the record
--to which it reffered in primary table 
--It will restrict user to enter just any value in the FK column. The data entered in FK will first verify
--its presence in its reference in primary table and then it will allow.
--It can be null and multiple FK can be added to one table.
--FK and PK both can present in one table also

----Example
alter table student drop column branch_name
-----------Creating another table branch name and the add constraint FK to branch id in student table
create table branch
(
	branch_id int primary key,
	branch_name varchar (20) not null,
	faculty_name varchar(10) not null,
	fee_id int not null unique
)

alter table student
add constraint FK_student_branch_branch_id foreign key (branch_id)
references branch (branch_id) 
--its not necessary that the name of column in both table should be same but the datatype must be same

----another example
create table fees(
fee_num int primary key,
currency varchar (5),
fee_amount float
)

alter table branch 
add constraint FK_fee_branch_fee_id foreign key (fee_id)
references fees (fee_num)


----Question 9 
--Check constraint is used to validate data logically. 
--here a condition is put while defining column, if the data doesnot meet the condition then
--the data is rejected.

---example
alter table fees 
add constraint CQ_fee_currency Check (currency='INR'or currency = 'USD' or currency ='EURO' )

alter table student 
add constraint CQ_student_yoj_age check (age>=17 & yoj >= '2009/04/20' )--NOT RUNNING


alter table student 
add constraint CQ_student_yoj_age check (age>=17 )

alter table student 
add constraint CQ_student_age_50 check (age<50 )

alter table student 
add constraint CQ_student_yoj check ( yoj >= '2009/04/20' )


--------------Q10------------------
--Default constraint is used to take pre defined default value instead of null

alter table fees
add constraint DF_fee_Amount default 100000 for fee_amount


alter table branch
add constraint DF_branch_Faculty default 'NOT ASSIGNED' for faculty_name