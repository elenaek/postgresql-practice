-- Example of updating a View with a new column (can't drop a column from a view) and ALTERing the view's name to rename it

CREATE OR REPLACE VIEW actor_film
AS
SELECT actor.actor_id, 
    film.film_id, 
    actor.first_name, 
    actor.last_name, 
    film.title, 
    film.description, 
    film.special_features,
    film.fullText
FROM actor, film_actor
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE film_actor.film_id = film.film_id AND
actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id, film.film_id
ORDER BY film.film_id ASC;

ALTER VIEW actor_film RENAME TO actor_film_fulltext_updated; -- Renames the view name 