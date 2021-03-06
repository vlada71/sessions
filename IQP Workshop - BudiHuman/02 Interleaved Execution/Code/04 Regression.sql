-------------------------------------------------------------------------------------
-- Intelligent Query Processing - Interleaved Execution
-- Milos Radivojevic, Data Platform MVP, bwin, Austria
-- E: milos.radivojevic@chello.at
-- W: https://milossql.wordpress.com/
-- Regression
-------------------------------------------------------------------------------------

USE Statistik;
GO
CREATE OR ALTER   FUNCTION dbo.SignificantEntries()
RETURNS @T TABLE
(ID INT NOT NULL)
AS
BEGIN
    INSERT INTO @T
	SELECT TOP 50000 id FROM A  
    RETURN
END
GO
 
ALTER DATABASE Statistik SET COMPATIBILITY_LEVEL = 130;
GO
SELECT ol.*
FROM b ol
INNER JOIN dbo.SignificantEntries() f1 ON f1.Id = ol.pid 
GO
ALTER DATABASE Statistik SET COMPATIBILITY_LEVEL = 140;
GO
SELECT ol.*
FROM b ol
INNER JOIN dbo.SignificantEntries() f1 ON f1.Id = ol.pid 
GO
--OPTION (USE HINT('DISABLE_INTERLEAVED_EXECUTION_TVF'));



--