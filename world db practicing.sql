show databases;
USE world;

#1 get number of cities in the usa
SELECT COUNT(*) FROM city WHERE CountryCode=("USA");

#2 get life expectancy of argentina
SELECT LifeExpectancy, Population FROM country WHERE Code=("ARG");

#3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy
SELECT LifeExpectancy, Name FROM country WHERE LifeExpectancy is NOT NULL ORDER BY LifeExpectancy desc LIMIT 1 ;

#4 find the capital of spain
SELECT city.Name FROM city JOIN country ON city.id=country.Capital WHERE CountryCode=("ESP");

#5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region. - just the nuique ones
SELECT  DISTINCT Language FROM countrylanguage JOIN country on country.Code=countrylanguage.CountryCode WHERE country.Region=("Southeast Asia");

#5 - another try  
SELECT DISTINCT Language FROM countrylanguage JOIN country on country.Code=countrylanguage.CountryCode WHERE country.Region=("Caribbean");

#6 Using a single query, list 25 cities around the world that start with the letter F.
SELECT Name FROM city WHERE name LIKE 'f%' LIMIT 25;

#7 Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT city.Name FROM city JOIN country ON city.CountryCode=country.Code WHERE CountryCode=("CHN");

#8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT Population, Name FROM country WHERE Population > 0 ORDER BY Population ASC LIMIT 1 ;

#9 Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(*) FROM country;

#10 What are the top ten largest countries by area?
SELECT SurfaceArea, Name FROM country WHERE SurfaceArea is NOT NULL ORDER BY SurfaceArea desc LIMIT 10;

#11 List the five largest cities by population in Japan.
SELECT population, Name FROM city WHERE CountryCode=("JPN") ORDER BY population DESC LIMIT 5;

#12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SET SQL_SAFE_UPDATES = 0;
UPDATE country SET HeadOfState = ("Elizabeth II") WHERE HeadOfState=("Elisabeth II");
SET SQL_SAFE_UPDATES = 1;
SELECT Name, Code FROM country WHERE HeadOfState = ("Elizabeth II");

#13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT Name, ((Population/SurfaceArea)*100) AS ratio FROM country WHERE Population AND SurfaceArea is NOT NULL ORDER BY ratio ASC LIMIT 10;

#and the highest ratio
SELECT Name, ((Population/SurfaceArea)*100) AS ratio FROM country WHERE Population AND SurfaceArea is NOT NULL ORDER BY ratio DESC LIMIT 10;

#14 List every unique world language.
SELECT DISTINCT Language FROM countrylanguage; 

#Then join to country
SELECT DISTINCT Language, country.Name FROM countrylanguage JOIN country ON countrylanguage.CountryCode=country.Code;

#15 List the names and GNP of the world's top 10 richest countries.
SELECT GNP, Name FROM country ORDER BY GNP DESC LIMIT 10;

#16 List the names of, and number of languages spoken by, the top ten most multilingual countries.
#this gets the countries and the languages spoken there
SELECT country.Name AS Country_Name, countrylanguage.language AS language FROM country 
JOIN countrylanguage ON countrylanguage.CountryCode=country.Code
ORDER BY Country_Name;

#this makes a new table of the names and the languages spoken
CREATE TABLE Country_Languages AS
SELECT country.Name AS Country_Name, countrylanguage.language AS language FROM country 
JOIN countrylanguage ON countrylanguage.CountryCode=country.Code
ORDER BY Country_Name;

# shows the country name and the number of languages spoken there, top 10 only
SELECT country_Name, count(*) FROM Country_Languages GROUP BY country_Name ORDER BY count(*) DESC LIMIT 10;


#17 List every country where over 50% of its population can speak German.
SELECT country.name, countrylanguage.percentage FROM country 
JOIN countrylanguage ON countrylanguage.CountryCode=country.Code
WHERE countrylanguage.percentage >=50 AND countrylanguage.language=("German");

#18 Which country has the worst life expectancy? Discard zero or null values
SELECT Name, LifeExpectancy FROM country WHERE LifeExpectancy is NOT NULL  > 0 ORDER BY LifeExpectancy ASC LIMIT 1;

#19 List the top three most common government forms.
SELECT governmentForm, count(*) FROM country GROUP BY governmentForm ORDER BY count(*) DESC LIMIT 3;

#20 How many countries have gained independence since records began?
SELECT COUNT(*) FROM country WHERE IndepYear is NOT NULL;






