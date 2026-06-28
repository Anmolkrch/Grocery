
CREATE DATABASE [FashionBazaar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FashionBazaar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FashionBazaar.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FashionBazaar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FashionBazaar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

ALTER DATABASE [FashionBazaar] SET QUERY_STORE = ON
GO
ALTER DATABASE [FashionBazaar] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FashionBazaar]
GO
/****** Object:  Table [dbo].[Tbl_Banner]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[BannerTitle] [nvarchar](200) NULL,
	[BannerImage] [nvarchar](300) NULL,
	[RedirectUrl] [nvarchar](300) NULL,
	[DisplayOrder] [int] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Brand]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
	[BrandLogo] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Cart]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[ShippingDetailId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[VariantId] [int] NULL,
	[SellingPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Tbl_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Cart_MemberVariant] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC,
	[VariantId] ASC,
	[CartStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CartStatus]    Script Date: 28-06-2026 01:39:30 ******/
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
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 28-06-2026 01:39:30 ******/
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
/****** Object:  Table [dbo].[Tbl_City]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Color]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Color](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
	[ColorCode] [varchar](20) NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Color] UNIQUE NONCLUSTERED 
(
	[ColorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Country]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[CountryCode] [nvarchar](5) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Coupon]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Coupon](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[CouponCode] [nvarchar](50) NOT NULL,
	[CouponName] [nvarchar](100) NULL,
	[DiscountType] [nvarchar](20) NULL,
	[DiscountValue] [decimal](18, 2) NULL,
	[MinimumOrderAmount] [decimal](18, 2) NULL,
	[MaximumDiscount] [decimal](18, 2) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[UsageLimit] [int] NULL,
	[UsedCount] [int] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_InventoryHistory]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_InventoryHistory](
	[InventoryHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[VariantId] [int] NOT NULL,
	[StockIn] [int] NULL,
	[StockOut] [int] NULL,
	[BalanceStock] [int] NULL,
	[Remarks] [nvarchar](250) NULL,
	[ReferenceType] [nvarchar](50) NULL,
	[ReferenceId] [int] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MemberRole]    Script Date: 28-06-2026 01:39:30 ******/
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
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 28-06-2026 01:39:30 ******/
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
/****** Object:  Table [dbo].[Tbl_Notification]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Notification](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NULL,
	[IsRead] [bit] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Offer]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Offer](
	[OfferId] [int] IDENTITY(1,1) NOT NULL,
	[OfferTitle] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[BannerImage] [nvarchar](300) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Order]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [nvarchar](30) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ShippingDetailId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
	[PaymentMode] [nvarchar](50) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[DiscountAmount] [decimal](18, 2) NOT NULL,
	[ShippingCharge] [decimal](18, 2) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ExpectedDeliveryDate] [datetime] NULL,
	[Remarks] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_OrderDetail]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[VariantId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[MRP] [decimal](18, 2) NOT NULL,
	[SellingPrice] [decimal](18, 2) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_OrderStatus]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_OrderStatus](
	[OrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_OrderTracking]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_OrderTracking](
	[TrackingId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[OrderStatusId] [int] NULL,
	[Remarks] [nvarchar](500) NULL,
	[TrackingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrackingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Payment]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[TransactionId] [nvarchar](200) NULL,
	[GatewayTransactionId] [nvarchar](200) NULL,
	[PaymentGateway] [nvarchar](50) NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[GatewayResponse] [nvarchar](max) NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PaymentStatus]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentStatusName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NULL,
	[BrandId] [int] NULL,
	[SKU] [nvarchar](50) NULL,
	[Barcode] [nvarchar](100) NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[MRP] [decimal](18, 2) NOT NULL,
	[SellingPrice] [decimal](18, 2) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[StockQuantity] [int] NOT NULL,
	[Gender] [nvarchar](20) NULL,
	[Material] [nvarchar](100) NULL,
	[FitType] [nvarchar](50) NULL,
	[SleeveType] [nvarchar](50) NULL,
	[NeckType] [nvarchar](50) NULL,
	[Pattern] [nvarchar](100) NULL,
	[Occasion] [nvarchar](100) NULL,
	[WashCare] [nvarchar](250) NULL,
	[Rating] [decimal](3, 2) NULL,
	[TotalReviews] [int] NULL,
	[Slug] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[IsFeatured] [bit] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Product_SKU] UNIQUE NONCLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ProductImage]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageName] [nvarchar](300) NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ProductReview]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ProductReview](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[Rating] [decimal](2, 1) NOT NULL,
	[ReviewTitle] [nvarchar](150) NULL,
	[ReviewText] [nvarchar](max) NULL,
	[IsApproved] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ProductSpecification]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ProductSpecification](
	[SpecificationId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[SpecificationName] [nvarchar](100) NULL,
	[SpecificationValue] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ProductTag]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ProductTag](
	[ProductId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ProductVariant]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ProductVariant](
	[VariantId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[SKU] [nvarchar](100) NOT NULL,
	[MRP] [decimal](18, 2) NOT NULL,
	[SellingPrice] [decimal](18, 2) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[StockQuantity] [int] NOT NULL,
	[Weight] [decimal](10, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ProductVariant] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[ColorId] ASC,
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_RecentlyViewed]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_RecentlyViewed](
	[RecentlyViewedId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[ProductId] [int] NULL,
	[ViewedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecentlyViewedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 28-06-2026 01:39:30 ******/
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
/****** Object:  Table [dbo].[Tbl_ShippingDetails]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[AddressLine] [varchar](100) NULL,
	[ZipCode] [varchar](50) NULL,
	[OrderId] [varchar](50) NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
	[FullName] [nvarchar](150) NULL,
	[MobileNo] [nvarchar](20) NULL,
	[AddressLine2] [nvarchar](250) NULL,
	[Landmark] [nvarchar](150) NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[IsDefault] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Tbl_ShippingAddress] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Size]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](20) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Size] UNIQUE NONCLUSTERED 
(
	[SizeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_State]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateName] [nvarchar](100) NOT NULL,
	[StateCode] [nvarchar](10) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SubCategory]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[SubCategoryImage] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Tag]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Tag](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Wishlist]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Wishlist](
	[WishlistId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[VariantId] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Wishlist] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC,
	[VariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_Order]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_Order] ON [dbo].[Tbl_OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_Variant]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_Variant] ON [dbo].[Tbl_OrderDetail]
(
	[VariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Payment_Order]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Payment_Order] ON [dbo].[Tbl_Payment]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Payment_Transaction]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Payment_Transaction] ON [dbo].[Tbl_Payment]
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_Brand]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Product_Brand] ON [dbo].[Tbl_Product]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_Category]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Product_Category] ON [dbo].[Tbl_Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_IsActive]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Product_IsActive] ON [dbo].[Tbl_Product]
(
	[IsActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_IsFeatured]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Product_IsFeatured] ON [dbo].[Tbl_Product]
(
	[IsFeatured] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product_Name]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Product_Name] ON [dbo].[Tbl_Product]
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product_SKU]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Product_SKU] ON [dbo].[Tbl_Product]
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product_Slug]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Product_Slug] ON [dbo].[Tbl_Product]
(
	[Slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_SubCategory]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_Product_SubCategory] ON [dbo].[Tbl_Product]
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImage_ProductId]    Script Date: 28-06-2026 01:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_ProductImage_ProductId] ON [dbo].[Tbl_ProductImage]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Brand] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Brand] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_Brand] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Cart] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Tbl_City] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_City] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_City] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Color] ADD  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Tbl_Color] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Color] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_Color] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Country] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Country] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_Country] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Coupon] ADD  DEFAULT ((0)) FOR [UsedCount]
GO
ALTER TABLE [dbo].[Tbl_Coupon] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_InventoryHistory] ADD  DEFAULT ((0)) FOR [StockIn]
GO
ALTER TABLE [dbo].[Tbl_InventoryHistory] ADD  DEFAULT ((0)) FOR [StockOut]
GO
ALTER TABLE [dbo].[Tbl_InventoryHistory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Notification] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Tbl_Notification] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Order] ADD  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[Tbl_Order] ADD  DEFAULT ((0)) FOR [ShippingCharge]
GO
ALTER TABLE [dbo].[Tbl_Order] ADD  DEFAULT ((0)) FOR [TaxAmount]
GO
ALTER TABLE [dbo].[Tbl_Order] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Tbl_OrderDetail] ADD  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[Tbl_OrderDetail] ADD  DEFAULT ((0)) FOR [TaxAmount]
GO
ALTER TABLE [dbo].[Tbl_OrderDetail] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_OrderStatus] ADD  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Tbl_OrderStatus] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_OrderTracking] ADD  DEFAULT (getdate()) FOR [TrackingDate]
GO
ALTER TABLE [dbo].[Tbl_Payment] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_PaymentStatus] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [DF_Product_StockQuantity]  DEFAULT ((0)) FOR [StockQuantity]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [DF_Product_Rating]  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [DF_Product_TotalReviews]  DEFAULT ((0)) FOR [TotalReviews]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [DF_Product_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [DF_Product_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [DF_Product_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [DF_Product_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_ProductImage] ADD  CONSTRAINT [DF_ProductImage_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[Tbl_ProductImage] ADD  CONSTRAINT [DF_ProductImage_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Tbl_ProductImage] ADD  CONSTRAINT [DF_ProductImage_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_ProductImage] ADD  CONSTRAINT [DF_ProductImage_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_ProductImage] ADD  CONSTRAINT [DF_ProductImage_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_ProductReview] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Tbl_ProductReview] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_ProductVariant] ADD  DEFAULT ((0)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[Tbl_ProductVariant] ADD  DEFAULT ((0)) FOR [StockQuantity]
GO
ALTER TABLE [dbo].[Tbl_ProductVariant] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_ProductVariant] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_ProductVariant] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_RecentlyViewed] ADD  DEFAULT (getdate()) FOR [ViewedDate]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Size] ADD  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Tbl_Size] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Size] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_Size] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_State] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_State] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_State] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_SubCategory] ADD  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Tbl_SubCategory] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_SubCategory] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_SubCategory] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Wishlist] ADD  DEFAULT (getdate()) FOR [AddedDate]
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([CartStatusId])
REFERENCES [dbo].[Tbl_CartStatus] ([CartStatusId])
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([CartStatusId])
REFERENCES [dbo].[Tbl_CartStatus] ([CartStatusId])
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_ProductVariant] FOREIGN KEY([VariantId])
REFERENCES [dbo].[Tbl_ProductVariant] ([VariantId])
GO
ALTER TABLE [dbo].[Tbl_Cart] CHECK CONSTRAINT [FK_Cart_ProductVariant]
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_ShippingDetails] FOREIGN KEY([ShippingDetailId])
REFERENCES [dbo].[Tbl_ShippingDetails] ([ShippingDetailId])
GO
ALTER TABLE [dbo].[Tbl_Cart] CHECK CONSTRAINT [FK_Cart_ShippingDetails]
GO
ALTER TABLE [dbo].[Tbl_City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[Tbl_State] ([StateId])
GO
ALTER TABLE [dbo].[Tbl_City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Tbl_MemberRole]  WITH CHECK ADD  CONSTRAINT [fk_Tbl_Roles_Tbl_MemberRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Tbl_Roles] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_MemberRole] CHECK CONSTRAINT [fk_Tbl_Roles_Tbl_MemberRole]
GO
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Tbl_Members] ([MemberId])
GO
ALTER TABLE [dbo].[Tbl_Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[Tbl_OrderStatus] ([OrderStatusId])
GO
ALTER TABLE [dbo].[Tbl_Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentStatus] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[Tbl_PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[Tbl_Order] CHECK CONSTRAINT [FK_Order_PaymentStatus]
GO
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipping] FOREIGN KEY([ShippingDetailId])
REFERENCES [dbo].[Tbl_ShippingDetails] ([ShippingDetailId])
GO
ALTER TABLE [dbo].[Tbl_Order] CHECK CONSTRAINT [FK_Order_Shipping]
GO
ALTER TABLE [dbo].[Tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Tbl_Order] ([OrderId])
GO
ALTER TABLE [dbo].[Tbl_OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Tbl_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductVariant] FOREIGN KEY([VariantId])
REFERENCES [dbo].[Tbl_ProductVariant] ([VariantId])
GO
ALTER TABLE [dbo].[Tbl_OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductVariant]
GO
ALTER TABLE [dbo].[Tbl_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Tbl_Order] ([OrderId])
GO
ALTER TABLE [dbo].[Tbl_Payment] CHECK CONSTRAINT [FK_Payment_Order]
GO
ALTER TABLE [dbo].[Tbl_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Status] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[Tbl_PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[Tbl_Payment] CHECK CONSTRAINT [FK_Payment_Status]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Tbl_Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[Tbl_SubCategory] ([SubCategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[Tbl_ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
ALTER TABLE [dbo].[Tbl_ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Tbl_Members] ([MemberId])
GO
ALTER TABLE [dbo].[Tbl_ProductReview] CHECK CONSTRAINT [FK_ProductReview_Member]
GO
ALTER TABLE [dbo].[Tbl_ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Tbl_ProductReview] CHECK CONSTRAINT [FK_ProductReview_Product]
GO
ALTER TABLE [dbo].[Tbl_ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Color] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Tbl_Color] ([ColorId])
GO
ALTER TABLE [dbo].[Tbl_ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Color]
GO
ALTER TABLE [dbo].[Tbl_ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Tbl_ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Product]
GO
ALTER TABLE [dbo].[Tbl_ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariant_Size] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Tbl_Size] ([SizeId])
GO
ALTER TABLE [dbo].[Tbl_ProductVariant] CHECK CONSTRAINT [FK_ProductVariant_Size]
GO
ALTER TABLE [dbo].[Tbl_State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Tbl_Country] ([CountryId])
GO
ALTER TABLE [dbo].[Tbl_State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[Tbl_SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[Tbl_Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Tbl_Members] ([MemberId])
GO
ALTER TABLE [dbo].[Tbl_Wishlist] CHECK CONSTRAINT [FK_Wishlist_Member]
GO
ALTER TABLE [dbo].[Tbl_Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_ProductVariant] FOREIGN KEY([VariantId])
REFERENCES [dbo].[Tbl_ProductVariant] ([VariantId])
GO
ALTER TABLE [dbo].[Tbl_Wishlist] CHECK CONSTRAINT [FK_Wishlist_ProductVariant]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Discount] CHECK  (([DiscountPercentage]>=(0) AND [DiscountPercentage]<=(100)))
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [CK_Product_Discount]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Price] CHECK  (([SellingPrice]<=[MRP]))
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [CK_Product_Price]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Rating] CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [CK_Product_Rating]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Stock] CHECK  (([StockQuantity]>=(0)))
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [CK_Product_Stock]
GO
/****** Object:  StoredProcedure [dbo].[USP_MemberShoppingCartDetails]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_MemberShoppingCartDetails]
(
    @memberId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        cr.CartId,
        cr.Quantity,
        cr.AddedOn,

        p.ProductId,
        p.ProductName,
        p.Description,
        p.ProductImage,

        p.MRP,
        p.SellingPrice,
        p.DiscountPercentage,

        p.StockQuantity,
        p.Rating,
        p.TotalReviews,
        p.IsFeatured,

        c.CategoryId,
        c.CategoryName,

        sc.SubCategoryId,
        sc.SubCategoryName,

        b.BrandId,
        b.BrandName,

        (cr.Quantity * p.SellingPrice) AS TotalAmount

    FROM Tbl_Cart cr

        INNER JOIN Tbl_Product p
            ON cr.ProductId = p.ProductId

        INNER JOIN Tbl_Category c
            ON p.CategoryId = c.CategoryId

        LEFT JOIN Tbl_SubCategory sc
            ON p.SubCategoryId = sc.SubCategoryId

        LEFT JOIN Tbl_Brand b
            ON p.BrandId = b.BrandId

    WHERE
        cr.MemberId = @memberId
        AND cr.CartStatusId = 1
        AND p.IsActive = 1
        AND p.IsDelete = 0
        AND c.IsActive = 1
        AND c.IsDelete = 0

    ORDER BY cr.CartId DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Search]    Script Date: 28-06-2026 01:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_Search]
(
    @SearchKey NVARCHAR(200) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    SET @SearchKey = LTRIM(RTRIM(ISNULL(@SearchKey, '')));

    SELECT
        P.ProductId,
        P.ProductName,
        P.ProductImage,
        P.Description,

        C.CategoryId,
        C.CategoryName,

        SC.SubCategoryId,
        SC.SubCategoryName,

        B.BrandId,
        B.BrandName,

        P.SKU,

        P.MRP,
        P.SellingPrice,

        CASE
            WHEN P.MRP > 0
            THEN CAST(((P.MRP - P.SellingPrice) * 100.0) / P.MRP AS DECIMAL(5,2))
            ELSE 0
        END AS DiscountPercentage,

        P.StockQuantity,

        CASE
            WHEN P.StockQuantity > 0
            THEN 'In Stock'
            ELSE 'Out Of Stock'
        END AS StockStatus,

        P.Rating,
        P.TotalReviews,

        P.Gender,
        P.Material,
        P.FitType,
        P.SleeveType,
        P.NeckType,
        P.Pattern,
        P.Occasion,

        P.IsFeatured,
        P.CreatedDate

    FROM Tbl_Product P
        INNER JOIN Tbl_Category C
            ON P.CategoryId = C.CategoryId

        LEFT JOIN Tbl_SubCategory SC
            ON P.SubCategoryId = SC.SubCategoryId

        LEFT JOIN Tbl_Brand B
            ON P.BrandId = B.BrandId

    WHERE
        P.IsActive = 1
        AND P.IsDelete = 0
        AND C.IsActive = 1
        AND C.IsDelete = 0
        AND
        (
            @SearchKey = ''

            OR P.ProductName LIKE '%' + @SearchKey + '%'
            OR C.CategoryName LIKE '%' + @SearchKey + '%'
            OR SC.SubCategoryName LIKE '%' + @SearchKey + '%'
            OR B.BrandName LIKE '%' + @SearchKey + '%'
            OR P.SKU LIKE '%' + @SearchKey + '%'
            OR P.Description LIKE '%' + @SearchKey + '%'
            OR P.Gender LIKE '%' + @SearchKey + '%'
            OR P.Material LIKE '%' + @SearchKey + '%'
            OR P.Pattern LIKE '%' + @SearchKey + '%'
            OR P.Occasion LIKE '%' + @SearchKey + '%'
        )

    ORDER BY

        P.IsFeatured DESC,
        P.Rating DESC,
        P.CreatedDate DESC,
        P.ProductName;
END
GO
USE [master]
GO
ALTER DATABASE [FashionBazaar] SET  READ_WRITE 
GO
