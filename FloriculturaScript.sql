USE [master]
GO
/****** Object:  Database [floricultura]    Script Date: 29/03/2021 15:55:51 ******/
CREATE DATABASE [floricultura]
 CONTAINMENT = NONE
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [floricultura] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [floricultura].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [floricultura] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [floricultura] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [floricultura] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [floricultura] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [floricultura] SET ARITHABORT OFF 
GO
ALTER DATABASE [floricultura] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [floricultura] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [floricultura] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [floricultura] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [floricultura] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [floricultura] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [floricultura] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [floricultura] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [floricultura] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [floricultura] SET  ENABLE_BROKER 
GO
ALTER DATABASE [floricultura] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [floricultura] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [floricultura] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [floricultura] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [floricultura] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [floricultura] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [floricultura] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [floricultura] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [floricultura] SET  MULTI_USER 
GO
ALTER DATABASE [floricultura] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [floricultura] SET DB_CHAINING OFF 
GO
ALTER DATABASE [floricultura] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [floricultura] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [floricultura] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [floricultura] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [floricultura] SET QUERY_STORE = OFF
GO
USE [floricultura]
GO
/****** Object:  Schema [flor]    Script Date: 29/03/2021 15:55:52 ******/
CREATE SCHEMA [flor]
GO
/****** Object:  Table [flor].[Cadastro]    Script Date: 29/03/2021 15:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [flor].[Cadastro](
	[ID_Cadastro] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](400) NULL,
	[Email] [nvarchar](400) NULL,
	[Endereco] [nvarchar](400) NULL,
	[Telefone] [nvarchar](400) NULL,
	[ID_Pedido] [int] NULL,
 CONSTRAINT [PK_Cadastro] PRIMARY KEY CLUSTERED 
(
	[ID_Cadastro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [flor].[Flor]    Script Date: 29/03/2021 15:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [flor].[Flor](
	[ID_Flor] [int] IDENTITY(1,1) NOT NULL,
	[ID_TipoFlor] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
	[Nome] [varchar](500) NOT NULL,
	[Preco] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Flor] PRIMARY KEY CLUSTERED 
(
	[ID_Flor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [flor].[ItemPedido]    Script Date: 29/03/2021 15:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [flor].[ItemPedido](
	[ID_ItemPedido] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pedido] [int] NOT NULL,
	[PrecoUnitario] [decimal](18, 2) NOT NULL,
	[ID_Flor] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
 CONSTRAINT [PK_ItemPedido] PRIMARY KEY CLUSTERED 
(
	[ID_ItemPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [flor].[Pedido]    Script Date: 29/03/2021 15:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [flor].[Pedido](
	[ID_Pedido] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cadastro] [int] NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[ID_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [flor].[TipoFlor]    Script Date: 29/03/2021 15:55:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [flor].[TipoFlor](
	[ID_TipoFlor] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](300) NOT NULL,
	[Cor] [varchar](300) NULL,
 CONSTRAINT [PK_TipoFlor] PRIMARY KEY CLUSTERED 
(
	[ID_TipoFlor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [flor].[Cadastro] ON 

INSERT [flor].[Cadastro] ([ID_Cadastro], [Nome], [Email], [Endereco], [Telefone], [ID_Pedido]) VALUES (7, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [flor].[Cadastro] OFF
GO
SET IDENTITY_INSERT [flor].[Flor] ON 

INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (1, 1, 1, N'Rosa de Pedra', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (2, 1, 2, N'Rabo de Burro', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (3, 1, 3, N'Rosa Negra', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (4, 1, 4, N'Zebra', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (5, 1, 5, N'Colar de Pérolas', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (6, 1, 6, N'Cata Vento da Haworth', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (7, 1, 7, N'Pedra da Lua', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (8, 1, 8, N'Brilhantina', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (9, 1, 9, N'AEONIUM LEUCOBLEPHARUM', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (10, 1, 10, N'Dedo de Moça', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (11, 1, 11, N'Rabo de Burro', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (12, 1, 12, N'Sedum Dourado', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (13, 1, 13, N'Estrela do Mar', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (14, 1, 14, N'Planta Fantasma', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (15, 1, 15, N'Rosa de Pedra Elegans', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (16, 1, 16, N'Planta de Jade', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (17, 1, 17, N'Orelha de Shrek', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (18, 1, 18, N'Giz Azul', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (19, 1, 19, N'Orelha de Gato', CAST(5 AS Decimal(18, 0)))
INSERT [flor].[Flor] ([ID_Flor], [ID_TipoFlor], [Codigo], [Nome], [Preco]) VALUES (20, 1, 20, N'Arbusto de Elefante', CAST(5 AS Decimal(18, 0)))
SET IDENTITY_INSERT [flor].[Flor] OFF
GO
SET IDENTITY_INSERT [flor].[Pedido] ON 

INSERT [flor].[Pedido] ([ID_Pedido], [ID_Cadastro]) VALUES (12, 7)
SET IDENTITY_INSERT [flor].[Pedido] OFF
GO
SET IDENTITY_INSERT [flor].[TipoFlor] ON 

INSERT [flor].[TipoFlor] ([ID_TipoFlor], [Tipo], [Cor]) VALUES (1, N'Suculenta', NULL)
INSERT [flor].[TipoFlor] ([ID_TipoFlor], [Tipo], [Cor]) VALUES (2, N'Orquidea', NULL)
INSERT [flor].[TipoFlor] ([ID_TipoFlor], [Tipo], [Cor]) VALUES (3, N'Sempre Viva', NULL)
INSERT [flor].[TipoFlor] ([ID_TipoFlor], [Tipo], [Cor]) VALUES (4, N'TodoTempo', NULL)
INSERT [flor].[TipoFlor] ([ID_TipoFlor], [Tipo], [Cor]) VALUES (5, N'Sambambaia', NULL)
SET IDENTITY_INSERT [flor].[TipoFlor] OFF
GO
/****** Object:  Index [IX_Pedido_ID_Cadastro]    Script Date: 29/03/2021 15:55:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Pedido_ID_Cadastro] ON [flor].[Pedido]
(
	[ID_Cadastro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [flor].[Cadastro]  WITH CHECK ADD  CONSTRAINT [Fk_ID_Pedido] FOREIGN KEY([ID_Pedido])
REFERENCES [flor].[Pedido] ([ID_Pedido])
GO
ALTER TABLE [flor].[Cadastro] CHECK CONSTRAINT [Fk_ID_Pedido]
GO
ALTER TABLE [flor].[Flor]  WITH CHECK ADD  CONSTRAINT [FK_TipoFlor] FOREIGN KEY([ID_TipoFlor])
REFERENCES [flor].[TipoFlor] ([ID_TipoFlor])
GO
ALTER TABLE [flor].[Flor] CHECK CONSTRAINT [FK_TipoFlor]
GO
ALTER TABLE [flor].[ItemPedido]  WITH CHECK ADD  CONSTRAINT [FK_Flor] FOREIGN KEY([ID_Flor])
REFERENCES [flor].[Flor] ([ID_Flor])
GO
ALTER TABLE [flor].[ItemPedido] CHECK CONSTRAINT [FK_Flor]
GO
ALTER TABLE [flor].[ItemPedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido] FOREIGN KEY([ID_Pedido])
REFERENCES [flor].[Pedido] ([ID_Pedido])
GO
ALTER TABLE [flor].[ItemPedido] CHECK CONSTRAINT [FK_Pedido]
GO
ALTER TABLE [flor].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Cadastro] FOREIGN KEY([ID_Cadastro])
REFERENCES [flor].[Cadastro] ([ID_Cadastro])
ON DELETE CASCADE
GO
ALTER TABLE [flor].[Pedido] CHECK CONSTRAINT [FK_Cadastro]
GO
USE [master]
GO
ALTER DATABASE [floricultura] SET  READ_WRITE 
GO
