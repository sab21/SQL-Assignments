
--Functions and Null Values Assignment Please write SQL queries/commands for the following and give the suggested output for each query:
--1. Concatenate the text ‘Business’, ‘Today’, ‘India’ with – (hyphen) in between each text.
--2. Create the email id for the person whose first name is ‘Rama’ middle name is ‘Krishnan’ and last name is ‘Iyer’. Company’s domain name is nikhilanalytics.com. Email id must have first 3 characters of first name, first 2 characters of middle name followed by a dot (.), followed by last 2 characters of last name, followed by @ and followed by the domain name. All the characters should have lowercase.
--3. Write a SQL query where ‘Microsoft’ text has to be stuffed with text ‘Apple’ from 4th position for 2 characters (ro).
--4. Extract 7 characters from 3rd position of the string ‘London Olympics’
--5. Count the number of characters from the string ‘Silicon Valley of India’.
--6. Count the number of records present in the table DimProduct.
--7. Reverse the string ‘Independence Day’
--8. Remove the Leading Blanks from the string ‘ India ‘.
--9. Remove the Trailing Blanks from the string ‘ Russia ‘.
--10. Select the minimum of ListPrice, maximum of standardcost, standard deviation of dealerprice , variance of weight and total of weight from DimProduct table.
--11. Find the sum of the square of first 20 natural numbers using SQL script by declaring your own variable.
--The formula for your reference is
--12. Find the concatenation of the lowcase of the text ‘NIKHIL’ , Ampersand(&) and upcase of the text ‘aNalytics’ using SQL Script by defining your user defined variables.
--13. What are null values? If any arithmetic operation is performed with NULL what will be the result of this?
--14. Describe briefly with the help of syntax ISNULL()?
--15. Describe briefly with the help of syntax NULLIF()?
--16. Describe briefly with the help of syntax COALESCE()?
--17. Write an SQL query, where the columns are prod_id, pname, price, entrydate. Table name is Product. Wherever entrydate is null you are required to display system/current date instead.
--18. What will be the result for SELECT COALESCE(NULL, NULL, 100, NULL, 85)? Explain with reason why you get the particular result.
--19. What will be the result for SELECT NULLIF(0, NULL)?
--a) NULL b) 0 c) 1 d) solution can’t be determined


--Q1
select CONCAT('Business','-','Today','-','India')

--Q2
create table comp_mail(
fname varchar(15), mname varchar(15), lname varchar (15), domain varchar(20)
)

insert into comp_mail values ('Rama', 'Krishna', 'Iyer', 'NikhilAnalytics')

select LOWER(concat(left(fname,3),LEFT(mname,2),'.',RIGHT(lname,2),domain,'.com'))
as Mail_id from comp_mails

--OR
select LOWER(concat(left('Rama',3),LEFT('Krishna',2),'.',RIGHT('Iyer',2),'nikhilanalytics.com'))
as Mail_id

--Q3
select STUFF('MICROSOFT', 4,2,'apple')

--Q4
select SUBSTRING('LONDON OLYMPICS',3,7)

--Q5
select len('Silicon Valley of India')

--Q6
select COUNT(*) as Record_count from Security_Table

--Q7
select REVERSE('INDEPENDENCE DAY')

--Q8
select '*'+ ltrim('              India    ')+'*'


--Q9
select '*'+ rtrim('              RUSSIA    ')+'*'


--Q10
select top 3 * from customer

select MIN(price_paid) as Minimum,
max(price_paid) as Maximum,
STDEV(price_paid) as Std_Dev,
var(price_paid)as Varience,
SUM(price_paid) as Total
from customer

--Q11


--Q12
select CONCAT(lower('NIKHIL'),'&',UPPER('aNalytics')) as NIKHILaNalytics


---Q13
-- NULL are records having no values at all. No character not any numeric. These are missing values.
-- its not 0 or space or character 'NULL'
-- Any operation performed with null will be NULL only

--#Q14
-- ISNULL() fuction takes 2 arguements;
--			It returns the 1st arguemnet by default provided it should not be null
--			If 1st arg is null then it returns the 2nd arg
select ISNULL(10,10)
select ISNULL('SQL','SQL')
select ISNULL(null, 20) -- if 1st arguement is null then it will return 2nd arg
select ISNULL(null,'SERVER')
select ISNULL('SQL','SERVER')
select ISNULL('SQL',null)

--Q15
-- NULLIF() fuction takes 2 arguements; gives Null value if both arguesments are same
--			It returns the 1st arguemnet if both arg are unequal by default
--			It has restriction that it wont allow 1st arg to be null
select nullif(100,100)
select nullif(10,100)
select nullif('server','SERVER')
select nullif('SQL','SERVER')
select nullif(null,'SERVER')-- 1st arg cant be null
select nullif(0,null)

--Q16
--COALESCE() function can take n number of arguement 
--			It returns the 1st arg by default provided its null
--			If 1st arg is null then it will return next not null value
--			Restriction: there ,ust be atleast one not null values in the arg

select COalesce ('Benf1','Benf2','Benf3','RBI')
select COalesce (null,'Benf2','Benf3','RBI')
select COalesce (null,'Benf2',null,'RBI')
select COalesce ('Benf1','Benf2','Benf3','RBI')
select coalesce(null,null,null,null,2,1000,null,50000)
select coalesce(null,null,null,null,getdate())
select coalesce (null,null,null,null)--ATLEAST ONE NOT NULL VALUES SHOULD BE THERE - RESTRICTION

--Q17
select * from product

begin transaction
update product set entry_date = ISNULL(ENTRY_dATE, GETDATE())

COMMIT


--q18
SELECT COALESCE(NULL, NULL, 100, NULL, 85)
--Since 100 is the 1st Not NULL value in the arguement that why coalesce will return 100 only

--19
SELECT NULLIF(0, NULL)
--Since both arguement are not equeal  therefore it will return the 1st arguement whih is 0