-- INSIGHT: Raw data showed DSNY at 97 days. After cleaning (removing negatives + >365 day outliers),
-- DSNY drops to 3.2 days. Revenue Accounting is actually the slowest at 14.7 days.
-- This demonstrates the importance of data quality checks before drawing conclusions.

SELECT 
    agency_name,
    COUNT(*) AS total_closed_requests,
    ROUND(AVG(EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400)::numeric, 1) AS avg_days,
    ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400))::numeric, 1) AS median_days
FROM service_requests_portfolio
WHERE closed_date IS NOT NULL 
    AND created_date IS NOT NULL
    AND closed_date > created_date
    AND closed_date < created_date + INTERVAL '365 days'
GROUP BY agency_name
HAVING COUNT(*) >= 50
ORDER BY avg_days DESC;