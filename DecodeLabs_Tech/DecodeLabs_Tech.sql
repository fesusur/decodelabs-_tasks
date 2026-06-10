SELECT *
  FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)]

  SELECT 
    OrderID, 
    Date AS [Order Date], 
    Product, 
    Quantity, 
    TotalPrice AS [Total Revenue]
FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)];

SELECT OrderID, CustomerID, Product, Quantity, TotalPrice
FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)]
WHERE Product = 'Laptop'
ORDER BY TotalPrice DESC;

SELECT OrderID, Date, Product, OrderStatus, PaymentMethod, TotalPrice
FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)]
WHERE OrderStatus = 'Delivered' 
  AND PaymentMethod = 'Credit Card'
ORDER BY Date ASC;

SELECT OrderID, CustomerID, Product, CouponCode, TotalPrice
FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)]
WHERE CouponCode IS NULL;

SELECT 
    COUNT(OrderID) AS [Total Orders Placed],
    SUM(TotalPrice) AS [Total Sales Revenue],
    AVG(TotalPrice) AS [Average Order Transaction Value]
FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)];

SELECT 
    Product,
    SUM(Quantity) AS [Total Units Sold],
    SUM(TotalPrice) AS [Total Revenue],
    AVG(UnitPrice) AS [Average Unit Price]
FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)]
GROUP BY Product
ORDER BY [Total Revenue] DESC;

SELECT 
    OrderStatus,
    COUNT(OrderID) AS [Number of Orders],
    SUM(TotalPrice) AS [Financial Value]
FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)]
GROUP BY OrderStatus
ORDER BY [Number of Orders] DESC;

SELECT 
    ReferralSource,
    COUNT(OrderID) AS [Orders Driven],
    SUM(TotalPrice) AS [Total Generated Revenue],
    AVG(TotalPrice) AS [Average Spend Per Customer]
FROM [DecodeLab_Tech].[dbo].[Dataset for Data Analytics (2)]
GROUP BY ReferralSource
ORDER BY [Total Generated Revenue] DESC;