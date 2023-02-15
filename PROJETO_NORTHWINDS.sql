

-- 1.Filtro para contagem de territorios por região
SELECT RegionID, COUNT(*) AS TotalTerritories
FROM Territories
GROUP BY RegionID;

-- 2.Selecione da tabela order_details todas as ordens que tiveram

SELECT * FROM [Order Details];

SELECT OrderID
FROM [Order Details]
WHERE EXISTS (
    SELECT *
    FROM [Order Details]
    WHERE [Order Details].OrderID = [Order Details].OrderID
    AND Quantity > 50
);

SELECT * FROM Employees;

-- 3.qual o tempo medio de envio por cidade destino

SELECT Orders.ShipCity AS Cidade, 
  AVG(DATEDIFF(day, Orders.OrderDate, Orders.ShippedDate)) AS MediaDias
FROM Orders 
GROUP BY Orders.ShipCity;

-- 4.Para cada empregado exiba seu total de vendas em cada país

SELECT 
  Employees.FirstName, 
  Customers.Country, 
  SUM([Order Details].Quantity * [Order Details].UnitPrice) AS VendaTotal
FROM 
  Employees 
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID 
  INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID 
  INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID 
GROUP BY 
  Employees.FirstName, 
  Customers.Country
ORDER BY Employees.FirstName;

-- 5.qual o tempo medio de envio por cidade destino

SELECT Orders.OrderID,[Order Details].UnitPrice * ( 1 - [Order Details].Discount) AS ValorTotal
FROM Orders 
  INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID 
  INNER JOIN Products ON [Order Details].ProductID = Products.ProductID;

-- 6.Crie uma view chamada ProductDetails que mostre ProductID, Company-name, 
--CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsIntStock, UnitOnOrder, 
--ReorderLevel, Discontinued das tabelas Supplier, Products a Categories

CREATE VIEW ProductDetails AS
SELECT p.ProductID, s.CompanyName, c.CategoryName,c.Description, p.QuantityPerUnit, 
       p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;

DROP VIEW ProductDetails;

SELECT * FROM ProductDetails;




