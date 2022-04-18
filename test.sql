--comment

--select count(*) from [SalesLT].[Product];
--select * from [SalesLT].[Product];
--select count(*)  from [SalesLT].[Product] GROUP by Color; 
--SELECT * from [SalesLT].[Product];

--SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'

SELECT * FROM INFORMATION_SCHEMA.TABLES;

--SELECT TABLE_NAME, TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES;
--SELECT TABLE_TYPE from INFORMATION_SCHEMA.TABLES;
--SELECT DISTINCT TABLE_TYPE from INFORMATION_SCHEMA.TABLES;

SELECT TABLE_TYPE, count(TABLE_TYPE) FROM INFORMATION_SCHEMA.TABLES GROUP BY TABLE_TYPE;

--SELECT * from [SalesLT].Customer;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Customer';

SELECT * from [SalesLT].[Product];

SELECT * FROM [SalesLT].[Product] where [Name] LIKE 'A%';

SELECT * FROM [SalesLT].[Address];

--TODO:
--Find all products which 
---- 1. Name starts from 'Sport' or include 'logo' (even inside some specific word)

SELECT * FROM [SalesLT].[Product] where [Name] LIKE '%Sport%' or  [Name] like '%logo%';

--SELECT with ORDER
SELECT TOP (100)
       [ProductID]
      , [Name]
      , [ProductNumber]
      , [Color]
      , [StandardCost]
      , [ListPrice]
      , [Size]
      , [Weight]
      , [ProductCategoryID]
      , [ProductModelID]
      , [SellStartDate]
      , [SellEndDate]
      , [DiscontinuedDate]
      , [ThumbNailPhoto]
      , [ThumbnailPhotoFileName]
      , [rowguid]
      , [ModifiedDate]
FROM [SalesLT].[Product]
ORDER BY [Name]

--SELECT with WHERE
SELECT [ProductID]
      , [Name]
      , [ProductNumber]
      , [Color]
      , [StandardCost]
      , [ListPrice]
      , [Size]
      , [Weight]
FROM [SalesLT].[Product]
WHERE [ListPrice] >= 2000

--select count(*), Color from [SalesLT].[Product]  GROUP by Color;
--SELECT DISTINCT [Color] FROM [SalesLT].[Product]

--TODO:
--Find all products which 
-- 2. Price is less than 1000
--
--WHERE [ListPrice] >= 2000

--WHERE [ListPrice] >= 2000
--       AND [SellStartDate] >= '2002-06-01 00:00:00.000'
--       OR [Name] LIKE 'Mountain%'

--where [Name] LIKE '%Sport%' or  [Name] like '%logo%';

select * from [SalesLT].[Product];

select * from [SalesLT].[Product] WHERE [Weight] > 6000.93;

--SELECT with named columns
SELECT [ProductID],
       [Name],
       [ListPrice],
       [ListPrice] * 10 / 100 AS discount_
FROM [SalesLT].[Product] where [ListPrice] * 10 / 100 > 100;


--SELECT with named columns
SELECT [ProductID],
       [Name],
       [ListPrice],
       [ListPrice] * 10 / 100 AS discount_
FROM [SalesLT].[Product] where [ListPrice] * 10 / 100 > 100;


SELECT [ProductID]
      , [Name]
      , [ProductNumber]
      , [Color]
      , [StandardCost]
      , [ListPrice]
      , [Size]
      , [Weight]
      , [SellStartDate]
FROM [SalesLT].[Product]
WHERE [ListPrice] >= 2000
       AND [SellStartDate] >= '2005-06-15 00:00:00.000'
       OR [Name] LIKE 'Road%'

--UNION ALL
       SELECT 'Category' as [Type], [Name]
       FROM [SalesLT].[ProductCategory]
UNION ALL
       SELECT 'Model' as [Type], [Name]
       FROM [SalesLT].[ProductModel]

--select rowguid from [SalesLT].Customer where CustomerId = 1

--SELECT NEWID() AS Kupa;
--SELECT getdate() As DDD;

DECLARE @myguid uniqueidentifier = NEWID();
--SELECT @myguid AS Result;
insert into [SalesLT].[Address]  values ( 30119, 'Bieżanowska', 'Krakow', 'Małopolskie', 'Poland', '30826', @myguid ,getdate())

--INSERT Customer (CustomerId, CustomerName)
--VALUES
--    (NEWID(), 'Bart Farnsworth'),
--    (NEWID(), 'Bruce Norris');

delete from [SalesLT].[Address] where AddressId = 11387;

select rowguid from [SalesLT].Customer where CustomerId = 1;

SELECT * FROM [SalesLT].[Address];

SELECT * FROM [SalesLT].[Address] where AddressID > 11380;

SELECT * FROM [SalesLT].[Customer];

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Address';

--INSERT Customer (CustomerId, CustomerName)
--VALUES
 --   (NEWID(), 'Bart Farnsworth'),
 --   (NEWID(), 'Bruce Norris');

SELECT * FROM Customer;

-- BEGIN
-- DECLARE @myguid uniqueidentifier = NEWID();
-- insert into [SalesLT].[Address]  values ( 30119, 'Bieżanowska', 'Krakow', 'Małopolskie', 'Poland', '30826', @myguid ,getdate());
-- COMMIT;

--ALTER USER userName WITH DEFAULT_SCHEMA = [SalesLT];
select * from [dbo].[ErrorLog];


SELECT [ProductID],
       [Name],
       [ListPrice],
       [ListPrice] * 10 / 100 AS ObliczenieEleny
FROM [SalesLT].[Product] Where [ListPrice] * 10 / 100  < 100;

-- jak dodac nowa kolumne do istniejacej tabeli address 
-- dodaj kolumne domfon ktora moze byc pusta
-- dodaj kolumne ktora domyslnie jest pusta
-- dodaj ja na koncu
-- https://www.codegrepper.com/code-examples/sql/azure+sql+alter+table+add+column

--ALTER TABLE table
--ADD COLUMN column VARCHAR (255) NOT NULL AFTER column;

--/ALTER TABLE table ADD COLUMN column VARCHAR (255) NOT NULL AFTER column;


-- zmien tabele i dodaj w niej nowa kolumne
ALTER TABLE [SalesLT].[Address] 
ADD Dom NVARCHAR (255) NOT NULL;

ALTER TABLE [SalesLT].[Address] ALTER column Domofon NVARCHAR (255);

ALTER TABLE [SalesLT].[Address] ALTER column Domofon DEFAULT 'klatka A';


ALTER TABLE [SalesLT].[Address] ALTER COLUMN [Domofon] ;

select * from [SalesLT].[Address] where City like 'Krakow';

--INSERT Customer (CustomerId, CustomerName)
--VALUES
--    (NEWID(), 'Bart Farnsworth'),
--    (NEWID(), 'Bruce Norris');

UPDATE [SalesLT].[Address] SET City = 'Kraków'  WHERE AddressID  = 11383;

DECLARE @character nvarchar(1)
--SET @character = 'ł'
SET @character = NCHAR(322)
UPDATE [SalesLT].[Address] SET StateProvince = 'MałopolskieŁ'+@character  WHERE AddressID  = 11383;

SELECT * FROM [SalesLT].[Address] ORDER BY AddressID DESC;

SELECT UNICODE('ł')
--108

SELECT NCHAR(322)



SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Address';

CREATE TABLE INSTAGRAM_COOPERATION(
   ID   INT              NOT NULL,
   NAME NVARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2) DEFAULT 100.00,       
   PRIMARY KEY (ID)
);
SELECT * FROM [INSTAGRAM_COOPERATION]

INSERT INSTAGRAM_COOPERATION (ID, NAME, AGE, ADDRESS, SALARY)
VALUES
   (1, 'Bart Farnsworth', 21, 'Bieżanowska', 1000.00)
 --   (NEWID(), 'Bruce Norris');

 SELECT * FROM [INSTAGRAM_COOPERATION];

 
DROP TABLE [dbo].[INSTAGRAM_COOPERATION]

 SELECT CURRENT_USER;  
GO  

SELECT * FROM INFORMATION_SCHEMA.SCHEMA;

SELECT SCHEMA_NAME(); 

select * from USERS;

SELECT SCHEMA_NAME(1); 
SELECT SCHEMA_NAME(5); 


SELECT name as username, create_date, 
       modify_date, type_desc as type
FROM sys.database_principals
WHERE type not in ('A', 'G', 'R', 'X')
      and sid is not null
      and name != 'guest'

      SELECT * FROM sys.database_principals;

-- how to find out what is the default schema name
SELECT name, default_schema_name, default_language_name FROM sys.database_principals ORDER BY [name]

SELECT * FROM sys.database_principals WHERE type = 'S';

--https://sqlserverguides.com/category/azure-sql-server/
SELECT * FROM sys.database_principals
WHERE type = 'S'
ORDER BY [name]

  SELECT * FROM sys.databases

  SELECT * FROM sys.schemas

  SELECT SCHEMA_NAME(5);

  SELECT sch.name AS [Schema Name],
    sch.schema_id AS [Schema ID],
    users.name AS [Schema Owner]
FROM sys.schemas sch
    inner join sys.sysusers users
        ON users.uid = sch.principal_id
ORDER BY sch.name

  SELECT sch.name AS [Schema Name],
    sch.schema_id AS [Schema ID]
    --users.name AS [Schema Owner]
FROM sys.schemas sch

SELECT * FROM sys.sysusers;


--Group by (non-aggreagte columns always should be present in the group by clause)
SELECT [SellStartDate],
       [ProductCategoryID], 
       MAX([ListPrice]),
       MIN([ListPrice])
FROM [SalesLT].[Product]
GROUP BY [SellStartDate], [ProductCategoryID]

SELECT * FROM [SalesLT].[Product]

SELECT [SellStartDate],
       [ProductCategoryID], 
       SUM([ListPrice])  AS DUPA
FROM [SalesLT].[Product]
GROUP BY [SellStartDate] , [ProductCategoryID]
ORDER BY DUPA DESC


select * from [SalesLT].ProductCategory


-- SELECT column_name(s)
-- FROM table1
-- LEFT JOIN table2
-- ON table1.column_name = table2.column_name;

select ProductCategoryID, Name from [SalesLT].ProductCategory

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


SELECT [Product].Name, 

[Product].[SellStartDate],
--       [Product].[ProductCategoryID],
  --    SUM([Product].[ListPrice])  AS DUPA,
--       [ProductCategory].[ProductCategoryID],
       [ProductCategory].[Name]
FROM [SalesLT].[Product]
--GROUP BY [Product].[SellStartDate] , [Product].[ProductCategoryID]
LEFT JOIN [SalesLT].[ProductCategory] ON [Product].[ProductCategoryID] = [ProductCategory].[ProductCategoryID];
