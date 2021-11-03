#1 List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT title, release_date FROM movies WHERE (release_date BETWEEN '1983-01-01' AND '1993-12-31') ORDER BY release_date ASC; 

#2 Without using LIMIT, list the titles of the movies with the lowest average rating. 
SELECT m.title, AVG(r.rating) AS average_rating FROM ratings AS r
JOIN movies AS m ON m.id=r.movie_id
GROUP BY r.movie_id
ORDER BY average_rating ASC;


#3 List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
SELECT DISTINCT * FROM movies AS m
JOIN genres_movies AS gm ON gm.movie_id=m.id
JOIN genres AS g ON gm.genre_id=g.id
JOIN ratings AS r ON r.movie_id=m.id
JOIN users AS u ON u.id=r.user_id
JOIN occupations AS o ON o.id=u.occupation_id
WHERE g.name=('Sci-Fi') AND u.age=24 AND u.gender=('M') AND r.rating=5 AND o.name=('Student');

#4 List the unique titles of each of the movies released on the most popular release day.
#this shows the dates by how popular they are for releases - shows most popular day
SELECT release_date, count(*) FROM movies GROUP BY release_date ORDER BY count(*) DESC LIMIT 1;

#make a table with just the most popular day in
CREATE TABLE most_pop_days AS
SELECT release_date, count(*) FROM movies GROUP BY release_date 
ORDER BY count(*) DESC LIMIT 1;

# then use this table to select the titles with that date
SELECT title, movies.release_date FROM movies 
JOIN most_pop_days ON most_pop_days.release_date=movies.release_date
WHERE most_pop_days.release_date=movies.release_date;

#5 Find the total number of movies in each genre; list the results in ascending numeric order.
SELECT g.name, count(*) FROM movies AS m
JOIN genres_movies AS gm ON gm.movie_id=m.id
JOIN genres AS g ON g.id=gm.genre_id
GROUP BY gm.genre_id
ORDER BY count(*) ASC;







 
