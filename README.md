NHS Dental Activity Dashboard

Project Status

Completed portfolio project demonstrating healthcare data analysis and Tableau dashboard development using NHS dental activity data.

⸻

Project Overview

This project analyses NHS dental activity data to explore treatment distribution, patient mix, and practice efficiency across dental providers.

The objective is to understand how NHS dental services are delivered and identify patterns in workload and productivity using publicly available healthcare data.

The analysis was conducted using a cleaned dataset and visualised through a Tableau dashboard.

⸻

Table of Contents
	•	Project Overview
	•	Dashboard Preview
	•	Objectives
	•	Dataset
	•	Data Preparation
	•	Project Workflow
	•	Dashboard Visualisations
	•	Dashboard Interpretation
	•	Key Insights
	•	Tools Used
	•	Skills Demonstrated
	•	Repository Files
	•	Project Purpose

⸻

Dashboard Preview

<div align="center">


<img src="dental-dashboard.png" alt="NHS Dental Dashboard" width="800"/>


</div>



⸻

Objectives

This project addresses three key questions:
	1.	What is the distribution of NHS dental treatment bands?
	2.	What proportion of treatments fall into different patient categories?
	3.	How do dental practices compare in terms of efficiency and workload?

⸻

Dataset

The dataset used in this project comes from publicly available NHS dental statistics.

Two datasets are included in this repository.

Processed dataset

nhs_dental_activity_processed.csv
Cleaned and structured dataset used for analysis and visualisation.

Raw dataset

nhs_dental_activity_raw.zip
Original dataset compressed due to GitHub file size limits.

The processed dataset contains the fields required to reproduce the analysis and dashboard.

⸻

Data Preparation

Several preparation steps were performed before building the dashboard:
	•	Cleaning the raw dataset
	•	Structuring treatment band categories
	•	Creating patient category variables
	•	Calculating efficiency metrics such as Average UDA per Course of Treatment
	•	Preparing the dataset for Tableau visualisation

⸻

Project Workflow
	1.	NHS dental activity dataset obtained from publicly available NHS statistics.
	2.	Raw dataset cleaned and structured for analysis.
	3.	Treatment band categories standardised.
	4.	Patient mix variables created.
	5.	Efficiency metrics calculated (Average UDA per Course of Treatment).
	6.	Dataset imported into Tableau.
	7.	Dashboard created to analyse treatment distribution, patient mix, and practice efficiency.

⸻

Dashboard Visualisations

Patient Mix

This chart shows the proportion of treatments delivered to different patient categories:
	•	Paying patients
	•	Non-paying patients
	•	Child patients

It highlights the demographic structure of NHS dental service usage.

⸻

Treatment Band Mix

This chart visualises the distribution of NHS treatment bands, including:
	•	Band 1
	•	Band 2 (including subcategories 2a, 2b, 2c)
	•	Band 3
	•	Urgent Treatment
	•	Regulation 11 Replacement Appliance

The chart highlights which treatment types represent the largest share of NHS dental activity.

⸻

Practice Efficiency Scatter Plot

This scatter plot compares dental practices using two key measures:
	•	Total UDAs delivered (overall workload)
	•	Average UDA per Course of Treatment (efficiency)

Each point represents an individual dental practice.

A horizontal reference line indicates the benchmark efficiency level, allowing viewers to identify practices performing above or below the typical average.

⸻

Dashboard Interpretation

The dashboard enables comparison of dental practices in terms of workload and efficiency.

Practices positioned higher on the scatter plot deliver more UDAs per course of treatment, indicating higher treatment intensity or complexity.

Practices positioned further to the right deliver a larger total number of UDAs, indicating higher overall service volume.

The reference line at approximately 8.5 average UDAs per course of treatment acts as a benchmark to identify practices performing above or below the typical efficiency level.

⸻

Key Insights
	•	Band 2 treatments represent a large share of NHS dental activity.
	•	NHS dental services serve a mix of paying and exempt patients.
	•	Efficiency varies significantly across practices.
	•	Some practices deliver substantially higher average UDAs per treatment, indicating differences in service delivery patterns.

⸻

Tools Used
	•	Tableau
	•	SQL
	•	NHS Public Datasets

⸻

Skills Demonstrated
	•	Healthcare data analysis
	•	Data cleaning and preparation
	•	Exploratory data analysis
	•	Data visualisation using Tableau
	•	Dashboard design and storytelling
	•	GitHub project documentation

⸻

Repository Files

dashboard.twbx
Tableau packaged workbook containing the dashboard.

dental-dashboard.png
Exported dashboard image used for preview.

nhs_dental_activity_processed.csv
Cleaned dataset used for analysis.

nhs_dental_activity_raw.zip
Original dataset provided in compressed format.

⸻

Project Purpose

This project was created as part of a personal portfolio to demonstrate practical skills in healthcare data analysis, visualisation, and health informatics.

It showcases the ability to work with healthcare datasets and present insights through structured analytical workflows and data visualisation tools.

⸻
