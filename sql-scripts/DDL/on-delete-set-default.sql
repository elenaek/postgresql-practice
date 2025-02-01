-- Creates two tables: department(1) and representative(1) which have a 1:1 relationship
-- When a representative with a corresponding department is deleted, the record in the department table will automatically set representative_id to 1
CREATE TABLE representative (
    representative_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);

CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    representative_id INT default 1,
    CONSTRAINT fk_representative FOREIGN KEY (representative_id) REFERENCES representative(representative_id) ON DELETE SET DEFAULT
);