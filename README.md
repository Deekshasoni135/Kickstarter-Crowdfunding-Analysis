# Kickstarter Crowdfunding Analysis

## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Data Cleaning](#data-cleaning)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Power BI Dashboard](#power-bi-dashboard)
- [Results](#results)
- [Recommendations](#recommendations)
- [References](#references)


## Project Overview

This data analysis project aims to analyze crowdfunding dynamics on platforms like Kickstarter, focusing on key areas such as project success rates, geographic distribution, success based on backer count, and category popularity.


## Data Sources

Crowdfunding data : The primary dataset used for this analysis is the “crowdfunding_data.csv” file, containing detailed information about project status, backers, geographical data of successful projects, and categories.


## Tools

- **Excel** – Used for Data Cleaning  
- **MySQL** – Data Analysis  
- **Power BI** – Creating KPI’s and Dashboard


## Data Cleaning

In this phase, I identified and corrected errors in the raw data:
- Handled missing values
- Removed duplicates
- Standardized date and category formats
- Corrected erroneous entries


## Exploratory Data Analysis

EDA involved exploring the crowdfunding data to answer key questions, such as:
- What is the overall successful projects?
- What is the percentage of successful projects by category?
- What is the percentage of successful projects by year, quarter and month?
- Top successful projects based on backers count and Amount raised?


## Data Analysis

Performed comprehensive data analysis using MySQL, focusing on Project status, geographic distribution, and total projects based on category.
- Total number of projects by status
<pre>  
SELECT state, COUNT(*) AS total_projects 
FROM projects 
GROUP BY state; </pre>
  
- Geographic distribution of projects
<pre>
SELECT location_id,
       COUNT(*) AS total_projects
FROM projects
GROUP BY location_id
ORDER BY total_projects DESC;  </pre>

- Project counts by category
<pre>
SELECT category,
       COUNT(*) AS total_projects
FROM projects
GROUP BY category
ORDER BY total_projects DESC;
</pre>

## Power BI Dashboard

Here is a preview of the dashboard that visualizes key insights from the crowdfunding data:

<img width="1326" height="728" alt="Power BI SS Dash-2" src="https://github.com/user-attachments/assets/b988f9ef-9e28-4616-a5b3-5a05624ed95a" />
 


## Results

- **140.31k** projects succeeded, while **188.24k** failed to meet funding goals. **32.5k** were canceled.
- The **United States** hosted the majority of projects.
- Top categories: **Product Design**, **Music**, and **Tabletop Games**.
- Peak year was **2015**; declining trends suggest a need for platform innovation.


## Recommendations

- Focus on high-potential categories (e.g., Product Design, Music).
- Expand globally by improving accessibility in other countries.
- Enhance user experience via creator support, mentorship, and educational content.
- Introduce pre-launch tools to improve campaign preparation.


## References

- [Epoch Time Converter](https://www.epochconverter.com/)


*Thank you for taking the time to explore my project. Your interest and support are greatly appreciated!* 😊
