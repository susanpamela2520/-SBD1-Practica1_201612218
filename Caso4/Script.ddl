-- Generado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   en:        2024-06-13 23:32:01 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE asignar_bol (
    id_asignar         INTEGER NOT NULL,
    boleto_id_boleto   INTEGER NOT NULL,
    cliente_id_cliente INTEGER NOT NULL
);

ALTER TABLE asignar_bol ADD CONSTRAINT asignar_bol_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asignar_boleto (
    id_asignar       INTEGER NOT NULL,
    pago_id_pago     INTEGER NOT NULL,
    boleto_id_boleto INTEGER NOT NULL
);

ALTER TABLE asignar_boleto ADD CONSTRAINT asignar_boleto_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asignar_emp (
    id_asignar             INTEGER NOT NULL,
    historial_id_historial INTEGER NOT NULL,
    empleado_id_empleado   INTEGER NOT NULL
);

ALTER TABLE asignar_emp ADD CONSTRAINT asignar_emp_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asignar_meca (
    id_asignar                     INTEGER NOT NULL,
    mantenimiento_id_mantenimiento INTEGER NOT NULL,
    empleado_id_empleado           INTEGER NOT NULL
);

ALTER TABLE asignar_meca ADD CONSTRAINT asignar_meca_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asistencia (
    id_asistencia        INTEGER NOT NULL,
    fecha                DATE NOT NULL,
    hora_entrada         TIMESTAMP(4) NOT NULL,
    hora_salida          TIMESTAMP(4) NOT NULL,
    motivo               VARCHAR2(100) NOT NULL,
    empleado_id_empleado INTEGER NOT NULL
);

ALTER TABLE asistencia ADD CONSTRAINT asistencia_pk PRIMARY KEY ( id_asistencia );

CREATE TABLE avion (
    id_avion              INTEGER NOT NULL,
    codigo_vuelo          VARCHAR2(50) NOT NULL,
    modelo                NVARCHAR2(25) NOT NULL,
    matricula             VARCHAR2(30) NOT NULL,
    asiento_primera       INTEGER NOT NULL,
    asiento_economica     INTEGER NOT NULL,
    asiento_ejecutiva     INTEGER NOT NULL,
    proximo_mantenimiento DATE NOT NULL,
    ultimo_mantenimiento  DATE NOT NULL,
    vuelo_despegue        DATE NOT NULL,
    vuelo_aterrizaje      DATE NOT NULL,
    gasolina              NUMBER NOT NULL,
    distancia             NUMBER NOT NULL,
    altura                NUMBER NOT NULL
);

ALTER TABLE avion ADD CONSTRAINT avion_pk PRIMARY KEY ( id_avion );

CREATE TABLE boleto (
    id_boleto      INTEGER NOT NULL,
    numero_boleto  INTEGER NOT NULL,
    forma_pago     VARCHAR2(50) NOT NULL,
    lugar_origen   VARCHAR2(100) NOT NULL,
    lugar_destino  VARCHAR2(100) NOT NULL,
    clase          VARCHAR2(50) NOT NULL,
    monton         NUMBER NOT NULL,
    fecha_viaje    DATE NOT NULL,
    fecha_regreso  DATE NOT NULL,
    peso_equipaje  NUMBER NOT NULL,
    tipo_vuelo     CHAR(1) NOT NULL,
    clase_id_clase INTEGER NOT NULL
);

ALTER TABLE boleto ADD CONSTRAINT boleto_pk PRIMARY KEY ( id_boleto );

CREATE TABLE clase (
    id_clase    INTEGER NOT NULL,
    descripcion VARCHAR2(50) NOT NULL
);

ALTER TABLE clase ADD CONSTRAINT clase_pk PRIMARY KEY ( id_clase );

CREATE TABLE cliente (
    id_cliente       INTEGER NOT NULL,
    nombre           VARCHAR2(50) NOT NULL,
    apellido         VARCHAR2(50) NOT NULL,
    edad             INTEGER NOT NULL,
    cui              INTEGER NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    correo           VARCHAR2(25) NOT NULL,
    telefono         INTEGER NOT NULL,
    direccion        VARCHAR2(100) NOT NULL,
    codigo_postal    INTEGER NOT NULL,
    pasaporte        INTEGER NOT NULL,
    viaje_id_viaje   INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE empleado (
    id_empleado        INTEGER NOT NULL,
    nombre             VARCHAR2(100) NOT NULL,
    apellido           VARCHAR2(100) NOT NULL,
    edad               INTEGER NOT NULL,
    cui                INTEGER NOT NULL,
    direccion          VARCHAR2(100) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    fecha_contratacion DATE NOT NULL,
    correo             VARCHAR2(25) NOT NULL,
    telefono           INTEGER NOT NULL,
    puesto             VARCHAR2(50) NOT NULL,
    jornada_id_jornada INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE historial (
    id_historial  INTEGER NOT NULL,
    fecha_despido DATE NOT NULL,
    razon         VARCHAR2(150) NOT NULL
);

ALTER TABLE historial ADD CONSTRAINT historial_pk PRIMARY KEY ( id_historial );

CREATE TABLE jornada (
    id_jornada  INTEGER NOT NULL,
    descripcion VARCHAR2(50) NOT NULL
);

ALTER TABLE jornada ADD CONSTRAINT jornada_pk PRIMARY KEY ( id_jornada );

CREATE TABLE mantenimiento (
    id_mantenimiento INTEGER NOT NULL,
    tipo             CHAR(1) NOT NULL,
    fecha            DATE NOT NULL,
    observacion      VARCHAR2(250) NOT NULL,
    problemas        CHAR(1) NOT NULL,
    avion_id_avion   INTEGER NOT NULL
);

ALTER TABLE mantenimiento ADD CONSTRAINT mantenimiento_pk PRIMARY KEY ( id_mantenimiento );

CREATE TABLE pago (
    id_pago        INTEGER NOT NULL,
    numero_tarjeta INTEGER NOT NULL,
    tipo_tarjeta   VARCHAR2(25) NOT NULL,
    total          NUMBER NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE viaje (
    id_viaje          INTEGER NOT NULL,
    numero_pasajeros  INTEGER NOT NULL,
    fecha_despegue    DATE NOT NULL,
    fecha_aterrizaje  DATE NOT NULL,
    tripulacion       VARCHAR2(150) NOT NULL,
    pais_despegue     VARCHAR2(50) NOT NULL,
    pais_aterrizaje   VARCHAR2(50) NOT NULL,
    ciudad_despegue   VARCHAR2(50) NOT NULL,
    ciudad_aterrizaje VARCHAR2(50) NOT NULL,
    avion_id_avion    INTEGER NOT NULL
);

ALTER TABLE viaje ADD CONSTRAINT viaje_pk PRIMARY KEY ( id_viaje );

ALTER TABLE asignar_bol
    ADD CONSTRAINT asignar_bol_boleto_fk FOREIGN KEY ( boleto_id_boleto )
        REFERENCES boleto ( id_boleto );

ALTER TABLE asignar_bol
    ADD CONSTRAINT asignar_bol_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE asignar_boleto
    ADD CONSTRAINT asignar_boleto_boleto_fk FOREIGN KEY ( boleto_id_boleto )
        REFERENCES boleto ( id_boleto );

ALTER TABLE asignar_boleto
    ADD CONSTRAINT asignar_boleto_pago_fk FOREIGN KEY ( pago_id_pago )
        REFERENCES pago ( id_pago );

ALTER TABLE asignar_emp
    ADD CONSTRAINT asignar_emp_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE asignar_emp
    ADD CONSTRAINT asignar_emp_historial_fk FOREIGN KEY ( historial_id_historial )
        REFERENCES historial ( id_historial );

ALTER TABLE asignar_meca
    ADD CONSTRAINT asignar_meca_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE asignar_meca
    ADD CONSTRAINT asignar_meca_mantenimiento_fk FOREIGN KEY ( mantenimiento_id_mantenimiento )
        REFERENCES mantenimiento ( id_mantenimiento );

ALTER TABLE asistencia
    ADD CONSTRAINT asistencia_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_clase_fk FOREIGN KEY ( clase_id_clase )
        REFERENCES clase ( id_clase );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_viaje_fk FOREIGN KEY ( viaje_id_viaje )
        REFERENCES viaje ( id_viaje );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_jornada_fk FOREIGN KEY ( jornada_id_jornada )
        REFERENCES jornada ( id_jornada );

ALTER TABLE mantenimiento
    ADD CONSTRAINT mantenimiento_avion_fk FOREIGN KEY ( avion_id_avion )
        REFERENCES avion ( id_avion );

ALTER TABLE viaje
    ADD CONSTRAINT viaje_avion_fk FOREIGN KEY ( avion_id_avion )
        REFERENCES avion ( id_avion );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             29
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
