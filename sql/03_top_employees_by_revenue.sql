-- Business question:
-- Which employees generated the highest total revenue?

-- Revenue per order line is calculated as:
-- UnitPrice * Quantity * (1 - Discount)
-- Orders are linked to employees via EmployeeID 
-- Revenue is aggregated per employee using SUM
-- Results are sorted from highest to lowest revenue

SELECT TOP 10
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
      ) AS total_revenue
FROM Employees e 
JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od
    ON o.OrderID = od.OrderID
GROUP BY 
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY total_revenue DESC;
