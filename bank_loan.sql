CREATE TABLE financial_loan(
id INTEGER,
address_state VARCHAR(50),
application_type VARCHAR(50),
emp_length VARCHAR(50),
emp_title VARCHAR(100),
grade VARCHAR(50),home_ownership VARCHAR(50),
issue_date DATE,
last_credit_pull_date DATE,
last_payment_date DATE,
loan_status VARCHAR(100),
next_payment_date DATE,
member_id INTEGER,
purpose VARCHAR(50),
sub_grade VARCHAR(50),
term VARCHAR(100),
verification_status VARCHAR(50),
annual_income REAL,
dti REAL,
installment DOUBLE PRECISION,
int_rate REAL,
loan_amount INTEGER,
total_acc INTEGER,
total_payment INTEGER	
)

SELECT * FROM financial_loan


--Key Performance Indicator (KPI's) Requirements:


--1. Total Loan Application: We need to calculate the total number of loan applications received during a specified period.Additionally, it is essential to monitor the Month-to-date (MTD) loan Applications and track changes Month over month(MoM).
SELECT COUNT (id) AS total_loan_application
FROM financial_loan

--MTD application:
SELECT COUNT(id) AS MTD_application
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=12
AND EXTRACT(Year FROM issue_date)=2021

--PTMD application:
SELECT COUNT(id) AS PTMD_application
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=11
AND EXTRACT (Year FROM issue_date)=2021


	 --TRY AND ERROR--
SELECT COUNT(id) AS total_loan_application, TO_CHAR(issue_date,'Month')
FROM financial_loan
WHERE EXTRACT(Year FROM issue_date)=2021
GROUP BY TO_CHAR(issue_date,'Month')
ORDER BY total_loan_application DESC

	
--2. Total Funded Amount: Understanding the total amount of funds disbursed as loans is cruscial. We also want to keep an eye on the MTD Total Funded Amount and analyse the Month over month(MoM) changes in this metric.
SELECT SUM(loan_amount) AS total_funded_amount
FROM financial_loan

--MTD application:
SELECT SUM(loan_amount) AS MTD_application
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=12
AND EXTRACT(Year FROM issue_date)=2021

--PMTD application:
SELECT SUM(loan_amount) AS PMTD_application
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=11
AND EXTRACT(Year FROM issue_date)=2021

	--Try and error--

SELECT SUM(loan_amount) AS total_funded_amount, TO_CHAR(issue_date,'Month')
FROM financial_loan
WHERE EXTRACT(Year FROM issue_date)=2021
GROUP BY TO_CHAR(issue_date,'Month')
ORDER BY total_funded_amount DESC

--3. Total Amount Received: Tracking the total amount received from borrowers is essential for assessing the bank's cash flow and loan repayment. We should analyse the Month to date(MTD) Total Amount Received and observe the month over month(mom) changes.
SELECT SUM(total_payment) AS total_amount_received
FROM financial_loan

--MTD application
SELECT SUM(total_payment) AS total_amount_received
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=12
AND EXTRACT(Year FROM issue_date)=2021

--PMTD application
SELECT SUM(total_payment) AS total_amount_received
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=11
AND EXTRACT(Year FROM issue_date)=2021


--TRY and ERROR:
SELECT SUM(total_payment) AS total_amount_received, TO_CHAR(issue_date,'Month')
FROM financial_loan
WHERE EXTRACT(Year FROM issue_date)=2021
GROUP BY TO_CHAR(issue_date,'Month')
ORDER BY total_amount_received DESC


--4. Average Interest Rate: Calculating the average interest rate across all loans, MTD and monitoring the Month over month(MoM) variations in interest rates will provide insights into our lending portfolio's overall cost.
SELECT AVG(int_rate) *100 AS AVG_DTI
FROM financial_loan

--MTD application
SELECT AVG(int_rate)*100 AS AVG_rate
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=12
AND EXTRACT(Year FROM issue_date)=2021

--PMTD application
SELECT AVG(int_rate)*100 AS AVG_rate
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=11
AND EXTRACT(Year FROM issue_date)=2021

			--TRY AND ERROR--
SELECT AVG(int_rate)*100 AS AVG_rate, TO_CHAR(issue_date,'Month')
FROM financial_loan
WHERE EXTRACT(Year FROM issue_date)=2021
GROUP BY TO_CHAR(issue_date,'Month')


--5. Average Debt-to-Income(DTI):Evaluating the average DTI for our borrowers helps us gauge their financial health. We need to compute the average DTI for all loans, MTD and track Month over month (MoM) fluctuations.
SELECT AVG(dti)*100 AS AVG_DTI
FROM financial_loan

--MTD application
SELECT AVG(dti)*100 AS AVG_DTI
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=12
AND EXTRACT(Year FROM issue_date)=2021

--PMTD application
SELECT AVG(dti)*100 AS AVG_DTI
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=11
AND EXTRACT(Year FROM issue_date)=2021

			--TRY AND ERROR--
SELECT AVG(dti)*100 AS AVG_DTI, TO_CHAR(issue_date,'Month')
FROM financial_loan
WHERE EXTRACT(Year FROM issue_date)=2021
GROUP BY TO_CHAR(issue_date,'Month')


  				--GOOD LOAN ISSUED--

--Good Loan Percentage--
SELECT(COUNT (CASE WHEN loan_status='Fully Paid' OR loan_status='Current' THEN id 
END)*100.0)/
      COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

--Good Loan Applications--
SELECT COUNT(id) AS Good_loan_applications 
FROM financial_loan
WHERE loan_status='Fully Paid' OR loan_status='Current'


--Good Loan Funded Amount--
SELECT SUM(loan_amount) AS Good_loan_funded_amount
FROM financial_loan
WHERE loan_status='Fully Paid' OR loan_status='Current'

--Good Loan Amount Received--
SELECT SUM(total_payment) AS Good_loan_amount_received
FROM financial_loan
WHERE loan_status='Fully Paid' OR loan_status='Current'



				--Bad Loan Issued--

--Bad Loan Percentage--
SELECT(COUNT (CASE WHEN loan_status='Charged Off' THEN id 
END)*100.0)/
      COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan

--Bad Loan Applications--
SELECT COUNT (id) AS Bad_loan_applications
FROM financial_loan
WHERE loan_status='Charged Off'

--Bad Loan Funded Amount--
SELECT SUM(loan_amount) AS Bad_loan_funded_amount
FROM financial_loan
WHERE loan_status='Charged Off'

--Bad Loan Amount Received--
SELECT SUM(total_payment) AS Bad_loan_amount_received
FROM financial_loan
WHERE loan_status='Charged Off'


			--Loan Status--

SELECT 
	loan_status,
	COUNT(id) AS loan_count,
	SUM(total_payment) AS Total_amount_received,
	SUM(loan_amount) AS Total_funded_amount,
	AVG(int_rate*100) AS Interest_rate,
	AVG(dti*100) AS DTI
FROM financial_loan
GROUP BY loan_status
ORDER BY loan_count


--monthly loan status--
SELECT 
	loan_status,
	SUM(total_payment) AS MTD_total_amount_received,
	SUM(loan_amount) AS MTD_total_funded_amount
FROM financial_loan
WHERE EXTRACT(Month FROM issue_date)=12
AND EXTRACT(Year FROM issue_date)=2021
GROUP BY loan_status


--bank loan report|overview--
SELECT 
	  TO_CHAR(issue_date,'Month') AS Month_name,
	  COUNT(id) AS total_loan_applications,
	  SUM(loan_amount) AS total_funded_amount,
      SUM(total_payment) AS total_amount_received
FROM financial_loan
WHERE EXTRACT (Year FROM issue_date)=2021
GROUP BY TO_CHAR(issue_date,'Month')


SELECT 
	  EXTRACT('Month' FROM issue_date) AS month_number,
	  TO_CHAR(issue_date,'Month') AS month_name,
	  COUNT(id) AS total_loan_applications,
	  SUM(loan_amount) AS total_funded_amount,
      SUM(total_payment) AS total_amount_received
FROM financial_loan
WHERE EXTRACT (Year FROM issue_date)=2021
GROUP BY month_number,month_name
ORDER BY month_number

--state--
SELECT address_state,COUNT(id) AS total_loan_applications, 
	   SUM(loan_amount) AS total_funded_amount, 
	   SUM(total_payment) AS total_amount_received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state


--term--
SELECT term AS TERM,
	   COUNT(id) AS Total_loan_applications,
	   SUM(loan_amount) AS total_funded_amount,
	   SUM(total_payment) AS total_amount_received
FROM financial_loan
GROUP BY TERM
ORDER BY TERM

--Employee Length--
SELECT emp_length AS Employee_length,
	   COUNT (id) AS total_loan_applications,
	   SUM(loan_amount) AS total_funded_amount,
	   SUM(total_payment) AS total_amount_received
FROM financial_loan
GROUP BY Employee_length
ORDER BY Employee_length 


--Purpose--
SELECT purpose AS PURPOSE,
	   COUNT(id) AS total_loan_applications,
	   SUM(loan_amount) AS total_funded_amount,
	   SUM(total_payment) AS total_amount_received
FROM financial_loan
GROUP BY PURPOSE
ORDER BY total_loan_applications



--Home ownership--
SELECT home_ownership AS Home_ownership,
	   COUNT(id) AS total_loan_applications,
	   SUM(loan_amount) AS total_funded_amount,
	   SUM(total_payment) AS total_amount_received
FROM financial_loan
GROUP BY home_ownership
ORDER BY total_loan_applications


SELECT * FROM financial_loan
SELECT purpose AS Purpose,
       COUNT(id) AS total_loan_applications,
       SUM(loan_amount) AS total_funded_amount,
       SUM(total_payment) AS total_amount_received
FROM financial_loan
WHERE grade='A'
GROUP BY purpose
ORDER BY purpose











