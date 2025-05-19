-- Create table schema

DROP TABLE IF EXISTS online_retail;
CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate TIMESTAMP,
    UnitPrice FLOAT,
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);


-- Add Data

COPY online_retail
FROM 'C:/Users/sayal/Downloads/online_retail.csv'
DELIMITER ','
CSV HEADER;


-- Check
SELECT * FROM online_retail LIMIT 10;


