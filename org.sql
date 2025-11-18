CREATE SCHEMA orga;

CREATE  TABLE orga.emp(
    id INT PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR(50),
    gender VARCHAR (10),
    department VARCHAR(50),
    hire_date DATE ,
    salary DECIMAL 

);
INSERT INTO orga.emp(id,first_name,last_name,gender,department,hire_date,salary)
VALUES
(1,'John','Doe','Male','IT','2018-05-01',60000.00),
(2,'Jane','Smith','Female','HR','2019-06-15',50000.00),
(3,'Michael','Johnson','Male','Finance','2017-03-10',75000.00),
(4,'Emily','Davis','Female','IT','2020-11-20',70000.00),
(5,'Sarah','Brown','Female','Marketing','2016-07-30',45000.00),
(6,'David','Wilson','Male','Sales','2019-01-05',55000.00),
(7,'Chris','Taylor','Male','IT','2022-02-25',65000.00);
