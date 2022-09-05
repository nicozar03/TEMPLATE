USE [master]
GO
/****** Object:  Database [papeleraVipDatabase]    Script Date: 5/9/2022 19:14:08 ******/
CREATE DATABASE [papeleraVipDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'papeleraVipDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\papeleraVipDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'papeleraVipDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\papeleraVipDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [papeleraVipDatabase] SET QUERY_STORE = OFF
GO
USE [papeleraVipDatabase]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/9/2022 19:14:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] NULL,
	[Nombre] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 5/9/2022 19:14:08 ******/
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
/****** Object:  Table [dbo].[productos]    Script Date: 5/9/2022 19:14:08 ******/
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
/****** Object:  Table [dbo].[subCategorias]    Script Date: 5/9/2022 19:14:08 ******/
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
INSERT [dbo].[Categorias] ([idCategoria], [Nombre]) VALUES (1, N'Utiles Escolares')
INSERT [dbo].[Categorias] ([idCategoria], [Nombre]) VALUES (2, N'Insumos Computacion')
INSERT [dbo].[Categorias] ([idCategoria], [Nombre]) VALUES (3, N'Libreria Tecnica')
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (1, N'David Canovas', N'Bulnes 3060', N'David1234', N'davidcanovas@gmail.com')
INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (4, N'Martin perez disalvo', N'Humboldt 1141', N'CoscuArmy', N'coscu@gmail.com')
INSERT [dbo].[clientes] ([idCliente], [nombre], [direccion], [password], [mail]) VALUES (5, N'Uriel Rabih', N'Yatay 240', N'RABIH', N'urielcarlosrabih@gmail.com')
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (3, N'Voligoma', N'Adhesivo Sintético Voligoma Original 30ml Por Unidad', N'https://inkgenio.com.ar/2291-large_default/voligoma-x-30-ml.jpg', N'POXIPOL', 107, 47, 1, 18, 1, N'https://librerialacentral.com.ar/wp-content/uploads/2021/10/Adhesivo-voligoma-x50ml.jpg.png', N'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/636/171/products/2951-daa51798502d162aa216213638227244-640-0.jpg')
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (4, N'Lapicera Filgo Fast Track', N' Bolígrafo retráctil con tinta suave a base de aceite', N'https://http2.mlstatic.com/D_NQ_NP_667597-MLA31041922374_062019-O.webp', N'Filgo', 60, 50, 1, 4, 1, N'https://www.copiart.com.ar/img/33105/7795513053263.jpg', N'http://d3ugyf2ht6aenh.cloudfront.net/stores/001/175/039/products/boligrafo_filgo_fastrack_x3611-9076e676ace502fabd15959460750533-640-01-d0d4478bf56b022a8c16002780465133-640-0.jpg')
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (6, N'Cuaderno Exito Tapa dura 48 hojas', N'Cuaderno Exito Tapa Dura 48 Hojas Lunares O Colores Araña', N'https://www.lacoopeencasa.coop/media/lcec/publico/articulos/2/4/c/24ce68028f7b5471fd2f1d8cdfd51bd1', N'Éxito', 500, 13, 1, 1, 1, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0i9yxg07BGrtvi5KM9FttGtNwx6LAYGa7kA&usqp=CAU', N'http://d3ugyf2ht6aenh.cloudfront.net/stores/934/828/products/lunares1-4b497bfd2e5062fe1016401994182195-640-0.jpg')
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (15, N'Globo terraqueo  Gloter Elbrus', N'Globo Terráqueo Elbrus
-Globo terráqueo con base de madera
-Altura: 42 cm
-Diametro: 30 cm
-Peso: 1,225 gr
-Base: Madera
-Ideal decoración, hogar, oficinas
Marca: Gloter
Origen: Argentina', N'https://cdn.shopify.com/s/files/1/1086/1234/products/257W_opt_1024x1024.jpg?v=1579740224', N' Gloter Elbrus', 16000, 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (16, N'Cuaderno Rivadavia Abc Espiralado 100h Rayado', N'Cuaderno ABC con Espiral Tapa Cartón x 100 hojas Rayadas

Formato 21 x 27cm
Hojas rayadas, sin perforar ni micropuntillar.
Diseños de tapas no elegibles.', N'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/398/366/products/cuaderno-rivadavia-abc-espiralado-x100h-pack-x5-d_nq_np_898125-mla25375422554_022017-f1-9a987ba3b7097a47ba15478488850974-1024-102421-6de97cc4d08cd778a316062236436449-1024-1024.jpg', N'Rivadavia', 1069, 10, 0, 1, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (22, N'Lapicera Roller Simball Genio Plus Tinta borrable Azul', N'Lapicera Roller Simball Genio Plus Tinta borrable Azul', N'https://www.lahorquetacopy.com.ar/wp-content/uploads/Lapicera-Roller-Simball-Genio-Plus-Tinta-borrable-Azul.jpg', N'Simball', 250, 15, 0, 4, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (23, N'Lapicera BIC trazo medio AZUL', N'Lapicera BIC trazo medio AZUL', N'https://www.bikabik.com.ar/wp-content/uploads/2020/07/boligrafo-bic-azul-trazo-grueso-1mm-opaco-x50-unid-D_NQ_NP_897138-MLA31037651428_062019-F-min.jpg', N'BIC', 80, 13, 0, 4, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (24, N'Block Anotador Congreso A5 40 Hojas Rayado', N'Block anotador Congreso

Rayado - 40 Hojas - Papel Obra 70 g- 160x210 mm
', N'https://http2.mlstatic.com/D_NQ_NP_917831-MLA48956532675_012022-O.webp', N'Congreso', 230, 14, 0, 6, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (25, N'LAPIZ GRAFITO STAEDTLER TRADITION HB', N'LAPIZ GRAFITO STAEDTLER TRADITION HB', N'https://unipack.com.ar/wp-content/uploads/2018/01/LAPTRADHB.jpg', N'STAEDTLER', 249, 12, 0, 2, 3, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (34, N'Regla Galleti 30 Cm 100% Acrílico Grabada Transparente', N'Ideal para trabajos de dibujo técnico, arquitectura o trabajos artísticos
estas reglas se destacan por ser 100% de acrílico y los números están grabados sobre el mismo permitiendo así, su conservación en el tiempo.

• Marca: Galetti
• Largo: 30 cm
•', N'https://http2.mlstatic.com/D_NQ_NP_827663-MLA41138443283_032020-O.webp', N'Galleti', 330, 10, 0, 3, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (38, N'Marcadores Touch Star Linea Clasica X 36 Unidades', N'Son permanentes, cada uno tiene punta amplia y punta fina, lo que le permite dibujar trazos gruesos y delgados, diseñados para durar y no desvanecerse fácilmente.', N'https://http2.mlstatic.com/D_NQ_NP_710546-MLA48366220616_112021-O.webp', N'Touch Star', 3745, 14, 0, 5, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (40, N'Set Resaltadores Trabi Pasteles + Fluo / 18 Unidades
', N'Set Resaltadores Trabi Pasteles + Fluo / 18 Unidades
', N'https://http2.mlstatic.com/D_NQ_NP_998939-MLA46760026026_072021-O.webp', N'Trabi', 1799, 18, 0, 9, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (41, N'Tijera Escolar Maped Cosmic Kids 13 Cm', N'Tijera Escolar Maped Cosmic Kids', N'https://http2.mlstatic.com/D_NQ_NP_739467-MLA48889057239_012022-O.webp', N'Maped', 319, 20, 0, 10, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (50, N'Cartulina Escolar Luma 45x63cm Varios Colores ', N'Cartulina Escolar Luma 45x63cm Varios Colores Calidad X 10un', N'https://http2.mlstatic.com/D_NQ_NP_754069-MLA47327725304_092021-O.webp', N'Luma', 500, 16, 0, 7, 1, NULL, NULL)
INSERT [dbo].[productos] ([idProducto], [nombre], [descripcion], [foto], [marca], [precio], [stock], [destacado], [idSubCategoria], [idCategoria], [foto2], [foto3]) VALUES (55, N'Mouse Logitech G203 Lightsync 8.000 Dpi Negro ', N'Mouse Logitech G203 Lightsync 8.000 Dpi Negro 6b Cable 2.1mt', N'https://http2.mlstatic.com/D_NQ_NP_941244-MLA44331789634_122020-O.webp', N'Logitech', 2949, 5, 0, 13, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[subCategorias] ON 

INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (1, N'cuadernos', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (2, N'lapices', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (3, N'reglas', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (4, N'lapiceras', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (5, N'marcadores', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (6, N'hojas', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (7, N'cartulinas', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (8, N'gomas', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (9, N'resaltadores', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (10, N'tijeras', 1)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (11, N'cartuchos', 3)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (12, N'toners', 2)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (13, N'mouse y teclado', 2)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (14, N'cuaderno de caligrafia', 3)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (15, N'escuadras', 3)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (16, N'lapices graduados', 3)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (17, N'transportadores', 3)
INSERT [dbo].[subCategorias] ([idSubcategoria], [nombre], [idCategoria]) VALUES (18, N'adhesivo', 1)
SET IDENTITY_INSERT [dbo].[subCategorias] OFF
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
