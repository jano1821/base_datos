--use incloudt_logistica;
CREATE TABLE almacen
(
	codAlmacen           INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(200) NULL,
	estadoRegistro       VARCHAR(1) NULL,
	usuarioInsercion     VARCHAR(30) NULL,
	fechaInsercion       DATETIME NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codAlmacen)
);

CREATE TABLE historico_movimientos
(
	codHistorico         CHAR(18) NOT NULL AUTO_INCREMENT,
	fechaMovimiento      CHAR(18) NULL,
	ingresoEgreso        CHAR(18) NULL,
	codProducto          INTEGER NULL,
	codUbicacion         INTEGER NULL,
	codProveedor         CHAR(18) NULL,
    PRIMARY KEY (codHistorico)
);

    CREATE TABLE logistica
(
	codLogistica         INTEGER NOT NULL AUTO_INCREMENT,
	codProducto          INTEGER NOT NULL,
	cantidad             DECIMAL(8,2) NOT NULL,
	minimo               DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (codLogistica)
);

CREATE TABLE marca
(
	codMarca             INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(200) NULL,
	estadoRegistro       VARCHAR(1) NULL,
	usuarioInsercion     VARCHAR(30) NULL,
	fechaInsercion       DATETIME NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codMarca)
);

CREATE TABLE modelo
(
	codModelo            INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(200) NOT NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codModelo)
);

CREATE TABLE producto
(
	codProducto          INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(500) NOT NULL,
	codModelo            INTEGER NOT NULL,
	codMarca             INTEGER NOT NULL,
	imagen               VARCHAR(500) NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
	fechaBaja            DATETIME NULL,
	motivoBaja           VARCHAR(300) NULL,
    PRIMARY KEY (codProducto)
);

CREATE TABLE producto_proveedor
(
	codProducto          INTEGER NOT NULL,
	codProveedor         INTEGER NOT NULL
);



ALTER TABLE producto_proveedor
ADD PRIMARY KEY (codProducto,codProveedor);



CREATE TABLE producto_ubicacion
(
	codUbicacion         INTEGER NOT NULL AUTO_INCREMENT,
	codSeccion           INTEGER NULL,
	codZona              INTEGER NULL,
	codSector            INTEGER NULL,
	codProducto          INTEGER NULL,
	codAlmacen           INTEGER NULL,
    PRIMARY KEY (codUbicacion)
);

CREATE TABLE producto_unidad
(
	correlativo          INTEGER NOT NULL AUTO_INCREMENT,
	codUnidadPadre       INTEGER NULL,
	codProducto          INTEGER NULL,
	indicadorPrincipal   VARCHAR(1) NULL,
	codUnidadHijo        INTEGER NULL,
	contenido            DECIMAL(8,2,) NULL,
	estadoRegistro       VARCHAR(1) NULL,
	usuarioInsercion     VARCHAR(30) NULL,
	fechaInsercion       DATETIME NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (correlativo)
);

CREATE TABLE seccion
(
	codSeccion           INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(200) NOT NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codSeccion)
);

CREATE TABLE sector
(
	codSector            INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(200) NOT NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codSector)
);

CREATE TABLE unidad_medida
(
	codUnidad            INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(100) NOT NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codUnidad)
);

CREATE TABLE zona
(
	codZona              INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(200) NOT NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codZona)
);

ALTER TABLE historico_movimientos
ADD FOREIGN KEY R_13 (codProducto) REFERENCES producto (codProducto);

ALTER TABLE historico_movimientos
ADD FOREIGN KEY R_14 (codUbicacion) REFERENCES producto_ubicacion (codUbicacion);

ALTER TABLE logistica
ADD FOREIGN KEY R_11 (codProducto) REFERENCES producto (codProducto);

ALTER TABLE producto
ADD FOREIGN KEY R_2 (codModelo) REFERENCES modelo (codModelo);

ALTER TABLE producto
ADD FOREIGN KEY R_3 (codMarca) REFERENCES marca (codMarca);

ALTER TABLE producto_proveedor
ADD FOREIGN KEY R_1 (codProducto) REFERENCES producto (codProducto);

ALTER TABLE producto_ubicacion
ADD FOREIGN KEY R_4 (codSeccion) REFERENCES seccion (codSeccion);

ALTER TABLE producto_ubicacion
ADD FOREIGN KEY R_5 (codZona) REFERENCES zona (codZona);

ALTER TABLE producto_ubicacion
ADD FOREIGN KEY R_6 (codSector) REFERENCES sector (codSector);

ALTER TABLE producto_ubicacion
ADD FOREIGN KEY R_7 (codProducto) REFERENCES producto (codProducto);

ALTER TABLE producto_ubicacion
ADD FOREIGN KEY R_8 (codAlmacen) REFERENCES almacen (codAlmacen);

ALTER TABLE producto_unidad
ADD FOREIGN KEY R_9 (codUnidadPadre) REFERENCES unidad_medida (codUnidad);

ALTER TABLE producto_unidad
ADD FOREIGN KEY R_10 (codProducto) REFERENCES producto (codProducto);

ALTER TABLE producto_unidad
ADD FOREIGN KEY R_12 (codUnidadHijo) REFERENCES unidad_medida (codUnidad);