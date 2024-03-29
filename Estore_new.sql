USE [master]
GO
/****** Object:  Database [eStore]    Script Date: 6/1/2024 1:46:36 PM ******/
CREATE DATABASE [eStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\eStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\eStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [eStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [eStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eStore] SET  MULTI_USER 
GO
ALTER DATABASE [eStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [eStore] SET QUERY_STORE = OFF
GO
USE [eStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/1/2024 1:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 6/1/2024 1:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[EMail] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[City] [nvarchar](20) NULL,
	[Country] [nvarchar](30) NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/1/2024 1:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/1/2024 1:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[RequiredDate] [date] NULL,
	[ShippedDate] [date] NOT NULL,
	[Freight] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/1/2024 1:46:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Weight] [real] NULL,
	[UnitPrice] [int] NOT NULL,
	[UnitInStock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Fruit')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Meat')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([MemberId], [EMail], [CompanyName], [City], [Country], [Password]) VALUES (1, N'huong@fpt', N'FPT', N'HN', N'VN', N'12345')
INSERT [dbo].[Members] ([MemberId], [EMail], [CompanyName], [City], [Country], [Password]) VALUES (2, N'string', N'string', N'HN', N'VN', N'123')
INSERT [dbo].[Members] ([MemberId], [EMail], [CompanyName], [City], [Country], [Password]) VALUES (4, N'Lan@fpt', NULL, NULL, NULL, N'123')
INSERT [dbo].[Members] ([MemberId], [EMail], [CompanyName], [City], [Country], [Password]) VALUES (6, N'Tuan@fpt', NULL, NULL, NULL, N'12345')
INSERT [dbo].[Members] ([MemberId], [EMail], [CompanyName], [City], [Country], [Password]) VALUES (7, N'Minh@fpt', NULL, NULL, NULL, N'12345')
INSERT [dbo].[Members] ([MemberId], [EMail], [CompanyName], [City], [Country], [Password]) VALUES (8, N'Lan@fpt', NULL, NULL, NULL, N'12345')
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailId], [ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (11, 2, 2, 0, 0, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 2, 2, 10, 10, 10)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 2, 2, 0, 0, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailId], [ProductId], [OrderId], [UnitPrice], [Quantity], [Discount]) VALUES (21, 2, 3, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (2, 1, CAST(N'2023-08-15' AS Date), NULL, CAST(N'2023-08-15' AS Date), NULL)
INSERT [dbo].[Orders] ([OrderId], [MemberId], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (3, 1, CAST(N'2023-07-26' AS Date), NULL, CAST(N'2023-07-26' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (2, 1, N'Orange', NULL, 1, 1)
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (3, 2, N'Chicken', NULL, 10, 100)
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (5, 1, N'Lemon', NULL, 2, 2)
INSERT [dbo].[Products] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (7, 1, N'Apple', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
USE [master]
GO
ALTER DATABASE [eStore] SET  READ_WRITE 
GO
