SELECT 
	complaint_type,
	COUNT(*) AS total_complaints
FROM service_requests_portfolio
GROUP BY complaint_type
ORDER BY total_complaints DESC
LIMIT 5;