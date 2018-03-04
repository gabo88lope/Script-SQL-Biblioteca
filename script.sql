--Biblioteca
--Script para creacion de tablas en la BD
--Por Gabriel,Bryan,Nelson y Leonardo
--Creado sábado, 4 de marzo de 2018

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