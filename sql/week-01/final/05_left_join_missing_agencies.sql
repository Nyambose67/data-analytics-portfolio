-- Business question: Which agencies are missing from the lookup table?
-- These agencies have no category assigned (gaps in our data)
-- We need to either add them to lookup or investigate why they're missing

SELECT 
    srp.agency,
    srp.agency_name,
    COUNT(*) AS total_requests,
    MIN(srp.created_date) AS first_request,
    MAX(srp.created_date) AS last_request
FROM service_requests_portfolio srp
LEFT JOIN agency_lookup al ON srp.agency = al.agency
WHERE al.agency_category IS NULL
GROUP BY srp.agency, srp.agency_name
ORDER BY total_requests DESC;