-- Generado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   en:        2024-06-13 19:38:37 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE asignar (
    id_asignar               INTEGER NOT NULL,
    vehiculo_id_vehiculo     INTEGER NOT NULL,
    inventario_id_inventario INTEGER NOT NULL,
    sucursal_id_sucursal     INTEGER NOT NULL
);

ALTER TABLE asignar ADD CONSTRAINT asignar_inventario_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asignar_emp (
    id_asignar           INTEGER NOT NULL,
    empleado_id_empleado INTEGER NOT NULL,
    sucursal_id_sucursal INTEGER NOT NULL
);

ALTER TABLE asignar_emp ADD CONSTRAINT asignar_emp_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asignar_modelo (
    id_asignar           INTEGER NOT NULL,
    modelo_id_modelo     INTEGER NOT NULL,
    vehiculo_id_vehiculo INTEGER NOT NULL
);

ALTER TABLE asignar_modelo ADD CONSTRAINT asignar_modelo_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asignar_prod (
    id_asignar             INTEGER NOT NULL,
    proveedor_id_proveedor INTEGER NOT NULL,
    vehiculo_id_vehiculo   INTEGER NOT NULL
);

ALTER TABLE asignar_prod ADD CONSTRAINT asignar_prod_pk PRIMARY KEY ( id_asignar );

CREATE TABLE cliente (
    id_cliente    INTEGER NOT NULL,
    nombre        VARCHAR2(100) NOT NULL,
    direccion     VARCHAR2(100) NOT NULL,
    telefono      INTEGER NOT NULL,
    telefono_casa INTEGER NOT NULL,
    correo        VARCHAR2(100) NOT NULL,
    dpi           INTEGER NOT NULL,
    nit           INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE departamento (
    id_departamento INTEGER NOT NULL,
    nombre          VARCHAR2(50) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE empleado (
    id_empleado  INTEGER NOT NULL,
    nombre       VARCHAR2(100) NOT NULL,
    dpi          INTEGER NOT NULL,
    nit          INTEGER NOT NULL,
    telefono     INTEGER NOT NULL,
    sueldo       NUMBER NOT NULL,
    fecha_inicio DATE NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE empresa (
    id_empresa INTEGER NOT NULL,
    nombre     VARCHAR2(50) NOT NULL
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE inventario (
    id_invent           INTEGER NOT NULL,
    cantidad_disponible INTEGER NOT NULL,
    cantidad_vendida    INTEGER NOT NULL
);

ALTER TABLE inventario ADD CONSTRAINT inventario_pk PRIMARY KEY ( id_invent );

CREATE TABLE modelo (
    id_modelo   INTEGER NOT NULL,
    descripcion VARCHAR2(50) NOT NULL
);

ALTER TABLE modelo ADD CONSTRAINT modelo_pk PRIMARY KEY ( id_modelo );

CREATE TABLE municipio (
    id_municipio                 INTEGER NOT NULL,
    nombre                       VARCHAR2(50) NOT NULL,
    departamento_id_departamento INTEGER NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( id_municipio );

CREATE TABLE proveedor (
    id_proveedor       INTEGER NOT NULL,
    nombre             VARCHAR2(100) NOT NULL,
    direccion          VARCHAR2(100) NOT NULL,
    telefono           INTEGER NOT NULL,
    correo             VARCHAR2(25) NOT NULL,
    empresa_id_empresa INTEGER NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE sucursal (
    id_sucursal INTEGER NOT NULL,
    nombre      VARCHAR2(100) NOT NULL,
    direccion   VARCHAR2(100) NOT NULL,
    telefono    INTEGER NOT NULL,
    sitio_web   VARCHAR2(100) NOT NULL
);

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( id_sucursal );

CREATE TABLE sucursalv1 (
    municipio_id_municipio INTEGER NOT NULL,
    sucursal_id_sucursal   INTEGER NOT NULL
);

ALTER TABLE sucursalv1 ADD CONSTRAINT sucursalv1_pk PRIMARY KEY ( municipio_id_municipio,
                                                                  sucursal_id_sucursal );

CREATE TABLE tarjeta (
    id_tarjeta         INTEGER NOT NULL,
    banco              VARCHAR2(100) NOT NULL,
    numero_tarjeta     INTEGER NOT NULL,
    cliente_id_cliente INTEGER NOT NULL
);

ALTER TABLE tarjeta ADD CONSTRAINT tarjeta_pk PRIMARY KEY ( id_tarjeta );

CREATE TABLE transaccion (
    id_transaccion       INTEGER NOT NULL,
    tipo                 CHAR(1) NOT NULL,
    banco                CHAR(1) NOT NULL,
    tarjeta_credito      INTEGER NOT NULL,
    monto                NUMBER NOT NULL,
    fecha_transaccion    DATE NOT NULL,
    fecha_venta          DATE NOT NULL,
    descuento            NUMBER NOT NULL,
    cliente_id_cliente   INTEGER NOT NULL,
    sucursal_id_sucursal INTEGER NOT NULL
);

ALTER TABLE transaccion ADD CONSTRAINT transaccion_pk PRIMARY KEY ( id_transaccion );

CREATE TABLE vehiculo (
    id_vehiculo    INTEGER NOT NULL,
    numero_placa   INTEGER NOT NULL,
    color          VARCHAR2(50) NOT NULL,
    marca          VARCHAR2(50) NOT NULL,
    kilometraje    NUMBER NOT NULL,
    anio           DATE NOT NULL,
    transmision    CHAR(1) NOT NULL,
    numero_puertas INTEGER NOT NULL,
    condicion      CHAR(1) NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( id_vehiculo );

ALTER TABLE asignar_emp
    ADD CONSTRAINT asignar_emp_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE asignar_emp
    ADD CONSTRAINT asignar_emp_sucursal_fk FOREIGN KEY ( sucursal_id_sucursal )
        REFERENCES sucursal ( id_sucursal );

ALTER TABLE asignar
    ADD CONSTRAINT asignar_inventario_fk FOREIGN KEY ( inventario_id_inventario )
        REFERENCES inventario ( id_invent );

ALTER TABLE asignar_modelo
    ADD CONSTRAINT asignar_modelo_modelo_fk FOREIGN KEY ( modelo_id_modelo )
        REFERENCES modelo ( id_modelo );

ALTER TABLE asignar_modelo
    ADD CONSTRAINT asignar_modelo_vehiculo_fk FOREIGN KEY ( vehiculo_id_vehiculo )
        REFERENCES vehiculo ( id_vehiculo );

ALTER TABLE asignar_prod
    ADD CONSTRAINT asignar_prod_proveedor_fk FOREIGN KEY ( proveedor_id_proveedor )
        REFERENCES proveedor ( id_proveedor );

ALTER TABLE asignar_prod
    ADD CONSTRAINT asignar_prod_vehiculo_fk FOREIGN KEY ( vehiculo_id_vehiculo )
        REFERENCES vehiculo ( id_vehiculo );

ALTER TABLE asignar
    ADD CONSTRAINT asignar_sucursal_fk FOREIGN KEY ( sucursal_id_sucursal )
        REFERENCES sucursal ( id_sucursal );

ALTER TABLE asignar
    ADD CONSTRAINT asignar_vehiculo_fk FOREIGN KEY ( vehiculo_id_vehiculo )
        REFERENCES vehiculo ( id_vehiculo );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_empresa_fk FOREIGN KEY ( empresa_id_empresa )
        REFERENCES empresa ( id_empresa );

ALTER TABLE sucursalv1
    ADD CONSTRAINT sucursalv1_municipio_fk FOREIGN KEY ( municipio_id_municipio )
        REFERENCES municipio ( id_municipio );

ALTER TABLE sucursalv1
    ADD CONSTRAINT sucursalv1_sucursal_fk FOREIGN KEY ( sucursal_id_sucursal )
        REFERENCES sucursal ( id_sucursal );

ALTER TABLE tarjeta
    ADD CONSTRAINT tarjeta_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE transaccion
    ADD CONSTRAINT transaccion_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE transaccion
    ADD CONSTRAINT transaccion_sucursal_fk FOREIGN KEY ( sucursal_id_sucursal )
        REFERENCES sucursal ( id_sucursal );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             33
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
