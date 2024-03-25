use [Bank Loan DB];

select loan_status, count(loan_status) as cnt  from bank_loan_data group by loan_status  ;

--1) Total Loan Applications

select count(id) as total_loan_applications from bank_loan_data ;


--2) MTD Loan Applications

select count(id) as mtd_loan_applications
from bank_loan_data
where datepart(month,issue_date) = 12


--3)PMTD Loan Applications

select count(id) as pmtd_loan_applications
from bank_loan_data
where datepart(month,issue_date) = 12-1


--4)Total Funded Amount

select sum(loan_amount) as total_funded_amount
from bank_loan_data


--5)MTD Total Funded Amount

select sum(loan_amount) as total_funded_amount
from bank_loan_data
where datepart(month,issue_date) = 12

--6)PMTD Total Funded Amount

select sum(loan_amount) as total_funded_amount
from bank_loan_data
where datepart(month,issue_date) = 12 -1

--7)Total Amount Received

select sum(total_payment) as toal_amount_received
from bank_loan_data


--8)MTD Total Amount Received

select sum(total_payment) as toal_amount_received
from bank_loan_data
where datepart(month,issue_date)=12 

--9)PMTD Total Amount Received

select sum(total_payment) as toal_amount_received
from bank_loan_data
where datepart(month,issue_date)=12-1


--10)Average Interest Rate

select round(avg(int_rate)*100,2) as avg_int_rate
from bank_loan_data


--11)MTD Average Interest

select round(avg(int_rate)*100,2) as avg_int_rate
from bank_loan_data
where datepart(month,issue_date)=12


--12)PMTD Average Interest

select round(avg(int_rate)*100,2) as avg_int_rate
from bank_loan_data
where datepart(month,issue_date)=12-1


--13)Avg DTI

select round(avg(dti)*100,2) as avg_dti_rate
from bank_loan_data


--14)MTD Avg DTI

select round(avg(dti)*100,2) as avg_dti_rate
from bank_loan_data
where datepart(month,issue_date)=12


--15)PMTD Avg DTI

select round(avg(dti)*100,2) as avg_dti_rate
from bank_loan_data
where datepart(month,issue_date)=12-1


--16)Good Loan Percentage

SELECT 

        COUNT(CASE WHEN loan_status ='Fully Paid' OR loan_status ='current' THEN id END) * 100.0 / COUNT(id)
         AS good_loan_percentage
FROM
    bank_loan_data;



-- 17)Good Loan Applications

select 
	count(id) as good_loan_applications
from
	bank_loan_data
where 
	loan_status = 'Fully Paid' OR loan_status = 'Current'


--18)Good Loan Funded Amount

select 
	sum(loan_amount) as good_loan_funded
from
	bank_loan_data
where 
	loan_status = 'Fully Paid' OR loan_status = 'Current'


-- 19)Good Loan Amount Received

select 
	sum(loan_amount) as good_loan_amt
from
	bank_loan_data
where 
	loan_status = 'Fully Paid' OR loan_status = 'Current'



--20)Bad Loan Percentage

SELECT 

        COUNT(CASE WHEN loan_status ='Charged Off' THEN id END) * 100.0 / COUNT(id)
         AS bad_loan_percentage
FROM
    bank_loan_data;


--21)Bad Loan Applications

select 
	count(id) as bad_loan_applications
from
	bank_loan_data
where 
	loan_status = 'Charged Off'



--22)Bad Loan Funded Amount

select 
	sum(loan_amount) as bad_loan_funded
from
	bank_loan_data
where 
	loan_status = 'Charged Off'



--23)Bad Loan Amount Received

select 
	sum(total_payment) as bad_loan_amt
from
	bank_loan_data
where 
	loan_status = 'Charged Off'


--24)Loan Status

Select 
	loan_status,
	count(id) as loan_count,
	sum(loan_amount) as loan_amount,
	SUM(total_payment) as total_amount_received,
	avg(int_rate *100) as interest_rate,
	avg(dti *100) as dti
from
	bank_loan_data
group by 
	loan_status ;


--25) MTD Loan Status


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status



-- 26)	BANK LOAN REPORT | OVERVIEW

select 
	datepart(month,issue_date)as month_number,
	datename(month,issue_date)as month_name,
	count(id) as total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_amount_received
from
	bank_loan_data
group by 
	datepart(month,issue_date) ,	
	datename(month,issue_date)
order by 
	datepart(month,issue_date)



--27)STATE

select  
	address_state,
	count(id) as total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_amount_received
from
	bank_loan_data
group by 
	address_state
order by
	address_state


--28)TERM

select 
	term as Term,
	count(id) as total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_amount_received
	
from
	bank_loan_data 
group by 
	term
order by 
	term;

--29) EMPLOYEE LENGTH

select 
	emp_length as employee_length ,
	count(id) as total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_amount_received
from 
	bank_loan_data
group by 
	emp_length
order by 
	emp_length;



--30) PURPOSE

select 
	purpose as purpose ,
	count(id) as total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_amount_received
from 
	bank_loan_data
group by 
	purpose
order by 
	purpose;


--31) HOME OWNERSHIP

select 
	home_ownership,
	count(id) as total_loan_applications,
	sum(loan_amount) as total_funded_amount,
	sum(total_payment) as total_amount_received
from 
	bank_loan_data
group by 
	home_ownership
order by 
	home_ownership;