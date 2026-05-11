# Data Analytics Portfolio

Welcome to my data analytics portfolio. I'm transitioning from Software Development + Business Analysis into Data Analysis.

## Project 1: NYC 311 Service Requests Analysis

**Goal:** Analyze service request patterns and agency performance

**Tools used:** Python (pandas), PostgreSQL, pgAdmin

**Key findings:**
- Top complaint type: Literature Request (2,937 out of 10,000 requests)
- DOF Property issues represent ~30% of all complaints

---

## Key Insight: Data Quality Changes Everything

**Raw data conclusion:** Department of Sanitation (DSNY) is the slowest agency at 97 days.

**After cleaning (removing negative dates + >365 day outliers):** DSNY is actually one of the fastest at 3.2 days. 

Revenue Accounting is the slowest at 14.7 days.

**Lesson:** Always validate your data before drawing conclusions. Raw data can be misleading without proper cleaning.

---

**Files:**
- `01_top_complaint_types.sql` - SQL query identifying most common complaints
- `02_agency_overall_speed_raw.sql` - Raw agency speeds (before cleaning)
- `02b_agency_speed_by_complaint_type.sql` - Breakdown by complaint type
- `02c_agency_overall_speed_cleaned.sql` - Cleaned agency speeds
- `311_clean_portfolio.csv` - Cleaned dataset ready for analysis

**Skills demonstrated:**
- Data cleaning with Python
- SQL aggregation and grouping
- Data quality validation
- Business analysis translation

---

*More projects coming soon*