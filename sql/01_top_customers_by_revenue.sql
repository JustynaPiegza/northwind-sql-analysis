-- Bussines question:
-- Which customers generate the highest revenue?

-- Explenation:
-- Revenue is calculated as: UnitPrice * Quantity * (1 - Discount)
-- The query aggregates revenue per customer 
-- Results are ordered from highest to lowest revenue

SELECT TOP 10
    c.CustomerID,
    c.CompanyName,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS total_revenue
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN [Order Details] od
    ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerID,
    c.CompanyName
ORDER BY
    total_revenue DESC;
