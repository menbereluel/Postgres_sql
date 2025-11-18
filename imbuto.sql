CREATE SCHEMA imbuto;
CREATE TABLE imbuto.payment(
    payment_id  INT PRIMARY KEY ,
    payment_status VARCHAR (30),
    payment_date DATE ,
    price_per_liter DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    member_id INT,
    CONSTRAINT fk_member_id 
    FOREIGN KEY(member_id)
    REFERENCES imbuto.member_details(member_id),
    record_id INT,
    CONSTRAINT fk_record_id
    FOREIGN KEY (record_id)
    REFERENCES imbuto.milk_records(milk_record_id)

);
INSERT INTO imbuto.payment(payment_id,payment_status,
payment_date,price_per_liter,total_amount ,member_id,record_id)
VALUES
(001,'Paid','2025-03-15',45,2000,m_01,001),
(002,'Paid','2025-03-30',45,3500,m_02,002),
(003,'Paid','2025-04-15',45,4000,m_03,003),
(004,'Paid','2025-04-30',45,2500,m_04,004),
(005,'Paid','2025-05-15',45,2300,m_05,005);