# Project 2 — Customer Churn / Retention Analysis

This project focuses on understanding **why customers churn, which customers are at risk, and what customer segments are more valuable to the business**.

The analysis was completed using **SQL Server, Python/Pandas, and Power BI**, following an end-to-end data analysis workflow.

## Project Workflow

Excel Dataset → SQL Server → Data Cleaning & Analysis → Python EDA → Power BI Dashboard → Business Insights

## Project Structure

Project_2_Customer_Churn_Analysis  
├── Dataset  
├── SQL  
├── Python  
├── PowerBI  
└── Documentation  

## Data Flow

Excel  
↓  
SQL Server  
↓  
Multiple SQL Tables  
↓  
JOINs / LEFT JOINs  
↓  
`vw_CustomerChurnAnalysis`  
↓  
Python/Pandas + Power BI  

The raw Excel data was loaded into SQL Server. Multiple tables were joined to create the consolidated view **`vw_CustomerChurnAnalysis`**, which was then used for both Python analysis and the Power BI dashboard.

## Python Analysis

The SQL view was connected to Python using **PyODBC** and analyzed using Pandas.

The analysis included checking the data structure, data types, missing values, duplicates, categorical values, numerical ranges, and business logic before moving into exploratory analysis.

**Libraries used:** Pandas, NumPy, Matplotlib, Seaborn, PyODBC.

I also explored creating the dashboard using **Python and Matplotlib** to understand how the analysis could be presented programmatically. For the final dashboard, I used **Power BI** because it provided better interactivity and was more suitable for presenting the required KPIs and business insights.

## Power BI Dashboard

The final dashboard focuses on the following analysis:

- Churned vs. non-churned customers
- Total revenue
- CLTV of non-churned customers
- Churn by churn category
- Top 20 churned states
- Churn score below 50 vs. above 50
- Churn by internet type
- Unlimited vs. limited data usage
- Customer distribution by offer

A dashboard preview image is included in the repository.

## Business Focus

The main goal of this project is to understand **customer churn patterns, customer value, and factors associated with churn**. The insights can help identify high-risk customer segments and support better customer retention decisions.

## Tools Used

**SQL Server | Python | Pandas | NumPy | Matplotlib | Seaborn | PyODBC | Power BI | DAX | Power Query**
