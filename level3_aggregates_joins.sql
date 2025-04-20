use netflix_db;
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