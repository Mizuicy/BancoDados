SELECT * FROM Orders;
USE Northwind;

--Qual o custo total de cada tipo de frete

SELECT ShipVia, SUM(Freight) AS FreteTotal
FROM Orders
GROUP BY ShipVia
ORDER BY ShipVia;

--Mostre quantos produtos fornecedor disponibiliza em cada categoria

SELECT SupplierID, CategoryID, COUNT(DISTINCT(ProductID))
FROM Products
WHERE Discontinued=0
GROUP BY SupplierID, CategoryID
ORDER BY SupplierID;

--O gerente de venda da Northwind pede uma série temporal (mensal) com volume de pedidos e o valor de vendas

SELECT FORMAT(o.OrderDate, 'yyyy-MM') AS Mes,
COUNT(DISTINCT(o.OrderId)) AS NumeroPedidos,
ROUND(SUM(od.Quantity*UnitPrice*(1-od.Discount)), 2) AS ValorTotalPedidos
FROM Orders AS o
JOIN [Order Details] AS od ON od.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY NumeroPedidos;



CREATE FUNCTION EmpregadoNome(@empregadoId int)
RETURNS TABLE 
RETURN (
	SELECT FirstName, LastName, HomePhone
	
	FROM Employees
	WHERE EmployeeID = @empregadoId
)

SELECT * FROM EmpregadoNome(5);







