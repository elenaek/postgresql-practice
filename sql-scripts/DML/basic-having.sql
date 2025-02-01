-- Example of how to use HAVING to filter out resultset of aggregate functions
-- This script retrieves paying customers ids from the payment table who have paid more in total than the average total
-- The HAVING clause is taking the SUM total amount paid by each customer and comparing it against the average total
-- filtering out any customers which have paid less cumulatively/in total than the average

SELECT payment.customer_id, SUM(payment.amount) as total
FROM payment
GROUP BY payment.customer_id
HAVING SUM(payment.amount) > (SELECT AVG(calc_payment.total) as mean_total
FROM (
	SELECT SUM(amount) as total
	FROM payment
	GROUP BY customer_id
) as calc_payment)
ORDER BY total DESC;