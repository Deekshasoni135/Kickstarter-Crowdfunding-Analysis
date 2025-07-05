USE project_db;

-- Q1
SELECT 
    ProjectID,
    FROM_UNIXTIME(created_at) AS Created_Date,
    FROM_UNIXTIME(deadline) AS Deadline_Date,
    FROM_UNIXTIME(updated_at) AS Updated_Date,
    FROM_UNIXTIME(state_changed_at) AS State_Changed_Date,
    FROM_UNIXTIME(launched_at) AS Launched_Date
FROM projects;

-- Q2 Calendar
CREATE TABLE calendar (
    Date DATE PRIMARY KEY,
    Year INT,
    MonthNo INT,
    MonthFullName VARCHAR(20),
    Quarter CHAR(2),
    YearMonth VARCHAR(10),
    WeekdayNo INT,
    WeekdayName VARCHAR(10),
    FinancialMonth CHAR(3),
    FinancialQuarter CHAR(3)
);
INSERT IGNORE INTO calendar (Date, Year, MonthNo, MonthFullName, Quarter, YearMonth, WeekdayNo, WeekdayName, FinancialMonth, FinancialQuarter) 
SELECT DISTINCT  
    DATE_ADD('1970-01-01', INTERVAL created_at SECOND) AS DateValue,  
    YEAR(DATE_ADD('1970-01-01', INTERVAL created_at SECOND)),  
    MONTH(DATE_ADD('1970-01-01', INTERVAL created_at SECOND)),  
    MONTHNAME(DATE_ADD('1970-01-01', INTERVAL created_at SECOND)),  
    CONCAT('Q', QUARTER(DATE_ADD('1970-01-01', INTERVAL created_at SECOND))),  
    LEFT(DATE_FORMAT(DATE_ADD('1970-01-01', INTERVAL created_at SECOND), '%Y-%b'), 10),  
    WEEKDAY(DATE_ADD('1970-01-01', INTERVAL created_at SECOND)) + 1,  
    DAYNAME(DATE_ADD('1970-01-01', INTERVAL created_at SECOND)),  
    CONCAT('FM', MOD(MONTH(DATE_ADD('1970-01-01', INTERVAL created_at SECOND)) + 8, 12) + 1),  
    CONCAT('FQ', CEIL((MOD(MONTH(DATE_ADD('1970-01-01', INTERVAL created_at SECOND)) + 8, 12) + 1) / 3))  
FROM projects;

-- Calendar Table Final
select * from calendar;


-- Q3 Build the Data Model
ALTER TABLE projects ADD COLUMN Created_Date DATE;
UPDATE projects SET Created_Date = FROM_UNIXTIME(created_at);
SELECT 
    p.category_id, 
    (COUNT(CASE WHEN p.state = 'successful' THEN 1 END) / total.total_count * 100) AS Success_Percentage 
FROM projects p
JOIN (
    SELECT category_id, COUNT(*) AS total_count 
    FROM projects 
    GROUP BY category_id
) total 
ON p.category_id = total.category_id
GROUP BY p.category_id;



-- 4. Convert Goal Amount to USD
SELECT 
    ProjectID, 
    goal * static_usd_rate AS Goal_in_USD
FROM projects;


-- 5. Projects Overview KPIs
-- Total Number of Projects based on outcome
SELECT state, COUNT(*) AS Total_Projects FROM projects GROUP BY state;
--  Total Number of Projects based on Locations
SELECT location_id, COUNT(*) AS Total_Projects FROM projects GROUP BY location_id;
--  Total Number of Projects based on  Category
SELECT category_id, COUNT(*) AS Total_Projects FROM projects GROUP BY category_id;
-- Total Number of Projects created by Year , Quarter , Month
SELECT YEAR(FROM_UNIXTIME(created_at)) AS Year, COUNT(*) FROM projects GROUP BY Year;
SELECT QUARTER(FROM_UNIXTIME(created_at)) AS Quarter, COUNT(*) FROM projects GROUP BY Quarter;
SELECT MONTH(FROM_UNIXTIME(created_at)) AS Month, COUNT(*) FROM projects GROUP BY Month;

-- 6. Successful Projects Analysis

-- Amount Raised 
SELECT SUM(usd_pledged) AS Amount_Raised FROM projects WHERE state = 'successful';

-- Number of Backers
SELECT SUM(backers_count) AS Total_Backers FROM projects WHERE state = 'successful';

-- Avg NUmber of Days for successful projects
SELECT AVG(DATEDIFF(FROM_UNIXTIME(deadline), FROM_UNIXTIME(launched_at))) AS Avg_Success_Days FROM projects WHERE state = 'successful';



-- 7. Top Successful Projects

--  Based on Number of Backers
SELECT ProjectID, name, backers_count FROM projects WHERE state = 'successful' ORDER BY backers_count DESC LIMIT 10;


--   Based on Amount Raised
SELECT ProjectID, name, usd_pledged FROM projects WHERE state = 'successful' ORDER BY usd_pledged DESC LIMIT 10;





-- 8. Success Percentage Calculations

--   Percentage of Successful Projects  by Category

SELECT (COUNT(*) / (SELECT COUNT(*) FROM projects) * 100) AS Success_Percentage FROM projects WHERE state = 'successful';

--    Percentage of Successful Projects by Year , Month 
SELECT 
    p.category_id, 
    (COUNT(CASE WHEN p.state = 'successful' THEN 1 END) / total.total_count * 100) AS Success_Percentage
FROM projects p
JOIN (
    SELECT category_id, COUNT(*) AS total_count
    FROM projects
    GROUP BY category_id
) total 
ON p.category_id = total.category_id
WHERE p.state = 'successful'
GROUP BY p.category_id;


--  percentage of Successful projects by Goal Range 
SELECT 
    YEAR(FROM_UNIXTIME(p.created_at)) AS Year,
    (COUNT(*) / total.total_count * 100) AS Success_Percentage
FROM projects p
JOIN (
    SELECT YEAR(FROM_UNIXTIME(created_at)) AS year, COUNT(*) AS total_count
    FROM projects
    GROUP BY YEAR(FROM_UNIXTIME(created_at))
) total 
ON YEAR(FROM_UNIXTIME(p.created_at)) = total.year
WHERE p.state = 'successful'
GROUP BY YEAR(FROM_UNIXTIME(p.created_at));

