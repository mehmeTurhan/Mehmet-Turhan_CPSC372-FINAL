-- Create the Client table
CREATE TABLE Client (
  client_id INT PRIMARY KEY, -- primary key of the table, unique identifier for the client
  first_name VARCHAR(50) NOT NULL, -- first name of the client
  last_name VARCHAR(50) NOT NULL, -- last name of the client
  email VARCHAR(50) NOT NULL, -- email of the client
  phone VARCHAR(20) NOT NULL, -- phone number of the client
  preferred_industry VARCHAR(50) NOT NULL, -- preferred industry of the client
  FOREIGN KEY (preferred_industry) REFERENCES Stock(industry) -- relationship between Client and Stock
);

-- Create the Advisor table
CREATE TABLE Advisor (
  advisor_id INT PRIMARY KEY, -- primary key of the table, unique identifier for the advisor
  first_name VARCHAR(50) NOT NULL, -- first name of the advisor
  last_name VARCHAR(50) NOT NULL, -- last name of the advisor
  email VARCHAR(50) NOT NULL, -- email of the advisor
  phone VARCHAR(20) NOT NULL, -- phone number of the advisor
  performance DECIMAL(5,2) NOT NULL -- performance rating of the advisor
);

-- Create the Account table
CREATE TABLE Account (
  account_id INT PRIMARY KEY, -- primary key of the table, unique identifier for the account
  client_id INT NOT NULL, -- foreign key referencing the Client table
  advisor_id INT NOT NULL, -- foreign key referencing the Advisor table
  balance DECIMAL(10,2) NOT NULL, -- current balance of the account
  account_performance DECIMAL(5,2) NOT NULL, -- performance rating of the account
  FOREIGN KEY (client_id) REFERENCES Client(client_id) -- relationship between Account and Client
  FOREIGN KEY (advisor_id) REFERENCES Advisor(advisor_id) -- relationship between Account and Advisor
);

-- Create the Investment table
CREATE TABLE Investment (
  investment_id INT PRIMARY KEY, -- primary key of the table, unique identifier for the investment
  stock_id INT NOT NULL, -- foreign key referencing the Stock table
  account_id INT NOT NULL, -- foreign key referencing the Account table
  quantity INT NOT NULL, -- number of shares invested
  purchase_price DECIMAL(10,2) NOT NULL, -- price per share at the time of purchase
  purchase_date DATE NOT NULL, -- date of purchase
  FOREIGN KEY (stock_id) REFERENCES Stock(stock_id), -- relationship between Investment and Stock
  FOREIGN KEY (account_id) REFERENCES Account(account_id) -- relationship between Investment and Account
);

-- Create the Transactions table
CREATE TABLE Transactions (
  transaction_id INT PRIMARY KEY, -- primary key of the table, unique identifier for the transaction
  investment_id INT NOT NULL, -- foreign key referencing the Investment table
  exchange_id INT NOT NULL, -- foreign key referencing the Exchange table
  transaction_type VARCHAR(50) NOT NULL, -- type of transaction (buy or sell)
  transaction_date DATE NOT NULL, -- date of the transaction
  price_per_share DECIMAL(10,2) NOT NULL, -- price per share at the time of the transaction
  quantity INT NOT NULL, -- number of shares transacted
  FOREIGN KEY (investment_id) REFERENCES Investment(investment_id), -- relationship between Transactions and Investment
  FOREIGN KEY (exchange_id) REFERENCES Exchange(exchange_id) -- relationship between Transactions and Exchange
);

-- Create the Metric table
CREATE TABLE Metric (
  metric_id INT PRIMARY KEY, -- primary key of the table, unique identifier for the metric
  investment_id INT NOT NULL, -- foreign key referencing the Investment table
  metric_type VARCHAR(50) NOT NULL, -- type of metric (PE ratio, dividend yield, etc.)
  metric_date DATE NOT NULL, -- date of the metric
  value DECIMAL(10,2) NOT NULL, -- value of the metric
  FOREIGN KEY (investment_id) REFERENCES Investment(investment_id) -- relationship between Metric and Investment
);


-- Create the Exchange table
CREATE TABLE Exchange (
  exchange_id INT PRIMARY KEY, -- primary key of the table, unique identifier for the exchange
  exchange_name VARCHAR(50), -- name of the stock exchange
  location VARCHAR(50) -- location of the stock exchange
);

-- Create the Stock table
CREATE TABLE Stock (
  stock_id INT PRIMARY KEY, -- primary key of the table, unique identifier for the stock
  exchange_id INT, -- foreign key referencing the Exchange table
  stock_symbol VARCHAR(10), -- symbol used to represent the stock in the exchange
  stock_name VARCHAR(50), -- name of the stock
  description VARCHAR(100), -- brief description of the stock
  industry VARCHAR(50), -- industry to which the stock belongs
  FOREIGN KEY (exchange_id) REFERENCES Exchange(exchange_id) -- relationship between Stock and Exchange
);

