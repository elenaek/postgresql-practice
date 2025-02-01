-- Creates two tables: manager and department with no relationships then alters the department table to add an FKEY relationship and constraint

CREATE TABLE IF NOT EXISTS manager (
    manager_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT
);

ALTER TABLE department
ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
ON DELETE SET NULL; -- This means when a manager record is deleted the corresponding row in department will set the manager_id to NULL