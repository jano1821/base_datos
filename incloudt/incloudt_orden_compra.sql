use incloudt_orden_compra;
CREATE TABLE comprobante
(
	codComprobante       INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(300) NOT NULL,
	subTotal             DECIMAL(12,3) NOT NULL,
	total                DECIMAL(12,3) NOT NULL,
	igv                  DECIMAL(12,3) NOT NULL,
	codCliente           INTEGER NOT NULL,
	codVendedor          INTEGER NOT NULL,
	fechaProceso         DATETIME NOT NULL,
	codTipoPago          INTEGER NOT NULL,
    numeroComprobante    VARCHAR(50) NULL,
    codEmpresa           INTEGER NOT NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codComprobante)
);



CREATE TABLE detalle_comprobante
(
	correlativo          INTEGER NOT NULL,
	codComprobante       INTEGER NOT NULL,
	monto                DECIMAL(12,3) NOT NULL,
	cantidad             DECIMAL(12,3) NOT NULL,
	codProducto          INTEGER NOT NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL
);
ALTER TABLE detalle_comprobante
ADD PRIMARY KEY (correlativo,codComprobante);



CREATE TABLE tipo_pago
(
	codTipoPago          INTEGER NOT NULL AUTO_INCREMENT,
	descripcion          VARCHAR(300) NOT NULL,
	codEmpresa           INTEGER NOT NULL,
	estadoRegistro       VARCHAR(1) NOT NULL,
	usuarioInsercion     VARCHAR(30) NOT NULL,
	fechaInsercion       DATETIME NOT NULL,
	usuarioModificacion  VARCHAR(30) NULL,
	fechaModificacion    DATETIME NULL,
    PRIMARY KEY (codTipoPago)
);



ALTER TABLE comprobante
ADD FOREIGN KEY R_1 (codTipoPago) REFERENCES tipo_pago (codTipoPago);



ALTER TABLE detalle_comprobante
ADD FOREIGN KEY R_2 (codComprobante) REFERENCES comprobante (codComprobante);
