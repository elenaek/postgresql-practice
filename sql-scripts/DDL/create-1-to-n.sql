-- Creates two tables: department(1) and employee(N) which have a 1:N relationship
-- One department can have multiple employees connected by the foreign key

CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    representative_id INT,
    CONSTRAINT fk_representative FOREIGN KEY (representative_id) REFERENCES representative(representative_id)
);

CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    department_id INT,
    CONSTRAINT fk_deparment FOREIGN KEY (department_id) REFERENCES department(department_id)
);