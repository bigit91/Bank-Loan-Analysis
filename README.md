# Bank-Loan-Analysis
 Here, I've conducted an analysis on a real-time bank loan dataset to delve deeper into borrower profiles and customer behavior

## Dashboard Link :https://app.powerbi.com/groups/me/reports/08f21eeb-5bf7-45de-be1a-e392b4c20f46/ReportSection?experience=power-bi

## About

The main goal of Bank Loan Analysis is to furnish an intuitive and thorough platform for accessing crucial loan information. This platform aims to be a centralized solution for users in search of in-depth insights into our loan portfolio, borrower profiles, and loan performance, offering a seamless experience.

## Purpose Of The Project
This purpose of this project is to be a central hub, providing users with comprehensive insights into our loan portfolio, borrower profiles, and loan performance, all in one place.


## About Data

This is a realtime dataset 

| Column                  | Description                             
| :---------------------- | :-------------------------------------- 
| id		          | Id of the customer who applied for loan             		    
| address_state           | name of the state as per sustomer details       
| application_type        | type of applicant whether individual or Joint applicant           
| emp_length         	  | Applicants length of employment in years            
| emp_title               | Name of the employer 
| grade          	  | risk classification assigned to the loan based on creditworthiness 
| home_ownership          | indicates the borrower's housing status           
| issue_date              | loan issue date          
| last_credit_pull_date   | records when the borrower's credit report was last accessed.
| last_payment_date       | most recent loan payment received
| loan_status             | indicates the current state of the loan 
| next_payment_date       | estimates the date of the next loan payment
| member_id        	  | loan ID of borrower generated  by bank               
| purpose                 | reason for the loan                 
| sub_grade		  | risk assessment within a grade               
| term                    | loan tenure                         
| verification_status     | indicates whether the borrower's financial information has been verified
| annual_income           | the borrower's total yearly earnings                         
| dti                     | debt to income ratio
| int_rate		  | rate of interest for the loan                          
| loan_amount             | Loan Amount is the total borrowed sum.
| total_acc		  | total accounts
| total_payment           | total amount received agiasnt loan repayment
                                                   

## Problem Statement:
# Key Performance Indicators (KPIs)to be calculated :

> 1.Total Loan Applications: We need to calculate the total number of loan applications received during a specified period. Additionally, it is essential to monitor the Month-to-Date (MTD) Loan Applications and track changes Month-over-Month (MoM).

> 2.Total Funded Amount: Understanding the total amount of funds disbursed as loans is crucial. We also want to keep an eye on the MTD Total Funded Amount and analyse the Month-over-Month (MoM) changes in this metric.

> 3.Total Amount Received: Tracking the total amount received from borrowers is essential for assessing the bank's cash flow and loan repayment. We should analyse the Month-to-Date (MTD) Total Amount Received and observe the Month-over-Month (MoM) changes.

> 4.Average Interest Rate: Calculating the average interest rate across all loans, MTD, and monitoring the Month-over-Month (MoM) variations in interest rates will provide insights into our lending portfolio's overall cost.

> 5.Average Debt-to-Income Ratio (DTI): Evaluating the average DTI for our borrowers helps us gauge their financial health. We need to compute the average DTI for all loans, MTD, and track Month-over-Month (MoM) fluctuations.

## Good Loan v Bad Loan KPI’s

# Good Loan:
> 1.Good Loan Application Percentage

> 2.Good Loan Applications

> 3.Good Loan Funded Amount

> 4.Good Loan Total Received Amount

# Bad Loan:
> 1.Bad Loan Application Percentage

> 2.Bad Loan Applications

> 3.Bad Loan Funded Amount

> 4.Bad Loan Total Received Amount


## Loan Status Grid View

In order to gain a comprehensive overview of our lending operations and monitor the performance of loans, we aim to create a grid view report categorized by 'Loan Status.’ By providing insights into metrics such as 'Total Loan Applications,' 'Total Funded Amount,' 'Total Amount Received,' 'Month-to-Date (MTD) Funded Amount,' 'MTD Amount Received,' 'Average Interest Rate,' and 'Average Debt-to-Income Ratio (DTI),' this grid view will empower us to make data-driven decisions and assess the health of our loan portfolio.


## CHARTS
> 1.Monthly Trends by Issue Date (Line Chart):  To identify seasonality and long-term trends in lending activities

> 2.Regional Analysis by State (Filled Map): To identify regions with significant lending activity and assess regional disparities

> 3.Loan Term Analysis (Donut Chart): To allow the client to understand the distribution of loans across various term lengths.

> 4.Employee Length Analysis (Bar Chart): How lending metrics are distributed among borrowers with different employment lengths, helping us assess the impact of employment history on loan applications.

> 5.Loan Purpose Breakdown (Bar Chart): Will provide a visual breakdown of loan metrics based on the stated purposes of loans, aiding in the understanding of the primary reasons borrowers seek financing.

> 6.Home Ownership Analysis (Tree Map): For a hierarchical view of how home ownership impacts loan applications and disbursements.

#Metrics to be shown: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'



## GRID
Need for a comprehensive 'Details Dashboard' that provides a consolidated view of all the essential information within our loan data. This Details Dashboard aims to offer a holistic snapshot of key loan-related metrics and data points, enabling users to access critical information efficiently.


# Tools used in cleaning and analysis : MS SQL SERVER &  MSPOWER BI

## Steps Used
-- Data Cleaning:

> 1.The dataset was originally in the MS SQL server database hance  it was imported to Power BI using SQL server connecion in import mode .

> 2.The data  was loaded and & Opened in power query editor & in view tab under Data preview section, check "column distribution", "column quality" & "column profile" options was checked .

> 3.It was observed that  none of the columns had errors 

> 4. Data Modelling : A seperate date table was created  for ease of calculation and optimization of data model

	-- Dax Used to create date table : Date Table = calendar(min(bank_loan_data[issue_date]),max(bank_loan_data[issue_date]))

	#Calculated Columns for Date Table 

	-- Month = format('Date Table'[Date],"mmm")
	-- Month Number = MONTH('Date Table'[Date])


	# Measure  : A Seperate table was created for measure for ease of calculation . Home tab--> Enter Data --> Table name --> Load 
		     

	# Measures :

	> Total Loan Applications = count(bank_loan_data[id])
	> MTD Loan Applications = calculate(TOTALMTD([Total Loan Applications],'Date Table'[Date])) 
	> PMTD Loan Applications = CALCULATE([MTD Loan Applications],DATEADD('Date Table'[Date],-1,MONTH))
	> MoM Application Growth = DIVIDE(([MTD Loan Applications]-[PMTD Loan Applications]),[PMTD Loan Applications],0)
	
	> Total Funded Amount = SUM(bank_loan_data[loan_amount])
	> MTD Funded Amount = calculate(TOTALMTD([Total Funded Amount],'Date Table'[Date]))
	> PMTD Funded Amount = CALCULATE([MTD Funded Amount],DATEADD('Date Table'[Date],-1,MONTH))
	> MoM Funded Amt Growth = DIVIDE(([MTD Funded Amount]-[PMTD Funded Amount]),[PMTD Funded Amount],0)

	> Total Amount Received = sum(bank_loan_data[total_payment])
	> MTD Amount Recived = CALCULATE(TOTALMTD([Total Amount Received],'Date Table'[Date]))
	> PMTD Amount Received = CALCULATE([MTD Amount Recived],DATEADD('Date Table'[Date],-1,MONTH))
	> MoM Amount Recived Growth = DIVIDE(([MTD Amount Recived]-[PMTD Amount Received]),[PMTD Amount Received] ,0)

	> Avg Interest Rate = AVERAGE(bank_loan_data[int_rate])
	> MTD Average Interest Rate = CALCULATE(TOTALMTD([Avg Interest Rate],'Date Table'[Date]))
	> PMTD Interest Rate = calculate([MTD Average Interest Rate] , DATEADD('Date Table'[Date],-1,MONTH))
	> MoM Avg Intetrest Growth = DIVIDE(([MTD Average Interest Rate]-[PMTD Interest Rate]),[PMTD Interest Rate])

	> Avergae DTI = AVERAGE(bank_loan_data[dti])
	> MTD Average DTI = calculate(TOTALMTD([Avergae DTI] ,'Date Table'[Date]))
	> PMTD Average DTI = CALCULATE([MTD Average DTI],DATEADD('Date Table'[Date],-1,MONTH))
	> MoM DTI Growth = divide(([MTD Average DTI]-[PMTD Average DTI]),[PMTD Average DTI],0)

	
	> Good Loan Applications = calculate([Total Loan Applications],bank_loan_data[Good vs Bad Loan]="Good Loan")
	> Good Loan Funded Amount = calculate([Total Funded Amount],bank_loan_data[Good vs Bad Loan]="Good Loan")
	> Good Loan Total Received = calculate([Total Amount Received],bank_loan_data[Good vs Bad Loan]="Good Loan")
	> Good Loan % = (calculate([Total Loan Applications],bank_loan_data[Good vs Bad Loan]="Good Loan"))/[Total Loan Applications]

	> Bad Loan Applications = calculate([Total Loan Applications],bank_loan_data[Good vs Bad Loan]="Bad Loan")
	> Bad Loan Funded Amount = calculate([Total Funded Amount],bank_loan_data[Good vs Bad Loan]="Bad Loan")
	> Bad Loan Total Received = calculate([Total Amount Received],bank_loan_data[Good vs Bad Loan]="Bad Loan")
	> Bad Loan % = (calculate([Total Loan Applications],bank_loan_data[Good vs Bad Loan]="Bad Loan"))/[Total Loan Applications]
	


  -- A field parameter named "Select Measure"  was created to make a dynamic chart  :
  
> Dax : [Select Measure ] = { ("Total Amount Received", NAMEOF('Measure Table'[Total Amount Received]), 0),("Total Funded Amount", NAMEOF('Measure Table'[Total Funded Amount]), 1), ("Total Loan Applications", NAMEOF('Measure Table'[Total Loan Applications]), 2)}



## Analysis :

> 1.Total Loan Applications : 38.6K   

> 2. Month to date Applications - 4.3K   

> 3. Month on Month Growth in Applications - 6.9%


> 4. Total Loan Funded (Sanctioned)  : $435.8 M 

> 5. Month to date - $54M   

> 6. Month on Month Growth - 13.0%


> 7. Total amount Received(Recovered) : $473.1 M 

> 8. Month to date - $58M  

> 9. Month on Month Growth - 15.8%


> 10.  Average Interest rate    : 12.0%   

> 11.  Month to date - 12.4%  

> 12.  Month on Month Growth - 3.5%



> 13. Average DTI(Debt to Income ratio) : 13.3%   

> 14.  Month to date - 13.7%  

> 15. Month on Month Growth - 2.7%


> 16. Good Loan Percentage : 86.2 %   

> 17. Applications -33k 

> 18. Funded( Sanctioned) - $ 370.2 M 

> 19. Received( Recovered) - $435.8 M



> 20. Bad Loan Percentage : 13.8 %   

> 21. Applications -5k 

> 22. Funded (Sanctioned) - $ 65.5 M 

> 23. Received (Recovered)- $37.3 M


# Furthermore, I have uploaded:

> 1. The SQL query utilized to execute the queries and examine the analysis results.
> 2. A report detailing the analysis findings and insights derived from it.


Dashboard Snaps :


![DB1](https://github.com/bigit91/Bank-Loan-Analysis/assets/155818756/a3be9b78-e9c9-470e-9e98-5aafb863cde8)



![DB2](https://github.com/bigit91/Bank-Loan-Analysis/assets/155818756/2c978a6f-0336-4694-bb05-e4a6325c050f)



![db3](https://github.com/bigit91/Bank-Loan-Analysis/assets/155818756/e0093bb7-2a23-426c-91db-22b83a56e728)






