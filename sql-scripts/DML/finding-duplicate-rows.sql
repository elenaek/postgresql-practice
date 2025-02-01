-- Finds the duplicate payment amounts in the payment table

SELECT amount, COUNT(*)
FROM payment
GROUP BY amount
HAVING COUNT(*) > 1; -- Means filter by payment amounts that have counts of more than 1 (meaning there are duplicates, based on amount)