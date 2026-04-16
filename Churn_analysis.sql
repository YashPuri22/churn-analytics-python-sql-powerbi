CREATE DATABASE churn_analysis;
USE churn_analysis;
SELECT * FROM cleaned_churn_data1;
SELECT COUNT(*) AS total_customers
FROM cleaned_churn_data1;

ALTER TABLE cleaned_churn_data1
RENAME COLUMN `Churn Binary` TO churnB;

SELECT 
    ROUND(AVG(churnB)*100,2) AS churn_rate_percentage
FROM cleaned_churn_data1;

SELECT
    contract,
    COUNT(*) AS total_customers,
    ROUND(AVG(churnB)*100,2) AS churn_rate
FROM cleaned_churn_data1
GROUP BY contract
ORDER BY churn_rate DESC;

SELECT 
    CASE 
        WHEN `Tenure Months` <= 12 THEN '0-1 Year'
        WHEN `Tenure Months` <= 24 THEN '1-2 Years'
        WHEN `Tenure Months` <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(churnB)*100,2) AS churn_rate
FROM cleaned_churn_data1
GROUP BY tenure_group
ORDER BY churn_rate DESC;

SELECT 
    `Payment Method`,
    COUNT(*) AS total_customers,
    ROUND(AVG(churnB)*100,2) AS churn_rate
FROM cleaned_churn_data1
GROUP BY `Payment Method`
ORDER BY churn_rate DESC;

SELECT 
    ROUND(SUM(`Monthly Charges`),2) AS total_revenue,
    ROUND(SUM(CASE WHEN churnB=1 THEN `Monthly Charges` ELSE 0 END),2) AS revenue_at_risk
FROM cleaned_churn_data1;

SELECT * FROM cleaned_churn_data1;