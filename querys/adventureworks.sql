
-- SQL Advanced --

-- 1) Financial Loss Analysis in SQL, Objective:
-- This analysis seeks to identify the products with the greatest negative impact due to returns,
-- in addition to calculating net revenue. To achieve this, we use COALESCE to replace NULL values ​​in the color column. We apply numeric formatting (FORMAT()). 
-- To process queries, I will use Python libraries from Pandas, Sqlalchemy and sqlite3 and others.
-- We calculate absolute and categorized losses (High, Medium, and Low).
-- We group the data by product name, product number, and color, filtering to include only products with returns greater than zero.
-- Finally, we order the results by received quantity in descending order.
-- Query:

-- 1) Financial Loss Analysis in SQL

SELECT 
    p.Name AS Nome,
    p.ProductNumber AS Identificação,
    COALESCE(p.Color, 'Sem cor') AS Cor,
    SUM(u.RejectedQty) AS Devoluções,
    SUM(u.ReceivedQty) AS Recebido,
    SUM(u.LineTotal) AS Faturamento,
    SUM(u.StockedQty) AS Estoque
FROM Production.Product p
INNER JOIN Purchasing.PurchaseOrderDetail u ON p.ProductID = u.ProductID
GROUP BY p.Name, p.ProductNumber, p.Color
HAVING SUM(u.RejectedQty) > 0
ORDER BY SUM(u.ReceivedQty) DESC;


