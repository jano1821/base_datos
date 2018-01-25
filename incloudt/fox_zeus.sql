--
-- Estructura de tabla para la tabla empresa
--
CREATE TABLE empresa (
  codEmpresa INTEGER NOT NULL AUTO_INCREMENT,
  nombreEmpresa varchar(500) NOT NULL,
  razonSocial varchar(500) DEFAULT NULL,
  limiteUsuarios INTEGER DEFAULT NULL COMMENT 'Cantidad maxima de Usuarios que se pueden Registrar por Empresa',
  identificadorEmpresa varchar(30) NOT NULL COMMENT 'Usuario único por Empresa',
  estadoRegistro varchar(1) NOT NULL COMMENT 'S:Activo/N:No Activo/B:Bloqueado',
  fechaInsercion datetime NOT NULL,
  usuarioInsercion varchar(30) NOT NULL,
  fechaModificacion datetime DEFAULT NULL,
  usuarioModificacion varchar(30) DEFAULT NULL,
    PRIMARY KEY (codEmpresa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla empresa
--

INSERT INTO empresa (codEmpresa, nombreEmpresa, razonSocial, limiteUsuarios, identificadorEmpresa, estadoRegistro, fechaInsercion, usuarioInsercion, fechaModificacion, usuarioModificacion) VALUES
(1, 'INCLOUDT', NULL, NULL, '1ncl0udt', 'S', '2018-01-12 00:00:00', 'JANO', null, null);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla empresa_sistema
--

CREATE TABLE empresa_sistema (
  codEmpresa INTEGER NOT NULL,
  codSistema INTEGER NOT NULL,
  estadoRegistro varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla errores_sistema
--

CREATE TABLE errores_sistema (
  codError INTEGER NOT NULL AUTO_INCREMENT,
  codUsuario INTEGER NOT NULL,
  codEmpresa INTEGER NOT NULL,
  descripcionError varchar(500) NOT NULL COMMENT 'Descripcion del error',
  claseError varchar(200) NOT NULL COMMENT 'clase y metoido donde ocurrio el error',
  fechaInsercion datetime NOT NULL COMMENT 'fecha y hora donde ocurrio el error',
    PRIMARY KEY (codEmpresa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla parametros_generales
--

CREATE TABLE parametros_generales (
  codParametro INTEGER NOT NULL AUTO_INCREMENT,
  codEmpresa INTEGER NOT NULL,
  identificadorParametro varchar(100) NOT NULL,
  descipcionParametro varchar(200) DEFAULT NULL,
  valorParametro varchar(200) DEFAULT NULL,
  estadoRegistro varchar(1) NOT NULL,
  fechaInsercion datetime NOT NULL,
  usuarioInsercion varchar(30) NOT NULL,
  fechaModificacion datetime DEFAULT NULL,
  usuarioModificacion varchar(30) DEFAULT NULL,
  indicadorFijo varchar(1) DEFAULT NULL COMMENT 'S=puede modificar identificador de parametro',
    PRIMARY KEY (codParametro)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla parametros_generales
--

INSERT INTO parametros_generales (codParametro, codEmpresa, identificadorParametro, descipcionParametro, valorParametro, estadoRegistro, fechaInsercion, usuarioInsercion, fechaModificacion, usuarioModificacion, indicadorFijo) VALUES
(1, 1, 'TIME_OUT_SESSION', 'Tiempo limite de Sesion Activa', '5', 'S', '2017-07-05 00:00:00', 'acnunez', NULL, NULL, 'S'),
(2, 1, 'LLAVE_HASH', 'Llave de encriptacion Hash para datos Sensibles', 'VmFtb3NfcG9yX21hc19wdWxwaW4=', 'S', '2017-07-05 00:00:00', 'acnunez', NULL, NULL, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla persona_usuario --- evaluar su existencia
--

CREATE TABLE persona_usuario (
  codPersonaUsuario INTEGER NOT NULL AUTO_INCREMENT,
  nombresPersona varchar(500) NOT NULL,
  ApellidosPersona varchar(500) NOT NULL,
  numeroDocumento varchar(25) NOT NULL,
  numeroCelular varchar(30) DEFAULT NULL,
  numeroAnexo varchar(30) DEFAULT NULL,
  estadoRegistro varchar(1) NOT NULL,
  fechaInsercion datetime NOT NULL,
  usuarioInsercion varchar(30) NOT NULL,
  fechaModificacion datetime DEFAULT NULL,
  usuarioModificacion varchar(30) DEFAULT NULL,
  PRIMARY KEY (codSistema)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla persona_usuario
--

INSERT INTO persona_usuario (codPersonaUsuario, nombresPersona, ApellidosPersona, numeroDocumento, numeroCelular, numeroAnexo, estadoRegistro, fechaInsercion, usuarioInsercion, fechaModificacion, usuarioModificacion) VALUES
(1, 'Alejandro Cesar', 'Nuñez Yupanqui', '44833065', '964713313', '5418', 'S', '2017-10-27 00:00:00', 'jano', '2017-11-03 00:00:00', 'acnunez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla sistema
--

CREATE TABLE sistema (
  codSistema INTEGER NOT NULL AUTO_INCREMENT,
  etiquetaSistema varchar(300) DEFAULT NULL,
  urlSistema varchar(300) DEFAULT NULL,
  urlIcono varchar(300) DEFAULT NULL,
  estadoRegistro varchar(1) DEFAULT NULL,
  fechaInsercion datetime DEFAULT NULL,
  usuarioInsercion varchar(30) DEFAULT NULL,
  fechaModificacion datetime DEFAULT NULL,
  usuarioModificacion varchar(30) DEFAULT NULL,
    PRIMARY KEY (codSistema)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla usuario
--

CREATE TABLE usuario (
  codUsuario INTEGER NOT NULL AUTO_INCREMENT,
  codEmpresa INTEGER NOT NULL,
  codPersonaUsuario INTEGER NOT NULL,
  nombreUsuario varchar(200) NOT NULL,
  passwordUsuario varchar(200) NOT NULL,
  cantidadIntentos INTEGER NOT NULL COMMENT 'cantidad de intentos de ingreso al sistema fallidos',
  indicadorUsuarioAdministrador varchar(1) NOT NULL COMMENT 'S:Administrador/N:No Administrador/Z:Super Admin',
  estadoRegistro varchar(1) NOT NULL COMMENT 'S:Vigente/N:No Vigente',
  fechaInsercion datetime NOT NULL,
  usuarioInsercion varchar(30) NOT NULL,
  fechaModificacion datetime DEFAULT NULL,
  usuarioModificacion varchar(30) DEFAULT NULL,
    PRIMARY KEY (codUsuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla usuario
--

INSERT INTO usuario (codUsuario, codEmpresa, codPersonaUsuario, nombreUsuario, passwordUsuario, cantidadIntentos, indicadorUsuarioAdministrador, estadoRegistro, fechaInsercion, usuarioInsercion, fechaModificacion, usuarioModificacion) VALUES
(1, 1, 1, 'acnunez', '$2y$12$Vm1GdGIzTmZjRzl5WDIxa.2gQYe0cMPidgMxR7sEAYU17oD2RZHte', 0, 'Z', 'S', '2017-10-26 00:00:00', 'jano', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla usuario_sistema
--

CREATE TABLE usuario_sistema (
  codUsuario INTEGER NOT NULL,
  codSistema INTEGER NOT NULL,
  estadoRegistro varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--



--
-- Indices de la tabla empresa_sistema
--
ALTER TABLE empresa_sistema
  ADD KEY fk_empresa_sistema_sistema1_idx (codSistema);

--
-- Indices de la tabla errores_sistema
--
ALTER TABLE errores_sistema
  ADD KEY fk_errores_sistema_usuario1_idx (codUsuario),
  ADD KEY fk_errores_sistema_empresa1_idx (codEmpresa);

--
-- Indices de la tabla parametros_generales
--
ALTER TABLE parametros_generales
  ADD KEY fk_parametros_generales_empresa1_idx1 (codEmpresa);

--
-- Indices de la tabla usuario
--
ALTER TABLE usuario
  ADD UNIQUE KEY nombre_usuario_UNIQUE (nombreUsuario),
  ADD UNIQUE KEY cod_usuario_UNIQUE (codUsuario),
  ADD KEY fk_usuario_empresa1_idx1 (codEmpresa),
  ADD KEY fk_usuario_PersonaUsuario1_idx (codPersonaUsuario);

--
-- Indices de la tabla usuario_sistema
--
ALTER TABLE usuario_sistema
  ADD KEY fk_usuario_sistema_sistema1_idx (codSistema);

--
-- Filtros para la tabla empresa_sistema
--
ALTER TABLE empresa_sistema
  ADD CONSTRAINT fk_empresa_sistema_empresa1 FOREIGN KEY (codEmpresa) REFERENCES empresa (codEmpresa) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_empresa_sistema_sistema1 FOREIGN KEY (codSistema) REFERENCES sistema (codSistema) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla errores_sistema
--
ALTER TABLE errores_sistema
  ADD CONSTRAINT fk_errores_sistema_empresa1 FOREIGN KEY (codEmpresa) REFERENCES empresa (codEmpresa) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_errores_sistema_usuario1 FOREIGN KEY (codUsuario) REFERENCES usuario (codUsuario) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla parametros_generales
--
ALTER TABLE parametros_generales
  ADD CONSTRAINT fk_parametros_generales_empresa1 FOREIGN KEY (codEmpresa) REFERENCES empresa (codEmpresa) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla usuario
--
ALTER TABLE usuario
  ADD CONSTRAINT fk_usuario_PersonaUsuario1 FOREIGN KEY (codPersonaUsuario) REFERENCES persona_usuario (codPersonaUsuario) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_usuario_empresa1 FOREIGN KEY (codEmpresa) REFERENCES empresa (codEmpresa) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla usuario_sistema
--
ALTER TABLE usuario_sistema
  ADD CONSTRAINT fk_usuario_sistema_sistema1 FOREIGN KEY (codSistema) REFERENCES sistema (codSistema) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_usuario_sistema_usuario1 FOREIGN KEY (codUsuario) REFERENCES usuario (codUsuario) ON DELETE NO ACTION ON UPDATE NO ACTION;
                           