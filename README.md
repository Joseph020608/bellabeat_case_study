# Bellabeat Case Study (Google Data Analytics Capstone)

## Overview
This project analyzes smart device usage data to identify trends in daily activity behavior and translate those insights into high-level marketing and product recommendations for **Bellabeat Spring** (smart water bottle).

## Business Task
Analyze non-Bellabeat smart device usage to:
1. Identify trends in smart device usage  
2. Explain how these trends could apply to Bellabeat customers  
3. Provide recommendations to support Bellabeats marketing strategy (focused on Spring)

## Tools
- **MySQL**: data cleaning, transformation, and analysis  
- **Excel**: summary tables and visualizations (bar charts + scatter plot)  
- **PowerPoint**: final presentation of findings and recommendations  

## Data Source
- Fitbit Fitness Tracker Data (public dataset commonly used in the Bellabeat case study).  
  *(Raw data may not be included in this repository due to size/licensing. See the `data/` section or notes in the repo for how to obtain it.)*

## Process (High Level)
1. Imported raw daily activity data into MySQL
2. Created a cleaned table with parsed dates
3. Flagged and excluded likely **non-wear** records (0 steps + 1440 sedentary minutes) using a filtered view  
   - Rows before filtering: **940**  
   - Rows after filtering: **868**  
   - Excluded records: **72**
4. Built summary metrics and visualizations in Excel
5. Prepared a presentation with key findings and recommendations for Bellabeat Spring

## Key Metrics (After Filtering)
- **Average steps/day:** 8,271.47  
- **Average calories/day:** 2,353.33  
- **Average sedentary minutes/day:** 953.98  
- **Average active minutes/day:** 246.42  
  *(active minutes = very + fairly + lightly active minutes)*

## Insights (Highlights)
- Activity varies by weekday, with higher average steps on some days compared to others.
- Most records fall into low-activity segments:
  - **Sedentary (0_12k steps):** 687 records  
  - **Lightly active (12k_24k steps):** 173 records  
  - **Active (24k+ steps):** 3 records  
  - **Zero steps (other):** 5 records  
- Steps and calories show a positive relationship (visualized via scatter plot).

## Recommendations (High Level)  Bellabeat Spring
1. **Spring + Premium Trial Bundle:** Offer Spring with a 1_3 month premium trial, then use loyalty pricing to drive subscription conversion.
2. **Hydrate & Move Micro-Habits:** Use smart reminders to encourage hydration and short movement breaks for users with high sedentary behavior.
3. **Weekly Challenges & Rewards:** Create weekly habit challenges with daily reminders and Sunday rewards (discounts/points) to improve consistency and retention.

## Repository Structure
- `sql/` _ SQL scripts used for cleaning and analysis  
- `excel/` _ Excel tables and charts  
- `presentation/` _ Final PowerPoint presentation  
- `reports/` _ Written report (PDF/DOCX)

## How to Reproduce (Quick Guide)
1. Download the dataset (Fitbit daily activity file)
2. Import the CSV into MySQL (raw table)
3. Run the SQL script to create the cleaned table and filtered view
4. Export the analysis query outputs to Excel and build charts
5. Review the presentation for insights and recommendations