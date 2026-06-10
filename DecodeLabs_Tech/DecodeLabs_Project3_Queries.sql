CREATE DATABASE DecodeLabs_Analytics;
GO

USE DecodeLabs_Analytics;
GO

SELECT * 
FROM dbo.[Dataset for Data Analytics (2)]

UPDATE [Dataset for Data Analytics (2)]
SET CouponCode = 'NO_COUPON'
WHERE CouponCode IS NULL

SELECT OrderID, COUNT(*)
FROM [Dataset for Data Analytics (2)]
GROUP BY OrderID
HAVING COUNT(*) > 1;

SELECT 
    COUNT(OrderID) AS Total_Orders,
    SUM(Quantity) AS Total_Units_Sold,
    FORMAT(SUM(TotalPrice), 'C', 'en-US') AS Gross_Revenue,
    FORMAT(AVG(TotalPrice), 'C', 'en-US') AS Average_Order_Value
FROM [Dataset for Data Analytics (2)];

SELECT 
    Product,
    COUNT(OrderID) AS [Transaction Volume],
    SUM(Quantity) AS [Total Units Sold],
    FORMAT(SUM(TotalPrice), 'C', 'en-US') AS [Gross Revenue Contribution]
FROM [Dataset for Data Analytics (2)]
GROUP BY Product
ORDER BY SUM(TotalPrice) DESC;

SELECT 
    OrderID, 
    Product, 
    Quantity, 
    FORMAT(UnitPrice, 'C', 'en-US') AS [Unit Price],
    FORMAT(TotalPrice, 'C', 'en-US') AS [Total Transaction Value]
FROM [Dataset for Data Analytics (2)]
WHERE TotalPrice >= 3334.00
ORDER BY TotalPrice DESC;

SELECT 
    OrderStatus,
    COUNT(OrderID) AS [Status Volume],
    CAST((COUNT(OrderID) * 100.0 / (SELECT COUNT(*) FROM [Dataset for Data Analytics (2)])) AS DECIMAL(5,2)) AS [Percentage of Total %]
FROM [Dataset for Data Analytics (2)]
GROUP BY OrderStatus
ORDER BY [Status Volume] DESC;

SELECT 
    ReferralSource,
    COUNT(OrderID) AS [Total Customer Conversions],
    FORMAT(SUM(TotalPrice), 'C', 'en-US') AS [Attributed Total Revenue]
FROM [Dataset for Data Analytics (2)]
GROUP BY ReferralSource
ORDER BY SUM(TotalPrice) DESC;

SELECT 
    Product,
    COUNT(OrderID) AS [High-Volume Orders Count],
    FORMAT(AVG(TotalPrice), 'C', 'en-US') AS [Segment Mean AOV]
FROM [Dataset for Data Analytics (2)]
WHERE Quantity >= 3
GROUP BY Product
HAVING AVG(TotalPrice) >= 1050.00
ORDER BY AVG(TotalPrice) DESC;