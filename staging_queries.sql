-- 1. Database Initialization & Schema Verification
CREATE DATABASE IF NOT EXISTS bank_analytics;
USE bank_analytics;

-- 2. Financial KPI Extraction: High-Level Portfolio Performance
-- Calculates total applications, total funded amounts, and total repayments received
SELECT 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received,
    ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate,
    ROUND(AVG(dti) * 100, 2) AS Avg_DTI_Ratio
FROM bank_loan_data;

-- 3. Temporal Performance: Month-to-Date (MTD) vs Previous Month-to-Date (PMTD)
-- Vital for Big Four financial reporting structures
SELECT 
    MONTH(issue_date) AS Month_Num,
    MONTHNAME(issue_date) AS Month_Name,
    COUNT(id) AS Monthly_Applications,
    SUM(loan_amount) AS Monthly_Funded_Amount,
    SUM(total_payment) AS Monthly_Received_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY Month_Num;

-- 4. Risk Segmentation: Good Loans vs. Bad Loans (Classification Query)
-- Good Loans: Fully Paid or Current. Bad Loans: Charged Off / Defaulted.
SELECT
    loan_status,
    COUNT(id) AS Loan_Count,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount,
    ROUND((COUNT(id) / (SELECT COUNT(*) FROM bank_loan_data)) * 100, 2) AS Allocation_Percentage
FROM bank_loan_data
GROUP BY loan_status;

-- 5. Deep-Dive Business Analytics Matrix
-- Aggregates credit profile behaviors across geographic distributions and regional branch segments
SELECT 
    address_state AS State,
    purpose AS Loan_Purpose,
    home_ownership AS Home_Ownership_Status,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded,
    SUM(total_payment) AS Total_Recovered
FROM bank_loan_data
GROUP BY address_state, purpose, home_ownership
ORDER BY Total_Applications DESC;
