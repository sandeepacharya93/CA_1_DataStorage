ALTER PROC SalesByStore

@id char(2)

AS

SELECT SUM(sf.TotalPrice) AS [Total Sale],s.StoreName,

p.ProductName, p.CategoryName, p.BrandName,

c.Month_, c.Year_, s.StoreId

FROM Sales_Fact sf INNER JOIN Product_Dim p

ON sf.ProductKey = p.ProductKey

INNER JOIN Calendar_Dim c

ON sf.CalendarKey = c.CalendarKey

INNER JOIN Store_Dim s ON sf.StoreKey = s.StoreKey

WHERE s.StoreId = @id

GROUP BY p.ProductName, p.CategoryName,p.BrandName

, c.Month_, c.Year_, s.StoreID,s.StoreName