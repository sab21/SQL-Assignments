--Contact us @ +91-9741267715/+91-9535539214 Page 1
--Data Manipulation Assignment Please write SQL queries/commands for the following: 
--1. Create Scty_Tran table with column names as follows: Column name Data type Constraint Scty_code Varchar(10) Not Null Tran_id Varchar(10) Not Null Trade_date Date Not Null Broker Varchar(15) Entry_date Date Not Null 
--2. Insert 10 Records in Security, Scty_Price and Scty_Tran Tables. 
--3. Perform Select Statement on all 3 tables. 
--4. Select first 3 records from Security Table. 
--5. Select those records from Security Table for which following condition is matched:
--I. Scty_code is equal to HCL205
--II. Date_inc is greater than 31st December 1994
--III. Sedol_code is from 180000 to 199999
--IV. Head_office is present in Kolkata, Delhi and Bangalore
--V. Head_office is not present in Kolkata, Delhi and Bangalore
--VI. Scty_code starts with H
--VII. Sec_Name ends with C
--VIII. Scty_code has C in it
--IX. Sec_Name has i in it
--X. Sec_Name has i as second character in it
--Contact us @ +91-9741267715/+91-9535539214 Page 2
--XI. Sec_Name has i has second last character in it
--XII. Start with any of A to K and has C as second character
--XIII. Start with other than A to K and has C as second character
--6. Select those records from Scty_Price Table for which following condition is matched:
--I. Calculate New Market Price as 10% increase in the existing Market Price
--7. Update Scty_code in Scty_tran Table whose Broker is ICICI, change Scty_code to ICICI201 
--8. Update Tran_id in Scty_tran Table whose Scty_code is HCL205 and Trade_date is 
--18-07-2013, Change Tran_id to 197643 9. Delete record from Scty_Price Table whose currency is PKR,
-- use commit to make the change permanent. 10. Delete record from Scty_Tran Table where entry_date is 
-- from 01-Jun-2012 to 31-Jul-2013, use rollback to revert back the changes. 11. What is the difference between
--  Delete and Truncate. Show this with the help of an example.
security_table
scty_price

-- Q1
create table scty_tran (
	Scty_code Varchar(10) Not Null ,
	Tran_id Varchar(10) Not Null,
	Trade_date Date Not Null ,
	Broker Varchar(15) ,
	Entry_date Date Not Null
	)

--Q2
insert into Security_Table
Select 'ICIC201', 'ICICI', 'ICICI Bank', 'MA304IC', 247382, 'Mumbai', '04/25/1989'
union select 'HDFC305', 'HDFC', 'HDFC Bank', 'K0102HD', 543917, 'kolkata', '06/07/1991'
union select 'HUL109', 'HUL', 'HUL Ltd', 'k0197HL', 189732, 'kolkata', '01/01/1995'
union select 'Ran208', 'Ranbaxy', 'Ranbaxy Ltd', 'HY249Ra', 547892, 'Hyderabad', '07/25/1999'
union select 'HCL205', 'HCL', 'HCL Tech Ltd', 'DL203HC', 184732, 'Delhi', '08/10/1999'
union select 'Inf409', 'Infosys', 'Infosys Ltd', 'PU305IF', 187934, 'Pune', '02/15/1981'
union select 'TCS103', 'TCS', 'Tcs Ltd', 'MU108TC', 198463, 'Mumbai', '09/13/2001'
union select 'Mar408', 'Marico', 'Marico Ltd', 'k0103Ma', 154788, 'kolkata', '04/15/1988'
union select 'Inc501', 'India cements', 'India cements Ltd', 'ch503Ic', 189742, 'chennai', '06/18/1995'
union select 'WIP309', 'WIPRO', 'Wipro Tech Ltd', 'BA209WP', 154386, 'Bangalore', '06/19/1987'

--alter table security_table 
--alter column sec_name varchar (20) not null

insert into scty_price
Select 'HCL205', '07/17/2013', 487.39, 'INR', 1
union select 'HDFC305', '07/15/2013', 1187.15, 'INR', 1
union select 'HUL109', '03/23/2013', 20, 'USD', 100
union select 'ICIC201', '06/24/2012', 50, 'GBP', 150
union select 'INC501', '01/10/2011', 15, 'SGD', 50
union select 'INF409', '04/01/2012', 25, 'USD', 100
union select 'Mar408', '07/05/2009', 1257.39, 'PKR', 0.7
union select 'Ran208', '05/11/2008', 112, 'CHF', 80
union select 'TCS103', '09/08/2007', 114, 'AUD', 90
union select 'WIP309', '10/05/2008', 120, 'AUD', 90


insert into scty_tran
Select 'HCL205', 'II207', '07/18/2013', 'IIFL', '07/18/2013'
union select 'HDFC305', 'II109', '07/17/2013', 'IIFL', '07/19/2013'
union select 'HUL109', 'HD305', '03/29/2013', 'HDFC', '03/29/2013'
union select 'ICIC201', 'IC409', '06/27/2012', 'ICICI', '06/27/2012'
union select 'Inc501', 'RM308', '01/15/2011', 'Rmoney', '01/16/2011'
union select 'Inf409', 'Re107', '01/05/2013', 'Religare', '01/05/2013'
union select 'Mar408', 'HD507', '07/07/2009', 'HDFC', '07/08/2009'
union select 'Ran208', 'sk308', '05/15/2008', 'Sharekhan', '05/16/2008'
union select 'Tcs103', 'RM305', '09/10/2007', 'Rmoney', '09/11/2007'
union select 'WIP309', 'AX508', '10/08/2008', 'Axis', '10/08/2008'


--Q3
select * from Security_Table
select * from scty_price
select * from scty_tran


--Q4
select top 3 * from Security_Table

--Q5
--i
select * from security_table where Scty_code = 'HCL205'
--ii
select * from Security_Table where Date_inc > '12/31/1994'
--iii
select * from Security_Table where  Sedol_code between 180000 and 199999
--iv
select * from Security_Table where Head_office in ('Kolkata', 'Delhi', 'Bangalore')
--v
select * from Security_Table where Head_office not in ('Kolkata', 'Delhi', 'Bangalore')
--vi
select * from Security_Table where Scty_code like 'h%'
--vii
select * from Security_Table where Sec_Name like '%C'
--viii
select * from Security_Table where Scty_code like '%c%'
--ix
select * from Security_Table where Sec_name like '%i%'
--x
select * from Security_Table where Sec_name like '_i%'
--xi
select * from Security_Table where Sec_name like '%i_'
--xii
select * from Security_Table where sec_name like '[a-k]c%'
--xiii
select * from Security_Table where sec_name like '[^a-k]c%'


--Q6
select * from scty_price

begin transaction 
update scty_price set Mkt_Price = 1.1*Mkt_Price
select * from scty_price
rollback

--Q7
begin transaction 
update scty_tran set Scty_code = 'ICICI201' where Broker = 'ICICI'
select * from scty_tran
commit

--Q8

begin transaction 
update scty_tran set tran_id = 197643
where scty_code = 'HCL205' AND Entry_date = '2013-07-18'
select * from scty_tran
rollback

--Q9
begin transaction 
select * from scty_price
delete scty_price where currency = 'PKR'
commit


--Q10
select * from scty_tran


begin transaction
delete scty_tran where Entry_date between '2012/06/01' AND '07/31/2013'
rollback


--Q11
--Difference						DELETE					AND						TRUNCATE
--				This command can delete entire records			This command will always remove all the record 
--				as well as selected record						from the table (No facility to remove record
--																as per our wish

--				Remove each one record at a time				Remove all the record at a time

--				This is slower compared to truncate				THIS IS faster 
--				as it checks all the record

--				DML comman										DDL command

--Example

