use netflix_db;
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
select avg(duration)
from netflix_titles
where type = 'movie';

## select movies with duration more than average duration..
select*
from netflix_titles
where duration >  (select avg(duration) from netflix_titles where type = 'movie');