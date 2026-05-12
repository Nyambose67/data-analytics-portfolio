-- Create agency category lookup for JOIN practice
CREATE TABLE IF NOT EXISTS agency_lookup AS
SELECT DISTINCT
	agency,
	agency_name,
	CASE
		WHEN agency IN ('DSNY', 'NYPD', 'FDNY') THEN 'Public Safety'
		WHEN agency IN ('DOF', 'DOB', 'DOT', 'DOITT') THEN 'Infrastructure'
		WHEN agency IN ('DPR', 'DEP') THEN 'Parks & Environment'
		ELSE 'Administrative'
	END AS agency_category
FROM service_requests_portfolio
WHERE agency IS NOT NULL;