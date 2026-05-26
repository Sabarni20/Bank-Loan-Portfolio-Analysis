-- ============================================================================
-- BANK LOAN PORTFOLIO MANAGEMENT & RISK ANALYTICS
-- ENVIRONMENT: SQLite Online (Preserves standard relational aggregations)
-- ============================================================================
-- 1. Financial KPI Extraction: High-Level Portfolio Performance
-- Calculates total applications, total funded amounts, and total repayments received
SELECT 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received,
    ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate,
    ROUND(AVG(dti) * 100, 2) AS Avg_DTI_Ratio
FROM financial_loan;
-- ----------------------------------------------------------------------------
-- TRANSACTION LAYER 2: TEMPORAL DISTRIBUTION (MONTH-ON-MONTH VELOCITY)
-- ----------------------------------------------------------------------------
-- Tracks capital velocity by grouping volume and payments chronologically
SELECT 
    strftime('%m', issue_date) AS Month_Num,
    CASE strftime('%m', issue_date)
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END AS Month_Name,
    COUNT(id) AS Monthly_Applications,
    SUM(loan_amount) AS Monthly_Funded_Amount,
    SUM(total_payment) AS Monthly_Received_Amount
FROM financial_loan
GROUP BY strftime('%m', issue_date)
ORDER BY Month_Num;
-- ----------------------------------------------------------------------------
-- TRANSACTION LAYER 3: CREDIT RISK CONCENTRATION SEGMENTATION
-- ----------------------------------------------------------------------------
-- Segregates assets into performing (Good) vs. non-performing (Bad Defaults)
SELECT
    loan_status,
    COUNT(id) AS Loan_Count,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount,
    ROUND((COUNT(id) * 100.0 / (SELECT COUNT(*) FROM financial_loan)), 2) AS Allocation_Percentage
FROM financial_loan
GROUP BY loan_status;
-- ----------------------------------------------------------------------------
-- TRANSACTION LAYER 4: MULTI-VARIABLE DEMOGRAPHIC RISK MATRIX
-- ----------------------------------------------------------------------------
-- Aggregates geographical concentration, loan intent, and asset collateralization
-- ----------------------------------------------------------------------------
-- TRANSACTION LAYER 4: MULTI-VARIABLE DEMOGRAPHIC RISK MATRIX (FIXED)
-- ----------------------------------------------------------------------------
-- Aggregates geographical concentration, loan intent, and asset collateralization
SELECT 
    address_state AS State,
    purpose AS Loan_Purpose,
    home_ownership AS Home_Ownership_Status,
    COUNT(id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded,
    SUM(total_payment) AS Total_Recovered
FROM financial_loan
GROUP BY address_state, Loan_Purpose, Home_Ownership_Status
ORDER BY Total_Applications DESC;