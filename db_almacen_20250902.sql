USE [master]
GO
/****** Object:  Database [db_almacen]    Script Date: 9/2/2025 5:06:54 PM ******/
CREATE DATABASE [db_almacen]
GO
USE [db_almacen]
GO
/****** Object:  Table [dbo].[T_Detalles_Presupuesto]    Script Date: 9/2/2025 5:06:54 PM ******/
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
)WITH (PAD_INDEX = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Ingredientes]    Script Date: 9/2/2025 5:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Ingredientes](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[n_ingrediente] [varchar](50) NOT NULL,
	[codigo_producto] [int] NOT NULL,
	[cantidad] [float] NULL,
	[unidad] [varchar](10) NULL,
 CONSTRAINT [PK_T_Ingredientes] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Presupuestos]    Script Date: 9/2/2025 5:06:54 PM ******/
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
)WITH (PAD_INDEX = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Productos]    Script Date: 9/2/2025 5:06:54 PM ******/
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
)WITH (PAD_INDEX = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[T_Detalles_Presupuesto] ([id_detalle], [id_presupuesto], [id_producto], [cantidad], [precio]) VALUES (1, 1, 1, 10, 100)
GO
INSERT [dbo].[T_Detalles_Presupuesto] ([id_detalle], [id_presupuesto], [id_producto], [cantidad], [precio]) VALUES (1, 2, 1, 1, 500)
GO
INSERT [dbo].[T_Detalles_Presupuesto] ([id_detalle], [id_presupuesto], [id_producto], [cantidad], [precio]) VALUES (2, 1, 2, 5, 200)
GO
SET IDENTITY_INSERT [dbo].[T_Ingredientes] ON 
GO
INSERT [dbo].[T_Ingredientes] ([codigo], [n_ingrediente], [codigo_producto], [cantidad], [unidad]) VALUES (1, N'Formula Secreta', 1, 100, N'%')
GO
SET IDENTITY_INSERT [dbo].[T_Ingredientes] OFF
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
INSERT [dbo].[T_Productos] ([codigo], [n_producto], [stock], [esta_activo], [precio]) VALUES (5, N'Schweppes Zero Pomelo', 250, 0, 2990)
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
ALTER TABLE [dbo].[T_Ingredientes]  WITH CHECK ADD  CONSTRAINT [FK_T_Ingredientes_T_Productos] FOREIGN KEY([codigo_producto])
REFERENCES [dbo].[T_Productos] ([codigo])
GO
ALTER TABLE [dbo].[T_Ingredientes] CHECK CONSTRAINT [FK_T_Ingredientes_T_Productos]
GO
/****** Object:  StoredProcedure [dbo].[SP_GUARDAR_INGREDIENTE]    Script Date: 9/2/2025 5:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GUARDAR_INGREDIENTE]
	@codigo_producto int,
	@nombre varchar(20),
	@cantidad int = NULL,
	@unidad varchar(10) = NULL
AS
INSERT INTO T_Ingredientes (
	n_ingrediente,
	codigo_producto,
	cantidad,
	unidad
) VALUES (
	@nombre,
	@codigo_producto,
	@cantidad,
	@unidad
)

GO
/****** Object:  StoredProcedure [dbo].[SP_GUARDAR_PRODUCTO]    Script Date: 9/2/2025 5:06:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE]    Script Date: 9/2/2025 5:06:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_MAESTRO]    Script Date: 9/2/2025 5:06:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_INGREDIENTE_POR_CODIGO]    Script Date: 9/2/2025 5:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECUPERAR_INGREDIENTE_POR_CODIGO]
	@codigo int
AS
BEGIN
	SELECT * FROM T_Ingredientes WHERE codigo = @codigo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_INGREDIENTES]    Script Date: 9/2/2025 5:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RECUPERAR_INGREDIENTES] 
AS
BEGIN
	SELECT * FROM T_Ingredientes
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRESUPUESTO_POR_ID]    Script Date: 9/2/2025 5:06:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRESUPUESTOS]    Script Date: 9/2/2025 5:06:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRODUCTO_POR_CODIGO]    Script Date: 9/2/2025 5:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RECUPERAR_PRODUCTO_POR_CODIGO]
	@codigo int
AS
BEGIN
	SELECT * FROM T_Productos WHERE codigo = @codigo AND esta_activo = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RECUPERAR_PRODUCTOS]    Script Date: 9/2/2025 5:06:54 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_BAJA_PRODUCTO]    Script Date: 9/2/2025 5:06:54 PM ******/
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
