-- Business question: Which borough has the worst backlog?
-- Compares open requests vs resolution time by borough

SELECT 
    borough,
    COUNT(*) FILTER (WHERE status = 'Closed') AS closed_requests,
    COUNT(*) FILTER (WHERE status != 'Closed' OR closed_date IS NULL) AS open_backlog,
    COUNT(*) AS total_requests,
    ROUND(100.0 * COUNT(*) FILTER (WHERE status != 'Closed' OR closed_date IS NULL) / COUNT(*), 1) AS backlog_percentage,
    ROUND(AVG(EXTRACT(EPOCH FROM (closed_date - created_date)) / 86400)::numeric, 1) AS avg_resolution_days
FROM service_requests_portfolio
WHERE borough IS NOT NULL 
    AND borough != 'Unspecified'
    AND created_date IS NOT NULL
GROUP BY borough
ORDER BY backlog_percentage DESC;