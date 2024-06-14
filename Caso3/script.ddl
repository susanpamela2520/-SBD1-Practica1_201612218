-- Generado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   en:        2024-06-13 10:15:41 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE asig_puesto (
    id_asignar               INTEGER NOT NULL,
    ensamblaje_id_ensamblaje INTEGER NOT NULL,
    id_puesto                INTEGER NOT NULL
);

ALTER TABLE asig_puesto ADD CONSTRAINT asignar_puesto_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asignar_bodega (
    id_asignar_bodega    INTEGER NOT NULL,
    bodega_id_bodega     INTEGER NOT NULL,
    producto_id_producto INTEGER NOT NULL
);

ALTER TABLE asignar_bodega ADD CONSTRAINT asignar_bodega_pk PRIMARY KEY ( id_asignar_bodega );

CREATE TABLE asignar_etapa (
    id_asignar_etapa     INTEGER NOT NULL,
    producto_id_producto INTEGER NOT NULL,
    etapa_id_etapa       INTEGER NOT NULL
);

ALTER TABLE asignar_etapa ADD CONSTRAINT asignar_etapa_pk PRIMARY KEY ( id_asignar_etapa );

CREATE TABLE asignar_parte (
    id_asignar_parte     INTEGER NOT NULL,
    producto_id_producto INTEGER NOT NULL,
    parte_id_parte       INTEGER NOT NULL
);

ALTER TABLE asignar_parte ADD CONSTRAINT asignar_parte_pk PRIMARY KEY ( id_asignar_parte );

CREATE TABLE asignar_producto (
    id_asignar_producto  INTEGER NOT NULL,
    cliente_id_cliente   INTEGER NOT NULL,
    producto_id_producto INTEGER NOT NULL
);

ALTER TABLE asignar_producto ADD CONSTRAINT asignar_producto_pk PRIMARY KEY ( id_asignar_producto );

CREATE TABLE asignar_proveedor (
    id_asignar_proveedor   INTEGER NOT NULL,
    proveedor_id_proveedor INTEGER NOT NULL,
    parte_id_parte         INTEGER NOT NULL
);

ALTER TABLE asignar_proveedor ADD CONSTRAINT asignar_proveedor_pk PRIMARY KEY ( id_asignar_proveedor );

CREATE TABLE asignar_soporte (
    id_asignar         INTEGER NOT NULL,
    cliente_id_cliente INTEGER NOT NULL,
    soporte_id_soporte INTEGER NOT NULL
);

ALTER TABLE asignar_soporte ADD CONSTRAINT asignar_soporte_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asinar_linea (
    id_asinar                INTEGER NOT NULL,
    producto_id_producto     INTEGER NOT NULL,
    ensamblaje_id_ensamblaje INTEGER NOT NULL
);

ALTER TABLE asinar_linea ADD CONSTRAINT asinar_linea_pk PRIMARY KEY ( id_asinar );

CREATE TABLE bodega (
    id_bodega                  INTEGER NOT NULL,
    numero_bodega              INTEGER NOT NULL,
    encargo                    VARCHAR2(30) NOT NULL,
    direccion                  VARCHAR2(50) NOT NULL,
    tipo_bodega_id_tipo_bodega INTEGER NOT NULL
);

ALTER TABLE bodega ADD CONSTRAINT bodega_pk PRIMARY KEY ( id_bodega );

CREATE TABLE cliente (
    id_cliente INTEGER NOT NULL,
    nombre     VARCHAR2(100) NOT NULL,
    direccion  VARCHAR2(100) NOT NULL,
    pais       VARCHAR2(100) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE empleado (
    id_empleado              INTEGER NOT NULL,
    codigo_empleado          INTEGER NOT NULL,
    nombre                   VARCHAR2(100) NOT NULL,
    telefono                 INTEGER NOT NULL,
    direccion                VARCHAR2(100) NOT NULL,
    correo                   VARCHAR2(25) NOT NULL,
    horario                  DATE NOT NULL,
    tipo                     CHAR(1) NOT NULL,
    ensamblaje_id_ensamblaje INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE ensamblaje (
    id_ensamblaje INTEGER NOT NULL,
    tipo          CHAR(1) NOT NULL
);

ALTER TABLE ensamblaje ADD CONSTRAINT linea_ensamblaje_pk PRIMARY KEY ( id_ensamblaje );

CREATE TABLE etapa (
    id_etapa INTEGER NOT NULL,
    estado   VARCHAR2(50) NOT NULL,
    costo    NUMBER NOT NULL
);

ALTER TABLE etapa ADD CONSTRAINT etapa_pk PRIMARY KEY ( id_etapa );

CREATE TABLE parte (
    id_parte                 INTEGER NOT NULL,
    codigo_parte             INTEGER NOT NULL,
    nombre                   VARCHAR2(50) NOT NULL,
    color                    VARCHAR2(25) NOT NULL,
    garantia                 DATE NOT NULL,
    tipo_parte_id_tipo_parte INTEGER NOT NULL
);

ALTER TABLE parte ADD CONSTRAINT parte_pk PRIMARY KEY ( id_parte );

CREATE TABLE producto (
    id_producto         INTEGER NOT NULL,
    codigo              INTEGER NOT NULL,
    nombre              VARCHAR2(50) NOT NULL,
    marca               VARCHAR2(50) NOT NULL,
    fecha_finalizacion  DATE NOT NULL,
    puesto_finalizacion VARCHAR2(50) NOT NULL,
    estado              CHAR(1) NOT NULL,
    costo_fabricacion   NUMBER NOT NULL,
    costo_verificacion  NUMBER NOT NULL,
    costo_parte         NUMBER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE proveedor (
    id_proveedor INTEGER NOT NULL,
    nombre       VARCHAR2(100) NOT NULL,
    telefono     INTEGER NOT NULL,
    compañia     VARCHAR2(50) NOT NULL,
    pais         VARCHAR2(50) NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE puesto (
    id_puesto   INTEGER NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    costo       NUMBER NOT NULL,
    tipo        VARCHAR2(50) NOT NULL
);

ALTER TABLE puesto ADD CONSTRAINT puesto_trabajo_pk PRIMARY KEY ( id_puesto );

CREATE TABLE soporte (
    id_soporte       INTEGER NOT NULL,
    fecha_devolucion DATE NOT NULL,
    reembolso        NUMBER NOT NULL
);

ALTER TABLE soporte ADD CONSTRAINT soporte_pk PRIMARY KEY ( id_soporte );

CREATE TABLE tipo_bodega (
    id_tipo_bodega INTEGER NOT NULL,
    descripcion    VARCHAR2(100) NOT NULL
);

ALTER TABLE tipo_bodega ADD CONSTRAINT tipo_bodega_pk PRIMARY KEY ( id_tipo_bodega );

CREATE TABLE tipo_parte (
    id_tipo_parte INTEGER NOT NULL,
    descripcion   VARCHAR2(50) NOT NULL
);

ALTER TABLE tipo_parte ADD CONSTRAINT tipo_parte_pk PRIMARY KEY ( id_tipo_parte );

ALTER TABLE asignar_bodega
    ADD CONSTRAINT asignar_bodega_bodega_fk FOREIGN KEY ( bodega_id_bodega )
        REFERENCES bodega ( id_bodega );

ALTER TABLE asignar_bodega
    ADD CONSTRAINT asignar_bodega_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE asignar_etapa
    ADD CONSTRAINT asignar_etapa_etapa_fk FOREIGN KEY ( etapa_id_etapa )
        REFERENCES etapa ( id_etapa );

ALTER TABLE asignar_etapa
    ADD CONSTRAINT asignar_etapa_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE asignar_parte
    ADD CONSTRAINT asignar_parte_parte_fk FOREIGN KEY ( parte_id_parte )
        REFERENCES parte ( id_parte );

ALTER TABLE asignar_parte
    ADD CONSTRAINT asignar_parte_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE asignar_producto
    ADD CONSTRAINT asignar_producto_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE asignar_producto
    ADD CONSTRAINT asignar_producto_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE asignar_proveedor
    ADD CONSTRAINT asignar_proveedor_parte_fk FOREIGN KEY ( parte_id_parte )
        REFERENCES parte ( id_parte );

ALTER TABLE asignar_proveedor
    ADD CONSTRAINT asignar_proveedor_proveedor_fk FOREIGN KEY ( proveedor_id_proveedor )
        REFERENCES proveedor ( id_proveedor );

ALTER TABLE asig_puesto
    ADD CONSTRAINT asignar_puesto_ensamblaje_fk FOREIGN KEY ( ensamblaje_id_ensamblaje )
        REFERENCES ensamblaje ( id_ensamblaje );

ALTER TABLE asig_puesto
    ADD CONSTRAINT asignar_puesto_puesto_fk FOREIGN KEY ( id_puesto )
        REFERENCES puesto ( id_puesto );

ALTER TABLE asignar_soporte
    ADD CONSTRAINT asignar_soporte_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE asignar_soporte
    ADD CONSTRAINT asignar_soporte_soporte_fk FOREIGN KEY ( soporte_id_soporte )
        REFERENCES soporte ( id_soporte );

ALTER TABLE asinar_linea
    ADD CONSTRAINT asinar_linea_ensamblaje_fk FOREIGN KEY ( ensamblaje_id_ensamblaje )
        REFERENCES ensamblaje ( id_ensamblaje );

ALTER TABLE asinar_linea
    ADD CONSTRAINT asinar_linea_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE bodega
    ADD CONSTRAINT bodega_tipo_bodega_fk FOREIGN KEY ( tipo_bodega_id_tipo_bodega )
        REFERENCES tipo_bodega ( id_tipo_bodega );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_ensamblaje_fk FOREIGN KEY ( ensamblaje_id_ensamblaje )
        REFERENCES ensamblaje ( id_ensamblaje );

ALTER TABLE parte
    ADD CONSTRAINT parte_tipo_parte_fk FOREIGN KEY ( tipo_parte_id_tipo_parte )
        REFERENCES tipo_parte ( id_tipo_parte );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             0
-- ALTER TABLE                             39
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
