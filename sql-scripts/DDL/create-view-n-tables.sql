-- Example of creating a View combining multiple tables using an INNER JOIN
-- Combines the actor and film tables stored as a View where the result set
-- lists actors and the movies they have a role in

CREATE VIEW actor_film
AS
SELECT actor.actor_id, film.film_id, actor.first_name, actor.last_name, film.title, film.description, film.special_features
FROM actor, film_actor
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE film_actor.film_id = film.film_id AND
actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id, film.film_id
ORDER BY film.film_id ASC;

