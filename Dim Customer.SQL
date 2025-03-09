-- Cleansed DIM_Customers Table --
SELECT 
  c.customerkey AS [CustomerKey], -- Corrected alias
  -- ,[GeographyKey]
  -- ,[CustomerAlternateKey]
  -- ,[Title]
  c.firstname AS [FirstName], -- Fixed column name
  -- ,[MiddleName]
  c.lastname AS [LastName], 
  c.firstname + ' ' + c.lastname AS [FullName], -- Added alias `c.` for lastname
  -- Combined First and Last Name
  -- ,[NameStyle]
  -- ,[BirthDate]
  -- ,[MaritalStatus]
  -- ,[Suffix]
  CASE 
    WHEN c.gender = 'M' THEN 'Male' 
    WHEN c.gender = 'F' THEN 'Female' 
    ELSE 'Unknown' 
  END AS Gender, -- Added `ELSE` for robustness
  -- ,[EmailAddress]
  -- ,[YearlyIncome]
  -- ,[TotalChildren]
  -- ,[NumberChildrenAtHome]
  -- ,[EnglishEducation]
  -- ,[SpanishEducation]
  -- ,[FrenchEducation]
  -- ,[EnglishOccupation]
  -- ,[SpanishOccupation]
  -- ,[FrenchOccupation]
  -- ,[HouseOwnerFlag]
  -- ,[NumberCarsOwned]
  -- ,[AddressLine1]
  -- ,[AddressLine2]
  -- ,[Phone]
  c.datefirstpurchase AS DateFirstPurchase, 
  -- ,[CommuteDistance]
  g.city AS [CustomerCity] -- Joined Customer City from Geography Table
FROM 
  dbo.dimcustomer AS c 
  LEFT JOIN dbo.dimgeography AS g 
    ON g.geographykey = c.geographykey -- Fixed join condition
ORDER BY 
  c.customerkey ASC; -- Corrected column alias and capitalization
