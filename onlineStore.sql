CREATE SCHEMA online_book_shop;
CREATE TABLE online_book_shop.authors(
    author_id INT PRIMARY KEY ,
    name VARCHAR (30),
    country VARCHAR(20)
);
INSERT INTO online_book_shop.authors(author_id,name,country)
VALUES
(1,'Mena','Ethiopia'),
(2,'Kebe','Kenya'), 
(3,'abe','Ruwanda');
CREATE TABLE online_book_shop.book(
    book_id INT PRIMARY KEY,
    title VARCHAR(30),
    gender VARCHAR(10),
    price DECIMAL(10,2),
    stock_quantity INT,
    published_year INT,
     author_id INT,
     CONSTRAINT fk_author_id
     FOREIGN KEY (author_id)
     REFERENCES online_book_shop.authors(author_id)

);
SELECT a.name,b.title
FROM online_book_shop.authors a
JOIN online_book_shop.book b
ON a.author_id=b.author_id
WHERE a.name='Kebe';

SELECT c.name , b.title
FROM online_book_shop.book  b
JOIN online_book_shop.orderdetails ob
on b.book_id=ob.book_id
JOIN online_book_shop.orders o 
ON o.order_id=ob.order_id
JOIN online_book_shop.customers c 
ON c.customer_id= o.customer_id
;
SELECT a.name ,count(b.title)
FROM online_book_shop.authors a
JOIN online_book_shop.book b
ON a.author_id=b.author_id
GROUP BY a.name
HAVING COUNT (b.book_id)>3;

SELECT * FROM  online_book_shop.book;

SELECT title ,price FROM online_book_shop.book
   WHERE price > 200;






INSERT INTO online_book_shop.book(book_id,title,gender,price,stock_quantity,published_year,author_id)
VALUES
(1,'Hadis','Male',200,20,1964,1),
(2,'Oromay','Male',300,30,1974,2),
(3,'kal_kidan','Female',350,42,1980,3);
SELECT gender,title FROM online_book_shop.book
WHERE  published_year>1974;

CREATE TABLE online_book_shop.customers(
    customer_id INT PRIMARY KEY,
    name VARCHAR(30),
    email VARCHAR (30),
    signup_date DATE

);
INSERT INTO online_book_shop.customers(customer_id,name,email,signup_date)
VALUES
(1,'Mena','manaluel@gmail.com','2024-3-17'),
(2,'Dana','danakele@gmail.com','2022-7-10'),
(3,'Sera','saral@gmail.com','2020-2-19');
SELECT  name, extract(year from signup_date ) FROM online_book_shop.customers
WHERE extract(year from signup_date) > 2020;

CREATE TABLE online_book_shop.orders(
    order_id INT PRIMARY KEY,
    customer_id INT ,
    CONSTRAINT fk_customer_id
    FOREIGN KEY(customer_id)
    REFERENCES online_book_shop.customers(customer_id)
);


INSERT INTO online_book_shop.orders(order_id,customer_id)
VALUES
(1,2),
(2,3),
(3,1);
CREATE TABLE online_book_shop.orderDetails(
    order_detail_id INT PRIMARY KEY,
    order_id INT ,
    CONSTRAINT fk_order_id
    FOREIGN KEY (order_id)
    REFERENCES online_book_shop.orders(order_id),
    book_id INT,
    CONSTRAINT fk_book_id
    FOREIGN KEY (book_id)
    REFERENCES online_book_shop.book(book_id)
);
INSERT INTO online_book_shop.orderdetails(order_detail_id,order_id,book_id)
VALUES
(1,2,1),
(2,1,3),
(3,3,2);