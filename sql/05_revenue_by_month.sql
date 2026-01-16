-- Business question:
-- How has total revenue changed over time (by month)?

-- Explanation:
-- Revenue per order line is calculated as:
-- UnitPrice * Quantity * (1 - Discount)
-- Order dates are taken from the Orders table 
-- Revenue is aggregated by year and month to avoid mixing months across years
-- Results are ordered chronologically to show the monthly revenue trend 

SELECT 
    YEAR(o.OrderDate) AS order_year,
    MONTH(o.OrderDate) AS order_month,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - Discount)),
        2
        ) AS total_revenue
FROM Orders o
JOIN  [Order Details] od
    ON O.OrderID = od.OrderID
GROUP BY 
    YEAR(o.OrderDate),
    MONTH(o.OrderDate)
ORDER BY 
    order_year,
    order_month;
