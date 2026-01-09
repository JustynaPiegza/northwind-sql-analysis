-- Question:
-- Which customers generate the highest revenue?

SELECT
    c.CustomerID,
    c.CompanyName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_revenue
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
