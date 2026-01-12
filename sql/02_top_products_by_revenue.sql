--Business question:
--Which products generate the highest total revenue?

--Explanation:
--Revenue per order line is calculated as:
--UnitPrice * Quantity * (1 - Discount)
--Revenue is aggregated per product using SUM
--Results are sorted from highest to lowest revenue

SELECT TOP 10
    p.ProductID,
    p.ProductName,
    ROUND(
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),
        2
    ) AS total_revenue
FROM Products p
JOIN [Order Details] od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY
    total_revenue DESC;
