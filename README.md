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
```sql
SELECT state, COUNT(*) AS total_projects 
FROM projects 
GROUP BY state;
```
  
- Geographic distribution of projects
```sql
SELECT location_id,
       COUNT(*) AS total_projects
FROM projects
GROUP BY location_id
ORDER BY total_projects DESC;
```

- Project counts by category
```sql
SELECT category,
       COUNT(*) AS total_projects
FROM projects
GROUP BY category
ORDER BY total_projects DESC;
```

## Power BI Dashboard

Here is a preview of the dashboard that visualizes key insights from the crowdfunding data:

<img width="1326" height="728" alt="Power BI SS Dash-2" src="https://github.com/user-attachments/assets/b988f9ef-9e28-4616-a5b3-5a05624ed95a" />
 


## Results
The analysis results are summarized as follows:
- Out of all analyzed crowdfunding campaigns, about **140,310 succeeded**, while **188,240 failed** and **32,500** were **canceled**. This shows the importance of proper planning and community support.

- The **United States** led in campaign volume, highlighting strong engagement with crowdfunding.

- **Top-performing categories** included **Product Design, Music, and Tabletop Games**, reflecting backer interest in innovation and creativity.

- Campaign activity peaked in **2015**, followed by a decline—suggesting a need to boost engagement and platform innovation.


## Recommendations
To enhance success rates and participation on crowdfunding platforms, consider the following:
- Prioritize popular categories like Product Design and Music, where success rates are higher.
- Expand globally by targeting underrepresented regions with localized content and marketing.
- Support creators pre-launch through evaluation tools, mentorship, and planning resources.
- Boost platform engagement using influencer campaigns, early-bird perks, and launch events.
- Innovate user experience to maintain interest and attract new users.
- Innovate user engagement strategies to boost participation and interest.


## References

- [Epoch Time Converter](https://www.epochconverter.com/)


*Thank you for taking the time to explore my project. Your interest and support are greatly appreciated!* 😊
