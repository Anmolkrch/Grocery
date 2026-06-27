USE [master]
GO
/****** Object:  Database [ShoppingOnline]    Script Date: 27-06-2026 17:33:47 ******/
CREATE DATABASE [ShoppingOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShoppingOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ShoppingOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShoppingOnline] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoppingOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoppingOnline', N'ON'
GO
ALTER DATABASE [ShoppingOnline] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShoppingOnline] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShoppingOnline]
GO
/****** Object:  Table [dbo].[Tbl_Cart]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[ShippingDetailId] [int] NULL,
 CONSTRAINT [PK_Tbl_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CartStatus]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CartStatus](
	[CartStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CartStatus] [varchar](100) NULL,
 CONSTRAINT [PK_Tbl_CartStatus] PRIMARY KEY CLUSTERED 
(
	[CartStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CategoryImage] [varchar](200) NULL,
	[CategoryDescription] [varchar](100) NULL,
 CONSTRAINT [PK_Tbl_ServiceCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MemberRole]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MemberRole](
	[MemberRoleId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Tbl_MemberRole] PRIMARY KEY CLUSTERED 
(
	[MemberRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailId] [nvarchar](200) NULL,
	[Password] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[Description] [varchar](500) NULL,
	[ProductImage] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsFeatured] [bit] NULL,
 CONSTRAINT [PK_Tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ShippingDetails]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[AddressLine] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[OrderId] [varchar](50) NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_ShippingAddress] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Cart] ON 
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1010, 8, 3, 3, CAST(N'2026-06-27T14:21:58.610' AS DateTime), CAST(N'2026-06-27T14:21:58.610' AS DateTime), 5)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1011, 228, 3, 1, CAST(N'2026-06-27T16:43:25.160' AS DateTime), CAST(N'2026-06-27T16:43:25.160' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1012, 62, 3, 1, CAST(N'2026-06-27T17:05:21.800' AS DateTime), CAST(N'2026-06-27T17:05:21.800' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_CartStatus] ON 
GO
INSERT [dbo].[Tbl_CartStatus] ([CartStatusId], [CartStatus]) VALUES (1, N'Added to cart')
GO
INSERT [dbo].[Tbl_CartStatus] ([CartStatusId], [CartStatus]) VALUES (2, N'Removed from cart')
GO
INSERT [dbo].[Tbl_CartStatus] ([CartStatusId], [CartStatus]) VALUES (3, N'Purchased the item')
GO
SET IDENTITY_INSERT [dbo].[Tbl_CartStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Category] ON 
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (1, N'Fruits & Vegetables', 1, 0, N'pexels-biravencrow-34700570.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (2, N'Dairy & Eggs', 1, 0, N'top-view-dairy-products-with-eggs-box.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (3, N'Bakery & Breads', 1, 0, N'lots-bakery-table.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (4, N'Grains & Pulses', 1, 0, N'legumes-beans-assortment-different-bowls.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (5, N'Spices & Condiments', 1, 0, N'top-view-raw-rice-with-lemons-seasonings-dark-surface-spice-fruit-raw-food.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (6, N'Snacks & Beverages', 1, 0, N'top-view-fast-food-meal.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (7, N'Meat & Seafood', 1, 0, N'top-view-fresh-fish-slices-with-red-tomatoes-greens-dark-background.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (8, N'Frozen & Packaged Foods', 1, 0, N'pexels-noviana-28670063.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (9, N'Household Essentials', 1, 0, N'flat-lay-composition-cleaning-products-with-copyspace.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (10, N'Personal Care', 1, 0, N'zero-waste-beauty-products.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (11, N'Baby Care', 1, 0, N'beauty-product-still-life.jpg', NULL)
GO
INSERT [dbo].[Tbl_Category] ([CategoryId], [CategoryName], [IsActive], [IsDelete], [CategoryImage], [CategoryDescription]) VALUES (12, N'Pet Supplies', 1, 0, N'various-colorful-pet-accessories-still-life-concept.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MemberRole] ON 
GO
INSERT [dbo].[Tbl_MemberRole] ([MemberRoleId], [MemberId], [RoleId]) VALUES (3, 3, 1)
GO
INSERT [dbo].[Tbl_MemberRole] ([MemberRoleId], [MemberId], [RoleId]) VALUES (6, 4, 2)
GO
INSERT [dbo].[Tbl_MemberRole] ([MemberRoleId], [MemberId], [RoleId]) VALUES (7, 5, 2)
GO
INSERT [dbo].[Tbl_MemberRole] ([MemberRoleId], [MemberId], [RoleId]) VALUES (8, 6, 2)
GO
SET IDENTITY_INSERT [dbo].[Tbl_MemberRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Members] ON 
GO
INSERT [dbo].[Tbl_Members] ([MemberId], [FirstName], [LastName], [EmailId], [Password], [IsActive], [IsDelete], [CreatedOn], [ModifiedOn]) VALUES (3, N'Imran', N'Ghani', N'admin@gmail.com', N'cyetcUjWIV2JW5uX7lplsdfQ==', 1, 0, CAST(N'2016-09-28T23:34:01.630' AS DateTime), CAST(N'2016-09-28T23:34:01.630' AS DateTime))
GO
INSERT [dbo].[Tbl_Members] ([MemberId], [FirstName], [LastName], [EmailId], [Password], [IsActive], [IsDelete], [CreatedOn], [ModifiedOn]) VALUES (4, N'Muhammad', N'Ahmad', N'ahmad@gmail.com', N'cyetcUjWIV2JW5uX7lplsdfQ==', 1, 0, CAST(N'2016-09-28T23:34:01.630' AS DateTime), CAST(N'2016-09-28T23:34:01.630' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] ON 
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (8, N'Apple', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'<p>Fresh Red Apples</p>', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (9, N'Banana', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'<p>Organic Bananas</p>', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (10, N'Mango', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'<p>Alphonso Mangoes</p>', N'gregmontani-mangoes-823598.jpg', CAST(150.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (11, N'Potato', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Farm Fresh Potatoes', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (12, N'Onion', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Red Onions', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (13, N'Tomato', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Juicy Tomatoes', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (14, N'Carrot', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Crunchy Carrots', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (15, N'Spinach', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Spinach', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (16, N'Cucumber', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Green Cucumbers', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (17, N'Cauliflower', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cauliflower Head', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (18, N'Broccoli', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Broccoli Florets', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (19, N'Grapes', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Seedless Grapes', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (20, N'Orange', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Nagpur Oranges', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (21, N'Papaya', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ripe Papaya', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (22, N'Pineapple', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Sweet Pineapple', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (23, N'Watermelon', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Large Watermelon', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (24, N'Strawberry', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Strawberries', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (25, N'Peas', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Green Peas', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (26, N'Radish', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'White Radish', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (27, N'Beetroot', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Red Beetroot', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (28, N'Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Full Cream Milk', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (29, N'Curd', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Curd', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (30, N'Butter', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Salted Butter', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (31, N'Cheese', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Processed Cheese', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (32, N'Paneer', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cottage Cheese', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (33, N'Eggs', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Farm Eggs', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (34, N'Ghee', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pure Cow Ghee', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (35, N'Lassi', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Sweet Lassi', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (36, N'Cream', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Cream', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (37, N'Flavored Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chocolate Milk', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (38, N'Buttermilk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Spiced Buttermilk', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (39, N'Whipped Cream', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whipped Cream', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (40, N'Mozzarella', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mozzarella Cheese', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (41, N'Parmesan', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Parmesan Cheese', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (42, N'Egg Whites', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Liquid Egg Whites', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (43, N'Skimmed Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Low Fat Milk', N'pexels-freestockpro-12955951.jpg', CAST(55.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (44, N'Soy Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soy Milk', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (45, N'Almond Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Almond Milk', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (46, N'Yogurt Drink', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Flavored Yogurt Drink', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (47, N'Kefir', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fermented Milk Drink', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (48, N'White Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft White Bread', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (49, N'Brown Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Wheat Bread', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (50, N'Multigrain Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Healthy Multigrain Bread', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (51, N'Buns', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Burger Buns', N'pexels-freestockpro-12955951.jpg', CAST(30.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (52, N'Croissant', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Butter Croissant', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (53, N'Bagel', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Bagel', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (54, N'Muffin', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chocolate Muffin', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (55, N'Cupcake', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Vanilla Cupcake', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (56, N'Doughnut', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Glazed Doughnut', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (57, N'Pita Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Pita Bread', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (58, N'Naan', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Tandoori Naan', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (59, N'Paratha', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Stuffed Paratha', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (60, N'Roti', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Wheat Roti', N'pexels-freestockpro-12955951.jpg', CAST(30.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (61, N'Cake', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chocolate Cake', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (62, N'Pastry', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cream Pastry', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (63, N'Breadsticks', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Crispy Breadsticks', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (64, N'Garlic Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Garlic Flavored Bread', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (65, N'Rolls', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dinner Rolls', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (66, N'Sourdough Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Artisan Sourdough', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (67, N'Focaccia', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Italian Focaccia', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (68, N'Rice', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Basmati Rice', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (69, N'Wheat Flour', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Wheat Flour', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (70, N'Oats', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rolled Oats', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (71, N'Barley', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pearl Barley', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (72, N'Corn Flour', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Corn Flour', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (73, N'Chickpeas', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dry Chickpeas', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (74, N'Green Gram', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moong Dal', N'pexels-freestockpro-12955951.jpg', CAST(110.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (75, N'Red Lentils', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Masoor Dal', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (76, N'Black Gram', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Urad Dal', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (77, N'Kidney Beans', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rajma Beans', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (78, N'Pigeon Pea', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Toor Dal', N'pexels-freestockpro-12955951.jpg', CAST(130.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (79, N'Soybeans', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soybeans', N'pexels-freestockpro-12955951.jpg', CAST(140.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (80, N'Millets', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Foxtail Millet', N'pexels-freestockpro-12955951.jpg', CAST(160.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (81, N'Quinoa', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Organic Quinoa', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (82, N'Buckwheat', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Buckwheat Grain', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (83, N'Chana Dal', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Split Bengal Gram', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (84, N'Horse Gram', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Kulthi Dal', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (85, N'Green Peas Dal', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Split Green Peas', N'pexels-freestockpro-12955951.jpg', CAST(110.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (86, N'Flattened Rice', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Poha', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (87, N'Semolina', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rava/Sooji', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (88, N'Turmeric Powder', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pure Turmeric Powder', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (89, N'Red Chili Powder', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Hot Chili Powder', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (90, N'Coriander Powder', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ground Coriander', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (91, N'Cumin Seeds', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Cumin Seeds', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (92, N'Black Pepper', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Black Peppercorns', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (93, N'Salt', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Iodized Salt', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (94, N'Sugar', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Refined Sugar', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (95, N'Mustard Seeds', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Yellow Mustard Seeds', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (96, N'Fenugreek Seeds', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Methi Seeds', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (97, N'Cardamom', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Green Cardamom', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (98, N'Cloves', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Cloves', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (99, N'Cinnamon', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cinnamon Sticks', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (100, N'Bay Leaf', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dried Bay Leaves', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (101, N'Nutmeg', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Nutmeg', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (102, N'Saffron', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Premium Saffron', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (103, N'Pickle', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mixed Vegetable Pickle', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (104, N'Vinegar', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'White Vinegar', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (105, N'Soy Sauce', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dark Soy Sauce', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (106, N'Tomato Ketchup', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Classic Tomato Ketchup', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (107, N'Chutney', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mint Chutney', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (108, N'Potato Chips', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Salted Potato Chips', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (109, N'Namkeen Mixture', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Spicy Namkeen Mix', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (110, N'Chocolate Bar', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Milk Chocolate Bar', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (111, N'Biscuits', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Digestive Biscuits', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (112, N'Cookies', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Choco Chip Cookies', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (113, N'Soft Drink', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cola Drink', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (114, N'Fruit Juice', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Orange Juice', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (115, N'Energy Drink', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Sports Energy Drink', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (116, N'Tea', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Assam Tea', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (117, N'Coffee', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Instant Coffee', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (118, N'Green Tea', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Organic Green Tea', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (119, N'Popcorn', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Salted Popcorn', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (120, N'Ice Cream Cone', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Vanilla Ice Cream', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (121, N'Candy', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fruit Candy', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (122, N'Protein Bar', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'High Protein Bar', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (123, N'Noodles', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Instant Noodles', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (124, N'Nachos', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cheese Nachos', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (125, N'Cold Coffee', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Iced Coffee', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (126, N'Milkshake', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chocolate Milkshake', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (127, N'Hot Chocolate', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rich Hot Chocolate', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (128, N'Chicken Breast', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Chicken Breast', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (129, N'Chicken Drumsticks', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Juicy Drumsticks', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (130, N'Whole Chicken', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Farm Whole Chicken', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (131, N'Mutton Curry Cut', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Tender Mutton Pieces', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (132, N'Mutton Mince', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ground Mutton', N'pexels-freestockpro-12955951.jpg', CAST(650.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (133, N'Fish Rohu', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Rohu Fish', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (134, N'Fish Hilsa', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Premium Hilsa Fish', N'pexels-freestockpro-12955951.jpg', CAST(800.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (135, N'Fish Salmon', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Atlantic Salmon', N'pexels-freestockpro-12955951.jpg', CAST(1200.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (136, N'Fish Tuna', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Tuna', N'pexels-freestockpro-12955951.jpg', CAST(900.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (137, N'Fish Pomfret', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Silver Pomfret', N'pexels-freestockpro-12955951.jpg', CAST(700.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (138, N'Prawns Medium', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Medium Prawns', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (139, N'Prawns Large', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Large Prawns', N'pexels-freestockpro-12955951.jpg', CAST(800.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (140, N'Crab', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Crab', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (141, N'Lobster', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Premium Lobster', N'pexels-freestockpro-12955951.jpg', CAST(1500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (142, N'Duck Meat', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Farm Duck Meat', N'pexels-freestockpro-12955951.jpg', CAST(700.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (143, N'Turkey Breast', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Turkey Breast', N'pexels-freestockpro-12955951.jpg', CAST(900.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (144, N'Goat Liver', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Goat Liver', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (145, N'Chicken Sausages', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chicken Sausages', N'pexels-freestockpro-12955951.jpg', CAST(350.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (146, N'Fish Fillet', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fish Fillet', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (147, N'Shrimp', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Shrimp', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (148, N'Frozen Peas', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Frozen Green Peas', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (149, N'Frozen Sweet Corn', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Frozen Sweet Corn', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (150, N'Frozen French Fries', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Crispy French Fries', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (151, N'Frozen Chicken Nuggets', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Chicken Nuggets', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (152, N'Frozen Fish Fingers', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fish Finger Snacks', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (153, N'Frozen Paratha', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready-to-cook Paratha', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (154, N'Frozen Pizza', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cheese Pizza', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (155, N'Frozen Momos', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Veg Momos', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (156, N'Frozen Spring Rolls', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Veg Spring Rolls', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (157, N'Frozen Samosa', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mini Samosa', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (158, N'Instant Noodles', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Packaged Instant Noodles', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (159, N'Instant Pasta', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Pasta', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (160, N'Ready Soup Mix', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Instant Soup Mix', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (161, N'Frozen Ice Cream', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Vanilla Ice Cream', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (162, N'Frozen Kulfi', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Traditional Kulfi', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (163, N'Frozen Sandwich', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Sandwich', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (164, N'Frozen Burger Patty', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Veg Burger Patty', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (165, N'Frozen Paneer Tikka', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Paneer Tikka', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (166, N'Frozen Idli', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Idli', N'pexels-freestockpro-12955951.jpg', CAST(160.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (167, N'Frozen Dosa', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Dosa', N'pexels-freestockpro-12955951.jpg', CAST(170.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (168, N'Laundry Detergent', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Powder Detergent', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (169, N'Liquid Detergent', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Liquid Detergent', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (170, N'Dishwashing Liquid', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dishwashing Soap', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (171, N'Floor Cleaner', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Multipurpose Floor Cleaner', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (172, N'Toilet Cleaner', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Toilet Cleaning Liquid', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (173, N'Glass Cleaner', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Glass Cleaning Spray', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (174, N'Room Freshener', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Air Freshener Spray', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (175, N'Garbage Bags', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Disposable Garbage Bags', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (176, N'Mop', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Floor Mop', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (177, N'Broom', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Coconut Broom', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (178, N'Bucket', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Plastic Bucket', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (179, N'Scrub Pad', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dish Scrub Pad', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (180, N'Hand Gloves', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cleaning Gloves', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (181, N'Tissue Paper', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Tissue Paper', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (182, N'Toilet Paper', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Roll of Toilet Paper', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (183, N'Washing Soap', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Bar Washing Soap', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (184, N'Insect Spray', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mosquito/Insect Spray', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (185, N'Bleach', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Household Bleach', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (186, N'Ironing Spray', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fabric Ironing Spray', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (187, N'Cleaning Cloth', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Microfiber Cleaning Cloth', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (188, N'Bath Soap', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moisturizing Bath Soap', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (189, N'Shampoo', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Anti-Dandruff Shampoo', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (190, N'Conditioner', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Hair Conditioner', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (191, N'Toothpaste', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fluoride Toothpaste', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (192, N'Toothbrush', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Bristle Toothbrush', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (193, N'Handwash', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Liquid Handwash', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (194, N'Sanitizer', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Alcohol-based Sanitizer', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (195, N'Face Wash', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Gentle Face Wash', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (196, N'Face Cream', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moisturizing Face Cream', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (197, N'Body Lotion', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Hydrating Body Lotion', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (198, N'Hair Oil', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Coconut Hair Oil', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (199, N'Perfume', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Floral Perfume', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (200, N'Deodorant', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Roll-on Deodorant', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (201, N'Lip Balm', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moisturizing Lip Balm', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (202, N'Shaving Cream', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Foamy Shaving Cream', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (203, N'Razor', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Disposable Razor', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (204, N'Talcum Powder', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fragrant Talcum Powder', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (205, N'Hair Gel', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Styling Hair Gel', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (206, N'Sunscreen', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'SPF Sunscreen Lotion', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (207, N'Hand Cream', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Nourishing Hand Cream', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (208, N'Baby Diapers', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Disposable Baby Diapers', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (209, N'Baby Wipes', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Baby Wipes', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (210, N'Baby Lotion', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moisturizing Baby Lotion', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (211, N'Baby Powder', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Gentle Baby Powder', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (212, N'Baby Soap', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mild Baby Soap', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (213, N'Baby Shampoo', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Tear-Free Baby Shampoo', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (214, N'Baby Oil', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Massage Baby Oil', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (215, N'Baby Cream', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Protective Baby Cream', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (216, N'Baby Food', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Packaged Baby Food', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (217, N'Infant Formula', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Milk Formula for Infants', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (218, N'Baby Bottle', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Feeding Bottle', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (219, N'Pacifier', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Pacifier', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (220, N'Baby Blanket', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Warm Baby Blanket', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (221, N'Baby Clothes', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cotton Baby Clothes', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (222, N'Baby Bibs', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Washable Baby Bibs', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (223, N'Baby Chair', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Feeding Chair', N'pexels-freestockpro-12955951.jpg', CAST(1500.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (224, N'Baby Cradle', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Wooden Baby Cradle', N'pexels-freestockpro-12955951.jpg', CAST(2500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (225, N'Baby Walker', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Baby Walker', N'pexels-freestockpro-12955951.jpg', CAST(1800.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (226, N'Baby Toys', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Baby Toys', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (227, N'Baby Bath Tub', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Plastic Baby Bath Tub', N'pexels-freestockpro-12955951.jpg', CAST(700.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (228, N'Dog Food', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dry Dog Food', N'pexels-freestockpro-12955951.jpg', CAST(800.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (229, N'Cat Food', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dry Cat Food', N'pexels-freestockpro-12955951.jpg', CAST(700.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (230, N'Bird Seeds', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mixed Bird Seeds', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (231, N'Fish Food', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Aquarium Fish Food', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (232, N'Dog Biscuits', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Crunchy Dog Biscuits', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (233, N'Cat Treats', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Tasty Cat Treats', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (234, N'Pet Shampoo', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Gentle Pet Shampoo', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (235, N'Pet Conditioner', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pet Hair Conditioner', N'pexels-freestockpro-12955951.jpg', CAST(450.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (236, N'Pet Soap', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pet Bath Soap', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (237, N'Dog Collar', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Adjustable Dog Collar', N'pexels-freestockpro-12955951.jpg', CAST(350.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (238, N'Dog Leash', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Strong Dog Leash', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (239, N'Cat Litter', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Clumping Cat Litter', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (240, N'Pet Cage', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Small Pet Cage', N'pexels-freestockpro-12955951.jpg', CAST(1500.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (241, N'Pet Carrier', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Portable Pet Carrier', N'pexels-freestockpro-12955951.jpg', CAST(1800.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (242, N'Pet Bed', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Pet Bed', N'pexels-freestockpro-12955951.jpg', CAST(1200.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (243, N'Pet Blanket', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Warm Pet Blanket', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (244, N'Pet Bowl', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Stainless Steel Pet Bowl', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (245, N'Pet Toys', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chew Toys', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (246, N'Dog Chews', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rawhide Dog Chews', N'pexels-freestockpro-12955951.jpg', CAST(350.00 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured]) VALUES (247, N'Cat Scratcher', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cat Scratching Post', N'pexels-freestockpro-12955951.jpg', CAST(1000.00 AS Decimal(18, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Roles] ON 
GO
INSERT [dbo].[Tbl_Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Tbl_Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_ShippingDetails] ON 
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (1, 4, N'sdsad', N'sdasd', N'dwfef', N'ewdwd', N'wqewqe', N'30b8dcac-4e3e-4596-b171-ab8be74868c1', CAST(8450 AS Decimal(18, 0)), N'Pay Using Debit/Credit Card')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (2, 4, N'Karol Bagh', N'Delhi', N'New Delhi', N'India', N'110009', N'428f09f8-141b-49b9-be38-77f5a288ea73', CAST(8450 AS Decimal(18, 0)), N'Pay Using Net banking')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (3, 4, N'Karol Bagh', N'Delhi', N'New Delhi', N'India', N'110006', N'314a9d28-550d-443c-ba6b-13dc905fabaf', CAST(90850 AS Decimal(18, 0)), N'Cash On Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (4, 3, N'gregfd', N'gfdgfdgfd', N'gdfgfdgfd', N'dfgdfgfdg', N'dfgfdgdfgfdgfdgf', N'6ecacd9a-3462-4032-8fff-be73c4dd3339', CAST(90100 AS Decimal(18, 0)), N'Cash On Delivery')
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [City], [State], [Country], [ZipCode], [OrderId], [AmountPaid], [PaymentType]) VALUES (5, 3, N'gfdgdfgfdg', N'dfgdfgdfgfd', N'fhgrhtrtrhyr', N'gdfgdfgfd', N'rhtrytr', N'34b5eadd-7da3-4886-99cb-9187e8e93e01', CAST(120 AS Decimal(18, 0)), N'Cash On Delivery')
GO
SET IDENTITY_INSERT [dbo].[Tbl_ShippingDetails] OFF
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([CartStatusId])
REFERENCES [dbo].[Tbl_CartStatus] ([CartStatusId])
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Tbl_MemberRole]  WITH CHECK ADD  CONSTRAINT [fk_Tbl_Roles_Tbl_MemberRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Tbl_Roles] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_MemberRole] CHECK CONSTRAINT [fk_Tbl_Roles_Tbl_MemberRole]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Category_Tbl_Product] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK_Tbl_Category_Tbl_Product]
GO
/****** Object:  StoredProcedure [dbo].[USP_MemberShoppingCartDetails]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_MemberShoppingCartDetails] 
(@memberId int) 
as 
begin 
select cr.CartId, p.Price,p.ProductId,p.ProductImage,p.ProductName,c.CategoryName 
from Tbl_Cart cr join Tbl_Product p on p.ProductId=cr.ProductId 
join Tbl_Category c on c.CategoryId=p.CategoryId 
join Tbl_Members m on m.MemberId=cr.MemberId where m.MemberId=@memberId 
and cr.CartStatusId=1 end 

GO
/****** Object:  StoredProcedure [dbo].[USP_Search]    Script Date: 27-06-2026 17:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[USP_Search](@searchKey varchar(100)) as begin select p.Description,p.Price,p.ProductId,p.ProductImage, p.ProductName, c.CategoryName from Tbl_Product p  join Tbl_Category c on p.CategoryId=c.CategoryId where p.IsActive=1 and p.IsDelete=0 and c.IsActive=1 and c.IsDelete=0 and (p.ProductName like '%'+@searchKey+'%' or c.CategoryName like '%'+@searchKey+'%') end

GO
USE [master]
GO
ALTER DATABASE [ShoppingOnline] SET  READ_WRITE 
GO
