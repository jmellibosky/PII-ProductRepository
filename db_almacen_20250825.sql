USE [master]
GO
/****** Object:  Database [db_almacen]    Script Date: 8/25/2025 10:18:53 PM ******/
CREATE DATABASE [db_almacen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_almacen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_almacen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_almacen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_almacen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_almacen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_almacen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_almacen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_almacen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_almacen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_almacen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_almacen] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_almacen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_almacen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_almacen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_almacen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_almacen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_almacen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_almacen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_almacen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_almacen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_almacen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_almacen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_almacen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_almacen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_almacen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_almacen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_almacen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_almacen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_almacen] SET RECOVERY FULL 
GO
ALTER DATABASE [db_almacen] SET  MULTI_USER 
GO
ALTER DATABASE [db_almacen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_almacen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_almacen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_almacen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_almacen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_almacen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_almacen', N'ON'
GO
ALTER DATABASE [db_almacen] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_almacen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_almacen]
GO
/****** Object:  Table [dbo].[T_Detalles_Presupuesto]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Detalles_Presupuesto](
	[id_detalle] [int] NOT NULL,
	[id_presupuesto] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [PK_Detalles_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC,
	[id_presupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Presupuestos]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Presupuestos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[vigencia] [int] NOT NULL,
 CONSTRAINT [PK_T_Presupuestos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Productos]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Productos](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[n_producto] [varchar](50) NOT NULL,
	[stock] [int] NOT NULL,
	[esta_activo] [bit] NOT NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_T_Productos] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[T_Detalles_Presupuesto] ([id_detalle], [id_presupuesto], [id_producto], [cantidad], [precio]) VALUES (1, 1, 1, 10, 100)
GO
INSERT [dbo].[T_Detalles_Presupuesto] ([id_detalle], [id_presupuesto], [id_producto], [cantidad], [precio]) VALUES (1, 2, 1, 1, 500)
GO
INSERT [dbo].[T_Detalles_Presupuesto] ([id_detalle], [id_presupuesto], [id_producto], [cantidad], [precio]) VALUES (2, 1, 2, 5, 200)
GO
SET IDENTITY_INSERT [dbo].[T_Presupuestos] ON 
GO
INSERT [dbo].[T_Presupuestos] ([id], [cliente], [fecha], [vigencia]) VALUES (1, N'Cliente de prueba', CAST(N'2024-09-02T16:58:03.200' AS DateTime), 10)
GO
INSERT [dbo].[T_Presupuestos] ([id], [cliente], [fecha], [vigencia]) VALUES (2, N'Cliente 2', CAST(N'2024-09-02T17:08:18.470' AS DateTime), 5)
GO
SET IDENTITY_INSERT [dbo].[T_Presupuestos] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Productos] ON 
GO
INSERT [dbo].[T_Productos] ([codigo], [n_producto], [stock], [esta_activo], [precio]) VALUES (1, N'Coca Cola Zero 2.25 L', 200, 1, 4599.99)
GO
INSERT [dbo].[T_Productos] ([codigo], [n_producto], [stock], [esta_activo], [precio]) VALUES (2, N'Pritty Limón 3L', 150, 1, 2346.75)
GO
INSERT [dbo].[T_Productos] ([codigo], [n_producto], [stock], [esta_activo], [precio]) VALUES (3, N'Paso de los Toros Pomelo 1.5L', 250, 1, 2279.25)
GO
INSERT [dbo].[T_Productos] ([codigo], [n_producto], [stock], [esta_activo], [precio]) VALUES (4, N'7up Lima Limón', 225, 1, 1823.4)
GO
INSERT [dbo].[T_Productos] ([codigo], [n_producto], [stock], [esta_activo], [precio]) VALUES (5, N'Schweppes Zero Pomelo', 250, 1, 2990)
GO
SET IDENTITY_INSERT [dbo].[T_Productos] OFF
GO
ALTER TABLE [dbo].[T_Presupuestos] ADD  CONSTRAINT [DF_T_Presupuestos_vigencia]  DEFAULT ((2)) FOR [vigencia]
GO
ALTER TABLE [dbo].[T_Detalles_Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Presupuesto_T_Presupuestos] FOREIGN KEY([id_presupuesto])
REFERENCES [dbo].[T_Presupuestos] ([id])
GO
ALTER TABLE [dbo].[T_Detalles_Presupuesto] CHECK CONSTRAINT [FK_Detalles_Presupuesto_T_Presupuestos]
GO
ALTER TABLE [dbo].[T_Detalles_Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Presupuesto_T_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[T_Productos] ([codigo])
GO
ALTER TABLE [dbo].[T_Detalles_Presupuesto] CHECK CONSTRAINT [FK_Detalles_Presupuesto_T_Productos]
GO
/****** Object:  StoredProcedure [dbo].[SP_GUARDAR_PRODUCTO]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GUARDAR_PRODUCTO]
@codigo int ,
@nombre varchar(20),
@stock int
AS
BEGIN 
	IF @codigo = 0
		BEGIN
			insert into T_Productos (n_producto, stock, esta_activo) 
			values (@nombre,@stock, 1)	
		END
	ELSE
		BEGIN
			update T_Productos 
			set n_producto= @nombre, stock= @stock 
			where codigo=@codigo
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_DETALLE] 
	@presupuesto int,
	@id_detalle int,
	@producto int,
	@cantidad int,
	@precio float

AS
BEGIN
	INSERT INTO T_Detalles_Presupuesto(id_detalle, id_presupuesto, id_producto, cantidad, precio) VALUES (@id_detalle, @presupuesto, @producto, @cantidad, @precio);
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_MAESTRO]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_MAESTRO] 
	@cliente varchar(50),
	@vigencia int,
	@id int output
AS
BEGIN
	INSERT INTO T_Presupuestos(cliente, fecha, vigencia) VALUES (@cliente, GETDATE(), @vigencia);
	SET @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRESUPUESTO_POR_ID]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECUPERAR_PRESUPUESTO_POR_ID]
	@id int
AS
BEGIN
	SELECT p.*, dp.precio, dp.cantidad, t.*
	  FROM T_Presupuestos p
	  INNER JOIN T_Detalles_Presupuesto dp ON dp.id_presupuesto =p.id
	  INNER JOIN T_Productos t ON (t.codigo = dp.id_producto)
	  WHERE p.id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRESUPUESTOS]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECUPERAR_PRESUPUESTOS]
AS
BEGIN
	SELECT p.*, dp.precio, dp.cantidad, t.*
	  FROM T_Presupuestos p
	  INNER JOIN T_Detalles_Presupuesto dp ON dp.id_presupuesto =p.id
	  INNER JOIN T_Productos t ON (t.codigo = dp.id_producto)

	  ORDER BY p.id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRODUCTO_POR_CODIGO]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECUPERAR_PRODUCTO_POR_CODIGO]
	@codigo int
AS
BEGIN
	SELECT * FROM T_Productos WHERE codigo = @codigo;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRODUCTOS]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RECUPERAR_PRODUCTOS] 
AS
BEGIN
	SELECT * FROM T_Productos
END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_BAJA_PRODUCTO]    Script Date: 8/25/2025 10:18:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_REGISTRAR_BAJA_PRODUCTO] 
	@codigo int 

AS
BEGIN
	UPDATE T_Productos SET esta_activo = 0 WHERE codigo = @codigo;
END
GO
USE [master]
GO
ALTER DATABASE [db_almacen] SET  READ_WRITE 
GO
