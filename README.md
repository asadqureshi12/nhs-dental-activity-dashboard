NHS Dental Activity Dashboard

Project Overview

This project analyses NHS dental activity data to explore treatment distribution, patient mix, and practice efficiency.
The goal is to understand how NHS dental services are delivered and identify patterns in workload and productivity across dental practices.

The analysis was performed using a cleaned dataset and visualised through a Tableau dashboard.

⸻

Dashboard Preview

<div align="center">


<img src="dental-dashboard.png" alt="NHS Dental Dashboard" width="800"/>


</div>


Note: The image is centered and scaled to 800px width for better readability.

⸻

Objectives

This project addresses three main questions:
	1.	What is the distribution of NHS dental treatment bands?
	2.	What proportion of treatments fall into different patient categories?
	3.	How do dental practices compare in terms of efficiency and workload?

⸻

Dataset

The dataset used in this project comes from publicly available NHS dental statistics.

Two datasets are included in this repository:

Processed dataset

nhs_dental_activity_processed.csv – cleaned and structured dataset used for analysis and visualisation.

Raw dataset

nhs_dental_activity_raw.zip – original NHS dataset, compressed due to size limits. This contains the full raw data before any transformation.

Note: The raw dataset exceeds GitHub upload limits, so it is provided as a ZIP file. The processed dataset is sufficient to reproduce the dashboard.

⸻

Data Preparation

Key steps before building the dashboard:
	•	Cleaning the raw dataset
	•	Structuring treatment band information
	•	Creating fields for patient categories
	•	Calculating efficiency metrics such as Average UDA per Course of Treatment

The processed dataset was then used to build the Tableau dashboard.

⸻

Dashboard Visualisations

Patient Mix

This chart shows the proportion of treatments by patient category:
	•	Paying patients
	•	Non-paying patients
	•	Child patients

It illustrates the demographic structure of NHS dental activity.

⸻

Treatment Band Mix

This visualisation shows the distribution of NHS treatment bands, including:
	•	Band 1
	•	Band 2 (and subcategories 2a, 2b, 2c)
	•	Band 3
	•	Urgent Treatment
	•	Regulation 11 Replacement Appliance

The chart highlights which types of dental treatments are most common.

⸻

Practice Efficiency Scatter Plot

This scatter plot compares dental practices using two measures:
	•	Total UDAs delivered (workload)
	•	Average UDA per Course of Treatment (efficiency)

Each point represents a dental practice.
A horizontal reference line highlights the benchmark efficiency level, allowing viewers to quickly identify practices performing above or below the threshold.

⸻

Key Findings
	•	Band 2 treatments account for a large share of NHS dental activity.
	•	Patient mix includes both paying and exempt groups.
	•	Efficiency varies across practices, with some delivering higher average UDAs per course of treatment.

⸻

Methodology
	1.	NHS dental activity data was obtained from public sources.
	2.	The raw dataset was cleaned and structured for analysis.
	3.	Additional fields were created to represent treatment bands and patient mix.
	4.	Efficiency metrics were calculated using average UDAs per course of treatment.
	5.	Visualisations were built in Tableau to explore activity patterns and practice productivity.

⸻

Tools Used
	•	Tableau
	•	SQL
	•	NHS public datasets

⸻

Repository Files
	•	dashboard.twbx – Tableau packaged workbook containing the dashboard.
	•	dental-dashboard.png – exported dashboard image (used in README).
	•	nhs_dental_activity_raw.zip – original dataset (compressed).
	•	nhs_dental_activity_processed.csv – cleaned dataset used for the dashboard.

⸻

Project Purpose

This project was created as part of a personal portfolio to demonstrate practical skills in healthcare data analysis, data visualisation, and health informatics.
It shows the ability to work with real healthcare datasets and communicate insights clearly.

⸻

Author

Independent project focused on healthcare data analytics and health informatics.

⸻
