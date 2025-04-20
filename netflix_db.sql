create database netflix_db;
use netflix_db;
CREATE TABLE netflix_titles (
    show_id VARCHAR(20),
    type VARCHAR(10),
    title VARCHAR(255),
    director VARCHAR(255),
    cast TEXT,
    country VARCHAR(100),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(50),
    listed_in VARCHAR(255),
    description TEXT
);
-- counting the total number of shows..??
SELECT COUNT(*) FROM netflix_titles;

## breaking down movies vs tv shows or others..
select type, count(*)
from netflix_titles
group by type;

## top 5 countries with the most content..
select country, count(*) as total
from netflix_titles
group by country
order by total desc
limit 5;

## Which years had the most releases?
select release_year, count(*) as total
from netflix_titles
group by release_year
order by total desc
limit 1;

## How many shows added in the year 2019??
select*from netflix_titles
where release_year = 2019;

##counting content by country..
select country, count(*)
from netflix_titles
group by country
having count(*)>0
order by count(*) desc
limit 5;

## top 3 genres..
select type as genre, count(*) as total
from netflix_titles
group by genre
order by total desc
limit 3;

## listing all movies between 2015 and 2020..
select*
from netflix_titles
where release_year between 2015 and 2020;

## shows in specific country (USA)
select*
from netflix_titles
where 'United states' = country;

## average duration of all movies..
create view view1 as
select avg(duration)
from netflix_titles
where type = 'movie';

## select movies with duration more than average duration..
select*
from netflix_titles
where duration >  (select avg(duration) from netflix_titles where type = 'movie');

##  Find all shows released in 2020 with the word “Love” in the title..
SELECT * FROM netflix_titles
WHERE release_year = 2020 AND title LIKE '%Love%';

## . Count how many TV Shows were added in each year..
SELECT release_year, COUNT(*) as tv_show_count
FROM netflix_titles
WHERE type = 'TV Show'
GROUP BY release_year;

##. Find shows with a description that mentions “inspiring”..
SELECT title, description
FROM netflix_titles
WHERE description LIKE '%inspiring%';

## List all shows added in July (any year)..
SELECT title, date_added
FROM netflix_titles
WHERE MONTH(STR_TO_DATE(date_added, '%M %d, %Y')) = 7;

## Number of titles per genre..
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC;

## Top 5 directors with the most content..
SELECT director, COUNT(*) AS total_directed
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_directed DESC
LIMIT 5;

## Total content released per year (filter out old data)..
SELECT release_year, COUNT(*) AS total_content
FROM netflix_titles
WHERE release_year >= 2010
GROUP BY release_year
ORDER BY release_year DESC;

## Find duplicate titles (if any)..
SELECT title, COUNT(*) AS count
FROM netflix_titles
GROUP BY title
HAVING COUNT(*) > 1;

## Bucketing titles into 'Short', 'Medium', 'Long' based on duration..
SELECT title, duration,
  CASE
    WHEN duration LIKE '%min%' THEN
      CASE
        WHEN CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) < 40 THEN 'Short'
        WHEN CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) BETWEEN 40 AND 90 THEN 'Medium'
        ELSE 'Long'
      END
    ELSE 'TV Show'
  END AS length_category
FROM netflix_titles
WHERE duration IS NOT NULL;

## Subquery: Top 5 longest movies
SELECT title, duration
FROM netflix_titles
WHERE duration LIKE '%min%'
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 5;






