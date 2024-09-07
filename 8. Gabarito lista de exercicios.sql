--1 

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory

SELECT
	tb_a.ProductKey,
	tb_a.ProductName,
	tb_a.ProductSubcategoryKey,
	tb_b.ProductSubcategoryDescription
FROM DimProduct tb_a
INNER JOIN DimProductSubcategory tb_b
	ON tb_b.ProductSubcategoryKey = tb_a.ProductSubcategoryKey 

--2

SELECT * FROM DimProductSubcategory
SELECT * FROM DimProductCategory

SELECT
	tb_a.ProductCategoryKey,
	tb_a.ProductCategoryName,
	tb_b.ProductSubcategoryKey,
	tb_b.ProductSubcategoryName
FROM DimProductCategory tb_a
LEFT JOIN DimProductSubcategory tb_b
	ON tb_b.ProductCategoryKey = tb_a.ProductCategoryKey

--3

SELECT * FROM DimStore
SELECT * FROM DimGeography

SELECT
	tb_a.StoreKey,
	tb_a.StoreName,
	tb_a.StoreType,
	tb_b.ContinentName,
	tb_b.RegionCountryName
FROM DimStore tb_a
LEFT JOIN DimGeography tb_b
	ON tb_b.GeographyKey = tb_a.GeographyKey

--4

SELECT * FROM DimProduct
SELECT * FROM DimProductCategory
SELECT * FROM DimProductSubcategory

SELECT
	tb_c.ProductCategoryKey,
	tb_c.ProductCategoryDescription,
	tb_a.ProductKey,
	tb_a.ProductName
FROM DimProduct tb_a
LEFT JOIN DimProductSubcategory tb_b
	ON tb_b.ProductSubcategoryKey = tb_a.ProductSubcategoryKey
LEFT JOIN DimProductCategory tb_c
	ON tb_c.ProductCategoryKey = tb_b.ProductCategoryKey

--5

SELECT TOP (100) * FROM FactStrategyPlan
SELECT * FROM DimAccount

SELECT TOP (100)
	tb_a.StrategyPlanKey,
	tb_a.DateKey,
	tb_b.AccountName,
	tb_a.Amount
FROM FactStrategyPlan tb_a
INNER JOIN DimAccount tb_b
	ON tb_b.AccountKey = tb_a.AccountKey

--6

SELECT TOP (100) * FROM FactStrategyPlan
SELECT * FROM DimScenario

SELECT TOP (100)
	tb_a.StrategyPlanKey,
	tb_a.DateKey,
	tb_b.ScenarioName,
	tb_a.Amount
FROM FactStrategyPlan tb_a
INNER JOIN DimScenario tb_b
	ON tb_b.ScenarioKey = tb_a.ScenarioKey

--7

SELECT * FROM DimProductSubcategory
SELECT * FROM DimProduct

SELECT
	tb_a.ProductSubcategoryKey,
	tb_a.ProductSubcategoryName,
	tb_b.ProductKey,
	tb_b.ProductName
FROM DimProductSubcategory tb_a
LEFT JOIN DimProduct tb_b
	ON tb_b.ProductSubcategoryKey = tb_a.ProductSubcategoryKey
WHERE ProductName IS NULL

--8

SELECT * FROM FactSales
SELECT * FROM DimChannel
SELECT * FROM DimProduct

SELECT
	DISTINCT tb_a.BrandName,
	tb_c.ChannelName 
FROM DimProduct tb_a
LEFT JOIN FactSales tb_b
	ON tb_b.ProductKey = tb_a.ProductKey
LEFT JOIN DimChannel tb_c
	ON tb_c.ChannelKey = tb_b.channelKey
WHERE BrandName IN ('Contoso', 'Fabrikam', 'Litware')


--9

SELECT * FROM DimPromotion
SELECT * FROM FactOnlineSales

SELECT TOP (10000)
	tb_a.OnlineSalesKey,
	tb_a.DateKey,
	tb_b.PromotionName,
	tb_a.SalesAmount
FROM FactOnlineSales tb_a
LEFT JOIN DimPromotion tb_b
	ON tb_b.PromotionKey = tb_a.PromotionKey
WHERE PromotionName <> 'No Discount'
ORDER BY DateKey

--10

SELECT * FROM FactSales
SELECT * FROM DimChannel
SELECT * FROM DimStore
SELECT * FROM DimProduct

SELECT
	tb_sales.SalesKey,
	tb_channel.ChannelName,
	tb_store.StoreName,
	tb_prod.ProductName,
	tb_sales.SalesAmount
FROM FactSales tb_sales
LEFT JOIN DimChannel tb_channel
	ON tb_channel.ChannelKey = tb_sales.channelKey
LEFT JOIN DimStore tb_store
	ON tb_store.StoreKey = tb_sales.StoreKey
LEFT JOIN DimProduct tb_prod
	ON tb_prod.ProductKey = tb_sales.ProductKey
ORDER BY SalesAmount DESC