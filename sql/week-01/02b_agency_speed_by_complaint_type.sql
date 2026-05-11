-- Business question: For each agency, which complaint types take the longest?
-- Shows the worst-performing agency + complaint type combinations
-- Only includes complaint types with at least 20 requests per agency

SELECT 
    agency_name,
    complaint_type,
    COUNT(*) AS total_requests,
    ROUND(AVG(EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400), 1) AS avg_days_to_close,
    ROUND(MIN(EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400), 1) AS fastest_days,
    ROUND(MAX(EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400), 1) AS slowest_days
FROM service_requests_portfolio
WHERE closed_date IS NOT NULL 
    AND created_date IS NOT NULL
    AND complaint_type IS NOT NULL
GROUP BY agency_name, complaint_type
HAVING COUNT(*) >= 20
ORDER BY avg_days_to_close DESC
LIMIT 20;