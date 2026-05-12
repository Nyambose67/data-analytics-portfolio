-- CORRECTED: Night complaints by borough (10 PM - 6 AM)
-- Removes the misleading avg_hour column

SELECT 
    borough,
    COUNT(*) AS night_complaints,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 1) AS pct_of_all_night_complaints
FROM service_requests_portfolio
WHERE (EXTRACT(HOUR FROM created_date) < 6 
   OR EXTRACT(HOUR FROM created_date) > 22)
  AND borough IS NOT NULL
  AND borough != 'Unspecified'
GROUP BY borough
ORDER BY night_complaints DESC;