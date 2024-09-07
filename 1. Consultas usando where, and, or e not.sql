SELECT * FROM DimEmployee

--1. Selecione todas as linhas da tabela dimEmployee de funcionarios do sexo feminino e do departamento de finanças

SELECT * FROM DimEmployee
WHERE Gender = 'F' AND DepartmentName = 'Finance'

--2. Selecione todas as linhas da tabela dimProduct de produtos da marca Contoso e da cor vermelha e que tenham um UnitPrice maior ou igual a $100

SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Red' AND UnitPrice >= 100

--3. Selecione todas as linhas da tabela dimProduct com produtos da marca Litware ou da marca Fabrikam ou da cor preta

SELECT * FROM DimProduct
WHERE (BrandName = 'Litware' or BrandName = 'Fabrikam') or ColorName = 'Black'

--4. Selecione todas as linhas da tabela dimSalesTerritory onde o continen é a europa mas o pais nao e igual a italia

SELECT * FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'Europe' and NOT SalesTerritoryCountry = 'Italy'
