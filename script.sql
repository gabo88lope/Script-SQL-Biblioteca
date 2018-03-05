--Biblioteca
--Script para creacion de tablas en la BD
--Por Gabriel,Bryan,Nelson y Leonardo
--Creado sábado, 4 de marzo de 2018
--Universidad Centroamericana ISI

-- Tabla Usuario
CREATE TABLE Usuario (

	IdUsuario NUMBER(5) PRIMARY KEY, 
	Nombre VARCHAR2(20) NOT NULL,
	Apellido VARCHAR2 (20) NOT NULL, 
	Identificacion VARCHAR2 (20) NOT NULL,
	Sexo VARCHAR2(15), 
	Nacionalidad VARCHAR2(20)
	
);

-- Tabla Ubicación

CREATE TABLE Ubicacion (

	IdUbicacion NUMBER(3) PRIMARY KEY,
	Nombre VARCHAR2(20) NOT NULL
	
);

-- TABLA Autor
CREATE TABLE Autor (

    IdAutor NUMBER(5) PRIMARY KEY,
    Nombre VARCHAR2(20)  NOT NULL,
    Apellido VARCHAR2(20)  NOT NULL,
    Sexo NUMBER(10)  NULL,
    Nacionalidad VARCHAR2(15)  NULL,
    FechaNacimiento DATE  NULL
    
);

-- TABLA Bibliotecario
CREATE TABLE Bibliotecario (

    IdBibliotecario NUMBER(3)  PRIMARY KEY,
    Nombre VARCHAR2(20)  NOT NULL,
    Apellido VARCHAR2(20)  NOT NULL
    
);


-- Tabla Estado
CREATE TABLE Estado(

	IdEstado NUMBER(2)PRIMARY KEY,
	Estado VARCHAR2(20)

);

-- Tabla TipoDocumento
CREATE TABLE TipoDocumento (

	IdTipoDocumento NUMBER(2) PRIMARY KEY,
	Nombre VARCHAR2(10) NOT NULL

);

-- TABLA CategoriaGeneral
CREATE TABLE CategoriaGeneral (

    CodigoGeneral NUMBER(3)  PRIMARY KEY,
    Nombre VARCHAR(50)  NOT NULL
    
);

-- TABLA CategoriaEspecial
CREATE TABLE CategoriaEspecial (

    CodigoEspecial NUMBER(3)  PRIMARY KEY,
    Nombre VARCHAR2(50)  NOT NULL,
    CodigoGeneral NUMBER(3)  NOT NULL
	
	CONSTRAINT FK_CatEspecial_CatGeneral
    REFERENCES CategoriaGeneral (CodigoGeneral);
    
);

-- Tabla Editorial
CREATE TABLE Editorial (

	IdEditorial NUMBER(3) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	IdUbicacion NUMBER(3)NOT NULL
	
	CONSTRAINT FK_Editorial_Ubicacion 
	REFERENCES Ubicacion (IdUbicacion)

);

-- TABLA LIBRO

CREATE TABLE Libro(

   IdLibro NUMBER(7) PRIMARY KEY,
   ISBN  VARCHAR2(13) PRIMARY KEY,
   Titulo VARCHAR2(50) NOT NULL,
   FechaPublicacion DATE NOT NULL,
   Edicion VARCHAR2(10),
   Descripcion VARCHAR2(300),
   Paginas NUMBER(4),
   NumEjemplares NUMBER(2) NOT NULL,
   IdUbicacion NUMBER(3) NOT NULL
   
   CONSTRAINT fk_Ubicacion_Libro 
   REFERENCES Ubicacion(IdUbicacion),
   
   IdEstado NUMBER(2) NOT NULL
   
   CONSTRAINT fk_Estado_Libro 
   REFERENCES Ubicacion(IdEstado),
   
   IdTipoDocumento NUMBER(3) NOT NULL
   
   CONSTRAINT fk_TipoDocumento_Libro 
   REFERENCES TipoDocumento(IdTipoDocumento),
   
   Codigo NUMBER(3) NOT NULL
   
   CONSTRAINT fk_CodigoGeneral_Libro  
   REFERENCES CodigoGeneral(CodigoGeneral),
   
   CodigoEspecial NUMBER(3) NOT NULL
   
   CONSTRAINT fk_CodigoEspecial_Libro 
   REFERENCES CodigoEspecial(CodigoEspecial)
);


-- TABLA PRESTAMO

CREATE TABLE Prestamo(
  
  IdPrestamo NUMBER(6) PRIMARY KEY,
  FechaPrestamo DATE NOT NULL,
  FechaDevolucion DATE NOT NULL,
  Cantidad NUMBER(2) NOT NULL,
  Estado VARCHAR2(10) NOT NULL,
  IdUsuario NUMBER(4) NOT NULL
  
  CONSTRAINT fk_Usuario_Prestamo 
  REFERENCES Usuario(IdUsuario),
  
  Identificacion VARCHAR2(20) NOT NULL
  
  CONSTRAINT fk_Usuario_Prestamo 
  REFERENCES Usuario(Identificacion),

  IdBibliotecario NUMBER(4) NOT NULL
  
  CONSTRAINT fk_Bibliotecario_Prestamo 
  REFERENCES Bibliotecario(IdBibliotecario)
  
  
);

-- TABLA DETALLE LIBRO

CREATE TABLE DetalleLibro(
    
    IdDetalleLibro NUMBER(6) primary key,
    IdLibro NUMBER(6) NOT NULL
	
	CONSTRAINT fk_libro_DetalleLibro 
	REFERENCES Libro(IdLibro),
	
    ISBN VARCHAR2(13) NOT NULL
	
	CONSTRAINT fk_Libro_DetalleLibro 
	REFERENCES Libro(ISBN),
	
	IdAutor NUMBER(5) NOT NULL
	
	CONSTRAINT fk_Autor_DetalleLibro 
	REFERENCES Autor(IdAutor),
	
    IdEditorial NUMBER(3) NOT NULL

    CONSTRAINT fk_Editorial_DetalleLibro 
	REFERENCES Editorial(IdEditorial)
);

-- Tabla DetallePrestamo
CREATE TABLE DetallePrestamo(

	IdDetallePrestamo NUMBER(6) PRIMARY KEY,
	IdPrestamo NUMBER(6) NOT NULL
	
	CONSTRAINT FK_DetallePrestamo_Prestamo
	REFERENCES Prestamo (IdPrestamo),
	
	IdLibro NUMBER(7) NOT NULL
	
	CONSTRAINT FK_DetallePrestamo_Libro
	REFERENCES Libro (IdLibro)

);

