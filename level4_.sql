use netflix_db;
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