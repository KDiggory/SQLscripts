USE sakila;

# longest length of film
SELECT length FROM film WHERE length is NOT NULL ORDER BY length DESC LIMIT 1;

# shortest length of a film
SELECT length FROM film WHERE length is NOT NULL ORDER BY length ASC LIMIT 1;

# average length of a film 
SELECT AVG(length) FROM film;


