
-- Query 1: Top 5 Visited URLs
SELECT url, COUNT(*) AS visits
FROM weblogs
GROUP BY url
ORDER BY visits DESC
LIMIT 5;

-- Query 2: Status Code Distribution
SELECT status, COUNT(*) AS frequency
FROM weblogs
GROUP BY status;

