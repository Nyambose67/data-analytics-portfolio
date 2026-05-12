-- Business question: Find true duplicates (same complaint, borough, date, descriptor, zip code)
-- This is the refined version after discovering that same-day + same complaint type is too aggressive

WITH ranked AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY 
                complaint_type, 
                borough, 
                DATE(created_date),
                descriptor,
                incident_zip
            ORDER BY created_date
        ) AS rn
    FROM service_requests_portfolio
    WHERE complaint_type IS NOT NULL 
      AND borough IS NOT NULL
      AND borough != 'Unspecified'
      AND descriptor IS NOT NULL
      AND descriptor != ''
      AND incident_zip IS NOT NULL
      AND incident_zip != 0
)
SELECT 
    COUNT(*) AS total_raw,
    SUM(CASE WHEN rn = 1 THEN 1 ELSE 0 END) AS unique_requests,
    COUNT(*) - SUM(CASE WHEN rn = 1 THEN 1 ELSE 0 END) AS duplicate_count,
    ROUND(100.0 * (COUNT(*) - SUM(CASE WHEN rn = 1 THEN 1 ELSE 0 END)) / COUNT(*), 1) AS duplicate_percentage
FROM ranked;