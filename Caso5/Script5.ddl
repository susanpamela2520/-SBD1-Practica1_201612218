-- Generado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   en:        2024-06-14 01:08:07 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE area (
    id_area                      INTEGER NOT NULL,
    nombre                       VARCHAR2(100) NOT NULL,
    departamento_departamento_id NUMBER NOT NULL
);

ALTER TABLE area ADD CONSTRAINT area_pk PRIMARY KEY ( id_area );

CREATE TABLE asignar_seguro (
    id_asignar           INTEGER NOT NULL,
    empleado_id_empleado INTEGER NOT NULL,
    pago_id_pago         INTEGER NOT NULL,
    seguro_id_seguro     INTEGER NOT NULL,
    cliente_cliente_id   NUMBER NOT NULL,
    id_cliente           INTEGER NOT NULL
);

ALTER TABLE asignar_seguro ADD CONSTRAINT asignar_seguro_pk PRIMARY KEY ( id_asignar );

CREATE TABLE cliente (
    id_cliente       INTEGER NOT NULL,
    nombre           VARCHAR2(150) NOT NULL,
    apellido         VARCHAR2(150) NOT NULL,
    cui              INTEGER NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono         INTEGER NOT NULL,
    direccion        VARCHAR2(150) NOT NULL,
    edad             INTEGER NOT NULL,
    correo           VARCHAR2(150) NOT NULL,
    poliza           INTEGER NOT NULL,
    cliente_id       NUMBER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cliente_id );

ALTER TABLE cliente ADD CONSTRAINT cliente_id_cliente_un UNIQUE ( id_cliente );

CREATE TABLE departamento (
    id_departamento INTEGER NOT NULL,
    nombre          VARCHAR2(150) NOT NULL,
    departamento_id NUMBER NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( departamento_id );

CREATE TABLE empleado (
    id_empleado      INTEGER NOT NULL,
    nombre           VARCHAR2(50) NOT NULL,
    apellido         VARCHAR2(50) NOT NULL,
    dpi              INTEGER NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_inicio     DATE NOT NULL,
    edad             INTEGER NOT NULL,
    telefono         INTEGER NOT NULL,
    direccion        VARCHAR2(100) NOT NULL,
    salario          NUMBER NOT NULL,
    puesto_id_puesto INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE forma_pago (
    id_forma INTEGER NOT NULL,
    nombre   VARCHAR2(100) NOT NULL
);

ALTER TABLE forma_pago ADD CONSTRAINT forma_pago_pk PRIMARY KEY ( id_forma );

CREATE TABLE llamada (
    id_llamada           INTEGER NOT NULL,
    telefono             INTEGER NOT NULL,
    fecha                DATE NOT NULL,
    duracion             NUMBER NOT NULL,
    empleado_id_empleado INTEGER NOT NULL,
    cliente_cliente_id   NUMBER NOT NULL,
    id_cliente           INTEGER NOT NULL
);

ALTER TABLE llamada ADD CONSTRAINT llamada_pk PRIMARY KEY ( id_llamada );

CREATE TABLE pago (
    id_pago             INTEGER NOT NULL,
    tarifa              NUMBER NOT NULL,
    mora                NUMBER NOT NULL,
    monto               NUMBER NOT NULL,
    fecha_pago          DATE NOT NULL,
    forma_pago_id_forma INTEGER NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE poliza (
    id_poliza        INTEGER NOT NULL,
    codigo           INTEGER NOT NULL,
    fecha_inicio     DATE NOT NULL,
    fecha_final      DATE NOT NULL,
    monto            NUMBER NOT NULL,
    pago             DATE NOT NULL,
    seguro_id_seguro INTEGER NOT NULL
);

ALTER TABLE poliza ADD CONSTRAINT poliza_pk PRIMARY KEY ( id_poliza );

CREATE TABLE puesto (
    id_puesto                    INTEGER NOT NULL,
    nombre                       VARCHAR2(150) NOT NULL,
    departamento_departamento_id NUMBER NOT NULL
);

ALTER TABLE puesto ADD CONSTRAINT puesto_pk PRIMARY KEY ( id_puesto );

CREATE TABLE seguro (
    id_seguro    INTEGER NOT NULL,
    papeleria    VARCHAR2(250) NOT NULL,
    tipo_id_tipo INTEGER NOT NULL
);

ALTER TABLE seguro ADD CONSTRAINT seguro_pk PRIMARY KEY ( id_seguro );

CREATE TABLE tipo (
    id_tipo INTEGER NOT NULL,
    nombre  VARCHAR2(100) NOT NULL
);

ALTER TABLE tipo ADD CONSTRAINT tipo_pk PRIMARY KEY ( id_tipo );

ALTER TABLE area
    ADD CONSTRAINT area_departamento_fk FOREIGN KEY ( departamento_departamento_id )
        REFERENCES departamento ( departamento_id );

ALTER TABLE asignar_seguro
    ADD CONSTRAINT asignar_seguro_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( cliente_id );

ALTER TABLE asignar_seguro
    ADD CONSTRAINT asignar_seguro_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE asignar_seguro
    ADD CONSTRAINT asignar_seguro_pago_fk FOREIGN KEY ( pago_id_pago )
        REFERENCES pago ( id_pago );

ALTER TABLE asignar_seguro
    ADD CONSTRAINT asignar_seguro_seguro_fk FOREIGN KEY ( seguro_id_seguro )
        REFERENCES seguro ( id_seguro );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_puesto_fk FOREIGN KEY ( puesto_id_puesto )
        REFERENCES puesto ( id_puesto );

ALTER TABLE llamada
    ADD CONSTRAINT llamada_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( cliente_id );

ALTER TABLE llamada
    ADD CONSTRAINT llamada_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE pago
    ADD CONSTRAINT pago_forma_pago_fk FOREIGN KEY ( forma_pago_id_forma )
        REFERENCES forma_pago ( id_forma );

ALTER TABLE poliza
    ADD CONSTRAINT poliza_seguro_fk FOREIGN KEY ( seguro_id_seguro )
        REFERENCES seguro ( id_seguro );

ALTER TABLE puesto
    ADD CONSTRAINT puesto_departamento_fk FOREIGN KEY ( departamento_departamento_id )
        REFERENCES departamento ( departamento_id );

ALTER TABLE seguro
    ADD CONSTRAINT seguro_tipo_fk FOREIGN KEY ( tipo_id_tipo )
        REFERENCES tipo ( id_tipo );

CREATE SEQUENCE Cliente_Cliente_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER Cliente_Cliente_ID_TRG 
BEFORE INSERT ON Cliente 
FOR EACH ROW 
WHEN (NEW.Cliente_ID IS NULL) 
BEGIN
:new.cliente_id := cliente_cliente_id_seq.nextval;

end;
/

CREATE SEQUENCE Departamento_Departamento_ID 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER Departamento_Departamento_ID 
BEFORE INSERT ON Departamento 
FOR EACH ROW 
WHEN (NEW.Departamento_ID IS NULL) 
BEGIN
:new.departamento_id := departamento_departamento_id.nextval;

end;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
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
-- CREATE SEQUENCE                          2
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
