

--Identity Properties Group By Having and Joins Assignment 
--Please write SQL queries/commands for the following and give the suggested output for each query:
--1. Create a table customer with following columns:
--	Column name Data type Constraint Cust_id INT NOT NULL Identity(100,1) Cname Varchar(15) NOT NULL 
--	location Varchar(15) NOT NULL Order_id INT NOT NULL Quantity Float NOT NULL 
--	Price Varchar(15) NOT NULL Insert 3 records in this table

create table cust1(
Cust_id INT NOT NULL Identity(100,1),
 Cname Varchar(15) NOT NULL ,
 location Varchar(15) NOT NULL ,
 Order_id INT NOT NULL ,
 Quantity Float NOT NULL ,
 Price float NOT NULL
 )

 insert into cust1 (Cname, location, Order_id, Quantity, Price)
 values ('Ajay', 'Bangalore',1011,5,1000),
 ('Manisha','Hyderabad',1012,3,12500),
 ('Rajesh', 'Chennai', 1013,2,56980)


 select * from cust1 


--2. What is GROUP BY Clause? When it is used? Explain with the help of Example.
--Group BY is used to group records with each unique value of the column present is this clause. 
--Only aggregate function, summary function and the column which are present in GROUP BY clause 
--are allowed to be listed in select clause

select * from customer

select location, sum(price_paid) as sumof, AVG(price_paid) as avgof, COUNT(location) as cntof from customer group by LOCATION
--here the clause is grouped by location so each record will be grouped by each distinct loacation 
--in select clause we can only put the column which is in group by clause or 
--or aggregate function which will summarize as per each location

--3. What is HAVING Clause? When it is used? Explain with the help of Example.
--Is used to specify conditions on aggregate or summary functions
--Is used to specify conditions or restrictions on columns present in GROUP BY clause
--Is always used together with GROUP BY clause


select location,SUM(PRICE_PAID) AS sumof from customer GROUP BY LOCATION having sum(PRICE_PAID)>40000

--4. What are Horizontal Joins? Why do we use these Joins.
--In horizontal join records are joined horizontally by combining field/column from two tables (irrespective of different column)
--using values common to each
-- We use it to join fields of two table on common field to find necessary record

--5. Explain Difference between RIGHT JOIN and LEFT JOIN?
--In Right Join all the common record of the two table along with uncommon records of right table i.e 2nd table in query is included with
--null records from left table
--whereas
--in Left join all common records along with all uncoommomn record from left table  i.e. 1st table in query is included with null records from right table
--number of records in right join will be same as right table and number of records in left join will be same as left join


--6. Perform INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN on SECURITY Table and SCTY_PRICE Table.
select * from scty_price
select * from Security_Table

select * from Security_Table
inner join scty_price
on Scty_code=Sec_id

select * from Security_Table
left join scty_price
on Scty_code=Sec_id

select * from Security_Table
right join scty_price
on Scty_code=Sec_id

select * from Security_Table
full join scty_price
on Scty_code=Sec_id

--uncommon record
select * from Security_Table
full join scty_price
on Scty_code=Sec_id
where Sec_id is null or 
Scty_code is null

--Here all records of left table is combined with each record and every record of right table; no of records= c
select * from Security_Table
cross join scty_price

select * from Security_Table
left join scty_price
on Date_inc<Prc_date
--7. What are Vertical Joins? When it is used? Explain with the help of Example?
--Here records are joined verically. Records will appear consecutively in ascending order irrespective of table they belongs to.
--Restriction: the two  table must have same number of columns and same datatypes of corresponding columns (column name may defer)
create table v1(
sn int primary key, name varchar(30) not null, age int)

create table v2(
sl_no int, name varchar(20) not null, age float)

insert into v1
values(101,'Sabyasachi',30),
(102,'Parthasathi',25),
(103,'Dwitikrishna',20)

insert into v2
values(101,'Sabyasachi',30),
(104,'Sangeeta',23),
(103,'XYZ',20)

select * from v1
select * from v2

select * from v2
union --all the unique records from both table appers; order is as per slno but taking name from 1st table 
select * from v1

select * from v1
union all -- all the records of both the table stacked one by one without any order 
select * from v2


select * from v1
intersect --common record from both table appear
select * from v2

select * from v1
except -- uncommon record of table 1  appears
select * from v2


select * from v2
except -- uncommon record of table 1  appears; as per ascending order of sn 
select * from v1


--8. Explain the difference between UNION and FULL JOIN?
--UNION clause is used to join tables vertically where as FULL JOIN clause is used to join table horizontally.

--9. What is the difference between UNION and UNION ALL?
--UNION clause is used to join all common records from tables, all the un-common records from each table.
--Thus in final table unique records appear consecutively in ascending order irrespective of their tables
--whereas
--in UNION ALL all the records from both the table appear in the final table. Means here records 2nd table is stacked below 1st table
--hence ordering is done as per reords of respective table


--10. Which join will be used to select un-common records from different tables. Please provide the query.

--In horizoonatal join FULL JOIN clause with where condition can be used to select un-common records from differet tables
select * 
from Security_Table
full join scty_price
on Scty_code=Sec_id
where Scty_code is null or Sec_id is null 

--
--In Vertical joins combination of union, except and intersect can be used to select un-common records from different table
select * from v1 union  select * from v2
except
select * from v1 intersect select * from v2

