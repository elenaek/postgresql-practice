-- Creates two tables: department(1) and representative(1) which have a 1:1 relationship
-- Each one department has one representative connected by the foreign key and UNIQUE constraint
-- UNIQUE is important as it dictates that each value in the department.representative_id column is UNIQUE meaning only 1 record related to a
-- given representative_id exists
-- Both department and representative tables are strong entities as they can exist on their own and thus this would be considered a strong relationship
CREATE TABLE representative (
    representative_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL
);

CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    representative_id INT UNIQUE, -- Dictates that only one representative record can be tied to one department record
    CONSTRAINT fk_representative FOREIGN KEY (representative_id) REFERENCES representative(representative_id)
);