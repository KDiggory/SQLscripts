#1 List all actors.
SELECT first_name, last_name FROM actor ORDER BY last_name;

#2 Find the surname of the actor with the forename 'John'
SELECT first_name, last_name FROM actor WHERE first_name=("John") ; 

#3  Find all actors with surname 'Neeson'.
SELECT first_name, last_name FROM actor WHERE last_name=("Neeson") ; 

#4 Find all actors with ID numbers divisible by 10
SELECT first_name, last_name, actor_id FROM actor WHERE (actor_id%10)=0;

#5 What is the description of the movie with an ID of 100?
SELECT description FROM film WHERE film_id=100;

#6 Find every R-rated movie.
SELECT title, rating FROM film WHERE rating="R";

#7 Find every non-R-rated movie
SELECT title, rating FROM film WHERE rating!="R";

#8 Find the ten shortest movies
SELECT title, length FROM film ORDER BY length ASC LIMIT 10;

#9 Find the movies with the longest runtime, without using LIMIT
SELECT title FROM film WHERE length=(SELECT MAX(length) FROM film);

#10 Find all movies that have deleted scenes.
SELECT title FROM film WHERE special_features LIKE "%Deleted scenes%";

#11 Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*) =1 ORDER BY last_name DESC;

#12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, count(*) FROM actor GROUP BY last_name HAVING COUNT(*) >1  ORDER BY count(*) DESC;

#13 Which actor has appeared in the most films?
SELECT FA.actor_id, count(*) AS number_of_films, A.first_name, A.last_name FROM film_actor FA 
JOIN actor AS A ON A.actor_id=FA.actor_id
GROUP BY actor_id ORDER BY count(*) DESC LIMIT 1;

#14 When is 'Academy Dinosaur' due? // make a new field called due date

SELECT DATE_ADD(r.rental_date, INTERVAL f.rental_duration DAY) AS due_date 
FROM (rental AS r
JOIN inventory AS i ON i.inventory_id=r.inventory_id)
JOIN film AS f ON f.film_id=i.film_id
WHERE f.title='Academy Dinosaur' AND r.return_date is NULL;

#15 What is the average runtime of all films?
SELECT AVG(length) FROM film;

#16 List the average runtime for every film category.
SELECT AVG(length), category.name FROM film 
JOIN film_category on film_category.film_id=film.film_id
JOIN category ON category.category_id=film_category.category_id
GROUP BY category.name;

#17 List all movies featuring a robot.
SELECT film.title, film_text.description FROM film
JOIN film_text ON film_text.film_id=film.film_id
WHERE film_text.description LIKE '%robot%';

#18 How many movies were released in 2010? - none, apparently all in 2006!
SELECT count(*) FROM film WHERE release_year=(2006);

#19 Find the titles of all the horror movies.
SELECT film.title FROM film
JOIN film_category ON film_category.film_id=film.film_id
JOIN category ON category.category_id=film_category.category_id
WHERE category.name=("horror");

#20 List the full name of the staff member with the ID of 2
SELECT first_name, last_name FROM staff WHERE staff_id=(2);

#21 List all the movies that Fred Costner has appeared in.
SELECT film.title FROM film
JOIN film_actor ON film_actor.film_id=film.film_id
JOIN actor ON actor.actor_id=film_actor.actor_id
WHERE actor.first_name=('Fred') AND actor.last_name=('Costner');

#22 How many distinct countries are there?
SELECT DISTINCT count(*) AS number_of_countries FROM country;

#23 List the name of every language in reverse-alphabetical order.
SELECT name FROM language ORDER by name DESC;

#24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son' ORDER BY first_name ASC;

#25 Which category contains the most films?
SELECT category.name, count(*) FROM category
JOIN film_category ON film_category.category_id=category.category_id
GROUP BY category.name
ORDER BY count(*) DESC
LIMIT 1;



