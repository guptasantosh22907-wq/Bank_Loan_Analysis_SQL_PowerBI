SELECT * FROM bank_loan_data

SELECT COUNT(ID) AS Total_Loan_Applications FROM bank_loan_data

SELECT COUNT(ID) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(ID) AS PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--(MTD-PMTD)/PMTD

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount From bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PTD_Total_Funded_Amount From bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS MTD_Total_Amount_recevied From bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PTD_Total_Amount_recevied From bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(INT_RATE), 4)* 100 AS Avg_Intrest_Rate From bank_loan_data

SELECT ROUND(AVG(INT_RATE), 4)* 100 AS MTD_Avg_Intrest_Rate From bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021



SELECT ROUND(AVG(INT_RATE), 4)* 100 AS PTD_Avg_Intrest_Rate From bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


SELECT ROUND(AVG(dti), 4) * 100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti), 4) * 100 AS PTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT loan_status FROM bank_loan_data

SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR Loan_status = 'Current' THEN id END) * 100)
    /
    COUNT(id) AS Good_loan_Percentage
FROM bank_loan_data

SELECT COUNT(id) AS Good__Loan_Apllications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Funded_Aount From bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Recevied_Amount From bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT 
    (COUNT(CASE WHEN loan_status = 'Charged off' THEN id END) * 100.0) /
    COUNT(id) AS Bad_Loan_Percentage
From bank_loan_data

SELECT COUNT(id) Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged off'

SELECT SUM(loan_amount) Bad_Loan_funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged off'

SELECT SUM(total_payment) Bad_Loan_Amount_Recevied FROM bank_loan_data
WHERE loan_status = 'Charged off'

SELECT
       loan_status,
       COUNT(id) AS Total_Appliction,
       SUM(total_payment) AS Total_Amount_Recevied,
       SUM(loan_amount) AS Total_Funded_Amount,
       AVG(int_rate * 100) AS Interest_Rate,
       AVG(dti * 100) AS DTI
    From
       bank_loan_data
    GROUP BY
       loan_status

SELECT
    loan_status,
    SUM(total_payment) AS MTD_Total_Amount_Recevied,
    SUM(loan_amount) AS MTD_Total_Funded_Amont
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

SELECT
    MONTH(issue_date) AS Month_Number,
    DATENAME(MONTH, issue_date) AS Month_Name,
    COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT
     address_state,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY address_state
ORDER BY  address_state

SELECT
     address_state,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC

SELECT
     address_state,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY address_state
ORDER BY COUNT (id) DESC


SELECT
     term,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY term
ORDER BY term

SELECT
     emp_length,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

SELECT
     emp_length,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY emp_length
ORDER BY COUNT (id) DESC


 SELECT
     purpose,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY purpose
ORDER BY COUNT (id) DESC

SELECT
     home_ownership,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT (id) DESC

SELECT
     home_ownership,
     COUNT (id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Recevied_Amount
FROM Bank_loan_data
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT (id) DESC




















