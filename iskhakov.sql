USE [master]
GO
/****** Object:  Database [Iskhakov_41]    Script Date: 30.01.2024 11:50:25 ******/
CREATE DATABASE [Iskhakov_41]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Iskhakov_41', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Iskhakov_41.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Iskhakov_41_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Iskhakov_41_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Iskhakov_41].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Iskhakov_41] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Iskhakov_41] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Iskhakov_41] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Iskhakov_41] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Iskhakov_41] SET ARITHABORT OFF 
GO
ALTER DATABASE [Iskhakov_41] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Iskhakov_41] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Iskhakov_41] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Iskhakov_41] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Iskhakov_41] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Iskhakov_41] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Iskhakov_41] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Iskhakov_41] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Iskhakov_41] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Iskhakov_41] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Iskhakov_41] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Iskhakov_41] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Iskhakov_41] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Iskhakov_41] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Iskhakov_41] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Iskhakov_41] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Iskhakov_41] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Iskhakov_41] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Iskhakov_41] SET  MULTI_USER 
GO
ALTER DATABASE [Iskhakov_41] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Iskhakov_41] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Iskhakov_41] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Iskhakov_41] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Iskhakov_41] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Iskhakov_41]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 30.01.2024 11:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[UserSurname] [nvarchar](100) NULL,
	[Patronymic] [nvarchar](100) NULL,
	[GiveAwayCode] [int] NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF17094069] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 30.01.2024 11:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A2662583014A6] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PIckUpPoint]    Script Date: 30.01.2024 11:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PIckUpPoint](
	[PickUpPointID] [int] NOT NULL,
	[PickUpPointIndex] [int] NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[House] [nvarchar](max) NULL,
 CONSTRAINT [PK_PIckUpPoint_] PRIMARY KEY CLUSTERED 
(
	[PickUpPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 30.01.2024 11:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[EdIzmir] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 2) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[Postavchik] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD570E8B345] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 30.01.2024 11:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30.01.2024 11:50:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[UserSurname] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[UserPatronymic] [nvarchar](max) NULL,
	[UserLogin] [nvarchar](max) NULL,
	[UserPassword] [nvarchar](max) NULL,
	[UserRole] [int] NULL,
 CONSTRAINT [PK__User__1788CCAC9F5C4ECA] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (1, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 10, N'Анохин', N'Арсений', N'Андреевич', 911, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (2, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 5, N'Козлов', N'Максим', N'Максимович', 912, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (3, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 11, N'Черных', N'Марк', N'Кириллович', 913, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (4, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 10, NULL, NULL, NULL, 914, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (5, CAST(N'2022-05-20' AS Date), CAST(N'2022-05-26' AS Date), 1, NULL, NULL, NULL, 915, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (6, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), 32, NULL, NULL, NULL, 916, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (7, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 20, N'Козлов', N'Давид', N'Александрович', 917, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (8, CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), 34, NULL, NULL, NULL, 918, N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (9, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 25, NULL, NULL, NULL, 919, N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [UserName], [UserSurname], [Patronymic], [GiveAwayCode], [OrderStatus]) VALUES (10, CAST(N'2022-05-25' AS Date), CAST(N'2022-05-31' AS Date), 36, NULL, NULL, NULL, 920, N'Завершен')
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'H782T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'F635R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'G783F5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'D572U8', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'J384T6', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'B320R5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'D329H3', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'G432E4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'S213E3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'K345R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'S634B5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'G531F4', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'J542F5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'C436G5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'P764G4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'D364R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'S326R5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'D268G5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'M542T5', 2)
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (1, 344288, N'г.Москва', N'ул.Чехова', N'1')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (2, 614164, N'г.Москва', N' ул.Степная', N'30')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (3, 394242, N'г.Москва', N'ул.Коммунистическая', N'43')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (4, 660540, N'г.Москва', N'ул.Солнечная', N'25')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (5, 125837, N'г.Москва', N'ул.Шоссейная', N'40')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (6, 125703, N'г.Москва', N'ул.Партизанская', N'49')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (7, 625283, N'г.Москва', N'ул.Победы', N'46')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (8, 614611, N'г.Москва', N'ул.Молодежная', N'50')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (9, 454311, N'г.Москва', N'ул.Новая', N'19')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (10, 660007, N'г.Москва', N'ул.Октябрьская', N'19')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (11, 603036, N'г.Москва', N'ул.Садовая', N'4')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (12, 450983, N'г.Москва', N'ул.Комсомольская', N'26')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (13, 394782, N'г.Москва', N'ул.Чехова', N'3')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (14, 603002, N'г.Москва', N'ул.Дзержинского', N'28')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (15, 450558, N'г.Москва', N'ул.Набережная', N'30')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (16, 394060, N'г.Москва', N'ул.Фрунзе', N'43')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (17, 410661, N'г.Москва', N'ул.Школьная', N'50')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (18, 625590, N'г.Москва', N'ул.Коммунистическая', N'20')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (19, 625683, N'г.Москва', N'ул.8Марта', NULL)
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (20, 400562, N'г.Москва', N'ул.Зеленая', N'32')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (21, 614510, N'г.Москва', N'ул.Маяковского', N'47')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (22, 410542, N'г.Москва', N'ул.Светлая', N'46')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (23, 620839, N'г.Москва', N'ул.Цветочная', N'8')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (24, 443890, N'г.Москва', N'ул.Коммунистическая', N'1')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (25, 603379, N'г.Москва', N'ул.Спортивная', N'46')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (26, 603721, N'г.Москва', N'ул.Гоголя', N'41')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (27, 410172, N'г.Москва', N'ул.Северная', N'13')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (28, 420151, N'г.Москва', N'ул.Вишневая', N'32')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (29, 125061, N'г.Москва', N'ул.Подгорная', N'8')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (30, 630370, N'г.Москва', N'ул.Шоссейная', N'24')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (31, 614753, N'г.Москва', N'ул.Полевая', N'35')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (32, 426030, N'г.Москва', N'ул.Маяковского', N'44')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (33, 450375, N'г.Москва', N'ул.Клубная', N'44')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (34, 625560, N'г.Москва', N'ул.Некрасова', N'12')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (35, 630201, N'г.Москва', N'ул.Комсомольская', N'17')
INSERT [dbo].[PIckUpPoint] ([PickUpPointID], [PickUpPointIndex], [City], [Street], [House]) VALUES (36, 190949, N'г.Москва', N'ул.Мичурина', N'26')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'B320R5', N'Туфли', N'шт.', CAST(4300.00 AS Decimal(19, 2)), 15, N'Rieker', N'Kari', N'Женская обувь', N'2', 6, N'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', N'B320R5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'B431R5', N'Ботинки', N'шт.', CAST(2700.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Мужская обувь', N'2', 5, N'Мужские кожаные ботинки/мужские ботинки', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'C436G5', N'Ботинки', N'шт.', CAST(10200.00 AS Decimal(19, 2)), 15, N'Alessio Nesca', N'Kari', N'Женская обувь', N'2', 9, N'Ботинки женские, ARGO, размер 40', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'D268G5', N'Туфли', N'шт.', CAST(4399.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Женская обувь', N'3', 12, N'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'D329H3', N'Полуботинки', N'шт.', CAST(1890.00 AS Decimal(19, 2)), 10, N'Alessio Nesca', N'Обувь для вас', N'Женская обувь', N'4', 4, N'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', N'D329H3.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'D364R4', N'Туфли', N'шт.', CAST(12400.00 AS Decimal(19, 2)), 10, N'Kari', N'Kari', N'Женская обувь', N'2', 5, N'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'D572U8', N'Кроссовки', N'шт.', CAST(4100.00 AS Decimal(19, 2)), 5, N'Рос', N'Обувь для вас', N'Мужская обувь', N'3', 6, N'129615-4 Кроссовки мужские', N'D572U8.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'E482R4', N'Полуботинки', N'шт.', CAST(1800.00 AS Decimal(19, 2)), 15, N'Kari', N'Kari', N'Женская обувь', N'2', 14, N'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'F427R5', N'Ботинки', N'шт.', CAST(11800.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Женская обувь', N'4', 11, N'Ботинки на молнии с декоративной пряжкой FRAU', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'F572H7', N'Туфли', N'шт.', CAST(2700.00 AS Decimal(19, 2)), 15, N'Marco Tozzi', N'Kari', N'Женская обувь', N'2', 14, N'Туфли Marco Tozzi женские летние, размер 39, цвет черный', N'F572H7.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'F635R4', N'Ботинки', N'шт.', CAST(3244.00 AS Decimal(19, 2)), 20, N'Marco Tozzi', N'Обувь для вас', N'Женская обувь', N'2', 13, N'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', N'F635R4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'G432E4', N'Туфли', N'шт.', CAST(2800.00 AS Decimal(19, 2)), 10, N'Kari', N'Kari', N'Женская обувь', N'3', 15, N'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', N'G432E4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'G531F4', N'Ботинки', N'шт.', CAST(6600.00 AS Decimal(19, 2)), 5, N'Kari', N'Kari', N'Женская обувь', N'2', 9, N'Ботинки женские зимние ROMER арт. 893167-01 Черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'G783F5', N'Ботинки', N'шт.', CAST(5900.00 AS Decimal(19, 2)), 25, N'Рос', N'Kari', N'Мужская обувь', N'2', 8, N'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', N'G783F5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'H535R5', N'Ботинки', N'шт.', CAST(2300.00 AS Decimal(19, 2)), 25, N'Rieker', N'Обувь для вас', N'Женская обувь', N'2', 7, N'Женские Ботинки демисезонные', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'H782T5', N'Туфли', N'шт.', CAST(4499.00 AS Decimal(19, 2)), 30, N'Kari', N'Kari', N'Мужская обувь', N'4', 5, N'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', N'H782T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'J384T6', N'Ботинки', N'шт.', CAST(3800.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Мужская обувь', N'2', 16, N'B3430/14 Полуботинки мужские Rieker', N'J384T6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'J542F5', N'Тапочки', N'шт.', CAST(500.00 AS Decimal(19, 2)), 5, N'Kari', N'Kari', N'Мужская обувь', N'3', 12, N'Тапочки мужские Арт.70701-55-67син р.41', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'K345R4', N'Полуботинки', N'шт.', CAST(2100.00 AS Decimal(19, 2)), 15, N'CROSBY', N'Обувь для вас', N'Мужская обувь', N'2', 3, N'407700/01-02 Полуботинки мужские CROSBY', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'K358H6', N'Тапочки', N'шт.', CAST(599.00 AS Decimal(19, 2)), 5, N'Rieker', N'Kari', N'Мужская обувь', N'3', 2, N'Тапочки мужские син р.41', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'L754R4', N'Полуботинки', N'шт.', CAST(1700.00 AS Decimal(19, 2)), 10, N'Kari', N'Kari', N'Женская обувь', N'2', 7, N'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'M542T5', N'Кроссовки', N'шт.', CAST(2800.00 AS Decimal(19, 2)), 5, N'Rieker', N'Обувь для вас', N'Мужская обувь', N'5', 3, N'Кроссовки мужские TOFA', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'N457T5', N'Полуботинки', N'шт.', CAST(4600.00 AS Decimal(19, 2)), 5, N'CROSBY', N'Kari', N'Женская обувь', N'3', 13, N'Полуботинки Ботинки черные зимние, мех', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'O754F4', N'Туфли', N'шт.', CAST(5400.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Женская обувь', N'4', 18, N'Туфли женские демисезонные Rieker артикул 55073-68/37', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'P764G4', N'Туфли', N'шт.', CAST(6800.00 AS Decimal(19, 2)), 30, N'CROSBY', N'Kari', N'Женская обувь', N'3', 15, N'Туфли женские, ARGO, размер 38', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'S213E3', N'Полуботинки', N'шт.', CAST(2156.00 AS Decimal(19, 2)), 5, N'CROSBY', N'Обувь для вас', N'Мужская обувь', N'3', 6, N'407700/01-01 Полуботинки мужские CROSBY', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'S326R5', N'Тапочки', N'шт.', CAST(9900.00 AS Decimal(19, 2)), 15, N'CROSBY', N'Обувь для вас', N'Мужская обувь', N'3', 15, N'Мужские кожаные тапочки "Профиль С.Дали" ', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'S634B5', N'Кеды', N'шт.', CAST(5500.00 AS Decimal(19, 2)), 20, N'CROSBY', N'Обувь для вас', N'Мужская обувь', N'3', 6, N'Кеды Caprice мужские демисезонные, размер 42, цвет черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'T324F5', N'Сапоги', N'шт.', CAST(4699.00 AS Decimal(19, 2)), 15, N'CROSBY', N'Kari', N'Женская обувь', N'2', 5, N'Сапоги замша Цвет: синий', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [EdIzmir], [ProductCost], [ProductDiscountAmount], [ProductManufacturer], [Postavchik], [ProductCategory], [ProductStatus], [ProductQuantityInStock], [ProductDescription], [Photo]) VALUES (N'А112Т4', N'Ботинки', N'шт.', CAST(4990.00 AS Decimal(19, 2)), 30, N'Kari', N'Kari', N'Женская обувь', N'3', 6, N'Женские Ботинки демисезонные kari', N'А112Т4.jpg')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Герасимов ', N'Вячеслав', N'Ростиславович', N'loginDEftn2018', N'gPq+a}', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Суворов ', N'Всеволод', N'Богданович', N'loginDEhuv2018', N'EJFYzS', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Ширяев ', N'Иван', N'Игоревич', N'loginDEfhd2018', N'{4wU7n', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Колобова ', N'Иванна', N'Геннадьевна', N'loginDEaon2018', N'&OmaNE', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Шестаков ', N'Антон', N'Константинович', N'loginDEyat2018', N'ELSTyH', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Игнатьев ', N'Федосей', N'Богданович', N'loginDEmin2018', N'pQ6jze', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Горбунов ', N'Валентин', N'Григорьевич', N'loginDEzal2018', N'zbU8R5', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Терентьева ', N'Анжела', N'Михаиловна', N'loginDEemw2018', N'NxhF5I', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Мясникова ', N'Ия', N'Евсеевна', N'loginDEmqt2018', N'SIasu5', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Горбунов ', N'Григорий', N'Денисович', N'loginDEpxx2018', N'Xv{vjN', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Герасимов ', N'Олег', N'Авксентьевич', N'loginDEetv2018', N'lNi&rF', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Меркушева ', N'Нинель', N'Матвеевна', N'loginDEonq2018', N'mKIIRQ', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Степанов ', N'Григорий', N'Матвеевич', N'loginDErhl2018', N'U}rb9j', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Агафонов ', N'Владлен', N'Станиславович', N'loginDEfou2018', N'O+S9hm', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Кузнецов ', N'Фрол', N'Георгьевич', N'loginDElno2018', N'le1vt2', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Игнатьев ', N'Борис', N'Владиславович', N'loginDEtbx2018', N'CQplH|', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Симонов ', N'Юрий', N'Созонович', N'loginDEltw2018', N'zvjkwE', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Степанов ', N'Евсей', N'Федотович', N'loginDEfuz2018', N'ILry03', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Зыков ', N'Вячеслав', N'Антонович', N'loginDEygj2018', N'7b6PUb', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Анисимова ', N'Алина', N'Протасьевна', N'loginDEwpn2018', N'9BBkXP', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Артемьева ', N'Лариса', N'Макаровна', N'loginDEyix2018', N'6zbXg*', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Мамонтова ', N'Ия', N'Христофоровна', N'loginDEtms2018', N'70Z&Zy', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Котова ', N'Светлана', N'Леонидовна', N'loginDEmgl2018', N'QJNgD&', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Фёдорова ', N'Алла', N'Брониславовна', N'loginDEhix2018', N'ZKnd*0', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Гущина ', N'Анжела', N'Аркадьевна', N'loginDEwbk2018', N'iJMh5B', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Дмитриев ', N'Григорий', N'Мэлорович', N'loginDEpwa2018', N'yn5MLQ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Дроздова ', N'Фёкла', N'Митрофановна', N'loginDElrx2018', N'lbX+dF', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Гаврилов ', N'Василий', N'Германович', N'loginDEidx2018', N'R2j0mn', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Суханова ', N'Фаина', N'Юрьевна', N'loginDEzmk2018', N'ZrgBk6', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Савельев ', N'Егор', N'Сергеевич', N'loginDEvje2018', N'gCU1fd', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Иван ', N'Васильевна', N'', N'loginDEwun2018', N'yy+Qhe', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Сазонова ', N'Клавдия', N'Евгеньевна', N'loginDEfzq2018', N'36H8f}', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Шаров ', N'Григорий', N'Созонович', N'loginDEwel2018', N'UU5FTi', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Щербаков ', N'Кондрат', N'Фёдорович', N'loginDEljg2018', N'CT44Gc', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Дроздов ', N'Дмитрий', N'Юлианович', N'loginDEgsp2018', N'9ACW}r', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Молчанов ', N'Юрий', N'Лукьянович', N'loginDEjvp2018', N'etLGcB', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Тихонов ', N'Валентин', N'Авдеевич', N'loginDEapt2018', N'cwx{RH', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Виноградов ', N'Юрий', N'Лукьевич', N'loginDEilb2018', N'IN2Ahc', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Горбунова ', N'Нинель', N'Сергеевна', N'loginDErch2018', N'|&DFy+', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Маслов ', N'Леонид', N'Николаевич', N'loginDEfwx2018', N't|*wCk', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Родионова ', N'Венера', N'Арсеньевна', N'loginDEggp2018', N'bBNxJb', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Агафонов ', N'Пантелеймон', N'Гордеевич', N'loginDEbgb2018', N'VtmP58', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Кудрявцев ', N'Гордей', N'Авксентьевич', N'loginDEnif2018', N'Nhj*t+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Лыткина ', N'Алевтина', N'Романовна', N'loginDEsvs2018', N'tLgPnC', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Князев ', N'Геласий', N'Евсеевич', N'loginDEghx2018', N'gue+iw', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Бирюкова ', N'Пелагея', N'Дмитрьевна', N'loginDElmy2018', N'X2LtuP', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Быков ', N'Лаврентий', N'Ярославович', N'loginDEevd2018', N'GMbcZN', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Воронов ', N'Олег', N'Яковович', N'loginDEodd2018', N's2|Eb1', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Богданова ', N'Марфа', N'Владимировна', N'loginDEmrj2018', N'blrD&8', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Беляев ', N'Донат', N'Агафонович', N'loginDEyct2018', N'uD+|Ud', 2)
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PIckUpPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PIckUpPoint] ([PickUpPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PIckUpPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__534D60F1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__534D60F1]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__5441852A] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__5441852A]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__4CA06362] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__4CA06362]
GO
USE [master]
GO
ALTER DATABASE [Iskhakov_41] SET  READ_WRITE 
GO
