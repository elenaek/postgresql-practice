-- Example of how to create a basic View
-- Create a View that displays paying customers who are actors and the movies they have a role in

CREATE VIEW actor_paying_customer
AS
SELECT actor.actor_id, film.film_id, actor.first_name, actor.last_name, film.title as movie
FROM actor, customer, film, film_actor, payment
WHERE actor.first_name = customer.first_name AND
actor.last_name = customer.last_name AND
film.film_id = film_actor.film_id AND
actor.actor_id = film_actor.actor_id AND
payment.customer_id = customer.customer_id
GROUP BY actor.actor_id, film.film_id, film.title;
