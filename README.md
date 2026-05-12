# Data Analytics Portfolio

Welcome to my data analytics portfolio. I'm transitioning from Software Development + Business Analysis into Data Analysis.

## Project 1: NYC 311 Service Requests Analysis

**Goal:** Analyze service request patterns and agency performance

**Tools used:** Python (pandas), PostgreSQL, pgAdmin, Git

---

## Key Findings

### 1. Top Complaint Types
- **Literature Request** dominates: 2,937 out of 10,000 requests (29%)
- DOF Property issues represent ~30% of all complaints

### 2. Agency Performance: Raw vs Cleaned Data

**Raw data conclusion:** Department of Sanitation (DSNY) is the slowest agency at 97 days.

**After cleaning (removing negative dates + >365 day outliers):** 
- DSNY is actually one of the fastest at **3.2 days**
- **Revenue Accounting** is the slowest at 14.7 days

**Lesson:** Always validate your data before drawing conclusions.

### 3. Borough Backlog Analysis

| Borough | Backlog % | Avg Resolution Days |
|---------|-----------|---------------------|
| BRONX | 2.6% | 81.4 days |
| MANHATTAN | 0.8% | 31.8 days |
| BROOKLYN | 0.7% | 31.3 days |
| QUEENS | 0.5% | 42.6 days |
| STATEN ISLAND | 0.2% | 25.0 days |

**Key finding:** The Bronx has the worst service performance:
- Highest backlog (2.6% of requests still open)
- Slowest resolution (81 days — 3x slower than Staten Island)

### 4. Night Complaints (10 PM - 6 AM)

**Key finding:** Manhattan has 40% of all night complaints — double any other borough.

| Borough | Night Complaints | % of All Night |
|---------|------------------|----------------|
| MANHATTAN | 62 | 40% |
| BRONX | 31 | 20% |
| BROOKLYN | 31 | 20% |
| QUEENS | 28 | 18% |
| STATEN ISLAND | 4 | 3% |

**Insight:** Night complaints (noise, nightlife issues) are concentrated in Manhattan. Other boroughs have far fewer late-night complaints, likely due to different land use (residential vs commercial/entertainment).

### 5. Duplicate Service Requests

**Finding:** 10+ duplicate requests exist in the 10,000-row sample.

Examples:
- Same `"Literature Request"` in Queens submitted multiple times on the same day
- One `"DOF Property - Reduction Issue"` in Manhattan has 3 duplicate entries

**Implication:** Metrics like "total requests" may be overcounted by 0.1-0.5%. For high-volume complaints (Literature Request at 29%), duplicates could skew analysis.

**Recommendation:** Deduplicate by `complaint_type + borough + DATE(created_date)` before calculating volume metrics.

### 6. Duplicate Detection

After refining the logic (grouping by complaint_type, borough, date, descriptor, AND zip code), **only 3.2% of records are true duplicates.**

- Total records with complete data: 7,473
- Unique requests: 7,237
- Duplicates: 236 (3.2%)

**Takeaway:** The data is clean. The 43% duplicate rate from early analysis was a false alarm caused by over-aggressive grouping (ignoring descriptor and zip code).

**Lesson learned:** Always validate your logic by sampling actual rows before concluding.

---

## SQL Queries in This Project

| File | Purpose |
|------|---------|
| `01_top_complaint_types.sql` | Most common complaints |
| `02_agency_overall_speed_raw.sql` | Raw agency speeds (before cleaning) |
| `02b_agency_speed_by_complaint_type.sql` | Breakdown by complaint type |
| `02c_agency_overall_speed_cleaned.sql` | Cleaned agency speeds |
| `03_borough_backlog_analysis.sql` | Backlog by borough |

---

## Skills Demonstrated

- **SQL:** Aggregations, date arithmetic, conditional filtering, percentage calculations
- **Python:** Data cleaning with pandas, handling large CSVs
- **Data quality:** Identifying outliers, filtering bad data, raw vs cleaned comparison
- **Business analysis:** Translating questions into queries, finding actionable insights
- **Geographic analysis:** Borough-level performance comparison

---

## Connect with me

- **GitHub:** [github.com/Nyambose67](https://github.com/Nyambose67)
- **LinkedIn:** [https://www.linkedin.com/in/ntando-ntandazo-b81608334/]

---

*More projects coming soon: Power BI dashboards, customer churn analysis, sales forecasting*
