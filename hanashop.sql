USE [master]
GO
/****** Object:  Database [hanashop]    Script Date: 4/15/2021 10:57:14 PM ******/
CREATE DATABASE [hanashop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hanashop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\hanashop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'hanashop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\hanashop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [hanashop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hanashop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hanashop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hanashop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hanashop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hanashop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hanashop] SET ARITHABORT OFF 
GO
ALTER DATABASE [hanashop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hanashop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hanashop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hanashop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hanashop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hanashop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hanashop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hanashop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hanashop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hanashop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hanashop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hanashop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hanashop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hanashop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hanashop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hanashop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hanashop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hanashop] SET RECOVERY FULL 
GO
ALTER DATABASE [hanashop] SET  MULTI_USER 
GO
ALTER DATABASE [hanashop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hanashop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hanashop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hanashop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [hanashop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'hanashop', N'ON'
GO
USE [hanashop]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 4/15/2021 10:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[catID] [int] IDENTITY(1,1) NOT NULL,
	[catName] [nvarchar](30) NOT NULL,
	[dateCreate] [datetime] NOT NULL,
	[description] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 4/15/2021 10:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [varchar](30) NOT NULL,
	[total] [float] NULL,
	[status] [bit] NULL,
	[dateCreate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_order_items]    Script Date: 4/15/2021 10:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tbl_order_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 4/15/2021 10:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](30) NOT NULL,
	[image] [varchar](250) NULL,
	[price] [float] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[catID] [int] NOT NULL,
	[description] [nvarchar](250) NULL,
	[updateDate] [datetime] NULL,
	[status] [bit] NOT NULL,
	[amount] [tinyint] NOT NULL,
	[userCreate] [varchar](30) NOT NULL,
	[userUpdate] [varchar](30) NULL,
 CONSTRAINT [PK_tbl_food] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 4/15/2021 10:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user](
	[userID] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[role] [bit] NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[dateCreate] [datetime] NULL,
 CONSTRAINT [PK_tbluser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([catID], [catName], [dateCreate], [description]) VALUES (28, N'Food', CAST(N'2021-01-12 13:20:20.397' AS DateTime), N'food')
INSERT [dbo].[tbl_category] ([catID], [catName], [dateCreate], [description]) VALUES (29, N'Drink', CAST(N'2021-01-12 13:21:31.333' AS DateTime), N'')
INSERT [dbo].[tbl_category] ([catID], [catName], [dateCreate], [description]) VALUES (30, N'Grab', CAST(N'2021-04-14 08:23:26.590' AS DateTime), N'Grab Food')
INSERT [dbo].[tbl_category] ([catID], [catName], [dateCreate], [description]) VALUES (33, N'demo', CAST(N'2021-04-14 09:07:14.127' AS DateTime), N'new')
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
SET IDENTITY_INSERT [dbo].[tbl_order] ON 

INSERT [dbo].[tbl_order] ([orderId], [customerId], [total], [status], [dateCreate]) VALUES (11, N'username1', 1800, 1, CAST(N'2021-01-20 22:47:08.747' AS DateTime))
INSERT [dbo].[tbl_order] ([orderId], [customerId], [total], [status], [dateCreate]) VALUES (1004, N'username1', 1080, 1, CAST(N'2021-04-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([orderId], [customerId], [total], [status], [dateCreate]) VALUES (1005, N'username1', NULL, 0, CAST(N'2021-04-15 20:18:15.783' AS DateTime))
INSERT [dbo].[tbl_order] ([orderId], [customerId], [total], [status], [dateCreate]) VALUES (1006, N'username1', NULL, 0, CAST(N'2021-04-15 20:18:17.473' AS DateTime))
INSERT [dbo].[tbl_order] ([orderId], [customerId], [total], [status], [dateCreate]) VALUES (1007, N'username1', NULL, 0, CAST(N'2021-04-15 20:19:07.180' AS DateTime))
INSERT [dbo].[tbl_order] ([orderId], [customerId], [total], [status], [dateCreate]) VALUES (1008, N'105963750169965165973', 120, 1, CAST(N'2021-04-15 22:48:15.053' AS DateTime))
INSERT [dbo].[tbl_order] ([orderId], [customerId], [total], [status], [dateCreate]) VALUES (1009, N'username1', 366, 1, CAST(N'2021-04-15 22:54:55.707' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_order] OFF
SET IDENTITY_INSERT [dbo].[tbl_order_items] ON 

INSERT [dbo].[tbl_order_items] ([id], [orderId], [productId], [quantity]) VALUES (26, 11, 36, 8)
INSERT [dbo].[tbl_order_items] ([id], [orderId], [productId], [quantity]) VALUES (27, 11, 41, 5)
INSERT [dbo].[tbl_order_items] ([id], [orderId], [productId], [quantity]) VALUES (1010, 1004, 42, 9)
INSERT [dbo].[tbl_order_items] ([id], [orderId], [productId], [quantity]) VALUES (1011, 1008, 42, 1)
INSERT [dbo].[tbl_order_items] ([id], [orderId], [productId], [quantity]) VALUES (1012, 1009, 42, 1)
INSERT [dbo].[tbl_order_items] ([id], [orderId], [productId], [quantity]) VALUES (1013, 1009, 44, 2)
SET IDENTITY_INSERT [dbo].[tbl_order_items] OFF
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (22, N'coffe1', N'bean-heart.jpg', 30, CAST(N'2021-01-20 22:32:38.610' AS DateTime), 29, N'this is a description', NULL, 1, 200, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (23, N'product 1', N'bean-heart1611156843002.jpg', 40, CAST(N'2021-01-20 22:34:03.003' AS DateTime), 29, N'this a product', NULL, 1, 200, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (24, N'product 1', N'bean-heart1611156853792.jpg', 50, CAST(N'2021-01-20 22:34:13.793' AS DateTime), 29, N'this a product', NULL, 1, 30, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (25, N'product 23', N'bean-heart1618501902239.jpg', 60, CAST(N'2021-01-20 22:34:28.393' AS DateTime), 29, N'this a product', CAST(N'2021-04-15 22:51:42.240' AS DateTime), 1, 10, N'dntlam', N'dntlam')
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (26, N'product 123', N'133688656_218237946541509_6637937660829344755_n.jpg', 100, CAST(N'2021-01-20 22:34:43.093' AS DateTime), 29, N'this a product', NULL, 1, 100, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (27, N'product 1234', N'bean-heart1618501893378.jpg', 20, CAST(N'2021-01-20 22:34:55.047' AS DateTime), 29, N'this a product', CAST(N'2021-04-15 22:51:33.377' AS DateTime), 1, 5, N'dntlam', N'dntlam')
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (28, N'product 12345', N'bean-heart1618501883592.jpg', 50, CAST(N'2021-01-20 22:35:16.187' AS DateTime), 29, N'this a product', CAST(N'2021-04-15 22:51:23.593' AS DateTime), 1, 20, N'dntlam', N'dntlam')
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (29, N'product 123456', N'download16111572034581618501875151.jfif', 60, CAST(N'2021-01-20 22:35:27.260' AS DateTime), 29, N'this a product', CAST(N'2021-04-15 22:51:15.153' AS DateTime), 1, 30, N'dntlam', N'dntlam')
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (30, N'coffe123', N'bean-heart1611156967188.jpg', 23, CAST(N'2021-01-20 22:36:07.187' AS DateTime), 29, N'this is coffee', NULL, 1, 21, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (31, N'coffe145', N'133688656_218237946541509_6637937660829344755_n1611156979196.jpg', 100, CAST(N'2021-01-20 22:36:19.197' AS DateTime), 29, N'this is coffee 123 ', NULL, 1, 21, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (32, N'coffe145', N'bean-heart1611156994987.jpg', 120, CAST(N'2021-01-20 22:36:34.987' AS DateTime), 29, N'this is coffee 12345', NULL, 1, 12, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (33, N'Bakery', N'1200px-Wedding_cake_with_pillar_supports,_2009.jpg', 120, CAST(N'2021-01-20 22:37:59.313' AS DateTime), 28, N'this is a cake', NULL, 1, 100, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (34, N'Bakery 123', N'16714-birthday-cake-600x600.jpg', 200, CAST(N'2021-01-20 22:38:08.617' AS DateTime), 29, N'this is a cake 123', NULL, 1, 10, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (35, N'Bakery 12', N'Chocolate-cake-recipe-1200a.jpg', 200, CAST(N'2021-01-20 22:38:22.477' AS DateTime), 28, N'this is a cake 123', NULL, 1, 99, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (36, N'Bakery 12', N'download.jfif', 150, CAST(N'2021-01-20 22:38:41.240' AS DateTime), 29, N'this is a cake 123', NULL, 1, 32, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (37, N'Bakery abc', N'image.jfif', 150, CAST(N'2021-01-20 22:39:05.090' AS DateTime), 28, N'this is a cake 123', NULL, 1, 40, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (38, N'Bakery def', N'Summer-Sangria-Cake-4.jpg', 160, CAST(N'2021-01-20 22:39:30.833' AS DateTime), 28, N'this is a cake 1234', NULL, 1, 50, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (39, N'Bakery dedas', N'triple-chocolate-peanut-butter-layer-cake-2-06eee24.jpg', 120, CAST(N'2021-01-20 22:39:50.943' AS DateTime), 29, N'this is a cake 1234', NULL, 1, 50, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (40, N'Bakery dedas', N'download1611157203458.jfif', 120, CAST(N'2021-01-20 22:40:03.457' AS DateTime), 29, N'this is a cake 1234', NULL, 1, 50, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (41, N'Bakery dedas', N'16714-birthday-cake-600x6001611157208104.jpg', 100, CAST(N'2021-01-20 22:40:08.103' AS DateTime), 29, N'this is a cake 1234', CAST(N'2021-01-27 13:04:10.783' AS DateTime), 1, 45, N'dntlam', N'dntlam')
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (42, N'Bakery dedwd', N'1200px-Wedding_cake_with_pillar_supports,_20091611157235162.jpg', 120, CAST(N'2021-01-20 22:40:35.163' AS DateTime), 28, N'this is a cake 1234', NULL, 1, 39, N'dntlam', NULL)
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (43, N'Bakery abdcd', N'Hearty-Yeast-Free-Bread-WS-Thumbnail.jpg', 120, CAST(N'2021-01-20 22:40:47.553' AS DateTime), 29, N'this is a cake 1234', CAST(N'2021-01-20 22:41:04.833' AS DateTime), 0, 30, N'dntlam', N'dntlam')
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (44, N'chiu khong noi 1', N'1200px-Wedding_cake_with_pillar_supports,_200916111572351621618501866454.jpg', 123, CAST(N'2021-01-29 13:20:25.013' AS DateTime), 30, N'qua te', CAST(N'2021-04-15 22:51:06.453' AS DateTime), 1, 21, N'khanhkt', N'dntlam')
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (2022, N'test product', N'16714-birthday-cake-600x600 - Copy.jpg', 2, CAST(N'2021-04-15 14:55:32.710' AS DateTime), 33, N'hello', CAST(N'2021-04-15 22:51:00.413' AS DateTime), 1, 2, N'dntlam', N'dntlam')
INSERT [dbo].[tbl_product] ([productID], [productName], [image], [price], [createDate], [catID], [description], [updateDate], [status], [amount], [userCreate], [userUpdate]) VALUES (2023, N'test product update', N'IMG_20210308_122840_838.jpg', 2, CAST(N'2021-04-15 14:55:39.570' AS DateTime), 33, N'hello 123', CAST(N'2021-04-15 15:30:04.040' AS DateTime), 0, 45, N'dntlam', N'dntlam')
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
INSERT [dbo].[tbl_user] ([userID], [password], [role], [fullName], [dateCreate]) VALUES (N'105963750169965165973', N'123456', 0, N'sasukeanos@gmail.com', CAST(N'2021-04-15 22:47:54.937' AS DateTime))
INSERT [dbo].[tbl_user] ([userID], [password], [role], [fullName], [dateCreate]) VALUES (N'dntlam', N'123456', 1, N'thanh lam', CAST(N'2021-01-07 19:15:58.553' AS DateTime))
INSERT [dbo].[tbl_user] ([userID], [password], [role], [fullName], [dateCreate]) VALUES (N'dntlam123', N'123456', 0, N'thanh lam ', CAST(N'2021-04-12 09:54:15.073' AS DateTime))
INSERT [dbo].[tbl_user] ([userID], [password], [role], [fullName], [dateCreate]) VALUES (N'khanhkk', N'4321', 0, N'khanh abc', NULL)
INSERT [dbo].[tbl_user] ([userID], [password], [role], [fullName], [dateCreate]) VALUES (N'khanhkt', N'5562', 1, N'lam cui bap', NULL)
INSERT [dbo].[tbl_user] ([userID], [password], [role], [fullName], [dateCreate]) VALUES (N'username1', N'123456', 0, N'thanh lam', CAST(N'2021-01-06 21:38:39.390' AS DateTime))
INSERT [dbo].[tbl_user] ([userID], [password], [role], [fullName], [dateCreate]) VALUES (N'username3', N'123456', 0, N'thanh lam', CAST(N'2021-01-07 16:33:10.927' AS DateTime))
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_tbl_user] FOREIGN KEY([customerId])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_order] CHECK CONSTRAINT [FK_tbl_order_tbl_user]
GO
ALTER TABLE [dbo].[tbl_order_items]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_items_tbl_order1] FOREIGN KEY([orderId])
REFERENCES [dbo].[tbl_order] ([orderId])
GO
ALTER TABLE [dbo].[tbl_order_items] CHECK CONSTRAINT [FK_tbl_order_items_tbl_order1]
GO
ALTER TABLE [dbo].[tbl_order_items]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_items_tbl_product] FOREIGN KEY([productId])
REFERENCES [dbo].[tbl_product] ([productID])
GO
ALTER TABLE [dbo].[tbl_order_items] CHECK CONSTRAINT [FK_tbl_order_items_tbl_product]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_category] FOREIGN KEY([catID])
REFERENCES [dbo].[tbl_category] ([catID])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_category]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_user] FOREIGN KEY([userUpdate])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_user]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_user1] FOREIGN KEY([userCreate])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_user1]
GO
USE [master]
GO
ALTER DATABASE [hanashop] SET  READ_WRITE 
GO
