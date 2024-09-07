--1
SELECT * FROM FactSales
SELECT * FROM DimChannel
SELECT * FROM DimStore

--a
SELECT
	ChannelName,
	SUM(SalesQuantity) AS 'Total Vendido'
FROM
	FactSales tb_a 
LEFT JOIN DimChannel tb_b ON tb_b.ChannelKey = tb_a.channelKey
GROUP BY ChannelName
ORDER BY [Total Vendido] DESC

--b
SELECT
	StoreName,
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total Devolvido',
	SUM(ReturnQuantity) / SUM(SalesQuantity) AS '% Dev'
FROM FactSales
LEFT JOIN DimStore ON Dimstore.StoreKey = FactSales.StoreKey
GROUP BY StoreName
ORDER BY [Total Vendido]

--c
SELECT * FROM FactSales
SELECT * FROM DimDate

SELECT
	CalendarMonthLabel AS 'Mês',
	SUM(SalesAmount) 'Venda R$'
FROM FactSales
LEFT JOIN DimDate ON DimDate.Datekey = FactSales.DateKey
GROUP BY CalendarMonthLabel

SELECT
	CalendarYear AS 'Mês',
	SUM(SalesAmount) 'Venda R$'
FROM FactSales
LEFT JOIN DimDate ON DimDate.Datekey = FactSales.DateKey
GROUP BY CalendarYear

--2
--a & b
SELECT * FROM FactSales
SELECT * FROM DimProduct

SELECT
	ColorName,
	SUM(SalesQuantity) AS 'Total Vendido'
FROM FactSales
LEFT JOIN DimProduct ON DimProduct.ProductKey = FactSales.ProductKey
GROUP BY ColorName
HAVING SUM(SalesQuantity) > 3000000
ORDER BY [Total Vendido] DESC

--3

SELECT TOP (10000)* FROM FactSales
SELECT * FROM DimProductCategory
SELECT * FROM DimProductSubcategory
SELECT * FROM DimProduct

SELECT
    DimProductCategory.ProductCategoryName,
    SUM(FactSales.SalesQuantity) AS 'Total Vendido'
FROM FactSales
LEFT JOIN DimProduct ON DimProduct.ProductKey = FactSales.ProductKey
LEFT JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
LEFT JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
GROUP BY DimProductCategory.ProductCategoryName
ORDER BY [Total Vendido] DESC

--4
SELECT TOP (10000)* FROM FactOnlineSales
SELECT * FROM DimCustomer

--a
SELECT
	DimCustomer.CustomerKey,
	CONCAT(DimCustomer.FirstName, DimCustomer.LastName) AS 'Nome Completo',
	SUM(SalesQuantity) AS 'Total Vendido'
FROM FactOnlineSales
INNER JOIN DimCustomer ON DimCustomer.CustomerKey = FactOnlineSales.CustomerKey
WHERE CustomerType = 'Person'
GROUP BY DimCustomer.CustomerKey, CONCAT(DimCustomer.FirstName, DimCustomer.LastName)
ORDER BY [Total Vendido] DESC

--b
SELECT
	ProductName AS 'Produto',
	SUM(SalesQuantity) AS 'Total Vendido'
FROM DimProduct
INNER JOIN FactOnlineSales ON FactOnlineSales.ProductKey = DimProduct.ProductKey
WHERE CustomerKey = 7665
GROUP BY ProductName
ORDER BY [Total Vendido] DESC

--5
SELECT * FROM FactOnlineSales
SELECT * FROM DimCustomer

SELECT
	tb_b.Gender as 'Gênero',
	SUM(SalesQuantity) as 'Total Vendido'
FROM FactOnlineSales tb_a
INNER JOIN DimCustomer tb_b ON tb_b.CustomerKey = tb_a.CustomerKey
WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY [Total Vendido] DESC

--6
SELECT * FROM FactExchangeRate
SELECT * FROM DimCurrency

SELECT
	CurrencyDescription,
	AVG(AverageRate) AS 'Taxa de câmbio média'
FROM FactExchangeRate
INNER JOIN DimCurrency ON DimCurrency.CurrencyKey = FactExchangeRate.CurrencyKey
GROUP BY CurrencyDescription

--7
SELECT * FROM FactStrategyPlan
SELECT * FROM DimScenario
SELECT * FROM DimDate

SELECT
	ScenarioName,
	SUM(Amount) AS 'Total'
FROM FactStrategyPlan
INNER JOIN DimScenario ON DimScenario.ScenarioKey = FactStrategyPlan.ScenarioKey
GROUP BY ScenarioName
ORDER BY Total DESC

--8

SELECT
	CalendarYear AS 'Ano',
	ScenarioName AS 'Cenário',
	SUM(Amount) 'Total'
FROM FactStrategyPlan
INNER JOIN DimScenario ON DimScenario.ScenarioKey = FactStrategyPlan.ScenarioKey
INNER JOIN DimDate ON DimDate.Datekey = FactStrategyPlan.Datekey
GROUP BY CalendarYear, ScenarioName
ORDER BY Ano, Total

--9

SELECT * FROM DimProductSubcategory
SELECT * FROM DimProduct

SELECT
	tb_a.ProductSubcategoryName AS 'SubCategoria',
	COUNT(ProductKey) AS 'Qtd Produtos'
FROM DimProductSubcategory tb_a
LEFT JOIN DimProduct ON DimProduct.ProductSubcategoryKey = tb_a.ProductSubcategoryKey
WHERE 0=0
	AND BrandName = 'Contoso'
	AND ColorName = 'Silver'
GROUP BY ProductSubcategoryName

--10

SELECT
	ProductSubcategoryName AS 'SubCategoria',
	BrandName AS 'Marca',
	Count(ProductKey) AS 'Qtd Produtos'
FROM DimProduct
INNER JOIN DimProductSubcategory ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
GROUP BY ProductSubcategoryName, BrandName
