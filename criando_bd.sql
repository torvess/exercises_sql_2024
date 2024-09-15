USE BD_Impressionador;

CREATE TABLE Produtos(
	id_produto INT,
	nome_produto VARCHAR(200),
	data_validade DATETIME,
	preco_produto FLOAT
	);

SELECT * FROM Produtos;


INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
SELECT
	ProductKey,
	ProductName,
	AvailableForSaleDate,
	UnitPrice
FROM
	ContosoRetailDW.dbo.DimProduct;

DROP TABLE Produtos;

INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
VALUES
	(3, 'macarrao', '31/12/2024', 2.6),
	(4, 'arroz', '31/12/2024', 22.50),
	(5, 'feijao', '31/12/2024', 8.99);

UPDATE Produtos
SET nome_produto = 'Macarrão'
WHERE id_produto = 4

DELETE
FROM Produtos
WHERE id_produto = 3