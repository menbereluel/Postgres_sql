CREATE SCHEMA TECH ;
CREATE TABLE TECH.empl(
    id INT PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    gender VARCHAR (10),
    department VARCHAR(100),
    hireDate DATE ,
    salary DECIMAL 
);
INSERT INTO TECH.empl(id,first_name,last_name,gender,department,hiredate,salary)
VALUES
(1,'John','Doe','Male','IT','2018-05-01',60000.00),
(2,'Jane','Smith','Female','HR','2019-06-15',50000.00),
(3,'Michael','Johnson','Male','Finance','2017-03-10',75000.00),
(4,'Emily','Davis','Female','IT','2020-11-20',70000.00),
(5,'Sarah','Brown','Female','Marketing','2016-07-30',45000.00),
(6,'David','Wilson','Male','Sales','2019-01-05',55000.00),
(7,'Chris','Taylor','Male','IT','2022-02-25',65000.00);

CREATE TABLE TECH.pro(
    p_id INT PRIMARY KEY,
    p_name VARCHAR (50),
    catagory VARCHAR (50),
    price  DECIMAL ,
    stock INT 
);
INSERT INTO TECH.pro(p_id,p_name,catagory,price,stock)
VALUES
(1,'Laptop','Electronics',1200.00,30),
(2,'Desk','Furniture',300.00,50),
(3,'Chair','Furniture',150.00,200),
(4,'SmartPhone','Electronics',250.00,40),
(5,'Monitor','Electronics',250.00,40),
(6,'Bookshelf','Furniture',100.00,60),
(7,'Printer','Electronics',200.00,25);

CREATE TABLE TECH.sale(
    s_id INT PRIMARY KEY ,
    s_date DATE,
    quantity INT ,
    total DECIMAL,
    p_id INT,
    constraint fk_p_id
    FOREIGN KEY (p_id)
    REFERENCES TECH.pro(p_id),
    id INT ,
    CONSTRAINT fk_id
    FOREIGN KEY (id)
    REFERENCES TECH.empl(id)

);
INSERT INTO TECH.sale(s_id,p_id,id,s_date,quantity,total)
VALUES
(1,1,1,'2021-01-15',2,2400.00),
(2,2,2,'2021-03-22',1,300.00),
(3,3,3,'2021-05-10',4,600.00),
(4,4,4,'2021-07-18',3,2400.00),
(5,5,5,'2021-09-25',2,500.00),
(6,6,6,'2021-11-30',1,100.00),
(7,7,1,'2022-02-15',1,200.00),
(8,1,2,'2022-04-10',1,1200.00),
(9,2,3,'2022-06-20',2,600.00),
(10,3,4,'2022-08-05',3,450.00),
(11,4,5,'2022-10-11',1,800.00),
(12,5,6,'2022-12-29',4,1000.00);
/* q1*/
SELECT *FROM TECH.empl;


SELECT first_name  FROM TECH.empl;

SELECT DISTINCT department FROM TECH.empl;

SELECT count (*)FROM TECH.empl;  

SELECT SUM(salary) FROM TECH.empl;
/*5*/

SELECT AVG (salary) FROM TECH.empl;
/*6*/

SELECT MAX (salary) FROM TECH.empl;

/*7*/

SELECT MIN (salary) FROM TECH.empl;

/*8*/

SELECT count (gender) FROM TECH.empl
WHERE gender='Male';

/*9*/

SELECT count(gender) FROM TECH.empl
WHERE gender='Female';

/*10*/

SELECT COUNT(*)
FROM TECH.empl
WHERE hiredate BETWEEN '2020-01-01' AND '2020-12-31';

/*11*/
SELECT AVG(salary) FROM TECH.empl
WHERE department='IT';
/*12*/

SELECT count (*), department
FROM TECH.empl
GROUP BY department;

/*13*/
SELECT department, SUM(salary)
FROM TECH.empl
GROUP BY department;

/*14*/
SELECT department, MAX (salary)
FROM TECH.empl
GROUP BY department;

/*15*/
SELECT MIN (salary), department
FROM TECH.empl
GROUP BY department;

/*16*/
SELECT gender, COUNT(*)
FROM TECH.empl
GROUP BY gender;

/*17*/

SELECT gender ,AVG(salary)
FROM TECH.empl
GROUP BY gender;

/*18*/

SELECT *
FROM TECH.empl
ORDER BY salary DESC
LIMIT 5;
select first_name  as first_name,e.salary
from TECH.empl e
order by e.salary desc
limit 5;

/*19*/

SELECT count ( DISTINCT first_name) FROM TECH.empl;

/*20*/

select e.first_name, s.total as sales_total, s.quantity as quantity_sold
from TECH.sale s, TECH.empl e, TECH.pro p
where e.id=s.id and s.p_id=p.p_id;
/*21*/

select e.first_name as first_name, e.hiredate as hired_date
from TECH.empl e
order by e.hiredate asc
limit 10;

/*22*/

select  e.id,e.first_name, e.last_name
from  TECH.empl e
where e.id not in (
select s.id
from TECH.sale s
);
/*23*/
SELECT s.id,e.first_name,SUM(s.total)AS total_sales
FROM TECH.sale s
JOIN TECH.empl e
ON s.id=e.id
GROUP BY e.first_name,s.id;
/*24*/


/*25*/
SELECT e.department ,AVG(s.quantity) AS average_quantity
FROM TECH.sale s, TECH.empl e
WHERE e.id=s.id
GROUP BY e.department;

/*26*/
SELECT  s.id ,s_date,e.first_name,extract(year from s_date),SUM(s.quantity)
FROM TECH.sale s,TECH.empl e
WHERE extract(year from s_date)=2021
GROUP BY s.id,e.first_name,s.s_date;
/*27*/

SELECT s.id,e.first_name,sum(s.quantity) AS total_quantity
FROM TECH.sale s ,TECH.empl e
WHERE s.id=e.id
GROUP BY s.id,e.first_name,
ORDER BY total_quantity DESC
LIMIT 3;
/*28*/

SELECT e.department,SUM(s.quantity) AS total_quantity
FROM TECH.sale s ,TECH.empl e
group by e.department;

/*29*/
SELECT p.catagory,sum(s.total) AS revenue
FROM TECH.pro p,TECH.sale s
GROUP BY p.catagory ;


/*30*/


/*11*/

/*19*/

