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
- **LinkedIn:** [Add your LinkedIn link here]

---

*More projects coming soon: Power BI dashboards, customer churn analysis, sales forecasting*