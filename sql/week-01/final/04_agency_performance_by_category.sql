-- Business question: How do different agency categories perform?
-- Categories: Public Safety, Infrastructure, Parks & Environment, Administrative
-- Insight: Public Safety takes 116 days (15x longer than Infrastructure at 8 days)

SELECT 
    al.agency_category,
    COUNT(*) AS total_requests,
    ROUND(AVG(EXTRACT(EPOCH FROM (srp.closed_date - srp.created_date)) / 86400)::numeric, 1) AS avg_resolution_days
FROM service_requests_portfolio srp
INNER JOIN agency_lookup al ON srp.agency = al.agency
WHERE srp.closed_date > srp.created_date
GROUP BY al.agency_category
ORDER BY avg_resolution_days DESC;