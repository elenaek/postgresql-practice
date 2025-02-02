-- Basic example of using an INNER JOIN to join the tables actor and film
-- Result set will display a combined set of both actor and film tables where the actor has a role in a given movie

SELECT actor.*, film.*
FROM actor, film_actor
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE film_actor.film_id = film.film_id AND
actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id, film.film_id
ORDER BY film.film_id ASC;