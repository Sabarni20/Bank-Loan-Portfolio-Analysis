#!/usr/bin/env python
# coding: utf-8

# In[9]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Ingest clean data from staging layer
df = pd.read_excel('financial_loan.xlsx')

# 2. Check shapes and structural variables
print(f"Dataset Dimensions: {df.shape}")
print(df.info())

# 3. Mathematical Assessment: Risk Profile Distributions
# Evaluate internal banking risk matrices across key continuous metrics
plt.figure(figsize=(10, 5))
sns.histplot(data=df, x='dti', hue='loan_status', kde=True, bins=30, multiple="stack")
plt.title('Debt-to-Income (DTI) Distribution Profiles Across Loan Health States')
plt.xlabel('Debt-to-Income Ratio')
plt.ylabel('Volume of Accounts')
plt.savefig('dti_distribution.png')
plt.show()

# 4. MBA Business Analytics Domain Focus: Multi-Variable Demographic Evaluation
# Correlating employee duration metrics with average funding allocations and risk rates
demographic_pivot = df.groupby(['emp_length', 'home_ownership']).agg(
    Average_Loan_Val=('loan_amount', 'mean'),
    Total_Defaults=('loan_status', lambda x: (x == 'Charged Off').sum()),
    Total_Accounts=('id', 'count')
).reset_index()

demographic_pivot['Default_Rate'] = (demographic_pivot['Total_Defaults'] / demographic_pivot['Total_Accounts']) * 100
print(demographic_pivot.sort_values(by='Default_Rate', ascending=False).head(10))


# In[ ]:




