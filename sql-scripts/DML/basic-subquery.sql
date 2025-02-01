-- Example of using a subquery to get the mean total spend of each customer on the payment table
-- We extract the SUM of the amounts paid for each customer in the inner query(subquery), and then consume
-- the SUM as total to find the mean in the outer query (mainquery)
SELECT AVG(calc_payment.total) as mean_total
FROM (
	SELECT SUM(amount) as total
	FROM payment
	GROUP BY customer_id
) as calc_payment
LIMIT 200;