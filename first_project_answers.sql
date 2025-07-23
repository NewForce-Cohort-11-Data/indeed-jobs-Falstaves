-- 1) How many rows are in the data_analyst_jobs table? 1793

-- SELECT COUNT(title)
-- FROM data_analyst_jobs;

-- 2) Write a query to look at just the first 10 rows. 
-- What company is associated with the job posting on the 10th row? ExxonMobil

-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10;

-- 3a) How many postings are in Tennessee? 21
-- 3b) How many are there in either Tennessee or Kentucky? 27


-- SELECT COUNT(title)
-- FROM data_analyst_jobs
-- WHERE location = 'TN';

-- SELECT COUNT(title)
-- 	FROM data_analyst_jobs
-- 	WHERE location ='TN' OR location ='KY';

-- 4) How many postings in Tennessee have a star rating above 4? 3

  -- SELECT COUNT(title)
  -- FROM data_analyst_jobs
  -- WHERE location = 'TN' AND "star-rating" > 4;

  -- 5) How many postings in the dataset have a review count between 500 and 1000? 150

  -- SELECT COUNT(title)
  -- FROM data_analyst_jobs
  -- WHERE review_count >500 AND review_count <1000;



-- 6a) Show the average star rating for companies in each state. 
-- The output should show the state as state and the average rating for the state as avg_rating. 
-- 6b) Which state shows the highest average rating? NE

-- SELECT location, AVG("star-rating")
-- FROM data_analyst_jobs
-- WHERE location IS NOT NULL
-- GROUP BY location


-- SELECT location AS state, AVG("star-rating") AS avg_rating
-- FROM data_analyst_jobs
-- WHERE location IS NOT NULL AND "star-rating" IS NOT NULL
-- GROUP BY location
-- ORDER BY avg_rating DESC;


-- 7) Select unique job titles from the data_analyst_jobs table. How many are there? 881


-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs;

-- 8) How many unique job titles are there for California companies? 230

-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs
-- WHERE location = 'CA';



-- 9a) Find the name of each company and its average star rating for all companies that have 
-- more than 5000 reviews across all locations. 
-- 9b) How many companies are there with more that 5000 reviews across all locations? 40

-- SELECT company, AVG("star-rating") as average_rating
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- AND company IS NOT NULL
-- GROUP BY company
-- ORDER BY average_rating DESC;

-- 10a) Add the code to order the query in #9 from highest to lowest average star rating. 
-- 10b) Which company with more than 5000 reviews across all locations 
-- in the dataset has the highest star rating? Unilever
-- 10c) What is that rating? 4.2


-- 11a) Find all the job titles that contain the word ‘Analyst’. 
-- 11b) How many different job titles are there? 774

-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs
-- WHERE title ILIKE '%analyst%';

-- 12a) How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 4
-- 12b) What word do these positions have in common? Tableau

-- SELECT DISTINCT(title)
-- FROM data_analyst_jobs
-- WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

-- BONUS: You want to understand which jobs requiring SQL are hard to fill. 
-- Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 403

-- Disregard any postings where the domain is NULL.
-- Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
-- Which three industries are in the top 4 on this list? Tech, banking, business, and healthcare
-- How many jobs have been listed for more than 3 weeks for each of the top 4? 62, 61, 57, 52 (respectively)

-- SELECT COUNT(domain) AS hard_to_find_good_help_these_days, domain
-- FROM data_analyst_jobs
-- WHERE skill ILIKE '%SQL%'
-- AND days_since_posting >21
-- AND domain IS NOT NULL
-- GROUP BY domain
-- ORDER BY hard_to_find_good_help_these_days DESC;