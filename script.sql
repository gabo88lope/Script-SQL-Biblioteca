--Biblioteca
--Script para creacion de tablas en la BD
--Por Gabriel,Bryan,Nelson y Leonardo
--Creado sábado, 4 de marzo de 2018

--Tabla Usuario--
CREATE TABLE Usuario (
	IdUsuario NUMBER(5) PRIMARY KEY, 
	Nombre VARCHAR2(20) NOT NULL,
	Apellido VARCHAR2 (20) NOT NULL, 
	Identificacion VARCHAR2 (20) NOT NULL,
	Sexo VARCHAR2(15), 
	Nacionalidad VARCHAR2(20),
	
);

--Tabla Ubicación--
CREATE TABLE Ubicacion (
	IdUbicacion NUMBER(3) PRIMARY KEY,
	Nombre VARCHAR2(20) NOT NULL,
	
);

--Tabla Editorial--
CREATE TABLE Editorial (
	IdEditorial NUMBER(3) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	IdUbicacion NUMBER(3)NOT NULL
	
	CONSTRAINT FK_Editorial_Ubicacion 
	FOREIGN KEY (IdUbicacion)
	REFERENCES Ubicacion (IdUbicacion)

);

-- TABLA Autor
CREATE TABLE Autor (
    IdAutor NUMBER(5) PRIMARY KEY,
    Nombre VARCHAR2(20)  NOT NULL,
    Apellido VARCHAR2(20)  NOT NULL,
    Sexo NUMBER(10)  NULL,
    Nacionalidad VARCHAR2(15)  NULL,
    FechaNacimiento DATE  NULL,
    
);

-- TABLA Bibliotecario
CREATE TABLE Bibliotecario (
    IdBibliotecario NUMBER(3)  PRIMARY KEY,
    Nombre VARCHAR2(20)  NOT NULL,
    Apellido VARCHAR2(20)  NOT NULL,
    
);

-- TABLA CategoriaGeneral
CREATE TABLE CategoriaGeneral (
    CodigoGeneral NUMBER(3)  PRIMARY KEY,
    Nombre VARCHAR(50)  NOT NULL,
    
);

-- TABLA CategoriaEspecial
CREATE TABLE CategoriaEspecial (
    CodigoEspecial NUMBER(3)  PRIMARY KEY,
    Nombre VARCHAR2(50)  NOT NULL,
    CodigoGeneral NUMBER(3)  NOT NULL
	
	CONSTRAINT FK_CatEspecial_CatGeneral
    FOREIGN KEY (CodigoGeneral)
    REFERENCES CategoriaGeneral (CodigoGeneral);
    
);

--Tabla DetallePrestamo
CREATE TABLE DetallePrestamo(
	IdDetallePrestamo NUMBER(6) PRIMARY KEY,
	IdPrestamo NUMBER(6) NOT NULL,
	IdLibro NUMBER(7) NOT NULL

CONSTRAINT FK_DetallePrestamo_Prestamo
FOREIGN KEY (IdPrestamo)
REFERENCES Prestamo (IdPrestamo)

CONSTRAINT FK_DetallePrestamo_Libro
FOREIGN KEY (IdLibro)
REFERENCES Libro (IdLibro)

);

--Tabla Estado
CREATE TABLE Estado(
	IdEstado NUMBER(2)PRIMARY KEY,
	Estado VARCHAR2(20)

);

--Tabla TipoDocumento
CREATE TABLE TipoDocumento (
	IdTipoDocumen NUMBER(2) PRIMARY KEY,
	Nombre VARCHAR2(10) NOT NULL

);


-------- TABLA LIBRO-------

CREATE TABLE Libro(
   IdLibro NUMBER(7) primary key,
   Titulo VARCHAR2(50) NOT NULL,
   ISBN  VARCHAR2(13) primary key,
   FechaPublicacion DATE NOT NULL,
   NumEjemplares NUMBER(2) NOT NULL,
   Descripcion VARCHAR2(300),
   Paginas NUMBER(4),
   Edicion VARCHAR2(10),
   IdUbicacion NUMBER(3),
   IdEstado NUMBER(2),
   IdTipoDocumento NUMBER(3)
   Codigo NUMBER(3),
   CodigoEspecial NUMBER(3),

   CONSTRAINT fk_Ubicacion_Libro FOREIGN KEY (IdUbicacion) REFERENCES Ubicacion(IdUbicacion),
   CONSTRAINT fk_Estado_Libro FOREIGN KEY (IdEstado) REFERENCES Ubicacion(IdEstado),
   CONSTRAINT fk_TipoDocumento_Libro FOREIGN KEY (IdTipoDocumento) REFERENCES TipoDocumento(IdTipoDocumento),
   CONSTRAINT fk_CodigoGeneral_Libro FOREIGN KEY (Codigo) REFERENCES CodigoGeneral(CodigoGeneral),
   CONSTRAINT fk_CodigoEspecial_Libro FOREIGN KEY (CodigoEspecial) REFERENCES CodigoEspecial(CodigoEspecial)
);


------ TABLA DETALLE LIBRO---------

CREATE TABLE DetalleLibro(
    
    IdDetalleLibro NUMBER(6) primary key,
    IdAutor NUMBER(5),
    IdLibro NUMBER(6),
    ISBN VARCHAR2(13),
    IdEditorial NUMBER(3),

    CONSTRAINT fk_Autor_DetalleLibro FOREIGN KEY (IdAutor) REFERENCES Autor(IdAutor),
    CONSTRAINT fk_libro_DetalleLibro FOREIGN KEY (Idlibro) REFERENCES Libro(IdLibro),
    CONSTRAINT fk_Libro_DetalleLibro FOREIGN KEY (ISBN) REFERENCES Libro(ISBN),
    CONSTRAINT fk_Editorial_DetalleLibro FOREIGN KEY (IdEditorial) REFERENCES Editorial(IdEditorial)
);

---------  TABLA PRESTAMO -----------

CREATE TABLE Prestamo(
  
  IdPrestamo NUMBER(6) primary key,
  FechaPrestamo DATE,
  FechaDevolucion DATE,
  Estado VARCHAR2(10),
  IdBibliotecario NUMBER(4),
  IdUsuario NUMBER(4),
  Identificacion VARCHAR2(20),
  Cantidad NUMBER(2),

  CONSTRAINT fk_Bibliotecario_Prestamo FOREIGN KEY (IdBibliotecario) REFERENCES Bibliotecario(IdBibliotecario),
  CONSTRAINT fk_Usuario_Prestamo FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
  CONSTRAINT fk_Usuario_Prestamo FOREIGN KEY (Identificacion) REFERENCES Usuario(Identificacion)
);

