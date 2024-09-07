--1

SELECT
	channelKey AS 'Canal Venda',
	SUM(SalesQuantity) AS 'Qtd Vendida'
		FROM FactSales
			GROUP BY channelKey

--2

--A

SELECT
	ProductKey AS 'Cod Produto',
	SUM(SalesAmount) AS 'Total Vendido'
		FROM FactSales
			GROUP BY ProductKey
				HAVING SUM(SalesAmount) > 5000000
					ORDER BY [Total Vendido] DESC

--B

SELECT TOP(10)
	ProductKey AS 'Cod Produto',
	SUM(SalesAmount) AS 'Total Vendido'
		FROM FactSales
			GROUP BY ProductKey
				HAVING SUM(SalesAmount) > 5000000
					ORDER BY [Total Vendido] DESC

--3

--A

SELECT TOP (1)
	CustomerKey AS 'ID Cliente',
	SUM(SalesQuantity) AS 'Qtd Vendida'
		FROM FactOnlineSales
			GROUP BY CustomerKey
				ORDER BY [Qtd Vendida] DESC

--B

SELECT * FROM FactOnlineSales

SELECT TOP (3)
	CustomerKey AS 'ID Cliente',
	ProductKey AS 'ID Produto',
	SUM(SalesQuantity) AS 'Qtd Vendida'
		FROM FactOnlineSales
			WHERE CustomerKey = 19037
				GROUP BY CustomerKey, ProductKey
					ORDER BY [Qtd Vendida] DESC

--4

--A

SELECT * FROM DimProduct

SELECT
	BrandName AS 'Nome da Marca',
	COUNT(ProductKey) AS 'Qtd Produtos'
		FROM DimProduct
			GROUP BY BrandName
				ORDER BY [Qtd Produtos] DESC

--B

SELECT
	ClassName AS 'Nome da Classe',
	AVG(UnitPrice) AS 'Preço Médio'
		FROM DimProduct
			GROUP BY ClassName

--C

SELECT
	ColorName AS 'Nome da Cor',
	SUM(Weight) AS 'Peso Total'
		FROM DimProduct
			GROUP BY ColorName

--5


SELECT
	StockTypeName,
	SUM(Weight) AS 'Peso Total'
		FROM DimProduct
			WHERE BrandName = 'Contoso'
				GROUP BY StockTypeName
					ORDER BY [Peso Total] DESC

--6

SELECT
	BrandName AS 'Nome da Marca',
	COUNT(DISTINCT ColorName) AS 'Qtd Disp Cores'
		FROM DimProduct
			GROUP BY BrandName
				ORDER BY [Qtd Disp Cores]

--7

SELECT * FROM DimCustomer

SELECT
	Gender,
	COUNT(CustomerKey) AS 'Qtd Clientes',
	AVG(YearlyIncome) AS 'Média Salario Anual'
		FROM DimCustomer
			WHERE Gender IS NOT NULL			
				GROUP BY Gender

--8

SELECT
	Gender,
	Education,
	COUNT(CustomerKey) AS 'Qtd Clientes',
	AVG(YearlyIncome) AS 'Média Salario Anual'
		FROM DimCustomer
			WHERE Gender IS NOT NULL			
				GROUP BY Gender, Education
					ORDER BY Gender, Education

--9

SELECT * FROM DimEmployee

SELECT
	DepartmentName,
	COUNT(EmployeeKey) AS 'Qtd Funcionários'
		FROM DimEmployee
			WHERE Status = 'Current'
				GROUP BY DepartmentName
					ORDER BY DepartmentName

--10

SELECT
	Title AS 'Cargo',
	SUM(VacationHours) AS 'Horas Férias'
		FROM DimEmployee
			WHERE Gender = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance')
				GROUP BY Title
				



				
				