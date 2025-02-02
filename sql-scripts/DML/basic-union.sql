-- Example usage of UNION which basically is just combining data from all the queries daisy chained by UNION
-- In this example it's combining the first_name and last_name of the actor table, the staff table, with the customer table deduplicating any duplicate rows

SELECT first_name, last_name
FROM actor
UNION
SELECT first_name, last_name
FROM customer
UNION
SELECT first_name, last_name
FROM staff