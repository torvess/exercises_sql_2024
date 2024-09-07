--1

SELECT
	channelKey,
	SUM(SalesQuantity) AS 'Quantidade Vendida',
	SUM(ReturnQuantity) AS 'Quantidade Devolvida'
FROM
	FactSales
GROUP BY channelKey

--2

SELECT
	Occupation,
	AVG(YearlyIncome) AS 'Media Salario LY'	
FROM DimCustomer
GROUP BY
	Occupation

--3

--Eu que fiz
SELECT TOP(1)
	StoreDescription,
	SUM(EmployeeCount) AS 'Qtd Emplyee'
FROM
	DimStore
GROUP BY StoreDescription
ORDER BY [Qtd Emplyee] DESC

--4

-- Numero de funcionarios por genero

SELECT
	Gender,
	COUNT(EmployeeKey) AS 'Qtd Employee'
FROM
	DimEmployee
GROUP BY Gender

-- nome, email e data da contrataçao de funcionarios mais antigos

SELECT TOP(1)
	CONCAT(FirstName, ' ', LastName) AS 'Employee Name',
	EmailAddress,
	StartDate
FROM
	DimEmployee
ORDER BY StartDate ASC

--5

-- Quantidade distinta de cores de produtos

SELECT
	ProductDescription AS 'Product Name',
	COUNT(DISTINCT ColorName) AS 'Qtd Color'
FROM
	DimProduct
WHERE ProductDescription IS NOT NULL
GROUP BY ProductDescription

-- Quantidade de cores, marcas e classes de produtos

SELECT
	COUNT(DISTINCT ColorName) AS 'Qtd Color',
	COUNT(DISTINCT BrandName) AS 'Qtd Brand',
	COUNT(DISTINCT ClassName) AS 'Qtd Class'
FROM
	DimProduct







