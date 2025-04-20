use netflix_db;
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