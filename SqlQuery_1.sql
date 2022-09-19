SELECT [ProductId], COUNT(ProductId) as Times
FROM [Market].[dbo].[Sales] sal 
	INNER JOIN (
		SELECT [CustomerId], MIN(DateCreated) as BecomeBuyerDate 
		FROM [Market].[dbo].[Sales] GROUP BY CustomerId
	) as cus 
	ON sal.CustomerId = cus.CustomerId AND 
	   sal.DateCreated = cus.BecomeBuyerDate
GROUP BY ProductId