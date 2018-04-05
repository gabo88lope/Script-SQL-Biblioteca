-- HonDB
-- Script para creacion de tablas en la BD
-- Por Gabriel,Bryan,Nelson y Leonardo
-- Creado sábado,4 de marzo de 2018
-- Universidad Centroamericana ISI

-- Tabla Ubicación
CREATE TABLE ubicacion (
    idubicacion   SMALLINT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_ubicacion PRIMARY KEY ( idubicacion ),
  	Pais        VARCHAR(10) NOT NULL,
	Ciudad		VARCHAR(10),
	Nacionalidad VARCHAR(15) NOT NULL

);

-- TABLA Bibliotecario
CREATE TABLE bibliotecario (
    idbibliotecario   SMALLINT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_bibliotecario PRIMARY KEY ( idbibliotecario ),
    nombre            VARCHAR(20) NOT NULL,
    apellido          VARCHAR(20) NOT NULL
);

-- Tabla Estado
CREATE TABLE estado (
    idestado   TINYINT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_estado PRIMARY KEY ( idestado ),
    estado     VARCHAR(20) NOT NULL
);

-- Tabla TipoDocumento
CREATE TABLE tipodocumento (
    idtipodocumento   TINYINT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_tipodocumento PRIMARY KEY ( idtipodocumento ),
    nombre            VARCHAR(30) NOT NULL
);

-- TABLA CategoriaGeneral

CREATE TABLE categoriageneral (
    codigogeneral   SMALLINT PRIMARY KEY,
    nombre          VARCHAR(50) NOT NULL
);

-- Tabla Usuario
CREATE TABLE usuario (
    idusuario        INT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_usuario PRIMARY KEY ( idusuario ),
    nombre           VARCHAR(20) NOT NULL,
    apellido         VARCHAR(20) NOT NULL,
    identificacion   VARCHAR(20) NOT NULL,
    sexo             VARCHAR(10),
    idubicacion      SMALLINT NOT NULL
	    CONSTRAINT fk_USUARIO_ubicacion
            REFERENCES ubicacion ( idubicacion )
);

-- TABLA Autor
CREATE TABLE autor (
    idautor           INT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_autor PRIMARY KEY ( idautor ),
    nombre            VARCHAR(20) NOT NULL,
    apellido          VARCHAR(20) NOT NULL,
    sexo              VARCHAR(10),
    idubicacion       SMALLINT NOT NULL
		CONSTRAINT fk_AUTOR_ubicacioN
            REFERENCES ubicacion ( idubicacion ),
    fechanacimiento   DATE NULL
);

-- TABLA CategoriaEspecial
CREATE TABLE categoriaespecial (
    codigoespecial   SMALLINT PRIMARY KEY,
    nombre           VARCHAR(50) NOT NULL,
    codigogeneral    SMALLINT NOT NULL
        CONSTRAINT fk_catespecial_catgeneral
            REFERENCES categoriageneral ( codigogeneral )
);

-- Tabla Editorial
CREATE TABLE editorial (
    ideditorial   SMALLINT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_editorial PRIMARY KEY ( ideditorial ),
    nombre        VARCHAR(60) NOT NULL,
    idubicacion   SMALLINT NOT NULL
        CONSTRAINT fk_editorial_ubicacion
            REFERENCES ubicacion ( idubicacion )
);

-- TABLA LIBRO
CREATE TABLE libro (
    idlibro            INT
        ON NULL AS AUTO_INCREMENT,
    isbn               VARCHAR(25),
    CONSTRAINT pk_libro PRIMARY KEY ( idlibro,isbn ),
    depositolegal      VARCHAR(20),
    titulo             VARCHAR(100) NOT NULL,
    fechapublicacion   DATETIME NOT NULL,
    edicion            VARCHAR(15),
    descripcion        VARCHAR(300),
    paginas            SMALLINT,
    numejemplares      TINYINT NOT NULL,
    idubicacion        SMALLINT NOT NULL
        CONSTRAINT fk_ubicacion_libro
            REFERENCES ubicacion ( idubicacion ),
    idestado           NUMBER(2) NOT NULL
        CONSTRAINT fk_estado_libro
            REFERENCES estado ( idestado ),
    idtipodocumento    NUMBER(3) NOT NULL
        CONSTRAINT fk_tipodocumento_libro
            REFERENCES tipodocumento ( idtipodocumento ),
    codigo             NUMBER(3) NOT NULL
        CONSTRAINT fk_codigogeneral_libro
            REFERENCES categoriageneral ( codigogeneral ),
    codigoespecial     NUMBER(3) NOT NULL
        CONSTRAINT fk_codigoespecial_libro
            REFERENCES categoriaespecial ( codigoespecial )
);

-- TABLA PRESTAMO
CREATE TABLE prestamo (
    idprestamo        INT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_prestamo PRIMARY KEY ( idprestamo ),
    fechaprestamo     DATETIME NOT NULL,
    fechadevolucion   DATETIME NOT NULL,
    cantidad          TINYINT NOT NULL,
    estado            VARCHAR(20) NOT NULL,
    idusuario         SMALLINT NOT NULL
        CONSTRAINT fk_usuario_prestamo
            REFERENCES usuario ( idusuario ),
    idbibliotecario   NUMBER(4) NOT NULL
        CONSTRAINT fk_bibliotecario_prestamo
            REFERENCES bibliotecario ( idbibliotecario )
);

-- TABLA DETALLE LIBRO
CREATE TABLE detallelibro (
    iddetallelibro   INT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_detallelibro PRIMARY KEY ( iddetallelibro ),
    idlibro          INT NOT NULL,
    isbn             VARCHAR(25) NOT NULL,
    CONSTRAINT fk_libro_detallelibro FOREIGN KEY ( idlibro,isbn )
        REFERENCES libro ( idlibro,isbn ),
    idautor          INT NOT NULL
        CONSTRAINT fk_autor_detallelibro
            REFERENCES autor ( idautor ),
    ideditorial      NUMBER(3) NOT NULL
        CONSTRAINT fk_editorial_detallelibro
            REFERENCES editorial ( ideditorial )
);

-- Tabla DetallePrestamo
CREATE TABLE detalleprestamo (
    iddetalleprestamo   INT
        ON NULL AS AUTO_INCREMENT,
    CONSTRAINT pk_detalleprestamo PRIMARY KEY ( iddetalleprestamo ),
    idprestamo          INT NOT NULL
        CONSTRAINT fk_detalleprestamo_prestamo
            REFERENCES prestamo ( idprestamo ),
    idlibro             NUMBER(6) NOT NULL,
    isbn                VARCHAR2(25) NOT NULL,
    CONSTRAINT fk_libro_detalleprestamo FOREIGN KEY ( idlibro,isbn )
        REFERENCES libro ( idlibro,isbn )
);

INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Nicaragua','Managua','Nicaraguense');
INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Mexico','D.F.','Mexicano');
INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Colombia','Medellin','Colombiano');
INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Venezuela','Caracas','Venezolano');
INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Alemania','Berlin','Alemania');
INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Espania','Cadiz','Espaniol');
INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Espania','Madrid','Espaniol');
INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Espania','Barcelona','Espaniol');
INSERT INTO UBICACION(Pais,Ciudad,Nacionalidad)VALUES('Brasil','Brasilia','Brasilenio');

INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Roberto','Montano','000017547','Masculino',1);
INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Maria','Lopez','000056489','Femenino',2);
INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Bryan','Perez','000023548','Masculino',1);
INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Leonardo','Cardoza','000017562','Masculino',4);
INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Nelson','Cerros','000078523','Masculino',5);

INSERT INTO TIPODOCUMENTO(NOMBRE)VALUES('Libro');
INSERT INTO TIPODOCUMENTO(NOMBRE)VALUES('Tesis de Pregrado');
INSERT INTO TIPODOCUMENTO(NOMBRE)VALUES('Tesis de Posgrado');
INSERT INTO TIPODOCUMENTO(NOMBRE)VALUES('Publicaciones periodicas');
INSERT INTO TIPODOCUMENTO(NOMBRE)VALUES('Bibliografias');

INSERT INTO ESTADO(ESTADO)VALUES('EN EXISTENCIA');
INSERT INTO ESTADO(ESTADO)VALUES('EN PRESTAMO ED UNIC');
INSERT INTO ESTADO(ESTADO)VALUES('EN PRESTAMO');
INSERT INTO ESTADO(ESTADO)VALUES('BAJO CONSUMO');
INSERT INTO ESTADO(ESTADO)VALUES('AGOTADO');

INSERT INTO EDITORIAL(NOMBRE,IDUBICACION)VALUES('Monte Avila Latinoamericana, C.A.',4);
INSERT INTO EDITORIAL(NOMBRE,IDUBICACION)VALUES('HISPAMER',1);
INSERT INTO EDITORIAL(NOMBRE,IDUBICACION)VALUES('Libros McGraw-Hill de Mexico, S.A. de C.V.',2);
INSERT INTO EDITORIAL(NOMBRE,IDUBICACION)VALUES('Random House Mondadori, S.A. de C.V.',2);
INSERT INTO EDITORIAL(NOMBRE,IDUBICACION)VALUES('Publicaciones y Ediciones Salamandra, S.A.',9);

INSERT INTO AUTOR (nombre,apellido,sexo,idubicacion) VALUES ('Antonio','Pasquali','Masculino',4);
INSERT INTO AUTOR (nombre,apellido,sexo,idubicacion) VALUES ('Joaquim','Rabella Vives','Masculino',1);
INSERT INTO AUTOR (nombre,apellido,sexo,idubicacion) VALUES ('Luis','Joyanes Aguilar','Masculino',7);
INSERT INTO AUTOR (nombre,apellido,sexo,idubicacion) VALUES ('Paulo','Coelho','Masculino',8);
INSERT INTO AUTOR (nombre,apellido,sexo,idubicacion) VALUES ('Antonio','Pasquali','Masculino',1);

INSERT INTO BIBLIOTECARIO (NOMBRE,APELLIDO) VALUES ('Roberto','Montano');
INSERT INTO BIBLIOTECARIO (NOMBRE,APELLIDO) VALUES ('Julian','Romero');
INSERT INTO BIBLIOTECARIO (NOMBRE,APELLIDO) VALUES ('Alberto','Reyes');
INSERT INTO BIBLIOTECARIO (NOMBRE,APELLIDO) VALUES ('Armando','Casas');
INSERT INTO BIBLIOTECARIO (NOMBRE,APELLIDO) VALUES ('Carlos','Lopez');


INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(000,'Generalidades');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(100,'Filosofía & Psicologia');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(200,'Religion');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(300,'Ciencias Sociales');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(400,'Lenguas');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(500,'Ciencias Naturales & Matematicas');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(600,'Tecnologia (Ciencias aplicadas)');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(700,'Las Artes');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(800,'Literatura & Retórica');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(900,'Geografia & Historia');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(010,'Bibliografia');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(110,'Metafisica');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(210,'Filosofia & teoria de la religion');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(310,'Colecs. de estadística general');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(410,'Linguistica');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(510,'Matematicas');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(610,'Ciencias Medicas Medicina');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(710,'Urbanismo & Arte del paisaje');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(860,'Literaturas española & portuguesa');
INSERT INTO CATEGORIAGENERAL (CODIGOGENERAL,NOMBRE)VALUES(970,'Historia General de América del Norte');

INSERT INTO CategoriaEspecial (CODIGOESPECIAL,NOMBRE,CODIGOGENERAL)VALUES(418,'Uso estándar, Lingüística aplicada',410);
INSERT INTO CategoriaEspecial (CODIGOESPECIAL,NOMBRE,CODIGOGENERAL)VALUES(972,'Mesoamérica, México',970);
INSERT INTO CategoriaEspecial (CODIGOESPECIAL,NOMBRE,CODIGOGENERAL)VALUES(005,'Programación, programas, datos de computación',000);
INSERT INTO CategoriaEspecial (CODIGOESPECIAL,NOMBRE,CODIGOGENERAL)VALUES(863,'Ficción española',860);


INSERT INTO LIBRO (isbn,titulo,fechapublicacion,edicion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigo,codigoespecial)VALUES('980-01-0024-5','Comprender la comunicacion',STR_TO_DATE('1990','%Y'),'4ta edicion','Libro sobre comunicacion',306,5,4,1,1,410,418);
INSERT INTO LIBRO (isbn,titulo,fechapublicacion,edicion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigo,codigoespecial)VALUES('978-99924-79-84-1','Aproximacion a la historia de Rio San Juan',STR_TO_DATE('2013','%Y'),'3ra edicion','Libro sobre la historia de Rio San Juan',190,1,1,2,1,900,972);
INSERT INTO LIBRO (isbn,depositolegal,titulo,fechapublicacion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigo,codigoespecial)VALUES('968-422-216-5','M. 23.299-1990','BASIC Avanzado Tratamiento y diseño de archivos',STR_TO_DATE('1990','%Y'),'Libro sobre BASIC',333,6,2,1,3,000,005);
INSERT INTO LIBRO (isbn,titulo,fechapublicacion,edicion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigo,codigoespecial)VALUES('978-970-810-304-6','El Zahir',STR_TO_DATE('2010','%Y'),'4ta reimpresion','Libro de literatura de Paulo Coelho',352,10,2,1,1,860,863);
INSERT INTO LIBRO (isbn,depositolegal,titulo,fechapublicacion,edicion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigo,codigoespecial)VALUES('84-7888-994-9','B-51.244-2005','Harry Potter y el misterio del principe',STR_TO_DATE('2006','%Y'),'1ra edicion','6to libro en serie de Harry Potter',609,3,8,4,1,860,863);

-- Valores para préstamo
INSERT INTO prestamo (idusuario, idbibliotecario, fechaprestamo, fechadevolucion, cantidad, estado)
VALUES(1,1, STR_TO_DATE('12/04/2017','%d/%m/%Y'), STR_TO_DATE('19/04/2017','%d/%m/%Y'), 1, 'Prestamo Vigente');

INSERT INTO prestamo (idusuario, idbibliotecario, fechaprestamo, fechadevolucion, cantidad, estado)
VALUES(2,2, STR_TO_DATE('18/07/2017','%d/%m/%Y'), STR_TO_DATE('23/07/2017','%d/%m/%Y'), 1, 'Prestamo Vigente');

INSERT INTO prestamo (idusuario, idbibliotecario, fechaprestamo, fechadevolucion, cantidad, estado)
VALUES(3,3, STR_TO_DATE('08/08/2017','%d/%m/%Y'),STR_TO_DATE('12/08/2017','%d/%m/%Y'), 2, 'Prestamo Vencido');

INSERT INTO prestamo (idusuario, idbibliotecario, fechaprestamo, fechadevolucion, cantidad, estado)
VALUES(4,4, STR_TO_DATE('21/08/2017','%d/%m/%Y'), STR_TO_DATE('25/08/2017','%d/%m/%Y'), 3, 'Prestamo Vigente');

INSERT INTO prestamo (idusuario, idbibliotecario, fechaprestamo, fechadevolucion, cantidad, estado)
VALUES(5,1, STR_TO_DATE('17/10/2017','%d/%m/%Y'), STR_TO_DATE('23/10/2017','%d/%m/%Y'), 1, 'Prestamo Finalizado');

INSERT INTO detallelibro (idlibro,isbn,idautor,ideditorial)values(1,'980-01-0024-5',1,1);
INSERT INTO detallelibro (idlibro,isbn,idautor,ideditorial)values(2,'978-99924-79-84-1',2,2);
INSERT INTO detallelibro (idlibro,isbn,idautor,ideditorial)values(3,'968-422-216-5',3,3);
INSERT INTO detallelibro (idlibro,isbn,idautor,ideditorial)values(4,'978-970-810-304-6',4,4);
INSERT INTO detallelibro (idlibro,isbn,idautor,ideditorial)values(5,'84-7888-994-9',5,5);

-- Valores para detalle_préstamo
INSERT INTO DetallePrestamo(idlibro,Isbn,idprestamo)
VALUES(1,'980-01-0024-5',1);
INSERT INTO DetallePrestamo(idlibro,Isbn,idprestamo)
VALUES(2,'978-99924-79-84-1',2);
INSERT INTO DetallePrestamo(idlibro,Isbn,idprestamo)
VALUES(3,'968-422-216-5',3);
INSERT INTO DetallePrestamo(idlibro,Isbn,idprestamo)
VALUES(4,'978-970-810-304-6',4);
INSERT INTO DetallePrestamo(idlibro,Isbn,idprestamo)
VALUES(5,'84-7888-994-9',5);
