-- Outputs a predictive analysis of the cost of the query to be ran, but will NOT run it without ANALYZE
-- If ran with ANALYZE then the query will actually run and will output the actual execution time and planning time

EXPLAIN
-- EXPLAIN ANALYZE
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