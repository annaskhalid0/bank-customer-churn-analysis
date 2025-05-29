--1. Total Customers and Churn Rate

SELECT 
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) AS Churned_Customers,
  ROUND(SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers;

--2. Churn by Region

SELECT 
  Region,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) AS Churned_Customers,
  ROUND(SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY Region
ORDER BY Churn_Rate DESC;

--3. Churn by Gender

SELECT 
  Gender,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) AS Churned_Customers,
  ROUND(SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY Gender;

--4. Average Credit Score, Income, and Balance by Churn Status

SELECT 
  Churned,
  ROUND(AVG(Credit_Score), 2) AS Avg_Credit_Score,
  ROUND(AVG(Income), 2) AS Avg_Income,
  ROUND(AVG(Account_Balance), 2) AS Avg_Balance
FROM bank_customers
GROUP BY Churned;

--5. Products Held vs Churn

SELECT 
  Products_Held,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) AS Churned_Customers,
  ROUND(SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY Products_Held
ORDER BY Products_Held;

--6. Credit Score Band vs Churn (Advanced)

SELECT 
  CASE
    WHEN Credit_Score >= 750 THEN 'Excellent'
    WHEN Credit_Score >= 650 THEN 'Good'
    WHEN Credit_Score >= 500 THEN 'Fair'
    ELSE 'Poor'
  END AS Credit_Band,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) AS Churned_Customers,
  ROUND(SUM(CASE WHEN Churned = 'CHURNED' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate
FROM bank_customers
GROUP BY Credit_Band;