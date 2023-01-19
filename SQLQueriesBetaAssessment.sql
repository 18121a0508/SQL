
----Beta - SQL Test  Solved 

/*Data Model****************************************************************************************************************************************************
StockLedger { ProductID, TransactionDate, TransactionSNO, Quantity, InWardOutward)
InWardoutWard will have value 1 for in coming stock and  -1 for out going stock
Product (ProductID , ProductName, ProductCategoryID, UnitID)
Unit(UnitID,  UnitName, StandardUnitID)  
ProductCategory (ProductCategoryID, ProductCategoryName)
***************************************************************************************************************************************************************/

/*Q 01****************************************************************************************************************************************************
Write a query  to display  All products where Name contains Soap in it.
Display  ProductID, ProductName , ProductCategoryName , UnitName   
*/

SELECT P.ProductID, P.ProductName , PC.ProductCategoryName , U.UnitName 
FROM Product P
INNER JOIN ProductCategory PC ON P.ProductCategoryID= PC.ProductCategoryID 
INNER JOIN Unit U ON  P.UnitID  =  U.UnitID
WHERE  ProductName Like '%Soap%'     --   SQL  Server  is not case sensitive so it does not matter if you search of soap SOAP or any other varation 

/*END Q 01 **************************************************************************************************************************************************************/

/*Q 02****************************************************************************************************************************************************
Write a query  to display  All products.
Display  ProductID, ProductName , ProductCategoryName , UnitName , StandardUnitName  
*/

SELECT P.ProductID, P.ProductName , PC.ProductCategoryName , U.UnitName , SU.UnitName StandardUnitName 
FROM Product P
INNER JOIN ProductCategory PC ON P.ProductCategoryID= PC.ProductCategoryID 
INNER JOIN Unit U ON  P.UnitID  =  U.UnitID
INNER JOIN Unit SU ON  SU.UnitID  =  U.StandardUnitID   ---   if we need Standard unit of  (Unit U)  we need find UnitName for  U.StandardUnitID 

/*END Q 02 **************************************************************************************************************************************************************/

/*Q 03****************************************************************************************************************************************************
Write Stored Procedure to help search  for  Products, procedure should support pagination to allow users to choose No Of rows per Page.
Columns to Display :  ProductID,ProductName,UnitName,ProductCategoryName, 
Procedure Parameters : @ProductName , @ProductCategoryName,@NoofRowsPerPage , @PageNo
ProductName  and ProductCategoryName  should be a starts with search,  All search parameters are optional , where user can search on either or both the parameters, when both parameters are provided search should be ProductName  contains @ProductName  AND  ProductCategoryName   Contains @ProductCategoryName  
*/

GO
/*Starta Q 03 V01 Dynamic Query****************************************************************************************************************************************************
*/
	CREATE PROCEDURE SP_GetProduct
	(
		 @ProductName NVARCHAR(50) = NULL, @ProductCategoryName NVARCHAR(50) = NULL
		 ---  For a parameter to be Optional  we need to  initiate it to a value  in declaration ,  better to set it to null
		 ,@PageNumber Int = 1, @RowsPerPage Int = 50
	)
	AS
	BEGIN
		Declare @SQL  NVARCHAR(MAX)


		Declare @Filter  NVARCHAR(MAX)

		SET @SQL = '		
				SELECT P.ProductID, P.ProductName , PC.ProductCategoryName , U.UnitName 
				FROM Product P
				INNER JOIN ProductCategory PC ON P.ProductCategoryID= PC.ProductCategoryID 
				INNER JOIN Unit U ON  P.UnitID  =  U.UnitID
		'  

		SET @Filter = ' 1=1 '

		IF @ProductName  IS NOT NULL 
			SET @Filter  =   ' P.ProductName  LIKE + @ProductName1 + ''%''' 
		IF @ProductCategoryName IS NOT NULL 
				SET @Filter  =   @Filter  + CASE WHEN @Filter ='' THEN  '' ELSE ' AND ' END +   ' B.@ProductCategoryName LIKE + @@ProductCategoryName1 + ''%''' 
		
		
	   SET  @SQL  = @SQL  + ' WHERE  ' + @Filter  + ' ORDER BY P.ProductID
					OFFSET (@PageNumber1-1)*@RowsOfPage1 ROWS
					FETCH NEXT @RowsOfPage1 ROWS ONLY '  

		EXEC SP_ExecuteSQL  @SQL  ,  N'@ProductName1 NVARCHAR(50), @ProductCategoryName1 NVARCHAR(50)
				,@PageNumber1 Int, @RowsPerPage1' , @ProductName1 =@ProductName, @ProductCategoryName1 =@ProductCategoryName
				,@PageNumber1=@PageNumber , @RowsPerPage1=@RowsPerPage 	

	END
/*END V01 Q 03 **************************************************************************************************************************************************************/
/*Start V02 Q 03 **************************************************************************************************************************************************************/
GO
CREATE PROCEDURE SP_GetProduct
	(
		 @ProductName NVARCHAR(50) = NULL, @ProductCategoryName NVARCHAR(50) = NULL
		 ---  For a parameter to be Optional  we need to  initiate it to a value  in declaration ,  better to set it to null
		 ,@PageNumber Int = 1, @RowsPerPage Int = 50
	)
	AS
	BEGIN
	
	SELECT P.ProductID, P.ProductName , PC.ProductCategoryName , U.UnitName 
				FROM Product P
				INNER JOIN ProductCategory PC ON P.ProductCategoryID= PC.ProductCategoryID 
				INNER JOIN Unit U ON  P.UnitID  =  U.UnitID
	WHERE  (@ProductName IS NULL  OR  	P.ProductName LIKE @ProductName + '%')
	AND (@ProductCategoryName IS NULL  OR  	P.ProductCategoryName LIKE @ProductCategoryName + '%')
	ORDER BY P.ProductID  
	OFFSET (@PageNumber1-1)*@RowsOfPage1 ROWS
	FETCH NEXT @RowsOfPage1 ROWS ONLY 

	END

/*END Q 03 **************************************************************************************************************************************************************/



/*Q 04****************************************************************************************************************************************************
Write a query  to display  Total Stock by product as of given date '31-March-2022'
Display  ProductID, ProductName , ProductCategoryName , UnitName ,  TotalStock   
*/


SELECT P.ProductID, P.ProductName , PC.ProductCategoryName , U.UnitName ,  

	SUM(InWardOutward*Quantity)  TotalStock   ---   
	/*when we multiply with InWardOutward which is 1 for in comming and -1 for out goging with quanity we will get net  stock */ 

FROM StockLedger SL 
INNER JOIN  Product P  ON   P.ProductID  = SL.ProductID  
INNER JOIN ProductCategory PC ON P.ProductCategoryID= PC.ProductCategoryID 
INNER JOIN Unit U ON  P.UnitID  =  U.UnitID
WHERE TransactionDate < '1-April-2022'   --  Filters All rows untill till  12:00 AM '1-April-2022'   
	-- to get total stock we need to  sum all incomming stock  and substract outgoing stock   
GROUP  BY P.ProductID, P.ProductName , PC.ProductCategoryName , U.UnitName 
/*END Q 02 **************************************************************************************************************************************************************/
