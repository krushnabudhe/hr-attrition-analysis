/* =====================================================
   HR ATTRITION ANALYSIS - SQL PROJECT
   Dataset: IBM HR Employee Attrition
   Author: Krushna Budhe
===================================================== */

-- 1️⃣ Overall Attrition Rate

SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM employee_attrition;



-- 2️⃣ Attrition by Department

SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Department
ORDER BY attrition_rate_percent DESC;



-- 3️⃣ Attrition by Age Group

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM employee_attrition
GROUP BY age_group
ORDER BY attrition_rate_percent DESC;



-- 4️⃣ Attrition by Overtime

SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM employee_attrition
GROUP BY OverTime
ORDER BY attrition_rate_percent DESC;



-- 5️⃣ Attrition by Salary Range

SELECT
    CASE
        WHEN MonthlyIncome BETWEEN 1000 AND 3000 THEN 'Low (1k-3k)'
        WHEN MonthlyIncome BETWEEN 3001 AND 6000 THEN 'Medium (3k-6k)'
        WHEN MonthlyIncome BETWEEN 6001 AND 10000 THEN 'High (6k-10k)'
        ELSE 'Very High (10k+)'
    END AS salary_range,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM employee_attrition
GROUP BY salary_range
ORDER BY attrition_rate_percent DESC;
