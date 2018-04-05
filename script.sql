-- HonDB
-- Script para creacion de tablas en la BD
-- Por Gabriel,Bryan,Nelson y Leonardo
-- Creado sábado,4 de marzo de 2018
-- Universidad Centroamericana ISI

-- Tabla Ubicación



CREATE TABLE ubicacion (
    idubicacion   SMALLINT AUTO_INCREMENT,
    CONSTRAINT pk_ubicacion PRIMARY KEY ( idubicacion ),
  	Pais        VARCHAR(10) NOT NULL,
	Ciudad		VARCHAR(10),
	Nacionalidad VARCHAR(15) NOT NULL

);

-- TABLA Bibliotecario
CREATE TABLE bibliotecario (
    idbibliotecario   SMALLINT AUTO_INCREMENT,
    CONSTRAINT pk_bibliotecario PRIMARY KEY ( idbibliotecario ),
    nombre            VARCHAR(20) NOT NULL,
    apellido          VARCHAR(20) NOT NULL,
    usuario			  VARCHAR(20),
    contraseña 	  	  VARCHAR(20)
);

-- Tabla Estado
CREATE TABLE estado (
    idestado   TINYINT AUTO_INCREMENT,
    CONSTRAINT pk_estado PRIMARY KEY ( idestado ),
    estado     VARCHAR(20) NOT NULL
);

-- Tabla TipoDocumento
CREATE TABLE tipodocumento (
    idtipodocumento   TINYINT AUTO_INCREMENT,
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
    idusuario        INT AUTO_INCREMENT,
    CONSTRAINT pk_usuario PRIMARY KEY ( idusuario ),
    nombre           VARCHAR(20) NOT NULL,
    apellido         VARCHAR(20) NOT NULL,
    identificacion   VARCHAR(20) NOT NULL,
    sexo             VARCHAR(10),
    idubicacion      SMALLINT NOT NULL,
	    CONSTRAINT fk_USUARIO_ubicacion FOREIGN KEY (idubicacion) 
        REFERENCES ubicacion (idubicacion)
);

-- TABLA Autor
CREATE TABLE autor (
    idautor           INT AUTO_INCREMENT,
    CONSTRAINT pk_autor PRIMARY KEY ( idautor ),
    nombre            VARCHAR(20) NOT NULL,
    apellido          VARCHAR(20) NOT NULL,
    sexo              VARCHAR(10),
    idubicacion       SMALLINT NOT NULL,
		CONSTRAINT fk_AUTOR_ubicacion FOREIGN KEY (idubicacion)
            REFERENCES ubicacion ( idubicacion ),
    fechanacimiento   DATE NULL
);

-- TABLA CategoriaEspecial
CREATE TABLE categoriaespecial (
    codigoespecial   SMALLINT PRIMARY KEY,
    nombre           VARCHAR(50) NOT NULL,
    codigogeneral    SMALLINT NOT NULL,
        CONSTRAINT fk_catespecial_catgeneral FOREIGN KEY (codigogeneral)
            REFERENCES categoriageneral ( codigogeneral )
);

-- Tabla Editorial
CREATE TABLE editorial (
    ideditorial   SMALLINT AUTO_INCREMENT,
    CONSTRAINT pk_editorial PRIMARY KEY ( ideditorial ),
    nombre        VARCHAR(60) NOT NULL,
    idubicacion   SMALLINT NOT NULL,
        CONSTRAINT fk_editorial_ubicacion FOREIGN KEY (idubicacion)
            REFERENCES ubicacion ( idubicacion )
);

-- TABLA LIBRO
CREATE TABLE libro (
    idlibro            INT AUTO_INCREMENT,
    CONSTRAINT pk_libro PRIMARY KEY ( idlibro ),
    isbn               VARCHAR(25) UNIQUE,
    depositolegal      VARCHAR(20),
    titulo             VARCHAR(100) NOT NULL,
    fechapublicacion   DATETIME NOT NULL,
    edicion            VARCHAR(15),
    descripcion        VARCHAR(300),
    paginas            SMALLINT,
    numejemplares      TINYINT NOT NULL,
    idubicacion        SMALLINT NOT NULL,
        CONSTRAINT fk_ubicacion_libro FOREIGN KEY (idubicacion)
            REFERENCES ubicacion ( idubicacion ),
    idestado           DECIMAL(2) NOT NULL,
        CONSTRAINT fk_estado_libro FOREIGN KEY (idestado)
            REFERENCES estado ( idestado ),
    idtipodocumento    DECIMAL(3) NOT NULL,
        CONSTRAINT fk_tipodocumento_libro FOREIGN KEY (idtipodocumento)
            REFERENCES tipodocumento ( idtipodocumento ),
    codigogeneral             DECIMAL(3) NOT NULL,
        CONSTRAINT fk_codigogeneral_libro FOREIGN KEY (codigogeneral)
            REFERENCES categoriageneral ( codigogeneral ),
    codigoespecial     DECIMAL(3) NOT NULL,
        CONSTRAINT fk_codigoespecial_libro FOREIGN KEY (codigoespecial)
            REFERENCES categoriaespecial ( codigoespecial )
);

-- TABLA PRESTAMO
CREATE TABLE prestamo (
    idprestamo        INT AUTO_INCREMENT,
    CONSTRAINT pk_prestamo PRIMARY KEY ( idprestamo ),
    fechaprestamo     DATETIME NOT NULL,
    fechadevolucion   DATETIME NOT NULL,
    cantidad          TINYINT NOT NULL,
    estado            VARCHAR(20) NOT NULL,
    idusuario         SMALLINT NOT NULL,
        CONSTRAINT fk_usuario_prestamo FOREIGN KEY (idusuario)
            REFERENCES usuario ( idusuario ),
    idbibliotecario   DECIMAL(4) NOT NULL,
        CONSTRAINT fk_bibliotecario_prestamo FOREIGN KEY (idbibliotecario)
            REFERENCES bibliotecario ( idbibliotecario )
);

-- TABLA DETALLE LIBRO
CREATE TABLE detallelibro (
    iddetallelibro   INT AUTO_INCREMENT,
    CONSTRAINT pk_detallelibro PRIMARY KEY ( iddetallelibro ),
    idlibro          INT NOT NULL,
    CONSTRAINT fk_libro_detallelibro FOREIGN KEY ( idlibro)
        REFERENCES libro ( idlibro ),
    idautor          INT NOT NULL,
        CONSTRAINT fk_autor_detallelibro FOREIGN KEY (idautor)
            REFERENCES autor ( idautor ),
    ideditorial      DECIMAL(3) NOT NULL,
        CONSTRAINT fk_editorial_detallelibro FOREIGN KEY (ideditorial)
            REFERENCES editorial ( ideditorial )
);

-- Tabla DetallePrestamo
CREATE TABLE detalleprestamo (
    iddetalleprestamo   INT AUTO_INCREMENT,
    CONSTRAINT pk_detalleprestamo PRIMARY KEY ( iddetalleprestamo ),
    idprestamo          INT NOT NULL,
        CONSTRAINT fk_detalleprestamo_prestamo FOREIGN KEY (idprestamo)
            REFERENCES prestamo ( idprestamo ),
    idlibro             DECIMAL(6) NOT NULL,
    CONSTRAINT fk_libro_detalleprestamo FOREIGN KEY ( idlibro )
        REFERENCES libro ( idlibro )
);

INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Nicaragua','Managua','Nicaraguense');
INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Mexico','D.F.','Mexicano');
INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Colombia','Medellin','Colombiano');
INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Venezuela','Caracas','Venezolano');
INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Alemania','Berlin','Alemania');
INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Espania','Cadiz','Espaniol');
INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Espania','Madrid','Espaniol');
INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Espania','Barcelona','Espaniol');
INSERT INTO ubicacion(pais,ciudad,nacionalidad)VALUES('Brasil','Brasilia','Brasilenio');

INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Roberto','Montano','000017547','Masculino',1);
INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Maria','Lopez','000056489','Femenino',2);
INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Bryan','Perez','000023548','Masculino',1);
INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Leonardo','Cardoza','000017562','Masculino',4);
INSERT INTO usuario (nombre,apellido,identificacion,sexo,idubicacion) VALUES ('Nelson','Cerros','000078523','Masculino',5);

INSERT INTO tipodocumento(nombre)VALUES('Libro');
INSERT INTO tipodocumento(nombre)VALUES('Tesis de Pregrado');
INSERT INTO tipodocumento(nombre)VALUES('Tesis de Posgrado');
INSERT INTO tipodocumento(nombre)VALUES('Publicaciones periodicas');
INSERT INTO tipodocumento(nombre)VALUES('Bibliografias');

INSERT INTO estado(estado)VALUES('EN EXISTENCIA');
INSERT INTO estado(estado)VALUES('EN PRESTAMO ED UNIC');
INSERT INTO estado(estado)VALUES('EN PRESTAMO');
INSERT INTO estado(estado)VALUES('BAJO CONSUMO');
INSERT INTO estado(estado)VALUES('AGOTADO');

INSERT INTO editorial(nombre,idubicacion)VALUES('Monte Avila Latinoamericana, C.A.',4);
INSERT INTO editorial(nombre,idubicacion)VALUES('HISPAMER',1);
INSERT INTO editorial(nombre,idubicacion)VALUES('Libros McGraw-Hill de Mexico, S.A. de C.V.',2);
INSERT INTO editorial(nombre,idubicacion)VALUES('Random House Mondadori, S.A. de C.V.',2);
INSERT INTO editorial(nombre,idubicacion)VALUES('Publicaciones y Ediciones Salamandra, S.A.',9);

INSERT INTO autor (nombre,apellido,sexo,idubicacion) VALUES ('Antonio','Pasquali','Masculino',4);
INSERT INTO autor (nombre,apellido,sexo,idubicacion) VALUES ('Joaquim','Rabella Vives','Masculino',1);
INSERT INTO autor (nombre,apellido,sexo,idubicacion) VALUES ('Luis','Joyanes Aguilar','Masculino',7);
INSERT INTO autor (nombre,apellido,sexo,idubicacion) VALUES ('Paulo','Coelho','Masculino',8);
INSERT INTO autor (nombre,apellido,sexo,idubicacion) VALUES ('Antonio','Pasquali','Masculino',1);

INSERT INTO bibliotecario (nombre,apellido) VALUES ('Roberto','Montano');
INSERT INTO bibliotecario (nombre,apellido) VALUES ('Julian','Romero');
INSERT INTO bibliotecario (nombre,apellido) VALUES ('Alberto','Reyes');
INSERT INTO bibliotecario (nombre,apellido) VALUES ('Armando','Casas');
INSERT INTO bibliotecario (nombre,apellido) VALUES ('Carlos','Lopez');


INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(000,'Generalidades');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(100,'Filosofía & Psicologia');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(200,'Religion');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(300,'Ciencias Sociales');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(400,'Lenguas');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(500,'Ciencias Naturales & Matematicas');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(600,'Tecnologia (Ciencias aplicadas)');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(700,'Las Artes');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(800,'Literatura & Retórica');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(900,'Geografia & Historia');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(010,'Bibliografia');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(110,'Metafisica');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(210,'Filosofia & teoria de la religion');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(310,'Colecs. de estadística general');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(410,'Linguistica');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(510,'Matematicas');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(610,'Ciencias Medicas Medicina');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(710,'Urbanismo & Arte del paisaje');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(860,'Literaturas española & portuguesa');
INSERT INTO categoriageneral (codigogeneral,nombre)VALUES(970,'Historia General de América del Norte');

INSERT INTO categoriaespecial (codigoespecial,nombre,codigogeneral)VALUES(418,'Uso estándar, Lingüística aplicada',410);
INSERT INTO categoriaespecial (codigoespecial,nombre,codigogeneral)VALUES(972,'Mesoamérica, México',970);
INSERT INTO categoriaespecial (codigoespecial,nombre,codigogeneral)VALUES(005,'Programación, programas, datos de computación',000);
INSERT INTO categoriaespecial (codigoespecial,nombre,codigogeneral)VALUES(863,'Ficción española',860);


INSERT INTO libro (isbn,titulo,fechapublicacion,edicion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigogeneral,codigoespecial)VALUES('980-01-0024-5','Comprender la comunicacion',STR_TO_DATE('1990','%Y'),'4ta edicion','Libro sobre comunicacion',306,5,4,1,1,410,418);
INSERT INTO libro (isbn,titulo,fechapublicacion,edicion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigogeneral,codigoespecial)VALUES('978-99924-79-84-1','Aproximacion a la historia de Rio San Juan',STR_TO_DATE('2013','%Y'),'3ra edicion','Libro sobre la historia de Rio San Juan',190,1,1,2,1,900,972);
INSERT INTO libro (isbn,depositolegal,titulo,fechapublicacion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigogeneral,codigoespecial)VALUES('968-422-216-5','M. 23.299-1990','BASIC Avanzado Tratamiento y diseño de archivos',STR_TO_DATE('1990','%Y'),'Libro sobre BASIC',333,6,2,1,3,000,005);
INSERT INTO libro (isbn,titulo,fechapublicacion,edicion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigogeneral,codigoespecial)VALUES('978-970-810-304-6','El Zahir',STR_TO_DATE('2010','%Y'),'4ta reimpresion','Libro de literatura de Paulo Coelho',352,10,2,1,1,860,863);
INSERT INTO libro (isbn,depositolegal,titulo,fechapublicacion,edicion,descripcion,paginas,numejemplares,idubicacion,idestado,idtipodocumento,codigogeneral,codigoespecial)VALUES('84-7888-994-9','B-51.244-2005','Harry Potter y el misterio del principe',STR_TO_DATE('2006','%Y'),'1ra edicion','6to libro en serie de Harry Potter',609,3,8,4,1,860,863);

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

INSERT INTO detallelibro (idlibro,idautor,ideditorial)values(1,1,1);
INSERT INTO detallelibro (idlibro,idautor,ideditorial)values(2,2,2);
INSERT INTO detallelibro (idlibro,idautor,ideditorial)values(3,3,3);
INSERT INTO detallelibro (idlibro,idautor,ideditorial)values(4,4,4);
INSERT INTO detallelibro (idlibro,idautor,ideditorial)values(5,5,5);

-- Valores para detalle_préstamo
INSERT INTO detalleprestamo(idlibro,idprestamo)
VALUES(1,1);
INSERT INTO detalleprestamo(idlibro,idprestamo)
VALUES(2,2);
INSERT INTO detalleprestamo(idlibro,idprestamo)
VALUES(3,3);
INSERT INTO detalleprestamo(idlibro,idprestamo)
VALUES(4,4);
INSERT INTO detalleprestamo(idlibro,idprestamo)
VALUES(5,5);
