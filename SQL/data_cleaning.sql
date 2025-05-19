DROP TABLE IF EXISTS online_retail_clean;

CREATE TABLE online_retail_clean AS
SELECT *
FROM online_retail;

SELECT COUNT(*) FROM online_retail_clean;
-- 541909 total entries

-------------------------------------------------------------------------------
-- checking for inconsistencies
-------------------------------------------------------------------------------


SELECT COUNT(*) FROM online_retail_clean
WHERE customerid IS NULL;
-- 135080 such entries. It might not be ideal to delete all such entries.

UPDATE online_retail_clean
SET customerid = '0'
WHERE customerid IS NULL;

-------------------------------------------------------------------------------
-- checking for invalid entries
-------------------------------------------------------------------------------


SELECT COUNT(*) FROM online_retail_clean
WHERE Quantity <= 0 OR UnitPrice <= 0;
-- 11805 such entries, which do not make sense. 

DELETE FROM online_retail_clean
WHERE Quantity <= 0 OR UnitPrice <= 0;

-------------------------------------------------------------------------------
-- checking for duplicates
-------------------------------------------------------------------------------

SELECT COUNT(*) FROM online_retail_clean
WHERE ctid NOT IN (    SELECT MIN(ctid)
    FROM online_retail_clean
    GROUP BY InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country
);
-- 5226 duplicate entries

DELETE FROM online_retail_clean
WHERE ctid NOT IN (    SELECT MIN(ctid)
    FROM online_retail_clean
    GROUP BY InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country
);

-------------------------------------------------------------------------------
-- string clean up
-------------------------------------------------------------------------------

-- Trim white spaces
UPDATE online_retail_clean
SET Description = TRIM(Description);

-- Convert Description to lowercase 
UPDATE online_retail_clean
SET Description = LOWER(Description);

-------------------------------------------------------------------------------
-- CHECK
-------------------------------------------------------------------------------

SELECT * FROM online_retail_clean
where invoiceno is null;

-- 524878 total entries after data cleaning
