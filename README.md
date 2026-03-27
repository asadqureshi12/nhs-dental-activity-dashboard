# NHS Dental Service Delivery & Access Pressure Analysis

**Data Source:** NHS Business Services Authority (BSA) Open Data — Financial Year 2024/25  
**Tools:** SQL (DB Browser for SQLite), Tableau  
**Status:** Complete

---

## What This Project Is About

I wanted to look at whether NHS dental services are actually keeping up with patient demand, and where the pressure points are. The NHS BSA publishes dental activity data at practice level, broken down by treatment band and patient type — it's detailed enough to ask some genuinely useful questions, but messy enough to need careful handling before you can trust the numbers.

The core question I tried to answer was:

> *Is NHS dental service delivery keeping up with patient demand over time, and which patient groups and geographic areas are bearing the most pressure?*

That breaks down into three sub-questions:
1. How has dental activity changed quarter by quarter through 2024/25?
2. Are certain patient groups relying disproportionately on urgent/emergency care rather than routine treatment?
3. Which practice postcodes are carrying the heaviest urgent care burden?

---

## Data Workflow
Before any analysis, we gathered raw NHS dental activity data at the practice level. This dataset required significant cleaning and standardization to ensure reliable results. We removed nulls, validated patient types, and restructured columns for easier analysis.

Once the data was prepared, we aggregated it to calculate key metrics such as total UDA delivered, courses of treatment by band and patient type, and urgent care volume by postcode. These metrics were then visualized in Tableau, providing clear insights into service delivery trends, patient access patterns, and geographic pressure points.

This workflow—from raw data gathering to cleaning, analysis, and visualization—ensures that every chart and finding reflects accurate, trustworthy information rather than unprocessed source data.

---

## Dashboards

### Dashboard 1 — Practice Activity Overview

![Dashboard 1](dashboards/dashboard_1_practice_overview.png)

Three views here:

- **Patient type distribution (COT volume)** — paying adults account for the largest share of clinical activity at 17.9M courses, followed by children at 11.9M. Non-paying adults are notably lower at 5.5M — which when read alongside Dashboard 2 suggests this group is accessing the service less overall but relying more heavily on urgent care when they do.
- **Treatment band distribution (COT volume)** — Band 1 dominates at 60.45%, meaning the majority of NHS dental activity is check-up and prevention level work. Band 2 accounts for 25.26%. Urgent treatment makes up 10.33% of total COT volume — a meaningful proportion given it represents unplanned, crisis-driven demand.
- **Efficiency scatter plot** — plots total UDA against average UDA per course of treatment per practice, with an 8.5 UDA benchmark line. Most practices cluster well below the benchmark, with efficiency dropping further as total UDA volume increases. A small number of high-volume outliers beyond 220K UDA show noticeably lower UDA per treatment course, suggesting larger practices may be handling a higher proportion of lighter-touch treatments.

---

### Dashboard 2 — Access Equity & System Pressure

![Dashboard 2](dashboards/dashboard_2_access_performance.png)

Three views here:

- **Access inequality — preventative vs emergency care by patient type**  
  This was the most striking finding. Children access routine Band 1 care 93.9% of the time, with only 6.1% urgent. Non-paying adults are almost the reverse — 37% of their dental contacts are urgent treatments. Paying adults sit in between at 15.7% urgent. This pattern is consistent with what you'd expect from a system where cost and access barriers push certain groups toward crisis-only care.

- **Top 10 high-pressure dental hotspots**
Ranked by raw urgent treatment volume. One postcode stands out as a clear outlier, with significantly higher urgent activity than the rest.

Outliers like this are typically driven by structural factors rather than purely local demand. These can include high-volume practices, centralised urgent care providers, or locations serving a wider catchment area. As postcode-level data reflects provider location rather than patient origin, high volumes often mean activity is concentrated at one site rather than spread across the area.

While a relative measure such as percentage-based pressure (urgent care as a share of total activity) was considered, it was not used here because it can be misleading at the postcode level. Smaller or specialist urgent care centres often appear as 100% by definition, which does not necessarily indicate system strain. Using raw urgent volume provides a clearer view of where the actual workload burden sits, making it more useful for identifying areas that may require additional resources or capacity.

- **Quarterly workload and growth**  
  UDA delivery grew steadily from Q1 to Q4. The quarter-on-quarter growth rate dips sharply at Q3 before recovering — this is visible in the LAG-based query output and likely reflects seasonal patterns in NHS dental scheduling.

---

## SQL Pipeline

The project follows a clean end-to-end pipeline. All queries are in the `/sql` folder.

| File | Purpose |
|---|---|
| `cleaning_the_data.sql` | Standardises formatting, removes nulls, validates patient types |
| `quarterly_summary.sql` | Total UDA and COT by financial quarter |
| `urgent_pressure_by_postcode.sql` | Top 10 postcodes by urgent treatment volume |
| `patient_type_impact.sql` | Band 1 vs urgent care split by patient type |
| `service_pressure_index.sql` | Urgent care as % of total workload per practice |
| `quarterly_recovery_trend.sql` | Quarter-on-quarter UDA growth using LAG window function |
| `dental_practice_master_volume.sql` | Full practice-level breakdown — COT by band, patient type, workload intensity |

---

## Key Findings

- Non-paying adults experience urgent care at a rate six times higher than children — a clear equity signal that cost and access barriers are shaping how different groups use the service
- WA157JW is a significant outlier in urgent demand, nearly 50% above the next highest postcode
- UDA delivery increased overall through 2024/25 but not evenly — growth accelerated in Q2, dropped in Q3, then partially recovered in Q4, suggesting seasonal variation rather than consistent system improvement
- Band 1 dominates the treatment mix at 60.45% of COT volume, indicating the majority of NHS dental activity is preventative in nature — however urgent treatment still accounts for 10.33%, representing a significant volume of unplanned crisis-driven demand

---

## Repo Structure

```
nhs-dental-dashboard/
│
├── README.md
├── dashboards/
│   ├── dashboard_1_practice_overview.png
│   └── dashboard_2_access_performance.png
├── sql/
│   ├── cleaning_the_data.sql
│   ├── quarterly_summary.sql
│   ├── urgent_pressure_by_postcode.sql
│   ├── patient_type_impact.sql
│   ├── service_pressure_index.sql
│   ├── quarterly_recovery_trend.sql
│   └── dental_practice_master_volume.sql
├── data/
│   ├── dtable_raw          ← original NHS BSA download
│   ├── dtable_cleaned      ← output of cleaning_the_data.sql
│   └── source_note.md
└── outputs/
    ├── quarterly_summary.csv
    ├── quarterly_recovery_trend.csv
    ├── urgent_pressure_by_postcode.csv
    ├── service_pressure_index.csv
    └── patient_type_impact.csv
```

## How This Project Answers the Questions

This project was designed to directly answer the overarching question:

> *Is NHS dental service delivery keeping up with patient demand over time, and which patient groups and geographic areas are bearing the most pressure?*

It does so by addressing each of the sub-questions:

1. **Quarter-by-quarter dental activity changes**  
   Using the **Quarterly Summary and Recovery Trend dashboards**, we track total UDA and COT delivered over the four financial quarters of 2024/25. The dashboards and SQL pipeline show both absolute volumes and growth percentages, revealing trends such as seasonal dips and overall increases in service delivery.

2. **Patient group reliance on urgent vs routine care**  
   The **Patient Type and Treatment Band charts** in Dashboard 1 and Dashboard 2 compare Band 1, Band 2, Band 3, and urgent treatments across children, paying adults, and non-paying adults. This shows clearly that non-paying adults rely disproportionately on urgent care, children mostly access routine care, and paying adults are in between. This answers the question of access inequality.

3. **Practice-level and geographic pressure points**  
   The **Urgent Pressure by Postcode and Service Pressure Index views** highlight the postcodes where urgent treatments are highest and where urgent care represents the largest share of total activity. By ranking and visualizing the top hotspots, the project identifies which areas and practices are under the most system pressure, both in absolute volume and relative intensity.

Overall, the combination of aggregated metrics, patient-level breakdowns, and geographic mapping allows this project to provide a full picture of both **service delivery trends** and **system pressure points**, making it clear where NHS dental services are performing well and where access challenges persist.
