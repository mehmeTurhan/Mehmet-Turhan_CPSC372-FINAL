-- Insert data into Client table
INSERT INTO Client (client_id, first_name, last_name, email, phone, preferred_industry)
VALUES
  (1, 'Mehmet', 'Turhan', 'mt@email.com', '123-456-7890', 'Technology'),
  (2, 'Nur', 'Khan', 'nk@email.com', '987-654-3210', 'Finance'),
  (3, 'Lincoln', 'Chapata', 'lc@email.com', '555-555-5555', 'Healthcare'),
  (4, 'Nick', 'Price', 'np@email.com', '111-222-3333', 'Retail'),
  (5, 'Jonathan', 'Johnson', 'jj@email.com', '444-444-4444', 'Real Estate'),
  (6, 'Rawleigh', 'Pollock', 'rp@email.com', '777-777-7777', 'Energy'),
  (7, 'Abdulrahman', 'Nassar', 'an@email.com', '888-888-8888', 'Technology'),
  (8, 'Jackson', 'Davis', 'jd@email.com', '999-999-9999', 'Healthcare'),
  (9, 'Gabe', 'Neuman', 'gn@email.com', '222-333-4444', 'Finance'),
  (10, 'Not', 'Sure', 'ns@email.com', '111-444-7777', 'Real Estate');

-- to see the relation
SELECT * FROM Client;


-- Insert data into Advisor table
INSERT INTO Advisor (advisor_id, first_name, last_name, email, phone, performance)
VALUES
  (1, 'Warren', 'Buffett', 'wbuffett@berkshirehathaway.com', '555-1234', 8.7),
  (2, 'Ray', 'Dalio', 'rdalio@bridgewater.com', '555-5678', 9.1),
  (3, 'Cathie', 'Wood', 'cwood@arkinvest.com', '555-9101', 9.5),
  (4, 'Ken', 'Griffin', 'kgriffin@citrade.com', '555-2345', 8.9),
  (5, 'Jamie', 'Dimon', 'jdimon@jpmorgan.com', '555-6789', 8.2),
  (6, 'Larry', 'Fink', 'lfink@blackrock.com', '555-1112', 9.3),
  (7, 'Abigail', 'Johnson', 'ajohnson@fidelity.com', '555-3456', 9.0),
  (8, 'Paul', 'Tudor Jones', 'ptjones@tudor.com', '555-7890', 9.2),
  (9, 'David', 'Swensen', 'dswensen@yale.edu', '555-1212', 9.4),
  (10, 'Howard', 'Marks', 'hmarks@oaktreecapital.com', '555-4545', 8.8);
-- to see the relation
SELECT * FROM Advisor;

-- Insert data into Account table
INSERT INTO Account (account_id, client_id, advisor_id, balance, account_performance)
VALUES 
  (1, 1, 5, 20000.00, 4.5),
  (2, 2, 3, 22000.00, 3.2),
  (3, 3, 6, 17500.00, 4.1),
  (4, 4, 7, 12000.00, 4.9),
  (5, 5, 2, 18000.00, 3.8),
  (6, 6, 9, 15000.00, 4.7),
  (7, 7, 1, 20000.00, 4.9),
  (8, 8, 10, 13000.00, 2.5),
  (9, 9, 4, 12000.00, 1.2),
  (10, 10, 8, 50000.00, 5.0);

-- to see the relation
SELECT * FROM Account;

-- Seed data into Exchange table
INSERT INTO Exchange (exchange_id, exchange_name, location) VALUES
(1, 'New York Stock Exchange', 'New York'),
(2, 'NASDAQ', 'New York'),
(3, 'London Stock Exchange', 'London');

-- to see the relation
SELECT * FROM Exchange;

-- Seed data into Stock table
INSERT INTO Stock (stock_id, exchange_id, stock_symbol, stock_name, description, industry) VALUES
(1, 1, 'AAPL', 'Apple Inc.', 'Sells software, services and devices', 'Technology'),
(2, 1, 'MSFT', 'Microsoft Corporation', 'Sells software, services and devices', 'Technology'),
(3, 1, 'AMZN', 'Amazon.com, Inc.', 'e-commerce, cloud computing, streaming services', 'Retail'),
(4, 2, 'TSLA', 'Tesla, Inc.', 'Electric vehicle and clean energy company', 'Energy'),
(5, 2, 'INDT', 'INDUS Realty Trust, Inc.', 'Managing and leasing industrial properties', 'Real Estate'),
(6, 2, 'BIIB', 'Biogen Inc.', 'delivers therapies for the treatment of neurological', 'Healthcare'),
(7, 3, 'HSBA', 'HSBC Holdings plc', 'Banking and financial services company', 'Finance'),
(8, 3, 'GSK', 'GlaxoSmithKline plc', 'Pharmaceutical company that researches, develops, and manufactures drugs', 'Healthcare'),
(9, 3, 'LLOY', 'Lloyds Banking Group plc', 'Banking and financial services company', 'Finance'),
(10, 1, 'SPG', 'Simon Property Group', 'Invests in shopping malls and outlet centers.', 'Real Estate');

-- to see the relation
SELECT * FROM Stock;

-- Seed data into the Investment table
INSERT INTO Investment (investment_id, stock_id, account_id, quantity, purchase_price, purchase_date) VALUES
  (1, 1, 1, 100, 12550.00, '2022-02-01'),
  (2, 2, 7, 75, 17640.00, '2022-03-15'),
  (3, 3, 4, 50, 14560.00, '2022-04-21'),
  (4, 4, 6, 25, 6240.00, '2022-05-09'),
  (5, 5, 10, 200, 8945.00, '2022-06-29'),
  (6, 6, 8, 150, 9230.00, '2022-07-11'),
  (7, 7, 2, 50, 7812.50, '2022-08-19'),
  (8, 8, 3, 75, 5820.00, '2022-09-24'),
  (9, 9, 9, 100, 6502.50, '2022-10-12'),
  (10, 10, 5, 50, 5280.00, '2022-11-27');

-- to see the relation
SELECT * FROM Investment;

-- Seed data into the Transactions table
INSERT INTO Transactions (transaction_id, investment_id, exchange_id, transaction_type, transaction_date, price_per_share, quantity) VALUES
  (1, 1, 1, 'buy', '2022-02-02', 125.50, 100),
  (2, 2, 1, 'buy', '2022-03-16', 235.20, 75),
  (3, 3, 1, 'buy', '2022-04-22', 72.80, 200),
  (4, 4, 2, 'buy', '2022-05-10', 41.60, 150),
  (5, 5, 2, 'buy', '2022-06-30', 178.90, 50),
  (6, 6, 2, 'buy', '2022-07-12', 92.30, 100),
  (7, 7, 3, 'buy', '2022-08-19', 312.50, 25),
  (8, 8, 3, 'buy', '2022-09-25', 19.40, 300),
  (9, 9, 3, 'buy', '2022-10-13', 86.70, 75),
  (10, 10, 1, 'buy', '2022-11-28', 52.80, 100),
  (11, 1, 1, 'sell', '2023-02-02', 150.00, 50),
  (12, 2, 1, 'sell', '2023-03-16', 240.00, 25),
  (13, 3, 1, 'sell', '2023-04-22', 80.00, 100),
  (14, 4, 2, 'sell', '2023-05-10', 35.00, 75),
  (15, 5, 2, 'sell', '2023-06-30', 200.00, 25),
  (16, 6, 2, 'sell', '2023-07-12', 95.00, 50),
  (17, 7, 3, 'sell', '2023-08-19', 300.00, 10),
  (18, 8, 3, 'sell', '2023-09-25', 22.00, 150),
  (19, 9, 3, 'sell', '2023-10-13', 90.00, 50),
  (20, 10, 1, 'sell', '2023-11-28', 60.00, 75);

-- to see the relation
SELECT * FROM Transactions;

-- Seed data into the Transactions table
INSERT INTO Metric (metric_id, investment_id, metric_type, metric_date, value) VALUES
  (1, 1, 'PE ratio', '2023-04-30', 25.7),
  (2, 1, 'Dividend Yield', '2023-04-30', 0.005),
  (3, 2, 'PE ratio', '2023-04-30', 35.6),
  (4, 2, 'Dividend Yield', '2023-04-30', 0.008),
  (5, 3, 'PE ratio', '2023-04-30', 20.9),
  (6, 3, 'Dividend Yield', '2023-04-30', 0.015),
  (7, 4, 'PE ratio', '2023-04-30', 15.3),
  (8, 4, 'Dividend Yield', '2023-04-30', 0.025),
  (9, 5, 'PE ratio', '2023-04-30', 12.8),
  (10, 5, 'Dividend Yield', '2023-04-30', 0.03),
  (11, 6, 'PE ratio', '2023-04-30', 18.4),
  (12, 6, 'Dividend Yield', '2023-04-30', 0.02),
  (13, 7, 'PE ratio', '2023-04-30', 21.6),
  (14, 7, 'Dividend Yield', '2023-04-30', 0.012),
  (15, 8, 'PE ratio', '2023-04-30', 30.2),
  (16, 8, 'Dividend Yield', '2023-04-30', 0.007),
  (17, 9, 'PE ratio', '2023-04-30', 16.5),
  (18, 9, 'Dividend Yield', '2023-04-30', 0.02),
  (19, 10, 'PE ratio', '2023-04-30', 28.6),
  (20, 10, 'Dividend Yield', '2023-04-30', 0.008);

-- to see the relation
SELECT * FROM Metric;