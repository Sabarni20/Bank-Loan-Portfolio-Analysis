# Bank Loan Portfolio Optimization & Risk Analytics Pipeline

## 📌 Executive Project Overview
This repository contains an end-to-end data analytics and engineering pipeline designed to evaluate retail banking loan portfolios. Navigating through massive transactional credit histories, this project extracts business-critical Key Performance Indicators (KPIs), tracks default exposures, and provides interactive intelligence layers for data-driven risk management.

By combining rigorous statistical assessment with corporate strategy frameworks, this pipeline bridges the gap between deep data architecture and executive-level financial decision-making.

---

## 🛠️ Multi-Layered Technical Architecture
The project is explicitly engineered across a modular pipeline to ensure scalability and governance:

[ Raw CSV Data ] ➡️ [ SQL Staging & CTEs ] ➡️ [ Python EDA & Statistics ] ➡️ [ Power BI Dashboard ]

1. **Data Engineering Layer (`staging_queries.sql`)**
   * Built rigorous relational staging mechanisms to compute high-level portfolio metrics.
   * Utilized Common Table Expressions (CTEs), window functions, and logical partitions to calculate Month-to-Date (MTD) and MoM variations.
   * Implemented credit asset categorization to dynamically segregate the portfolio into "Good Loans" (Fully Paid/Current) vs. "Bad Loans" (Charged Off) to monitor non-performing assets (NPAs).

2. **Quantitative Discovery Layer (`demographic_eda.ipynb`)**
   * Leveraged Python (Pandas, NumPy, Seaborn) to examine mathematical distributions across risk variables.
   * Conducted variance and distribution profiling on continuous features like Debt-to-Income (DTI) ratios and interest rates to isolate structural default triggers.
   * Built multi-variable demographic matrices correlating employment history, income thresholds, and homeownership with risk frequencies.

3. **Business Intelligence Layer (`loan_dashboard.pbix`)**
   * Engineered a dynamic dashboard establishing an executive summary layer for C-suite reporting.
   * Features real-time sliceable matrices tracking regional allocation risks, credit grading tiers, and purpose-driven performance tracking to optimize loan provisioning strategies.

---

## 📈 Key Financial Metrics Analyzed
* **Portfolio Health:** Tracking Total Applications, Funded Capital, and Total Received Repayments.
* **Risk Thresholding:** Identifying structural breaking points in Debt-to-Income (DTI) segments where probability of default spikes.
* **Temporal Velocity:** Evaluating Month-to-Date (MTD) vs. Previous Month-to-Date (PMTD) shifts to catch sudden macro-credit contractions early.

---

## 🚀 Repository File Directory
* `/bank_loan_data.csv` : Raw consumer credit tracking transactional data.
* `/staging_queries.sql` : Production-ready SQL script containing full metric and data transformation logic.
* `/demographic_eda.ipynb` : Jupyter Notebook containing statistical distributions, visualization plots, and code.
* `/loan_dashboard.pbix` : Packaged interactive Power BI dashboard application.

📁 Bank-Loan-Portfolio-Analysis  (Your Repository)
│
├── 📄 bank_loan_data.csv        <-- Upload your raw dataset here
├── 📄 staging_queries.sql       <-- Paste the SQL queries file here
├── 📄 demographic_eda.ipynb     <-- Upload your Python notebook here
├── 📄 loan_dashboard.pbix       <-- Drop your Power BI file here
└── 📄 README.md                 <-- This is your "Clean Explanation" homepage
