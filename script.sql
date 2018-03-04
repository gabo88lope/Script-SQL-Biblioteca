--Biblioteca
--Script para creacion de tablas en la BD
--Por Gabriel,Bryan,Nelson y Leonardo
--Creado sábado, 4 de marzo de 2018

--Tabla Usuario--
CREATE TABLE Usuario
(IdUsuario number(5) PRIMARY KEY, 
Nombre VARCHAR2(20) NOT NULL,
Apellido VARCHAR2 (20) NOT NULL, 
Identificacion VARCHAR2 (20) NOT NULL,
Sexo VARCHAR2(15), 
Nacionalidad VARCHAR2(20));

--Tabla Ubicación--
CREATE TABLE Ubicacion
(IdUbicacion number(3) PRIMARY KEY,
Nombre VARCHAR2(20) NOT NULL);

--Tabla Editorial--
CREATE TABLE Editorial
(IdEditorial number(3) PRIMARY KEY,
Nombre VARCHAR(30) NOT NULL,
CONSTRAINT FK_Editorial_Ubicacion 
FOREIGN KEY (IdUbicacion)
REFERENCES Ubicacion (IdUbicacion));

-- TABLA Autor
CREATE TABLE Autor (
    IdAutor number(5) PRIMARY KEY,
    Nombre number(20)  NOT NULL,
    Apellido number(20)  NOT NULL,
    Sexo number(10)  NULL,
    Nacionalidad varchar2(15)  NULL,
    FechaNacimiento date  NULL,
    
);

-- TABLA Bibliotecario
CREATE TABLE Bibliotecario (
    IdBibliotecario number(3)  PRIMARY KEY,
    Nombre varchar2(20)  NOT NULL,
    Apellido varchar2(20)  NOT NULL,
    
);

-- TABLA CategoriaGeneral
CREATE TABLE CategoriaGeneral (
    CodigoGeneral number(3)  PRIMARY KEY,
    Nombre varchar2(50)  NOT NULL,
    
);

-- TABLA CategoriaEspecial
CREATE TABLE CategoriaEspecial (
    CodigoEspecial number(3)  PRIMARY KEY,
    Nombre varchar2(50)  NOT NULL,
    CodigoGeneral number(3)  NOT NULL
	
	CONSTRAINT CatEspecial_CatGeneral
    FOREIGN KEY (CodigoGeneral)
    REFERENCES CategoriaGeneral (CodigoGeneral);
    
);
