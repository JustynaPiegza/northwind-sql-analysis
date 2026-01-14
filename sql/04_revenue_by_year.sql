-- Business question:
-- How has total revenue changed over time (by year)?

-- Explanation:
-- Revenue per order line is calculated as:
-- UnitPrice * Quantity * (1 - Discount)
-- Order dates are taken from the Orders table
-- Revenue is aggregated by year using SUM
-- Results are ordered chronologically to show the revenue trend over time

SELECT 
    YEAR(o.OrderDate) AS order_year,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - Discount)),
        2
    ) AS total_revenue
FROM Orders o
JOIN [Order Details] od
    ON o.OrderID = od.OrderID
GROUP BY 
    YEAR(o.OrderDate)
ORDER BY 
    order_year DESC
