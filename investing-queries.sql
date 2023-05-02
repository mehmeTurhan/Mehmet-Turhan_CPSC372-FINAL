--1: Find the total balance of all accounts grouped by preferred industry of clients.
SELECT c.preferred_industry, SUM(a.balance) as total_balance
FROM Client c
INNER JOIN Account a ON c.client_id = a.client_id
GROUP BY c.preferred_industry;

--2: Find the advisors whose performance is greater than the average performance of all advisors and their associated clients.
SELECT DISTINCT ad.first_name, ad.last_name, ad.performance
FROM Advisor ad
WHERE ad.performance > (
    SELECT AVG(performance)
    FROM Advisor
) ORDER BY ad.performance DESC;

--3: Give the first and last name of clients and their advisors who invested in the Real Estate industry and have an account performance greater than 4.0.
SELECT c.first_name, c.last_name, a.first_name, a.last_name
FROM Client c
INNER JOIN Account ac ON c.client_id = ac.client_id
INNER JOIN Advisor a ON ac.advisor_id = a.advisor_id
WHERE c.preferred_industry = 'Real Estate'
AND ac.account_performance > 4.0;

--4: Give the first and last name of advisors who have no clients.
SELECT a.first_name, a.last_name
FROM Advisor a
LEFT OUTER JOIN Account ac ON a.advisor_id = ac.advisor_id
WHERE ac.account_id IS NULL;

--5: Find the first and last name of the clients and the advisors who have performance greater than 4.0
SELECT c.first_name AS client_first_name, c.last_name AS client_last_name,  
       adv.first_name AS advisor_first_name, adv.last_name AS advisor_last_name
FROM Client c
JOIN Account a ON c.client_id = a.client_id
JOIN Advisor adv ON a.advisor_id = adv.advisor_id
WHERE a.account_performance > 4.0;

--6: Find the advisor's first and last name and their performance who have clients with account balance less than 15000.
SELECT DISTINCT adv.first_name, adv.last_name, adv.performance
FROM Advisor adv
JOIN Account a ON adv.advisor_id = a.advisor_id
WHERE a.balance < 15000;

--7: Find the purchase_price of all the investments made in NASDAQ and purchase_price of more than 3000$.
SELECT s.stock_name, i.purchase_price 
FROM Stock s 
INNER JOIN Investment i ON s.stock_id = i.stock_id 
WHERE s.exchange_id = (SELECT exchange_id FROM Exchange WHERE exchange_name = 'NASDAQ') 
AND i.purchase_price > 3000;

--8: Find all investments and their associated metrics.
SELECT Investment.investment_id, Investment.purchase_price, Metric.metric_type, Metric.value
FROM Investment
LEFT OUTER JOIN Metric ON Investment.investment_id = Metric.investment_id;


