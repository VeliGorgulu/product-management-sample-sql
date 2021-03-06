USE [master]
GO
/****** Object:  Database [ProductManagementDb]    Script Date: 30.08.2021 19:35:27 ******/
CREATE DATABASE [ProductManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductManagementDb', FILENAME = N'C:\Users\velig\ProductManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductManagementDb_log', FILENAME = N'C:\Users\velig\ProductManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProductManagementDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductManagementDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [ProductManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductManagementDb] SET QUERY_STORE = OFF
GO
USE [ProductManagementDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ProductManagementDb]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PasswordHash] [varbinary](64) NOT NULL,
	[PasswordSalt] [varbinary](128) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (1, N'Beverages')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (2, N'Condiments')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (3, N'Confections')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (4, N'Dairy Products')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (5, N'Grains/Cereals')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (6, N'Meat/Poultry')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (7, N'Produce')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (8, N'Seafood')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'user')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (3, N'product.admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (4, N'category.admin')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (1, 1, N'Chai', 18.0000, 39)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (2, 1, N'Chang', 19.0000, 17)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (5, 2, N'Aniseed Syrup', 10.0000, 13)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (6, 2, N'Chef Anton''s Cajun Seasoning', 22.0000, 53)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (7, 2, N'Grandma''s Boysenberry Spread', 25.0000, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (8, 3, N'Sir Rodney''s Marmalade', 10.0000, 3)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (9, 3, N'NuNuCa Nuß-Nougat-Creme', 14.0000, 76)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (10, 4, N'Gorgonzola Telino', 12.5000, 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (11, 4, N'Mascarpone Fabioli', 32.0000, 9)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (13, 4, N'Geitost', 2.5000, 112)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (14, 5, N'Gnocchi di nonna Alice', 38.0000, 21)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (15, 5, N'Ravioli Angelo', 19.5000, 36)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (16, 6, N'Mishi Kobe Niku', 6.0000, 24)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (18, 6, N'Perth Pasties', 23.5000, 35)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (19, 6, N'Tourtière', 15.5000, 39)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (20, 7, N'Longlife Tofu', 17.4500, 29)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (21, 7, N'Manjimup Dried Apples', 39.0000, 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (25, 8, N'Boston Crab Meat', 18.4000, 123)
INSERT [dbo].[Products] ([Id], [CategoryId], [ProductName], [Price], [Stock]) VALUES (26, 8, N'Jack''s New England Clam Chowder', 9.6500, 85)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1, 1004, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2, 1005, 2)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (1004, N'admin', N'admin', N'admin@admin.com', 0x79CADA2886063C8DDCF3695880456056D3A12583D2368F9EDF516BAC8AE421C137AFDC62B5DC71680920AB8C1D163F606FD98403E246A65DFF0F823320F6438C, 0x5C84BDFBDC228F45A3E82C7DC6638A69D52CD77A84BDD0F716150ADE396ED36F1D53D859B3088969BAAF25824DAFC2D15AA03B3060FE231D2DCAA7F0EEEBDC6E314BB36F59F63CAAA93D5E1516AE5C53E8647283CE260ACF9B539EC1F95FA5FE5FEFAF75C85704B38C81C936CB14B6539DE7E256BBB2CAD9AD4CE674079C5D76, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (1005, N'user', N'user', N'user@user.com', 0x53073F988EC34E1D25656890372B84632C9D317BE49DE85C8E34BC823F2C2B0367BA49418B48ADEBC94C60D047C11BDD4EEC71849892DFCCE538D2DDE0A215D2, 0x1845FA7BA58E692F058E857DDE6C63C2DEECD584679291C683CE6B37081328B7B8C8B591720E5BFA9471AB425701D768B86D49BCF29DFD8C9D0C56166A5955E3A1D100B63A4A5F3321410854D722D92BF98E17F32C46AB929147C3FC4CD17CE650360C153B9370967AAEDA1011E554024BA5AA7168B7F23A5A8572870523CC4B, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (2005, N'string2', N'string2', N'string2', 0xE8DE43913B41F04BDFABE06A55F10DD88E41EA62C94BC11986EABEF60FCEA474CA910A8BB43549BBE097271B7DA3EA8F22A24995C1DC4ED43BF0BA7044330CCD, 0x7DB6A2E7A5312076C2DDA5962E32D11A389E7255AC6C358C74F2EEA5A683D3A1FBB69F9E9623138D48807DB85B16E0AD583931E5D23B670D723EA3160F1988A7F7E8C64263F4C688FB2CC4AC0AD47A2404056B52B3FC2458790E7E52259651851C14DFFB63291CC2B04FC2910AA912FF893E5F125F7F1FC6FF06D4A44B0B5105, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Products] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Categories_Products]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategory] 
	@CategoryName varchar(50)
AS

BEGIN

	INSERT INTO Categories VALUES(@CategoryName)

END
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct] 
	@CategoryId int,
	@ProductName varchar(50),
	@Price money,
	@Stock int
AS

BEGIN

	INSERT INTO Products VALUES(@CategoryId, @ProductName, @Price, @Stock)

END
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser] 
	@FirstName varchar(50),
	@LastName varchar(50),
	@Email varchar(50),
	@PasswordHash binary(500),
	@PasswordSalt binary(500),
	@Status bit
AS

BEGIN

	INSERT INTO Users VALUES(@FirstName, @LastName, @Email, @PasswordHash, @PasswordSalt, @Status)

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCategory] 
	@Id int
AS

BEGIN

	DELETE FROM Categories WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct] 
	@Id int
AS

BEGIN

	DELETE FROM Products WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser] 
	@Id int
AS

BEGIN

	DELETE FROM Users WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[Get]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get] 
	@tableName varchar(50),
	@query varchar(100)
AS

BEGIN

	DECLARE @result varchar(200)

	SET @result = 'SELECT * FROM ' + @tableName + ' WHERE ' + @query
	
	EXEC(@result)
   
END
GO
/****** Object:  StoredProcedure [dbo].[GetAll]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAll] @tableName varchar(50), @query varchar(100)
AS

BEGIN

	DECLARE @result varchar(200)

	IF @query is null
		SET @result = 'SELECT * FROM ' + @tableName
	ELSE
		SET @result = 'SELECT * FROM ' + @tableName + ' WHERE ' + @query
	

	
	EXEC(@result)
   
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductDetails]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProductDetails]
	@query varchar(100)
AS

BEGIN

	DECLARE @result varchar(200)

	IF @query is null
		SET @result = 'SELECT * FROM Products p INNER JOIN Categories c ON p.CategoryId = c.Id'
	ELSE
		SET @result = 'SELECT * FROM Products p INNER JOIN Categories c ON p.CategoryId = c.Id WHERE ' + @query
		
	EXEC(@result)
   
END
GO
/****** Object:  StoredProcedure [dbo].[GetClaims]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClaims]
	@userId int
AS
	
BEGIN

	SELECT * FROM OperationClaims o 
	INNER JOIN UserOperationClaims u
	ON o.Id = u.OperationClaimId
	WHERE u.UserId = @userId

END
GO
/****** Object:  StoredProcedure [dbo].[GetProductDetails]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductDetails]
	@query varchar(100)
AS

BEGIN

	DECLARE @result varchar(200)

	SET @result = 'SELECT * FROM Products p INNER JOIN Categories c ON p.CategoryId = c.Id WHERE ' + @query

	EXEC(@result)
   
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategory] 
	@Id int,
	@CategoryName varchar(50)
AS

BEGIN

	UPDATE Categories SET CategoryName = @CategoryName WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct] 
	@Id int,
	@CategoryId int,
	@ProductName varchar(50),
	@Price money,
	@Stock int
AS

BEGIN

	UPDATE Products SET ProductName = @ProductName, Price = @Price, Stock = @Stock WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 30.08.2021 19:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser] 
	@Id int,
	@FirstName varchar(50),
	@LastName varchar(50),
	@Email varchar(50),
	@PasswordHash binary(500),
	@PasswordSalt binary(500),
	@Status bit
AS

BEGIN

	UPDATE Users SET 
		FirstName = @FirstName,
		LastName = @LastName,
		Email = @Email,
		PasswordHash = @PasswordHash,
		PasswordSalt = @PasswordSalt,
		Status = @Status

		WHERE Id = @Id

END
GO
USE [master]
GO
ALTER DATABASE [ProductManagementDb] SET  READ_WRITE 
GO
