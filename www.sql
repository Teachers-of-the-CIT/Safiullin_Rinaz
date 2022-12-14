USE [master]
GO
/****** Object:  Database [Parfumeria]    Script Date: 05.11.2022 10:48:36 ******/
CREATE DATABASE [Parfumeria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Parfumeria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Parfumeria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Parfumeria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Parfumeria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Parfumeria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Parfumeria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Parfumeria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Parfumeria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Parfumeria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Parfumeria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Parfumeria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Parfumeria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Parfumeria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Parfumeria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Parfumeria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Parfumeria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Parfumeria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Parfumeria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Parfumeria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Parfumeria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Parfumeria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Parfumeria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Parfumeria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Parfumeria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Parfumeria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Parfumeria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Parfumeria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Parfumeria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Parfumeria] SET RECOVERY FULL 
GO
ALTER DATABASE [Parfumeria] SET  MULTI_USER 
GO
ALTER DATABASE [Parfumeria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Parfumeria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Parfumeria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Parfumeria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Parfumeria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Parfumeria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Parfumeria', N'ON'
GO
ALTER DATABASE [Parfumeria] SET QUERY_STORE = OFF
GO
USE [Parfumeria]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 05.11.2022 10:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[id_akk] [int] NOT NULL,
	[name_c] [nvarchar](50) NOT NULL,
	[surname_c] [nvarchar](50) NOT NULL,
	[patronymic_c] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 05.11.2022 10:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NOT NULL,
	[count] [int] NOT NULL,
	[cost] [money] NOT NULL,
	[id_pvz] [int] NOT NULL,
	[id_client] [int] NOT NULL,
	[data_zakaza] [date] NOT NULL,
	[data_dostavki] [date] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parfum]    Script Date: 05.11.2022 10:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parfum](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[name_product] [nvarchar](50) NOT NULL,
	[name_brend] [nvarchar](50) NOT NULL,
	[price] [money] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[punkt_vidachi]    Script Date: 05.11.2022 10:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[punkt_vidachi](
	[id_pvz] [int] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PVZ] PRIMARY KEY CLUSTERED 
(
	[id_pvz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05.11.2022 10:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_akk] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[id_akk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 05.11.2022 10:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[id_worker] [int] IDENTITY(1,1) NOT NULL,
	[id_akk] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[name_w] [nvarchar](50) NOT NULL,
	[surname_w] [nvarchar](50) NOT NULL,
	[patronymic_w] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[id_worker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Users] FOREIGN KEY([id_akk])
REFERENCES [dbo].[Users] ([id_akk])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([id_client])
REFERENCES [dbo].[Clients] ([id_client])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Parfum] FOREIGN KEY([id_product])
REFERENCES [dbo].[Parfum] ([id_product])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Parfum]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_punkt_vidachi] FOREIGN KEY([id_pvz])
REFERENCES [dbo].[punkt_vidachi] ([id_pvz])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_punkt_vidachi]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Users] FOREIGN KEY([id_akk])
REFERENCES [dbo].[Users] ([id_akk])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Users]
GO
USE [master]
GO
ALTER DATABASE [Parfumeria] SET  READ_WRITE 
GO
