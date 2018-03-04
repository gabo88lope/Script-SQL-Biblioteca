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
