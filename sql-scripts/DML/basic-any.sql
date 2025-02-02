-- Example of using ANY to filter based on matches against an attribute with results of subqueries
-- We want to return records where the customer's first and last name are the same as an actor's
-- Meaning any customer that is an actor would end up in the resultset, or atleast that they share the same first and last name

SELECT *
FROM customer
WHERE first_name = ANY (
    SELECT first_name
    FROM actor
) AND last_name = ANY (
    SELECT last_name
    FROM actor
);