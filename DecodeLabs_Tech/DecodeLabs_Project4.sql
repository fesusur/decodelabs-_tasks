USE DecodeLabs_DW;
GO

SELECT 
    p.ProductName AS [Catalog Item],
    COUNT(f.SalesID) AS [Order Volume],
    SUM(f.Quantity) AS [Total Units Sold],
    FORMAT(SUM(f.TotalPrice), 'C', 'en-US') AS [Total Normalized Revenue]
FROM Fact_Sales f
INNER JOIN Dim_Products p ON f.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY SUM(f.TotalPrice) DESC;
GO

USE DecodeLabs_DW;
GO

SELECT TOP 10
    f.CustomerID AS [Customer Account Key],
    c.ShippingAddress AS [Registered Delivery Destination],
    COUNT(f.SalesID) AS [Lifetime Orders Placed],
    FORMAT(SUM(f.TotalPrice), 'C', 'en-US') AS [Total Customer Lifetime Value (CLV)]
FROM Fact_Sales f
INNER JOIN Dim_Customers c ON f.CustomerID = c.CustomerID
GROUP BY f.CustomerID, c.ShippingAddress
ORDER BY SUM(f.TotalPrice) DESC;
GO

USE DecodeLabs_DW;
GO

SELECT 
    l.OrderStatus AS [Fulfillment State],
    COUNT(f.SalesID) AS [Logistics Volume],
    FORMAT(SUM(f.TotalPrice), 'C', 'en-US') AS [Financial Value in State],
    CAST((COUNT(f.SalesID) * 100.0 / (SELECT COUNT(*) FROM Fact_Sales)) AS DECIMAL(5,2)) AS [Percentage of Total Volume %]
FROM Fact_Sales f
INNER JOIN Dim_Logistics l ON f.TrackingNumber = l.TrackingNumber
GROUP BY l.OrderStatus
ORDER BY COUNT(f.SalesID) DESC;
GO