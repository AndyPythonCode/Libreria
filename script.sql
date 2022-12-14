USE [master]
GO
/****** Object:  Database [Libreria]    Script Date: 9/23/2022 11:59:01 AM ******/
CREATE DATABASE [Libreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Libreria', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Libreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Libreria_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Libreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Libreria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Libreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Libreria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Libreria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Libreria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Libreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Libreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Libreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Libreria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Libreria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Libreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Libreria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Libreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Libreria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Libreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Libreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Libreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Libreria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Libreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Libreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Libreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Libreria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Libreria] SET  MULTI_USER 
GO
ALTER DATABASE [Libreria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Libreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Libreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Libreria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Libreria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Libreria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Libreria] SET QUERY_STORE = OFF
GO
USE [Libreria]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 9/23/2022 11:59:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Nacionalidad] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 9/23/2022 11:59:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[IdLector] [int] IDENTITY(1,1) NOT NULL,
	[CI] [varchar](30) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Direccion] [varchar](40) NOT NULL,
	[Carrera] [varchar](30) NOT NULL,
	[Edad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibAut]    Script Date: 9/23/2022 11:59:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibAut](
	[IdAutor] [int] NULL,
	[IdLibro] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 9/23/2022 11:59:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](60) NOT NULL,
	[Editorial] [varchar](30) NOT NULL,
	[Area] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 9/23/2022 11:59:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[IdLector] [int] NULL,
	[IdLibro] [int] NULL,
	[FechaPrestamo] [datetime] NOT NULL,
	[FechaDevolucion] [datetime] NOT NULL,
	[Devuelto] [bit] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (1, N'Pau Glor', N'Argentino')
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (2, N'Félix Amador', N'Chileno')
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (3, N'Ana Caro', N'Uruguaya')
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [Nacionalidad]) VALUES (4, N'Liz Bella', N'Mexicana')
SET IDENTITY_INSERT [dbo].[Autor] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Direccion], [Carrera], [Edad]) VALUES (1, N'A26', N'Miguel De La Cruz', N'Avenida Del Sur', N'Lic. Contabilidad', 24)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Direccion], [Carrera], [Edad]) VALUES (2, N'B14', N'Luis Martinez', N'Calle Paula Reyes', N'Lic. Educacion Basica', 27)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Direccion], [Carrera], [Edad]) VALUES (3, N'C56', N'Antonio Santana', N'Calle Los Alamos', N'Lic. Cinematografia', 22)
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
GO
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (1, 1)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (1, 2)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (3, 3)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (2, 4)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (4, 5)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (4, 6)
INSERT [dbo].[LibAut] ([IdAutor], [IdLibro]) VALUES (2, 7)
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (1, N'El corazón de la piedra', N'Nocturna', N'Novela')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (2, N'Salmos de vísperas', N'Nocturna', N'Obra')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (3, N'La música en las catedrales españolas del Siglo de Oro', N'Nocturna', N'Musica')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (4, N'Studies in the Music of Tomás Luis de Victoria', N'Ashgate', N'Musica')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (5, N'La polifonía clásica', N'ABC', N'Obra')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (6, N'Historia de la música', N'ABC', N'Obra')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [Editorial], [Area]) VALUES (7, N'Mi vida', N'ABC', N'Biografia')
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (1, 5, CAST(N'2022-09-23T00:00:00.000' AS DateTime), CAST(N'2022-09-25T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (3, 2, CAST(N'2022-08-23T00:00:00.000' AS DateTime), CAST(N'2022-09-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (1, 7, CAST(N'2022-09-14T00:00:00.000' AS DateTime), CAST(N'2022-09-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (2, 3, CAST(N'2022-07-15T00:00:00.000' AS DateTime), CAST(N'2022-08-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Prestamo] ([IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (2, 4, CAST(N'2022-09-20T00:00:00.000' AS DateTime), CAST(N'2022-10-05T00:00:00.000' AS DateTime), 0)
GO
ALTER TABLE [dbo].[Prestamo] ADD  DEFAULT ((1)) FOR [Devuelto]
GO
ALTER TABLE [dbo].[LibAut]  WITH CHECK ADD FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[LibAut]  WITH CHECK ADD FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD FOREIGN KEY([IdLector])
REFERENCES [dbo].[Estudiante] ([IdLector])
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
/****** Object:  StoredProcedure [dbo].[LibroDeterminado]    Script Date: 9/23/2022 11:59:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[LibroDeterminado] 
@Autor VARCHAR(40) = NULL
AS
BEGIN
	SELECT A.Nombre, A.Nacionalidad, L.Titulo, L.Editorial, L.Area, P.Devuelto, E.Nombre FROM Autor A
	INNER JOIN LibAut LA
	ON A.IdAutor = LA.IdAutor
	INNER JOIN Libro L 
	ON LA.IdLibro = L.IdLibro
	INNER JOIN Prestamo P
	ON L.IdLibro = P.IdLibro
	INNER JOIN Estudiante E
	ON P.IdLector = E.IdLector
	WHERE A.Nombre = @Autor
END

EXEC LibroDeterminado 'Liz Bella'
GO
USE [master]
GO
ALTER DATABASE [Libreria] SET  READ_WRITE 
GO
