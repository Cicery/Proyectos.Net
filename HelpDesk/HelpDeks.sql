USE [master]
GO
/****** Object:  Database [HelpDeks]    Script Date: 14/01/2019 4:58:25 p.m. ******/
CREATE DATABASE [HelpDeks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HelpDeks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HelpDeks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HelpDeks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HelpDeks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HelpDeks] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HelpDeks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HelpDeks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HelpDeks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HelpDeks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HelpDeks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HelpDeks] SET ARITHABORT OFF 
GO
ALTER DATABASE [HelpDeks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HelpDeks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HelpDeks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HelpDeks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HelpDeks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HelpDeks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HelpDeks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HelpDeks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HelpDeks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HelpDeks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HelpDeks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HelpDeks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HelpDeks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HelpDeks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HelpDeks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HelpDeks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HelpDeks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HelpDeks] SET RECOVERY FULL 
GO
ALTER DATABASE [HelpDeks] SET  MULTI_USER 
GO
ALTER DATABASE [HelpDeks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HelpDeks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HelpDeks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HelpDeks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HelpDeks] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HelpDeks', N'ON'
GO
ALTER DATABASE [HelpDeks] SET QUERY_STORE = OFF
GO
USE [HelpDeks]
GO
/****** Object:  Table [dbo].[Dependencia]    Script Date: 14/01/2019 4:58:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependencia](
	[idDependencia] [int] IDENTITY(1,1) NOT NULL,
	[depNombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dependencia] PRIMARY KEY CLUSTERED 
(
	[idDependencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleSolicitudes]    Script Date: 14/01/2019 4:58:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleSolicitudes](
	[idDetalleSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[detSolicitud] [int] NOT NULL,
	[detEquipo] [int] NOT NULL,
	[detObservacion] [text] NOT NULL,
 CONSTRAINT [PK_DetalleSolicitudes] PRIMARY KEY CLUSTERED 
(
	[idDetalleSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 14/01/2019 4:58:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[empPersona] [int] NOT NULL,
	[empCargo] [nvarchar](50) NOT NULL,
	[empDependencia] [int] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 14/01/2019 4:58:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[idEquipo] [int] IDENTITY(1,1) NOT NULL,
	[equiTipo] [nvarchar](50) NOT NULL,
	[equiMarca] [nvarchar](50) NOT NULL,
	[equiSerial] [nvarchar](50) NOT NULL,
	[equiDependencia] [int] NOT NULL,
 CONSTRAINT [PK_Equipos] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 14/01/2019 4:58:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[perIdentificacion] [nvarchar](50) NOT NULL,
	[perNombre] [nvarchar](50) NOT NULL,
	[perApellido] [nvarchar](50) NOT NULL,
	[perCorreo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 14/01/2019 4:58:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[idServicio] [int] IDENTITY(1,1) NOT NULL,
	[serSolicitud] [int] NOT NULL,
	[serEmpleado] [int] NOT NULL,
	[serDescripcionSolucion] [text] NOT NULL,
	[serFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solicitudes]    Script Date: 14/01/2019 4:58:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[idSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[solTicket] [nvarchar](15) NOT NULL,
	[solEmpleado] [int] NOT NULL,
	[solFechaHora] [datetime] NOT NULL,
	[solEstado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Solicitudes] PRIMARY KEY CLUSTERED 
(
	[idSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/01/2019 4:58:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuEmpleado] [int] NOT NULL,
	[usuLogin] [nvarchar](15) NOT NULL,
	[usuPassword] [nvarchar](60) NOT NULL,
	[usuRol] [nvarchar](50) NOT NULL,
	[usuEstado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dependencia] ON 

INSERT [dbo].[Dependencia] ([idDependencia], [depNombre]) VALUES (2, N'Ambientalista')
INSERT [dbo].[Dependencia] ([idDependencia], [depNombre]) VALUES (3, N'Talento Humano')
INSERT [dbo].[Dependencia] ([idDependencia], [depNombre]) VALUES (4, N'Sistema')
INSERT [dbo].[Dependencia] ([idDependencia], [depNombre]) VALUES (5, N'ninguna')
INSERT [dbo].[Dependencia] ([idDependencia], [depNombre]) VALUES (1005, N'salud')
SET IDENTITY_INSERT [dbo].[Dependencia] OFF
SET IDENTITY_INSERT [dbo].[DetalleSolicitudes] ON 

INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (1, 1, 1, N'cambio de sisco duro')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (2, 1, 1, N'cambio de ram')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (3, 2, 1, N'ww')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (4, 3, 2, N'pantalla partida')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (5, 4, 1, N'oreja tuerta')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (6, 5, 2, N'tiene el ojo sordo')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (7, 6, 2, N'tiene el ojo sordo')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (8, 7, 1, N'ojo sordo')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (9, 7, 2, N'c&#225;mara sorda')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (10, 8, 3, N'camara sorda')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (11, 8, 1, N'ojo sordo')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (12, 9, 1, N'sdsd')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (1002, 1002, 3, N'TIENE TUERTA LA OREJA ')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (1003, 1002, 3, N'TIENE SORDO EL OJO')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (1004, 1003, 1002, N'HGHGHG')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (1005, 1004, 1002, N'balalalalla')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (1006, 1005, 1003, N'IOOJOHGJKFHCG ')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (2002, 2002, 1002, N'tuerto')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (3002, 3002, 1, N'ssss')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (3003, 3002, 2, N'sdsd')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (3004, 3007, 2, N'sdsd')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (3005, 3007, 1, N'sdsd')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (3006, 3008, 2, N'jajajaja')
INSERT [dbo].[DetalleSolicitudes] ([idDetalleSolicitud], [detSolicitud], [detEquipo], [detObservacion]) VALUES (3007, 3008, 1, N'jojojojo')
SET IDENTITY_INSERT [dbo].[DetalleSolicitudes] OFF
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (2, 1, N'Gerente', 2)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (3, 2, N'Tesorero', 3)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (6, 5, N'Archivista', 4)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (7, 6, N'Ingeniero de Sistemas', 4)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (8, 7, N'Gerente', 4)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (9, 14, N'Tesorero', 3)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (10, 16, N'Gerente', 2)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (1007, 1006, N'Ingeniero de Sistemas', 4)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (1008, 1007, N'Tesorero', 2)
INSERT [dbo].[Empleado] ([idEmpleado], [empPersona], [empCargo], [empDependencia]) VALUES (1009, 1008, N'Gerente', 3)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([idEquipo], [equiTipo], [equiMarca], [equiSerial], [equiDependencia]) VALUES (1, N'portatil', N'Hp', N'123', 2)
INSERT [dbo].[Equipos] ([idEquipo], [equiTipo], [equiMarca], [equiSerial], [equiDependencia]) VALUES (2, N'Portatil', N'HP', N'321', 3)
INSERT [dbo].[Equipos] ([idEquipo], [equiTipo], [equiMarca], [equiSerial], [equiDependencia]) VALUES (3, N'Impresora', N'Epson', N'1234', 3)
INSERT [dbo].[Equipos] ([idEquipo], [equiTipo], [equiMarca], [equiSerial], [equiDependencia]) VALUES (1002, N'Portatil', N'Epson', N'567', 4)
INSERT [dbo].[Equipos] ([idEquipo], [equiTipo], [equiMarca], [equiSerial], [equiDependencia]) VALUES (1003, N'Impresora', N'Asus', N'01', 4)
SET IDENTITY_INSERT [dbo].[Equipos] OFF
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (1, N'11', N'Juan', N'castro', N'castro@')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (2, N'12', N'Yeferson', N'cicery', N'ycicery@')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (5, N'13', N'Andres', N'Perdomo', N'perdomo@')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (6, N'007', N'jeins', N'bouns', N'jeins@bous.com')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (7, N'1502', N'yenifer', N'Garzon', N'garzon@gmail.com')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (14, N'1520', N'angie', N'Ramos', N'tati@asa.com')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (16, N'32323', N'dfdfd', N'fdfdf', N'fdfdf@fdfdfdf')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (1006, N'0621', N'Michell', N'Rivas', N'michell@michell.com')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (1007, N'2415', N'Fan', N'Perdomo', N'perdomo@fan.com')
INSERT [dbo].[Personas] ([idPersona], [perIdentificacion], [perNombre], [perApellido], [perCorreo]) VALUES (1008, N'0222', N'carmenza', N'Rivas', N'gfgdg@cfvfv')
SET IDENTITY_INSERT [dbo].[Personas] OFF
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (1, 3, 6, N'ya', CAST(N'2018-11-06T22:29:46.110' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (2, 1, 6, N'ya hice los cambios', CAST(N'2018-11-07T10:15:41.003' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (3, 2, 6, N'ww arelgado', CAST(N'2018-11-07T10:19:38.667' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (4, 4, 6, N'ya se arreglo', CAST(N'2018-11-07T12:46:23.040' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (5, 7, 6, N'ya se arreglo el ojo sordo', CAST(N'2018-11-07T13:32:54.933' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (6, 5, 6, N'listo', CAST(N'2018-11-07T13:36:07.867' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (7, 8, 6, N'ya los arreglamos', CAST(N'2018-11-07T14:02:37.917' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (8, 6, 6, N'ya perro', CAST(N'2018-11-07T15:58:09.520' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (1002, 1003, 1007, N'asasas', CAST(N'2018-11-09T15:29:09.813' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (1003, 9, 1007, N'asasas', CAST(N'2018-11-09T15:29:27.987' AS DateTime))
INSERT [dbo].[Servicios] ([idServicio], [serSolicitud], [serEmpleado], [serDescripcionSolucion], [serFecha]) VALUES (1004, 1002, 1007, N'assas', CAST(N'2018-11-09T15:29:43.673' AS DateTime))
SET IDENTITY_INSERT [dbo].[Servicios] OFF
SET IDENTITY_INSERT [dbo].[Solicitudes] ON 

INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (1, N'1018', 2, CAST(N'2018-11-06T14:09:15.650' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (2, N'6794', 3, CAST(N'2018-11-06T15:41:38.020' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (3, N'1166', 3, CAST(N'2018-11-06T16:01:11.900' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (4, N'3831', 3, CAST(N'2018-11-07T10:43:03.727' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (5, N'4230', 3, CAST(N'2018-11-07T10:47:50.543' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (6, N'3165', 3, CAST(N'2018-11-07T10:48:22.617' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (7, N'2556', 3, CAST(N'2018-11-07T10:55:56.317' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (8, N'4132', 3, CAST(N'2018-11-07T13:34:18.047' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (9, N'9896', 3, CAST(N'2018-11-07T13:34:45.630' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (1002, N'3399', 3, CAST(N'2018-11-09T15:18:19.017' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (1003, N'4749', 3, CAST(N'2018-11-09T15:21:38.963' AS DateTime), N'Atendida')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (1004, N'8029', 1008, CAST(N'2018-11-09T15:28:12.150' AS DateTime), N'Solicitada')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (1005, N'6337', 1008, CAST(N'2018-11-09T16:04:31.357' AS DateTime), N'Solicitada')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (2002, N'5804', 3, CAST(N'2018-11-10T19:23:41.973' AS DateTime), N'Solicitada')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (3002, N'2049', 3, CAST(N'2018-11-28T21:46:45.457' AS DateTime), N'Solicitada')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (3007, N'1192', 3, CAST(N'2018-11-28T22:11:44.437' AS DateTime), N'Solicitada')
INSERT [dbo].[Solicitudes] ([idSolicitud], [solTicket], [solEmpleado], [solFechaHora], [solEstado]) VALUES (3008, N'6027', 3, CAST(N'2018-11-28T22:12:33.313' AS DateTime), N'Solicitada')
SET IDENTITY_INSERT [dbo].[Solicitudes] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (1, 2, N'11', N'11', N'Administrador', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (2, 3, N'12', N'12', N'Funcionario', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (3, 6, N'13', N'13', N'Soporte', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (4, 7, N'007', N'007', N'Soporte', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (5, 8, N'1502', N'1502', N'Soporte', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (6, 9, N'1520', N'1520', N'Funcionario', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (7, 10, N'32323', N'32323', N'Administrador', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (1004, 1007, N'0621', N'0621', N'Soporte', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (1005, 1008, N'2415', N'2415', N'Funcionario', N'Activo')
INSERT [dbo].[Usuario] ([idUsuario], [usuEmpleado], [usuLogin], [usuPassword], [usuRol], [usuEstado]) VALUES (1006, 1009, N'0222', N'0222', N'Administrador', N'Activo')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Personas]    Script Date: 14/01/2019 4:58:25 p.m. ******/
ALTER TABLE [dbo].[Personas] ADD  CONSTRAINT [IX_Personas] UNIQUE NONCLUSTERED 
(
	[perIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Personas_1]    Script Date: 14/01/2019 4:58:25 p.m. ******/
ALTER TABLE [dbo].[Personas] ADD  CONSTRAINT [IX_Personas_1] UNIQUE NONCLUSTERED 
(
	[perCorreo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleSolicitudes]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSolicitudes_Equipos] FOREIGN KEY([detEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[DetalleSolicitudes] CHECK CONSTRAINT [FK_DetalleSolicitudes_Equipos]
GO
ALTER TABLE [dbo].[DetalleSolicitudes]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSolicitudes_Solicitudes] FOREIGN KEY([detSolicitud])
REFERENCES [dbo].[Solicitudes] ([idSolicitud])
GO
ALTER TABLE [dbo].[DetalleSolicitudes] CHECK CONSTRAINT [FK_DetalleSolicitudes_Solicitudes]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Dependencia] FOREIGN KEY([empDependencia])
REFERENCES [dbo].[Dependencia] ([idDependencia])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Dependencia]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Personas] FOREIGN KEY([empPersona])
REFERENCES [dbo].[Personas] ([idPersona])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Personas]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_Dependencia] FOREIGN KEY([equiDependencia])
REFERENCES [dbo].[Dependencia] ([idDependencia])
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [FK_Equipos_Dependencia]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Empleado] FOREIGN KEY([serEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Empleado]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Solicitudes] FOREIGN KEY([serSolicitud])
REFERENCES [dbo].[Solicitudes] ([idSolicitud])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Solicitudes]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [FK_Solicitudes_Empleado] FOREIGN KEY([solEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [FK_Solicitudes_Empleado]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleado] FOREIGN KEY([usuEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empleado]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [emun_Cargo] CHECK  (([empCargo]='Gerente' OR [empCargo]='Tesorero' OR [empCargo]='Secretaria' OR [empCargo]='Ingeniero De Sistemas' OR [empCargo]='Tecnico En Sistemas' OR [empCargo]='Archivista'))
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [emun_Cargo]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [emun_Marca] CHECK  (([equiMarca]='Dell' OR [equiMarca]='HP' OR [equiMarca]='Lenovo' OR [equiMarca]='Asus' OR [equiMarca]='Acer' OR [equiMarca]='Epson' OR [equiMarca]='Canon' OR [equiMarca]='Samsung' OR [equiMarca]='Mac'))
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [emun_Marca]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [emun_Tipo] CHECK  (([equiTipo]='Computador Escritorio' OR [equiTipo]='Portatil' OR [equiTipo]='Impresora' OR [equiTipo]='Scanner' OR [equiTipo]='Monitor'))
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [emun_Tipo]
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD  CONSTRAINT [emun_Estados] CHECK  (([solEstado]='Solicitada' OR [solEstado]='Proceso' OR [solEstado]='Atendida' OR [solEstado]='Cancelada'))
GO
ALTER TABLE [dbo].[Solicitudes] CHECK CONSTRAINT [emun_Estados]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [CK_Usuario] CHECK  (([usuRol]='Administrador' OR [usuRol]='Funcionario' OR [usuRol]='Soporte'))
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [CK_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [emun_Estado] CHECK  (([usuEstado]='Activo' OR [usuEstado]='Inactivo'))
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [emun_Estado]
GO
USE [master]
GO
ALTER DATABASE [HelpDeks] SET  READ_WRITE 
GO
