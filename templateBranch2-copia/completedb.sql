USE [master]
GO
/****** Object:  Database [papeleraVipDatabase]    Script Date: 6/9/2022 11:29:17 ******/
CREATE DATABASE [papeleraVipDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'papeleraVipDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\papeleraVipDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'papeleraVipDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\papeleraVipDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [papeleraVipDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [papeleraVipDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [papeleraVipDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [papeleraVipDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [papeleraVipDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [papeleraVipDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [papeleraVipDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [papeleraVipDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [papeleraVipDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [papeleraVipDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [papeleraVipDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [papeleraVipDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [papeleraVipDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'papeleraVipDatabase', N'ON'
GO
ALTER DATABASE [papeleraVipDatabase] SET QUERY_STORE = OFF
GO
USE [papeleraVipDatabase]
GO
/****** Object:  User [alumno]    Script Date: 6/9/2022 11:29:17 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 6/9/2022 11:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] NULL,
	[Nombre] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 6/9/2022 11:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](48) NOT NULL,
	[direccion] [varchar](64) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[mail] [varchar](64) NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 6/9/2022 11:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](56) NOT NULL,
	[descripcion] [varchar](256) NULL,
	[foto] [varchar](256) NOT NULL,
	[marca] [varchar](32) NOT NULL,
	[precio] [float] NOT NULL,
	[stock] [int] NOT NULL,
	[destacado] [bit] NULL,
	[idSubCategoria] [int] NULL,
	[idCategoria] [int] NULL,
	[foto2] [varchar](256) NULL,
	[foto3] [varchar](256) NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subCategorias]    Script Date: 6/9/2022 11:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subCategorias](
	[idSubcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idCategoria] [int] NULL,
 CONSTRAINT [PK_categorias] PRIMARY KEY CLUSTERED 
(
	[idSubcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_categorias] FOREIGN KEY([idSubCategoria])
REFERENCES [dbo].[subCategorias] ([idSubcategoria])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_productos_categorias]
GO
USE [master]
GO
ALTER DATABASE [papeleraVipDatabase] SET  READ_WRITE 
GO
