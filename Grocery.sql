USE [Grocery]
GO
/****** Object:  Table [dbo].[Tbl_Cart]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_CartStatus]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_City]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_Country]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_MemberRole]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 30-06-2026 09:35:35 ******/
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
	[Pincode] [int] NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
 CONSTRAINT [PK_Tbl_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 30-06-2026 09:35:35 ******/
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
	[Description] [nvarchar](max) NULL,
	[ProductImage] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsFeatured] [bit] NULL,
	[VendorId] [int] NULL,
	[Pincode] [int] NULL,
	[DiscountPercent] [decimal](5, 2) NULL,
	[SellingPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_ShippingDetails]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_State]    Script Date: 30-06-2026 09:35:35 ******/
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
/****** Object:  Table [dbo].[Tbl_Vendors]    Script Date: 30-06-2026 09:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Vendors](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CompanyName] [nvarchar](200) NULL,
	[GSTNumber] [nvarchar](50) NULL,
	[BusinessLicense] [nvarchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[Pincode] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Cart] ON 
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1010, 8, 3, 3, CAST(N'2026-06-27T14:21:58.610' AS DateTime), CAST(N'2026-06-27T14:21:58.610' AS DateTime), 5)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1011, 228, 3, 3, CAST(N'2026-06-27T16:43:25.160' AS DateTime), CAST(N'2026-06-27T16:43:25.160' AS DateTime), 6)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1012, 62, 3, 3, CAST(N'2026-06-27T17:05:21.800' AS DateTime), CAST(N'2026-06-27T17:05:21.800' AS DateTime), 6)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1013, 109, 3, 3, CAST(N'2026-06-27T17:42:42.830' AS DateTime), CAST(N'2026-06-27T17:42:42.830' AS DateTime), 6)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1014, 28, 3, 3, CAST(N'2026-06-27T17:52:55.557' AS DateTime), CAST(N'2026-06-27T17:52:55.557' AS DateTime), 6)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1015, 70, 3, 3, CAST(N'2026-06-27T17:55:45.517' AS DateTime), CAST(N'2026-06-27T17:55:45.517' AS DateTime), 8)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1016, 88, 3, 3, CAST(N'2026-06-27T18:33:40.773' AS DateTime), CAST(N'2026-06-27T18:33:40.773' AS DateTime), 8)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1017, 10, 3, 3, CAST(N'2026-06-27T19:39:48.937' AS DateTime), CAST(N'2026-06-27T19:39:48.937' AS DateTime), 9)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1018, 68, 3, 2, CAST(N'2026-06-27T19:41:44.380' AS DateTime), CAST(N'2026-06-27T19:41:47.993' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1019, 48, 3, 3, CAST(N'2026-06-27T19:41:54.140' AS DateTime), CAST(N'2026-06-27T19:41:54.140' AS DateTime), 12)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1020, 129, 3, 1, CAST(N'2026-06-27T19:52:51.650' AS DateTime), CAST(N'2026-06-27T19:52:51.650' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1021, 68, 3, 1, CAST(N'2026-06-30T00:48:44.120' AS DateTime), CAST(N'2026-06-30T00:48:44.120' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_Cart] ([CartId], [ProductId], [MemberId], [CartStatusId], [AddedOn], [UpdatedOn], [ShippingDetailId]) VALUES (1022, 68, 3, 1, CAST(N'2026-06-30T00:48:44.320' AS DateTime), CAST(N'2026-06-30T00:48:44.320' AS DateTime), NULL)
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
SET IDENTITY_INSERT [dbo].[Tbl_City] ON 
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (1, 1, N'Mumbai', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (2, 1, N'Pune', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (3, 1, N'Nagpur', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (4, 2, N'New Delhi', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (5, 3, N'Bengaluru', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (6, 3, N'Mysuru', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (7, 4, N'Chennai', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (8, 4, N'Coimbatore', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (9, 5, N'Lucknow', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (10, 5, N'Noida', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (11, 6, N'Ahmedabad', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
INSERT [dbo].[Tbl_City] ([CityId], [StateId], [CityName], [IsActive], [IsDelete], [CreatedDate]) VALUES (12, 6, N'Surat', 1, 0, CAST(N'2026-06-27T18:05:44.330' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_City] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Country] ON 
GO
INSERT [dbo].[Tbl_Country] ([CountryId], [CountryName], [CountryCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (1, N'India', N'IN', 1, 0, CAST(N'2026-06-27T18:05:27.653' AS DateTime))
GO
INSERT [dbo].[Tbl_Country] ([CountryId], [CountryName], [CountryCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (2, N'United States', N'US', 1, 0, CAST(N'2026-06-27T18:05:27.653' AS DateTime))
GO
INSERT [dbo].[Tbl_Country] ([CountryId], [CountryName], [CountryCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (3, N'United Kingdom', N'UK', 1, 0, CAST(N'2026-06-27T18:05:27.653' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_MemberRole] ON 
GO
INSERT [dbo].[Tbl_MemberRole] ([MemberRoleId], [MemberId], [RoleId]) VALUES (3, 3, 1)
GO
INSERT [dbo].[Tbl_MemberRole] ([MemberRoleId], [MemberId], [RoleId]) VALUES (6, 4, 2)
GO
INSERT [dbo].[Tbl_MemberRole] ([MemberRoleId], [MemberId], [RoleId]) VALUES (7, 5, 3)
GO
SET IDENTITY_INSERT [dbo].[Tbl_MemberRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Members] ON 
GO
INSERT [dbo].[Tbl_Members] ([MemberId], [FirstName], [LastName], [EmailId], [Password], [IsActive], [IsDelete], [CreatedOn], [ModifiedOn], [Pincode], [PhoneNumber]) VALUES (3, N'Imran', N'Ghani', N'admin@gmail.com', N'cyetcUjWIV2JW5uX7lplsdfQ==', 1, 0, CAST(N'2016-09-28T23:34:01.630' AS DateTime), CAST(N'2016-09-28T23:34:01.630' AS DateTime), 841301, NULL)
GO
INSERT [dbo].[Tbl_Members] ([MemberId], [FirstName], [LastName], [EmailId], [Password], [IsActive], [IsDelete], [CreatedOn], [ModifiedOn], [Pincode], [PhoneNumber]) VALUES (4, N'Muhammad', N'Ahmad', N'ahmad@gmail.com', N'cyetcUjWIV2JW5uX7lplsdfQ==', 1, 0, CAST(N'2016-09-28T23:34:01.630' AS DateTime), CAST(N'2016-09-28T23:34:01.630' AS DateTime), 841301, NULL)
GO
INSERT [dbo].[Tbl_Members] ([MemberId], [FirstName], [LastName], [EmailId], [Password], [IsActive], [IsDelete], [CreatedOn], [ModifiedOn], [Pincode], [PhoneNumber]) VALUES (5, N'Kumar@123.com', N'Kumar@123.com', N'Kumar@123.com', N'iioYlgisx44ABF63sQKlRQ==', 1, 0, CAST(N'2026-06-28T12:41:20.657' AS DateTime), NULL, 841301, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] ON 
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (8, N'Apple', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-29' AS Date), N'<p>Fresh Red Apples</p>', N'133946434129895615.jpg', CAST(120.00 AS Decimal(18, 2)), 1, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (9, N'Banana', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'<p>Organic Bananas</p>', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (10, N'Mango', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'<p>Alphonso Mangoes</p>', N'gregmontani-mangoes-823598.jpg', CAST(150.00 AS Decimal(18, 2)), 0, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (11, N'Potato', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Farm Fresh Potatoes', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (12, N'Onion', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Red Onions', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(49.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (13, N'Tomato', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Juicy Tomatoes', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (14, N'Carrot', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-29' AS Date), N'<p>Crunchy Carrots&nbsp;</p>', N'133886835376214483.jpg', CAST(80.00 AS Decimal(18, 2)), 0, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (15, N'Spinach', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Spinach', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (16, N'Cucumber', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Green Cucumbers', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (17, N'Cauliflower', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cauliflower Head', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (18, N'Broccoli', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Broccoli Florets', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (19, N'Grapes', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Seedless Grapes', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (20, N'Orange', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Nagpur Oranges', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (21, N'Papaya', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ripe Papaya', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (22, N'Pineapple', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Sweet Pineapple', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (23, N'Watermelon', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Large Watermelon', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (24, N'Strawberry', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Strawberries', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (25, N'Peas', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Green Peas', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (26, N'Radish', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'White Radish', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(49.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (27, N'Beetroot', 1, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Red Beetroot', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (28, N'Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Full Cream Milk', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (29, N'Curd', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Curd', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(49.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (30, N'Butter', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Salted Butter', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (31, N'Cheese', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Processed Cheese', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (32, N'Paneer', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cottage Cheese', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (33, N'Eggs', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Farm Eggs', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (34, N'Ghee', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pure Cow Ghee', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (35, N'Lassi', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Sweet Lassi', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (36, N'Cream', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Cream', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (37, N'Flavored Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chocolate Milk', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (38, N'Buttermilk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Spiced Buttermilk', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (39, N'Whipped Cream', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whipped Cream', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (40, N'Mozzarella', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mozzarella Cheese', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (41, N'Parmesan', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Parmesan Cheese', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (42, N'Egg Whites', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Liquid Egg Whites', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (43, N'Skimmed Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Low Fat Milk', N'pexels-freestockpro-12955951.jpg', CAST(55.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(54.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (44, N'Soy Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soy Milk', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (45, N'Almond Milk', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Almond Milk', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (46, N'Yogurt Drink', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Flavored Yogurt Drink', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (47, N'Kefir', 2, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fermented Milk Drink', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (48, N'White Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft White Bread', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (49, N'Brown Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Wheat Bread', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(49.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (50, N'Multigrain Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Healthy Multigrain Bread', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (51, N'Buns', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Burger Buns', N'pexels-freestockpro-12955951.jpg', CAST(30.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(29.70 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (52, N'Croissant', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Butter Croissant', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (53, N'Bagel', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Bagel', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (54, N'Muffin', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chocolate Muffin', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (55, N'Cupcake', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Vanilla Cupcake', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (56, N'Doughnut', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Glazed Doughnut', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (57, N'Pita Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Pita Bread', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(49.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (58, N'Naan', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Tandoori Naan', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (59, N'Paratha', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Stuffed Paratha', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (60, N'Roti', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Wheat Roti', N'pexels-freestockpro-12955951.jpg', CAST(30.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(29.70 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (61, N'Cake', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chocolate Cake', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (62, N'Pastry', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cream Pastry', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (63, N'Breadsticks', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Crispy Breadsticks', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (64, N'Garlic Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Garlic Flavored Bread', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (65, N'Rolls', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dinner Rolls', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (66, N'Sourdough Bread', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Artisan Sourdough', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (67, N'Focaccia', 3, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Italian Focaccia', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (68, N'Rice', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Basmati Rice', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (69, N'Wheat Flour', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Wheat Flour', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (70, N'Oats', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rolled Oats', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (71, N'Barley', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pearl Barley', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (72, N'Corn Flour', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Corn Flour', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (73, N'Chickpeas', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dry Chickpeas', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (74, N'Green Gram', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moong Dal', N'pexels-freestockpro-12955951.jpg', CAST(110.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(108.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (75, N'Red Lentils', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Masoor Dal', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (76, N'Black Gram', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Urad Dal', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (77, N'Kidney Beans', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rajma Beans', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (78, N'Pigeon Pea', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Toor Dal', N'pexels-freestockpro-12955951.jpg', CAST(130.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(128.70 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (79, N'Soybeans', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soybeans', N'pexels-freestockpro-12955951.jpg', CAST(140.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(138.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (80, N'Millets', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Foxtail Millet', N'pexels-freestockpro-12955951.jpg', CAST(160.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(158.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (81, N'Quinoa', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Organic Quinoa', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (82, N'Buckwheat', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Buckwheat Grain', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (83, N'Chana Dal', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Split Bengal Gram', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (84, N'Horse Gram', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Kulthi Dal', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (85, N'Green Peas Dal', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Split Green Peas', N'pexels-freestockpro-12955951.jpg', CAST(110.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(108.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (86, N'Flattened Rice', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Poha', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (87, N'Semolina', 4, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rava/Sooji', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (88, N'Turmeric Powder', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pure Turmeric Powder', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (89, N'Red Chili Powder', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Hot Chili Powder', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (90, N'Coriander Powder', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ground Coriander', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (91, N'Cumin Seeds', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Cumin Seeds', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (92, N'Black Pepper', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Black Peppercorns', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (93, N'Salt', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Iodized Salt', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (94, N'Sugar', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Refined Sugar', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (95, N'Mustard Seeds', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Yellow Mustard Seeds', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (96, N'Fenugreek Seeds', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Methi Seeds', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (97, N'Cardamom', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Green Cardamom', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (98, N'Cloves', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Cloves', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (99, N'Cinnamon', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cinnamon Sticks', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (100, N'Bay Leaf', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dried Bay Leaves', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (101, N'Nutmeg', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Whole Nutmeg', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(217.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (102, N'Saffron', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Premium Saffron', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (103, N'Pickle', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mixed Vegetable Pickle', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (104, N'Vinegar', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'White Vinegar', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (105, N'Soy Sauce', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dark Soy Sauce', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (106, N'Tomato Ketchup', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Classic Tomato Ketchup', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (107, N'Chutney', 5, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mint Chutney', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (108, N'Potato Chips', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Salted Potato Chips', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(49.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (109, N'Namkeen Mixture', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Spicy Namkeen Mix', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (110, N'Chocolate Bar', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Milk Chocolate Bar', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (111, N'Biscuits', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Digestive Biscuits', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (112, N'Cookies', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Choco Chip Cookies', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (113, N'Soft Drink', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cola Drink', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (114, N'Fruit Juice', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Orange Juice', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (115, N'Energy Drink', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Sports Energy Drink', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (116, N'Tea', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Assam Tea', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (117, N'Coffee', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Instant Coffee', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (118, N'Green Tea', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Organic Green Tea', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (119, N'Popcorn', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Salted Popcorn', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (120, N'Ice Cream Cone', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Vanilla Ice Cream', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (121, N'Candy', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fruit Candy', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(49.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (122, N'Protein Bar', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'High Protein Bar', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (123, N'Noodles', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Instant Noodles', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (124, N'Nachos', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cheese Nachos', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (125, N'Cold Coffee', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Iced Coffee', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (126, N'Milkshake', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chocolate Milkshake', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (127, N'Hot Chocolate', 6, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rich Hot Chocolate', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(217.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (128, N'Chicken Breast', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Chicken Breast', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (129, N'Chicken Drumsticks', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Juicy Drumsticks', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(217.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (130, N'Whole Chicken', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Farm Whole Chicken', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(396.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (131, N'Mutton Curry Cut', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Tender Mutton Pieces', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(594.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (132, N'Mutton Mince', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ground Mutton', N'pexels-freestockpro-12955951.jpg', CAST(650.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(643.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (133, N'Fish Rohu', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Rohu Fish', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (134, N'Fish Hilsa', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Premium Hilsa Fish', N'pexels-freestockpro-12955951.jpg', CAST(800.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(792.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (135, N'Fish Salmon', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Atlantic Salmon', N'pexels-freestockpro-12955951.jpg', CAST(1200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(1188.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (136, N'Fish Tuna', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Tuna', N'pexels-freestockpro-12955951.jpg', CAST(900.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(891.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (137, N'Fish Pomfret', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Silver Pomfret', N'pexels-freestockpro-12955951.jpg', CAST(700.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(693.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (138, N'Prawns Medium', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Medium Prawns', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (139, N'Prawns Large', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Large Prawns', N'pexels-freestockpro-12955951.jpg', CAST(800.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(792.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (140, N'Crab', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Crab', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(594.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (141, N'Lobster', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Premium Lobster', N'pexels-freestockpro-12955951.jpg', CAST(1500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(1485.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (142, N'Duck Meat', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Farm Duck Meat', N'pexels-freestockpro-12955951.jpg', CAST(700.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(693.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (143, N'Turkey Breast', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Turkey Breast', N'pexels-freestockpro-12955951.jpg', CAST(900.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(891.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (144, N'Goat Liver', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Goat Liver', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(396.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (145, N'Chicken Sausages', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chicken Sausages', N'pexels-freestockpro-12955951.jpg', CAST(350.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(346.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (146, N'Fish Fillet', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fish Fillet', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (147, N'Shrimp', 7, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fresh Shrimp', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(594.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (148, N'Frozen Peas', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Frozen Green Peas', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (149, N'Frozen Sweet Corn', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Frozen Sweet Corn', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (150, N'Frozen French Fries', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Crispy French Fries', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (151, N'Frozen Chicken Nuggets', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Chicken Nuggets', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (152, N'Frozen Fish Fingers', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fish Finger Snacks', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (153, N'Frozen Paratha', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready-to-cook Paratha', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (154, N'Frozen Pizza', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cheese Pizza', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (155, N'Frozen Momos', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Veg Momos', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (156, N'Frozen Spring Rolls', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Veg Spring Rolls', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(217.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (157, N'Frozen Samosa', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mini Samosa', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (158, N'Instant Noodles', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Packaged Instant Noodles', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (159, N'Instant Pasta', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Pasta', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (160, N'Ready Soup Mix', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Instant Soup Mix', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (161, N'Frozen Ice Cream', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Vanilla Ice Cream', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (162, N'Frozen Kulfi', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Traditional Kulfi', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (163, N'Frozen Sandwich', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Sandwich', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (164, N'Frozen Burger Patty', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Veg Burger Patty', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (165, N'Frozen Paneer Tikka', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Paneer Tikka', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(217.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (166, N'Frozen Idli', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Idli', N'pexels-freestockpro-12955951.jpg', CAST(160.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(158.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (167, N'Frozen Dosa', 8, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Ready Dosa', N'pexels-freestockpro-12955951.jpg', CAST(170.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(168.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (168, N'Laundry Detergent', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Powder Detergent', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (169, N'Liquid Detergent', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Liquid Detergent', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (170, N'Dishwashing Liquid', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dishwashing Soap', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (171, N'Floor Cleaner', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Multipurpose Floor Cleaner', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (172, N'Toilet Cleaner', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Toilet Cleaning Liquid', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (173, N'Glass Cleaner', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Glass Cleaning Spray', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (174, N'Room Freshener', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Air Freshener Spray', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (175, N'Garbage Bags', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Disposable Garbage Bags', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (176, N'Mop', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Floor Mop', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (177, N'Broom', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Coconut Broom', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (178, N'Bucket', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Plastic Bucket', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (179, N'Scrub Pad', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dish Scrub Pad', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (180, N'Hand Gloves', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cleaning Gloves', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (181, N'Tissue Paper', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Tissue Paper', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (182, N'Toilet Paper', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Roll of Toilet Paper', N'pexels-freestockpro-12955951.jpg', CAST(70.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(69.30 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (183, N'Washing Soap', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Bar Washing Soap', N'pexels-freestockpro-12955951.jpg', CAST(50.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(49.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (184, N'Insect Spray', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mosquito/Insect Spray', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (185, N'Bleach', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Household Bleach', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (186, N'Ironing Spray', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fabric Ironing Spray', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (187, N'Cleaning Cloth', 9, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Microfiber Cleaning Cloth', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (188, N'Bath Soap', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moisturizing Bath Soap', N'pexels-freestockpro-12955951.jpg', CAST(40.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(39.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (189, N'Shampoo', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Anti-Dandruff Shampoo', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (190, N'Conditioner', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Hair Conditioner', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (191, N'Toothpaste', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fluoride Toothpaste', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (192, N'Toothbrush', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Bristle Toothbrush', N'pexels-freestockpro-12955951.jpg', CAST(60.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(59.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (193, N'Handwash', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Liquid Handwash', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (194, N'Sanitizer', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Alcohol-based Sanitizer', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (195, N'Face Wash', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Gentle Face Wash', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (196, N'Face Cream', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moisturizing Face Cream', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (197, N'Body Lotion', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Hydrating Body Lotion', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (198, N'Hair Oil', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Coconut Hair Oil', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (199, N'Perfume', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Floral Perfume', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (200, N'Deodorant', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Roll-on Deodorant', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (201, N'Lip Balm', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moisturizing Lip Balm', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (202, N'Shaving Cream', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Foamy Shaving Cream', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (203, N'Razor', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Disposable Razor', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (204, N'Talcum Powder', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Fragrant Talcum Powder', N'pexels-freestockpro-12955951.jpg', CAST(90.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(89.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (205, N'Hair Gel', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Styling Hair Gel', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (206, N'Sunscreen', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'SPF Sunscreen Lotion', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (207, N'Hand Cream', 10, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Nourishing Hand Cream', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (208, N'Baby Diapers', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Disposable Baby Diapers', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (209, N'Baby Wipes', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Baby Wipes', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (210, N'Baby Lotion', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Moisturizing Baby Lotion', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (211, N'Baby Powder', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Gentle Baby Powder', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (212, N'Baby Soap', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mild Baby Soap', N'pexels-freestockpro-12955951.jpg', CAST(100.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (213, N'Baby Shampoo', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Tear-Free Baby Shampoo', N'pexels-freestockpro-12955951.jpg', CAST(180.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(178.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (214, N'Baby Oil', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Massage Baby Oil', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (215, N'Baby Cream', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Protective Baby Cream', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(217.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (216, N'Baby Food', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Packaged Baby Food', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (217, N'Infant Formula', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Milk Formula for Infants', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(594.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (218, N'Baby Bottle', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Feeding Bottle', N'pexels-freestockpro-12955951.jpg', CAST(150.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (219, N'Pacifier', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Pacifier', N'pexels-freestockpro-12955951.jpg', CAST(80.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(79.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (220, N'Baby Blanket', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Warm Baby Blanket', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(396.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (221, N'Baby Clothes', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cotton Baby Clothes', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (222, N'Baby Bibs', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Washable Baby Bibs', N'pexels-freestockpro-12955951.jpg', CAST(120.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(118.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (223, N'Baby Chair', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Feeding Chair', N'pexels-freestockpro-12955951.jpg', CAST(1500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(1485.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (224, N'Baby Cradle', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Wooden Baby Cradle', N'pexels-freestockpro-12955951.jpg', CAST(2500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(2475.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (225, N'Baby Walker', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Baby Walker', N'pexels-freestockpro-12955951.jpg', CAST(1800.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(1782.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (226, N'Baby Toys', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Baby Toys', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (227, N'Baby Bath Tub', 11, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Plastic Baby Bath Tub', N'pexels-freestockpro-12955951.jpg', CAST(700.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(693.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (228, N'Dog Food', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dry Dog Food', N'pexels-freestockpro-12955951.jpg', CAST(800.00 AS Decimal(18, 2)), 1, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(792.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (229, N'Cat Food', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Dry Cat Food', N'pexels-freestockpro-12955951.jpg', CAST(700.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(693.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (230, N'Bird Seeds', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Mixed Bird Seeds', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (231, N'Fish Food', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Aquarium Fish Food', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (232, N'Dog Biscuits', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Crunchy Dog Biscuits', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (233, N'Cat Treats', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Tasty Cat Treats', N'pexels-freestockpro-12955951.jpg', CAST(220.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(217.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (234, N'Pet Shampoo', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Gentle Pet Shampoo', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(396.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (235, N'Pet Conditioner', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pet Hair Conditioner', N'pexels-freestockpro-12955951.jpg', CAST(450.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(445.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (236, N'Pet Soap', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Pet Bath Soap', N'pexels-freestockpro-12955951.jpg', CAST(200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(198.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (237, N'Dog Collar', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Adjustable Dog Collar', N'pexels-freestockpro-12955951.jpg', CAST(350.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(346.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (238, N'Dog Leash', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Strong Dog Leash', N'pexels-freestockpro-12955951.jpg', CAST(400.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(396.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (239, N'Cat Litter', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Clumping Cat Litter', N'pexels-freestockpro-12955951.jpg', CAST(500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (240, N'Pet Cage', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Small Pet Cage', N'pexels-freestockpro-12955951.jpg', CAST(1500.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(1485.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (241, N'Pet Carrier', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Portable Pet Carrier', N'pexels-freestockpro-12955951.jpg', CAST(1800.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(1782.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (242, N'Pet Bed', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Soft Pet Bed', N'pexels-freestockpro-12955951.jpg', CAST(1200.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(1188.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (243, N'Pet Blanket', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Warm Pet Blanket', N'pexels-freestockpro-12955951.jpg', CAST(600.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(594.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (244, N'Pet Bowl', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Stainless Steel Pet Bowl', N'pexels-freestockpro-12955951.jpg', CAST(250.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(247.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (245, N'Pet Toys', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Chew Toys', N'pexels-freestockpro-12955951.jpg', CAST(300.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (246, N'Dog Chews', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Rawhide Dog Chews', N'pexels-freestockpro-12955951.jpg', CAST(350.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(346.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (247, N'Cat Scratcher', 12, 1, 0, CAST(N'2026-06-27' AS Date), CAST(N'2026-06-27' AS Date), N'Cat Scratching Post', N'pexels-freestockpro-12955951.jpg', CAST(1000.00 AS Decimal(18, 2)), 0, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(990.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (248, N'test', 1, 1, 1, CAST(N'2026-06-29' AS Date), CAST(N'2026-06-29' AS Date), N'<p>testtesttesttesttesttest</p>', N'133857399940833791.jpg', CAST(100.00 AS Decimal(18, 2)), 0, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(99.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tbl_Product] ([ProductId], [ProductName], [CategoryId], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate], [Description], [ProductImage], [Price], [IsFeatured], [VendorId], [Pincode], [DiscountPercent], [SellingPrice]) VALUES (249, N'test test test', 1, 1, 1, CAST(N'2026-06-29' AS Date), CAST(N'2026-06-29' AS Date), N'<p>test&nbsp;&nbsp;test&nbsp;&nbsp;test&nbsp;&nbsp;</p>', N'133886835376214483.jpg', CAST(9.00 AS Decimal(18, 2)), 0, 1, 841301, CAST(1.00 AS Decimal(5, 2)), CAST(8.91 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Roles] ON 
GO
INSERT [dbo].[Tbl_Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Tbl_Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
GO
INSERT [dbo].[Tbl_Roles] ([RoleId], [RoleName]) VALUES (3, N'Vendor')
GO
INSERT [dbo].[Tbl_Roles] ([RoleId], [RoleName]) VALUES (4, N'SuperAdmin')
GO
INSERT [dbo].[Tbl_Roles] ([RoleId], [RoleName]) VALUES (5, N'DeliveryPerson')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_ShippingDetails] ON 
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [ZipCode], [OrderId], [AmountPaid], [PaymentType], [FullName], [MobileNo], [AddressLine2], [Landmark], [CountryId], [StateId], [CityId], [IsDefault], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate]) VALUES (11, 3, N'R4R43', N'565665', N'ea0fea08-25a9-47fb-be9d-c2feb3473950', CAST(40 AS Decimal(18, 0)), N'Cash On Delivery', NULL, NULL, NULL, NULL, 1, 4, 7, 0, 0, 0, CAST(N'2026-06-27T19:42:21.643' AS DateTime), NULL)
GO
INSERT [dbo].[Tbl_ShippingDetails] ([ShippingDetailId], [MemberId], [AddressLine], [ZipCode], [OrderId], [AmountPaid], [PaymentType], [FullName], [MobileNo], [AddressLine2], [Landmark], [CountryId], [StateId], [CityId], [IsDefault], [IsActive], [IsDelete], [CreatedDate], [ModifiedDate]) VALUES (12, 3, N'R4R43', N'565665', N'd9be7c9d-3b17-4bc3-b8da-038b0cb8644a', CAST(40 AS Decimal(18, 0)), N'Cash On Delivery', NULL, NULL, NULL, NULL, 1, 4, 7, 0, 0, 0, CAST(N'2026-06-27T19:43:43.527' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Tbl_ShippingDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_State] ON 
GO
INSERT [dbo].[Tbl_State] ([StateId], [CountryId], [StateName], [StateCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (1, 1, N'Maharashtra', N'MH', 1, 0, CAST(N'2026-06-27T18:05:34.483' AS DateTime))
GO
INSERT [dbo].[Tbl_State] ([StateId], [CountryId], [StateName], [StateCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (2, 1, N'Delhi', N'DL', 1, 0, CAST(N'2026-06-27T18:05:34.483' AS DateTime))
GO
INSERT [dbo].[Tbl_State] ([StateId], [CountryId], [StateName], [StateCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (3, 1, N'Karnataka', N'KA', 1, 0, CAST(N'2026-06-27T18:05:34.483' AS DateTime))
GO
INSERT [dbo].[Tbl_State] ([StateId], [CountryId], [StateName], [StateCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (4, 1, N'Tamil Nadu', N'TN', 1, 0, CAST(N'2026-06-27T18:05:34.483' AS DateTime))
GO
INSERT [dbo].[Tbl_State] ([StateId], [CountryId], [StateName], [StateCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (5, 1, N'Uttar Pradesh', N'UP', 1, 0, CAST(N'2026-06-27T18:05:34.483' AS DateTime))
GO
INSERT [dbo].[Tbl_State] ([StateId], [CountryId], [StateName], [StateCode], [IsActive], [IsDelete], [CreatedDate]) VALUES (6, 1, N'Gujarat', N'GJ', 1, 0, CAST(N'2026-06-27T18:05:34.483' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_State] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Vendors] ON 
GO
INSERT [dbo].[Tbl_Vendors] ([VendorId], [MemberId], [CompanyName], [GSTNumber], [BusinessLicense], [Address], [Pincode], [IsActive], [IsDelete], [CreatedOn]) VALUES (1, 5, N'Test', N'Test', NULL, NULL, 841301, 1, 0, CAST(N'2026-06-28T14:45:21.140' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tbl_Vendors] OFF
GO
ALTER TABLE [dbo].[Tbl_City] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_City] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_City] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Country] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Country] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_Country] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Members] ADD  DEFAULT ((841301)) FOR [Pincode]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_ShippingDetails] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_State] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_State] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_State] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tbl_Vendors] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tbl_Vendors] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Tbl_Vendors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([CartStatusId])
REFERENCES [dbo].[Tbl_CartStatus] ([CartStatusId])
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
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
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Tbl_Vendors] ([VendorId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK_Product_Vendor]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Category_Tbl_Product] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK_Tbl_Category_Tbl_Product]
GO
ALTER TABLE [dbo].[Tbl_State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Tbl_Country] ([CountryId])
GO
ALTER TABLE [dbo].[Tbl_State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[Tbl_Vendors]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Member] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Tbl_Members] ([MemberId])
GO
ALTER TABLE [dbo].[Tbl_Vendors] CHECK CONSTRAINT [FK_Vendor_Member]
GO
