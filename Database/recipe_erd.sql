USE [master]
GO
/****** Object:  Database [RecipeDatabase]    Script Date: 21-May-21 11:24:14 PM ******/
CREATE DATABASE [RecipeDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecipeDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RecipeDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecipeDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RecipeDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RecipeDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecipeDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecipeDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecipeDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecipeDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecipeDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecipeDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecipeDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecipeDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecipeDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecipeDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecipeDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecipeDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecipeDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecipeDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecipeDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecipeDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RecipeDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecipeDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecipeDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecipeDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecipeDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecipeDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RecipeDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecipeDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RecipeDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [RecipeDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecipeDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecipeDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecipeDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RecipeDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RecipeDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RecipeDatabase] SET QUERY_STORE = OFF
GO
USE [RecipeDatabase]
GO
/****** Object:  Table [dbo].[Cuisine]    Script Date: 21-May-21 11:24:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuisine](
	[ID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Cuisine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 21-May-21 11:24:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[ID] [int] NOT NULL,
	[RecipeID] [int] NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 21-May-21 11:24:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[ID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 21-May-21 11:24:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Image] [image] NULL,
	[Description] [varchar](300) NULL,
	[CuisineID] [int] NULL,
	[UserID] [nvarchar](100) NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeDirection]    Script Date: 21-May-21 11:24:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeDirection](
	[ID] [int] NOT NULL,
	[StepNo] [int] NOT NULL,
	[StepDescription] [varchar](100) NOT NULL,
	[RecipeID] [int] NULL,
 CONSTRAINT [PK_RecipeDirection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeIngredient]    Script Date: 21-May-21 11:24:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeIngredient](
	[ID] [int] NOT NULL,
	[RecipeID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
 CONSTRAINT [PK_RecipeIngredient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21-May-21 11:24:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nvarchar](100) NOT NULL,
	[Name] [varchar](50) NULL,
	[Password] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Recipe]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_User]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Cuisine] FOREIGN KEY([CuisineID])
REFERENCES [dbo].[Cuisine] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_Cuisine]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Email])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_User]
GO
ALTER TABLE [dbo].[RecipeDirection]  WITH CHECK ADD  CONSTRAINT [FK_RecipeDirection_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RecipeDirection] CHECK CONSTRAINT [FK_RecipeDirection_Recipe]
GO
ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Ingredient] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredient] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_RecipeIngredient_Ingredient]
GO
ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_RecipeIngredient_Recipe]
GO
USE [master]
GO
ALTER DATABASE [RecipeDatabase] SET  READ_WRITE 
GO
