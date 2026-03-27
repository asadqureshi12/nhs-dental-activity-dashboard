# NHS Dental Service Delivery & Access Pressure Analysis

**Data Source:** NHS Business Services Authority (BSA) Open Data — Financial Year 2024/25  
**Tools:** SQL (DBeaver / SQLite), Tableau  
**Status:** Complete — background portfolio project

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

## Dashboards

### Dashboard 1 — Practice Activity Overview

![Dashboard 1](dashboards/dashboard_1_practice_overview.png)

Three views here:

- **Patient type distribution** — roughly even split between children, non-paying adults, and paying adults across the dataset
- **Treatment band distribution** — Band 2 accounts for the largest share of UDA volume (43%), suggesting the majority of activity involves restorative rather than preventative work
- **Efficiency scatter plot** — plots total UDA against average UDA per course of treatment per practice, with an 8.5 UDA benchmark line. Most practices cluster below the benchmark; a small number of high-volume outliers deliver significantly fewer UDA per treatment course

---

### Dashboard 2 — Access Equity & System Pressure

![Dashboard 2](dashboards/dashboard_2_access_performance.png)

Three views here:

- **Access inequality — preventative vs emergency care by patient type**  
  This was the most striking finding. Children access routine Band 1 care 93.9% of the time, with only 6.1% urgent. Non-paying adults are almost the reverse — 37% of their dental contacts are urgent treatments. Paying adults sit in between at 15.7% urgent. This pattern is consistent with what you'd expect from a system where cost and access barriers push certain groups toward crisis-only care.

- **Top 10 high-pressure dental hotspots**  
  Ranked by raw urgent treatment volume. WA157JW stands out at 37,282 urgent courses — roughly 46% more than the second-ranked postcode.

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

### A note on Query 04

The service pressure index (urgent % of total COT per practice) was computed but not visualised. When sorted, the top-ranked postcodes showed close to 100% urgent treatment — which sounds alarming, but on inspection these are dedicated urgent dental care centres, not overwhelmed general practices. Their entire purpose is urgent care, so 100% is expected. To make this metric meaningful for general practices, you would need to filter out postcodes where urgent treatment is the only band present, or raise the minimum COT threshold significantly. This is flagged as a future refinement rather than a limitation of the analysis itself.

---

## Key Findings

- Non-paying adults experience urgent care at a rate six times higher than children — a clear equity signal that cost and access barriers are shaping how different groups use the service
- WA157JW is a significant outlier in urgent demand, nearly 50% above the next highest postcode
- UDA delivery grew consistently through 2024/25, but the growth in courses of treatment was flatter — suggesting treatments are becoming more complex on average (more UDA per course)
- Band 2 dominates the treatment mix at 43% of UDA, which points toward a system dealing more with repair than prevention

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
