/*
 Navicat Premium Data Transfer

 Source Server         : Binh
 Source Server Type    : SQL Server
 Source Server Version : 15002000 (15.00.2000)
 Source Host           : DESKTOP-7P56B3O\SQLEXPRESS:1433
 Source Catalog        : QLBanSach
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002000 (15.00.2000)
 File Encoding         : 65001

 Date: 01/12/2022 22:35:20
*/


-- ----------------------------
-- Table structure for Category
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type IN ('U'))
	DROP TABLE [dbo].[Category]
GO

CREATE TABLE [dbo].[Category] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(70) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Category] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Feedback
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Feedback]') AND type IN ('U'))
	DROP TABLE [dbo].[Feedback]
GO

CREATE TABLE [dbo].[Feedback] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [User_id] int  NULL,
  [Subject_name] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Note] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Feedback] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Order
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type IN ('U'))
	DROP TABLE [dbo].[Order]
GO

CREATE TABLE [dbo].[Order] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [User_id] int  NULL,
  [Fullname] nvarchar(70) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Email] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Phone_number] int  NULL,
  [Address] nvarchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Note] nvarchar(700) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Oder_date] date  NULL
)
GO

ALTER TABLE [dbo].[Order] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Order_Details
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Order_Details]') AND type IN ('U'))
	DROP TABLE [dbo].[Order_Details]
GO

CREATE TABLE [dbo].[Order_Details] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Product_id] int  NULL,
  [Order_id] int  NULL,
  [Price] int  NULL,
  [Num] int  NULL
)
GO

ALTER TABLE [dbo].[Order_Details] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Product
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type IN ('U'))
	DROP TABLE [dbo].[Product]
GO

CREATE TABLE [dbo].[Product] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Category_id] int  NULL,
  [Title] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Price] int  NULL,
  [Discount] int  NULL,
  [Thumbnail] varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Description] nvarchar(700) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Inventory] int  NULL
)
GO

ALTER TABLE [dbo].[Product] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type IN ('U'))
	DROP TABLE [dbo].[Role]
GO

CREATE TABLE [dbo].[Role] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for User
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type IN ('U'))
	DROP TABLE [dbo].[User]
GO

CREATE TABLE [dbo].[User] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [Fullname] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Phone_number] int  NULL,
  [Email] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Address] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Password] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [Role_id] int  NULL
)
GO

ALTER TABLE [dbo].[User] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Auto increment value for Category
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Category]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table Category
-- ----------------------------
ALTER TABLE [dbo].[Category] ADD CONSTRAINT [PK__Category__3214EC27BEDF3E9D] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Feedback
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Feedback]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table Feedback
-- ----------------------------
ALTER TABLE [dbo].[Feedback] ADD CONSTRAINT [PK__Feedback__3214EC274E9C9CD2] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Order
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Order]', RESEED, 44)
GO


-- ----------------------------
-- Primary Key structure for table Order
-- ----------------------------
ALTER TABLE [dbo].[Order] ADD CONSTRAINT [PK__Order__3214EC27607595F5] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Order_Details
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Order_Details]', RESEED, 7)
GO


-- ----------------------------
-- Primary Key structure for table Order_Details
-- ----------------------------
ALTER TABLE [dbo].[Order_Details] ADD CONSTRAINT [PK__Order_De__3214EC277FCFC229] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Product
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Product]', RESEED, 17)
GO


-- ----------------------------
-- Primary Key structure for table Product
-- ----------------------------
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [PK__Product__3214EC271516CEBC] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Role
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Role]', RESEED, 8)
GO


-- ----------------------------
-- Primary Key structure for table Role
-- ----------------------------
ALTER TABLE [dbo].[Role] ADD CONSTRAINT [PK__Role__3214EC276AFB5EC5] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for User
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[User]', RESEED, 19)
GO


-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK__User__3214EC277343375F] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table Feedback
-- ----------------------------
ALTER TABLE [dbo].[Feedback] ADD CONSTRAINT [User_id] FOREIGN KEY ([User_id]) REFERENCES [dbo].[User] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Order
-- ----------------------------
ALTER TABLE [dbo].[Order] ADD CONSTRAINT [User_id_1] FOREIGN KEY ([User_id]) REFERENCES [dbo].[User] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Order_Details
-- ----------------------------
ALTER TABLE [dbo].[Order_Details] ADD CONSTRAINT [FK_IDorder] FOREIGN KEY ([Product_id]) REFERENCES [dbo].[Order] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[Order_Details] ADD CONSTRAINT [FK_IDProduct] FOREIGN KEY ([Order_id]) REFERENCES [dbo].[Product] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Product
-- ----------------------------
ALTER TABLE [dbo].[Product] ADD CONSTRAINT [Category_id] FOREIGN KEY ([Category_id]) REFERENCES [dbo].[Category] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table User
-- ----------------------------
ALTER TABLE [dbo].[User] ADD CONSTRAINT [Role_id] FOREIGN KEY ([Role_id]) REFERENCES [dbo].[Role] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

