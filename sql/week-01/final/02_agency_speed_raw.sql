-- Business question: Which agencies close requests fastest overall?
-- Average resolution time in days for all closed requests

SELECT 
    agency_name,
    COUNT(*) AS total_closed,
    ROUND(AVG(EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400), 1) AS avg_days_to_close,
    ROUND(MIN(EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400), 1) AS fastest_days,
    ROUND(MAX(EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400), 1) AS slowest_days
FROM service_requests_portfolio
WHERE closed_date IS NOT NULL 
    AND created_date IS NOT NULL
GROUP BY agency_name
HAVING COUNT(*) >= 50
ORDER BY avg_days_to_close DESC;