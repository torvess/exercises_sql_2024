-- 1

SELECT 
	TOP(10) * 
FROM 
	FactSales
ORDER BY 
	SalesAmount DESC

--2

SELECT 
	TOP(10) *
FROM
	DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate 

--3

SELECT 
	[ProductName] AS 'Nome do Produto', [Weight] AS 'Peso do Produto'
FROM
	DimProduct
WHERE Weight >= 100
ORDER BY Weight DESC

--4

SELECT
	[StoreName] AS 'Nome da Loja',
	[OpenDate] AS 'Data Abertura',
	[EmployeeCount] AS 'Quantidade Funcionário'
FROM
	DimStore
WHERE Storetype = 'Store' AND Status = 'On'

--5

SELECT 
	*
FROM
	DimProduct
WHERE BrandName = 'Litware' AND ProductDescription LIKE '%Home Theater%' AND AvailableForSaleDate = '20060315'

--6

SELECT
	*
FROM DimStore
WHERE Storetype = 'Store' AND CloseDate IS NOT NULL 

--7

SELECT
	StoreKey,
	StoreName,
	EmployeeCount
FROM
	DimStore
ORDER BY EmployeeCount DESC

--8

SELECT
	ProductKey,
	ProductLabel,
	ProductName,
	UnitPrice
FROM
	DimProduct
WHERE ProductName LIKE '%LCD%'
ORDER BY UnitPrice DESC

--9

SELECT
	ProductKey,
	ProductLabel,
	ProductName,
	BrandName,
	ColorName,
	UnitPrice
FROM
	DimProduct
WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')

--10

SELECT
	ProductKey,
	ProductLabel,
	ProductName,
	BrandName,
	ColorName,
	UnitPrice
FROM
	DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY UnitPrice DESC