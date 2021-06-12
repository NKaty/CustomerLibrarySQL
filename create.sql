 CREATE DATABASE [CustomerLib_Naida];

 GO

 USE [CustomerLib_Naida];

 GO

 CREATE TABLE [dbo].[Customers]
 (
	[CustomerID] int IDENTITY(1, 1) NOT NULL,
	[FirstName] nvarchar(50) NULL,
	[LastName] nvarchar(50) NOT NULL,
	[PhoneNumber] nvarchar(15) NULL,
	[Email] nvarchar(320) NULL,
	[TotalPurchasesAmount] money NULL,
	CONSTRAINT [PK_Customers_CustomerID] PRIMARY KEY ([CustomerID]),
	CONSTRAINT [CK_Customers_PhoneNumber] CHECK([PhoneNumber] LIKE '+%[0-9]'),
	CONSTRAINT [CK_Customers_Email] CHECK([Email] LIKE '%_@__%.__%'AND PATINDEX('%[^a-z,0-9,@,.,_,\-]%', [Email]) = NULL),
 );

 CREATE TABLE [dbo].[Addresses]
 (
	[AddressID] int IDENTITY(1, 1) NOT NULL,
	[CustomerID] int NOT NULL,
	[AddressLine] nvarchar(100) NOT NULL,
	[AddressLine2] nvarchar(100) NULL,
	[AddressType] nvarchar(10) NOT NULL,
	[City] nvarchar(50) NOT NULL,
	[PostalCode] nvarchar(6) NOT NULL,
	[State] nvarchar(20) NOT NULL,
	[Country] nvarchar(15) NOT NULL,
	CONSTRAINT [PK_Addresses_AddressID] PRIMARY KEY ([AddressID]),
	-- Deal with FOREIGN KEY constraint violation by ourselves
	CONSTRAINT [FK_Addresses_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID]),
	CONSTRAINT [CK_Addresses_AddressType] CHECK([AddressType] in ('Shipping', 'Billing')),
	CONSTRAINT [CK_Addresses_Country] CHECK([Country] in ('United States', 'Canada'))
 );

 CREATE TABLE [dbo].[Notes]
 (
	[NoteID] int IDENTITY(1, 1) NOT NULL,
	[CustomerID] int NOT NULL,
	[Note] nvarchar(500) NOT NULL,
	CONSTRAINT [PK_Notes_NoteID] PRIMARY KEY ([NoteID]),
	CONSTRAINT [FK_Notes_CustomerID] FOREIGN KEY ([CustomerID])
	-- One of the ways to deal with FOREIGN KEY constraint violation
	REFERENCES [dbo].[Customers] ([CustomerID]) ON DELETE CASCADE ON UPDATE CASCADE
 );