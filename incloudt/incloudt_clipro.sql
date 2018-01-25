use incloudt_clipro;

CREATE TABLE cliente
(
	codPersona           INTEGER NOT NULL,
    PRIMARY KEY (codPersona)
);

CREATE TABLE departamento
(
	codDepartamento      INTEGER NOT NULL AUTO_INCREMENT,
	nombreDepartamento   varchar(100) NULL,
    PRIMARY KEY (codDepartamento)
);

CREATE TABLE direccion
(
	codDireccion         int NOT NULL AUTO_INCREMENT,
	direccion            varchar(500) NULL,
	codPersona           INTEGER NULL,
	estadoRegistro       varchar(1) NOT NULL,
	usuarioInsercion     varchar(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  varchar(30) NULL,
	fechaModificacion    DATETIME NULL,
	codDistrito          INTEGER NOT NULL,
    PRIMARY KEY (codDireccion)
);

CREATE TABLE distrito
(
	codDistrito          INTEGER NOT NULL AUTO_INCREMENT,
	nombreDistrito       varchar(100) NULL,
	codProvincia         INTEGER NOT NULL,
    PRIMARY KEY (codDistrito)
);

CREATE TABLE persona
(
	codPersona           INTEGER NOT NULL AUTO_INCREMENT,
	nombrePersona        varchar(250) NOT NULL,
	apePat               varchar(200) NOT NULL,
	apeMat               varchar(200) NOT NULL,
	sexo                 varchar(1) NULL,
	edad                 int NULL,
	numeroDocumento      varchar(40) NOT NULL,
	razonSocial          varchar(500) NULL,
	estadoRegistro       varchar(1) NOT NULL,
	usuarioInsercion     varchar(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  varchar(30) NULL,
	fechaModificacion    DATETIME NULL,
	codTipoDocumento     int NOT NULL,
    PRIMARY KEY (codPersona)
);

CREATE TABLE proveedor
(
	codPersona           INTEGER NOT NULL,
    PRIMARY KEY (codPersona)
);

CREATE TABLE provincia
(
	codProvincia         INTEGER NOT NULL AUTO_INCREMENT,
	nombreProvincia      varchar(100) NULL,
	codDepartamento      INTEGER NOT NULL,
    PRIMARY KEY (codProvincia)
);

CREATE TABLE telefono
(
	codTelefono          int NOT NULL AUTO_INCREMENT,
	numeroTelefono       varchar(40) NULL,
	codPersona           INTEGER NOT NULL,
    codOperador          INTEGER NOT NULL,
	estadoRegistro       VARCHAR(1) NULL,
	usuarioInsercion     varchar(1) NULL,
	fechaInsercion       DATETIME NULL,
	usuarioModificacion  varchar(1) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codTelefono)
);

CREATE TABLE tipo_documento
(
	codTipoDocumento     int NOT NULL AUTO_INCREMENT,
	descripcionTipoDocumento varchar(250) NULL,
	estadoRegistro       varchar(1) NULL,
	usuarioInsercion     varchar(30) NULL,
	fechaInsercion       DATETIME NULL,
	usuarioModificacion  varchar(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codTipoDocumento)
);

CREATE TABLE operador
(
	codOperador          INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(150) NULL,
	estadoRegistro       VARCHAR(1) NULL,
	usuarioInsercion     VARCHAR(30) NULL,
	fechaInsercion       DATETIME NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
	PRIMARY KEY (codOperador)
);

CREATE TABLE empleado
(
	codPersona           INTEGER NOT NULL,
	PRIMARY KEY (codPersona)
);


ALTER TABLE cliente
ADD FOREIGN KEY R_5 (codPersona) REFERENCES persona (codPersona);



ALTER TABLE direccion
ADD FOREIGN KEY R_2 (codPersona) REFERENCES persona (codPersona);



ALTER TABLE direccion
ADD FOREIGN KEY R_8 (codDistrito) REFERENCES distrito (codDistrito);



ALTER TABLE distrito
ADD FOREIGN KEY R_7 (codProvincia) REFERENCES provincia (codProvincia);



ALTER TABLE persona
ADD FOREIGN KEY R_3 (codTipoDocumento) REFERENCES tipo_documento (codTipoDocumento);



ALTER TABLE proveedor
ADD FOREIGN KEY R_4 (codPersona) REFERENCES persona (codPersona);



ALTER TABLE provincia
ADD FOREIGN KEY R_6 (codDepartamento) REFERENCES departamento (codDepartamento);



ALTER TABLE telefono
ADD FOREIGN KEY R_1 (codPersona) REFERENCES persona (codPersona);



ALTER TABLE telefono
ADD FOREIGN KEY R_9 (codOperador) REFERENCES operador (codOperador);



ALTER TABLE empleado
ADD FOREIGN KEY R_10 (codPersona) REFERENCES persona (codPersona);
