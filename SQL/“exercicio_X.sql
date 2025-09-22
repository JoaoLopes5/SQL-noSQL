-- Exercício 1

select film_category.category_id, film.title from film_category
    inner join  film 
        on film_category.film_id=film.film_id
    order by film.title


Select ac.first_name, count(a.film_id) as NumberOfFilms
    from film_actor a
    JOIN actor ac ON a.actor_id = ac.actor_id
    group by a.actor_id, ac.first_name
    order by NumberOfFilms DESC

SELECT ac.first_name, COUNT(fa.film_id) AS NumberOfFilms
FROM actor ac
JOIN film_actor fa ON ac.actor_id = fa.actor_id
JOIN film fi ON fa.film_id = fi.film_id
WHERE fi.length > 120
GROUP BY ac.actor_id, ac.first_name, ac.last_name
ORDER BY NumberOfFilms DESC;

--Exercício 2

SELECT COUNT(*) AS TotalFilms
FROM film_category
INNER JOIN film 
    ON film_category.film_id = film.film_id;

SELECT COUNT(*) AS TotalActors
FROM (
    SELECT a.actor_id
    FROM film_actor a
    JOIN actor ac ON a.actor_id = ac.actor_id
    GROUP BY a.actor_id
) AS Subquery;

SELECT COUNT(*) AS TotalActorsLongFilms
FROM (
    SELECT ac.actor_id
    FROM actor ac
    JOIN film_actor fa ON ac.actor_id = fa.actor_id
    JOIN film fi ON fa.film_id = fi.film_id
    WHERE fi.length > 120
    GROUP BY ac.actor_id
) AS Subquery;