# Bank Loan Analysis
This repository contains code and datasets for analyzing bank loan applications. 

## Table of content
- [Project Overview](#project-overview)
- [Data Source](#data-source)

## Project Overview
This project involves conducting an extensive examination of bank loan data by utilizing SQL for powerful data querying and manipulation. The analysis is enhanced with advanced visualization tools like Power BI and Excel. Its main aim is to uncover actionable insights related to loan applications, funding, repayments, and borrower demographics. The analysis covers diverse dimensions such as monthly trends, loan terms, state-level analysis and loan purposes, home ownership.

## Data Source
Loan data: The primary dataset used for this analysis is the “financial_loan.csv”, encompassing various aspects of bank loans, including loan amounts, issue dates, interest rates, DTI ratios, and loan statuses.

## Tools
- Postgresql: Used for database management, querying, and data analysis. SQL queries were crucial in extracting key metrics and insights from the loan dataset.
- Excel: Utilized for data cleaning, processing, and conducting preliminary analyses. Excel provided a platform for validating data integrity and performing initial calculations.
- Power BI: Employed for data visualization and dashboard creation. Power BI enabled the creation of interactive dashboards that visualize loan portfolio performance and trends.

## Methodology
Our approach to analyzing the bank loan data involved a multi-step, systematic process designed to ensure thorough data examination and insightful visualization. Below, we outline each stage of our methodology:

### Data Ingestion and Database Creation:

Objective: Establish a robust foundation for data storage and retrieval.
Process: A relational database was created in Microsoft SQL Server to store comprehensive loan data, ensuring data integrity and accessibility.

### Data Analysis and SQL Queries:

Objective: Extract meaningful insights and key performance indicators (KPIs).
Process: SQL queries were meticulously developed to retrieve essential KPIs, including total and monthly loan applications, funded amounts, and average interest rates. This step facilitated the identification of critical trends and performance metrics.

### Data Processing in Excel:

Objective: Perform initial data cleaning and preliminary analysis.
Process: The dataset underwent further cleaning and processing in Excel, which included data validation and the generation of preliminary insights. This step ensured the accuracy and reliability of the data before more advanced analysis.

### Categorization of Loans:

Objective: Classify loans based on repayment performance.
Process: Loans were categorized into 'Good' or 'Bad' based on their repayment status. This classification provided a clear distinction between performing and non-performing loans, which is crucial for risk assessment and management.

### Temporal and Categorical Analysis:

Objective: Examine the data across various dimensions and time frames.
Process: Detailed analysis was conducted based on multiple factors, including issue month, state, loan term, employee length, loan purpose, and home ownership status. This multifaceted analysis enabled a comprehensive understanding of the factors influencing loan performance.

### Visualization:

Objective: Transform data into actionable visual insights.
Process: The results from the SQL queries were visualized using Power BI, Excel, and Tableau. These visualizations were designed to ensure data consistency and to provide a clear, graphical representation of the findings. This step was critical for communicating insights effectively to stakeholders.

## Key Insights and Findings
The analysis results are summarized as follows:

- Total Loan Applications: Detailed breakdown of total loan applications, including distinctions between Month-To-Date (MTD) and Previous Month-To-Date (PMTD) applications, providing insights into monthly application trends.
- Total Funded Amount vs. Amounts Received: Analysis of the bank's liquidity and loan performance, comparing total funded amounts with actual amounts received, highlighting discrepancies and potential financial adjustments.
- Average Interest Rate and DTI (Debt-to-Income Ratio): Examination of borrower financial health through average interest rates and DTI ratios, aiding in assessing borrowers' ability to manage debt obligations.
- Loan Categorization: Segmentation of loans into 'Good' and 'Bad' categories based on repayment status, offering a comprehensive view of the loan portfolio's risk profile and potential credit losses.
- Detailed Breakdowns by Various Factors: In-depth analysis by loan status, purpose, state, term, and other factors to identify underlying patterns and trends influencing loan performance and customer behaviour.


