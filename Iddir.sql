CREATE SCHEMA  iddir;
CREATE TABLE  iddir.iddirs(
    iddir_id  INT PRIMARY KEY ,
    name VARCHAR(30),
    account_number INT,
    CONSTRAINT fk_user_id
    FOREIGN KEY (user_id)
    REFERENCES iddir.user(user_id),
    CONSTRAINT fk_resource_id
    FOREIGN KEY (resource_id)
    REFERENCES iddir.resource(resource_id),
    created_date DATE,
    


)
