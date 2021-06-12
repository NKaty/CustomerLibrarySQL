USE [CustomerLib_Naida];

-- Valid insertions

 GO

 DECLARE @ID AS int;

 INSERT INTO [dbo].[Customers] VALUES('Bob', 'Smith', NULL, 'bob@gmail.com', 1000.54);
 SET @ID = @@IDENTITY;
 INSERT INTO [dbo].[Addresses] VALUES(@ID, 'Some address', 'continues', 'Shipping', 'New York', '123456', 'NY', 'United States');
 INSERT INTO [dbo].[Addresses] VALUES(@ID, 'Another address', NULL, 'Shipping', 'Some City', '123456', 'Some State', 'Canada');
 INSERT INTO [dbo].[Notes] VALUES(@ID, 'Note1');
 INSERT INTO [dbo].[Notes] VALUES(@ID, 'Note2');

 INSERT INTO [dbo].[Customers] VALUES('Tom', 'Lee', '+123476543', NULL, NULL);
 SET @ID = @@IDENTITY;
 INSERT INTO [dbo].[Addresses] VALUES(@ID, 'Some address', NULL, 'Billing', 'Boston', '123456', 'MA', 'United States');
 INSERT INTO [dbo].[Addresses] VALUES(@ID, 'Another address', 'is long', 'Shipping', 'Boston', '123456', 'MA', 'United States');
 INSERT INTO [dbo].[Notes] VALUES(@ID, 'Note3');
 INSERT INTO [dbo].[Notes] VALUES(@ID, 'Note4');

 INSERT INTO [dbo].[Customers] VALUES('Anna', 'Roy', '+123476543', NULL, 5005);
 SET @ID = @@IDENTITY;
 INSERT INTO [dbo].[Addresses] VALUES(@ID, 'Her address', NULL, 'Billing', 'Her city', '123456', 'Her state', 'Canada');
 INSERT INTO [dbo].[Notes] VALUES(@ID, 'Note5');

 INSERT INTO [dbo].[Customers] VALUES(NULL, 'West', '+12347654387', NULL, 102.8);
 SET @ID = @@IDENTITY;
 INSERT INTO [dbo].[Addresses] VALUES(@ID, 'His address', NULL, 'Billing', 'His city', '987432', 'His state', 'Canada');
 INSERT INTO [dbo].[Notes] VALUES(@ID, 'Note6');

 -- Invalid insertions

 GO

 --Incorrect email
 INSERT INTO [dbo].[Customers] VALUES('Bob', 'Smith', '+12345', 'bobgmail.com', 1000.54);

 GO

 -- The phone number is too long
 INSERT INTO [dbo].[Customers] VALUES('Bob', 'Smith', '+123456789123456', 'bob@gmail.com', 1000.54);

 GO

 -- Incorrect phone number
 INSERT INTO [dbo].[Customers] VALUES('Bob', 'Smith', 'dddd', 'bob@gmail.com', 1000.54);

 GO

 -- LastName is null
 INSERT INTO [dbo].[Customers] VALUES('Bob', NULL, '+12345', 'bob@gmail.com', 1000.54);

 GO

 -- TotalPurchasesAmount is an incorrect type
 INSERT INTO [dbo].[Customers] VALUES('Bob', 'Smith', '+12345', 'bob@gmail.com', 'hh');

 GO

 -- CustomerID is null
 INSERT INTO [dbo].[Addresses] VALUES(NULL, 'Some address', 'continues', 'Shipping', 'New York', '123456', 'NY', 'United States');

 GO

 -- CustomerID - FOREIGN KEY constraint violation
 INSERT INTO [dbo].[Addresses] VALUES(100, 'Some address', 'continues', 'Shipping', 'Some City', '123456', 'Some State', 'Canada');

 GO

 -- AddressLine is null
 INSERT INTO [dbo].[Addresses] VALUES(1, NULL, 'continues', 'Shipping', 'Some City', '123456', 'Some State', 'Canada');

 GO

 -- Delivery is invalid AddressType
 INSERT INTO [dbo].[Addresses] VALUES(1, 'Some address', 'continues', 'Delivery', 'Some City', '123456', 'Some State', 'Canada');

 GO

 -- City is null
 INSERT INTO [dbo].[Addresses] VALUES(1, 'Some address', 'continues', 'Shipping', NULL, '123456', 'Some State', 'Canada');

 GO

 -- PostalCode is too long
 INSERT INTO [dbo].[Addresses] VALUES(1, 'Some address', 'continues', 'Shipping', 'Some City', '1234567', 'Some State', 'Canada');

 GO

 -- PostalCode is null
 INSERT INTO [dbo].[Addresses] VALUES(1, 'Some address', 'continues', 'Shipping', 'Some City', NULL, 'Some State', 'Canada');

 GO

 -- State is null
 INSERT INTO [dbo].[Addresses] VALUES(1, 'Some address', 'continues', 'Shipping', 'Some City', '123456', NULL, 'Canada');

 GO

 -- France is an invalid Country
 INSERT INTO [dbo].[Addresses] VALUES(1, 'Some address', 'continues', 'Shipping', 'Some City', '123456', 'Some State', 'France');

 GO

 -- CustomerID is null
 INSERT INTO [dbo].[Notes] VALUES(NULL, 'Note1');

 GO

 -- CustomerID - FOREIGN KEY constraint violation
 INSERT INTO [dbo].[Notes] VALUES(100, 'Note1');

 GO

 -- Note is null
 INSERT INTO [dbo].[Notes] VALUES(1, NULL);
