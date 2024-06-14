-- Generado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   en:        2024-06-15 01:45:27 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE area (
    id_area     INTEGER NOT NULL,
    descripcion VARCHAR2(100) NOT NULL
);

ALTER TABLE area ADD CONSTRAINT area_pk PRIMARY KEY ( id_area );

CREATE TABLE asignar_capa (
    id_asignar                   INTEGER,
    fecha                        DATE NOT NULL,
    lugar                        VARCHAR2(100) NOT NULL,
    encargado                    VARCHAR2(150) NOT NULL,
    diploma                      VARCHAR2(100) NOT NULL,
    capacitacion_id_capacitacion INTEGER NOT NULL,
    empleado_id_empleado         INTEGER NOT NULL
);

CREATE TABLE asignar_maqui (
    id_asignar               INTEGER NOT NULL,
    descripcion              VARCHAR2(150) NOT NULL,
    tienda_id_tienda         INTEGER NOT NULL,
    maquinaria_id_maquinaria INTEGER NOT NULL,
    empleado_id_empleado     INTEGER NOT NULL
);

ALTER TABLE asignar_maqui ADD CONSTRAINT asignar_maqui_pk PRIMARY KEY ( id_asignar );

CREATE TABLE asignar_tienda (
    id_asiganr               INTERVAL DAY(9) TO SECOND(0) NOT NULL,
    tienda_id_tienda         INTEGER NOT NULL,
    inventario_id_inventario INTEGER NOT NULL
);

ALTER TABLE asignar_tienda ADD CONSTRAINT asignar_tienda_pk PRIMARY KEY ( id_asiganr );

CREATE TABLE capacitacion (
    id_capacitacion INTEGER NOT NULL,
    tema            VARCHAR2(150) NOT NULL,
    tiempo          DATE NOT NULL
);

ALTER TABLE capacitacion ADD CONSTRAINT capacitacion_pk PRIMARY KEY ( id_capacitacion );

CREATE TABLE departamento (
    id_departamento INTEGER NOT NULL,
    descripcion     VARCHAR2(150) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE empleado (
    id_empleado  INTEGER NOT NULL,
    no_empleado  VARCHAR2(7) NOT NULL,
    sueldo       NUMBER NOT NULL,
    edad         INTEGER NOT NULL,
    jornada      VARCHAR2(100) NOT NULL,
    rendimiento  VARCHAR2(100) NOT NULL,
    direccion    VARCHAR2(100) NOT NULL,
    telefono     INTEGER NOT NULL,
    igss         INTEGER NOT NULL,
    correo       VARCHAR2(25) NOT NULL,
    rol_id_rol   INTEGER NOT NULL,
    area_id_area INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE falta (
    id_falta             INTEGER NOT NULL,
    descripcion          VARCHAR2(250) NOT NULL,
    incidencia           INTEGER NOT NULL,
    tipo_falta_id_falta  INTEGER NOT NULL,
    empleado_id_empleado INTEGER NOT NULL
);

ALTER TABLE falta ADD CONSTRAINT falta_pk PRIMARY KEY ( id_falta );

CREATE TABLE inventario (
    id_inventario INTEGER NOT NULL,
    sku           VARCHAR2(13) NOT NULL,
    categoria     VARCHAR2(50) NOT NULL,
    fecha         DATE NOT NULL,
    linea         INTEGER NOT NULL,
    espacio       VARCHAR2(100) NOT NULL
);

ALTER TABLE inventario ADD CONSTRAINT inventario_pk PRIMARY KEY ( id_inventario );

CREATE TABLE maquinaria (
    id_maquinaria INTEGER NOT NULL,
    descripcion   VARCHAR2(100) NOT NULL
);

ALTER TABLE maquinaria ADD CONSTRAINT maquinaria_pk PRIMARY KEY ( id_maquinaria );

CREATE TABLE pedido (
    id_pedido           INTEGER NOT NULL,
    fecha_entrega       DATE NOT NULL,
    monto               NUMBER NOT NULL,
    detalle             VARCHAR2(250) NOT NULL,
    muelle              INTEGER NOT NULL,
    tipo_pedido_id_tipo INTEGER NOT NULL,
    tienda_id_tienda    INTEGER NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( id_pedido );

CREATE TABLE producto (
    id_producto              INTEGER NOT NULL,
    cantidad                 INTEGER NOT NULL,
    precio                   NUMBER NOT NULL,
    monto                    NUMBER NOT NULL,
    fecha_ingreso            DATE,
    tipo_producto_id_tipo    INTEGER NOT NULL,
    proveedor_id_proveedor   INTEGER NOT NULL,
    inventario_id_inventario INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE proveedor (
    id_proveedor INTEGER NOT NULL,
    nombre       VARCHAR2(150) NOT NULL,
    direccion    VARCHAR2(150) NOT NULL,
    telefono     INTEGER NOT NULL,
    correo       VARCHAR2(25) NOT NULL,
    empresa      VARCHAR2(50)
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE rol (
    id_rol      INTEGER NOT NULL,
    descripcion VARCHAR2(100) NOT NULL
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( id_rol );

CREATE TABLE ruta (
    id_ruta          INTEGER NOT NULL,
    vehiculo         VARCHAR2(100) NOT NULL,
    personal         VARCHAR2(150) NOT NULL,
    detalle          VARCHAR2(150) NOT NULL,
    ruta             VARCHAR2(150) NOT NULL,
    armado           VARCHAR2(100) NOT NULL,
    ensamblado       VARCHAR2(150) NOT NULL,
    tienda_id_tienda INTEGER NOT NULL
);

ALTER TABLE ruta ADD CONSTRAINT ruta_pk PRIMARY KEY ( id_ruta );

CREATE TABLE tienda (
    id_tienda                    INTEGER NOT NULL,
    numero                       INTEGER NOT NULL,
    direccion                    VARCHAR2(150) NOT NULL,
    descriptores                 VARCHAR2(250) NOT NULL,
    departamento_id_departamento INTEGER NOT NULL,
    tipo_tienda_id_tipo          INTEGER NOT NULL
);

ALTER TABLE tienda ADD CONSTRAINT tienda_pk PRIMARY KEY ( id_tienda );

CREATE TABLE tipo_falta (
    id_falta    INTEGER NOT NULL,
    descripcion VARCHAR2(100) NOT NULL
);

ALTER TABLE tipo_falta ADD CONSTRAINT tipo_falta_pk PRIMARY KEY ( id_falta );

CREATE TABLE tipo_pedido (
    id_tipo     INTEGER NOT NULL,
    descripcion VARCHAR2(100) NOT NULL
);

ALTER TABLE tipo_pedido ADD CONSTRAINT tipo_pedido_pk PRIMARY KEY ( id_tipo );

CREATE TABLE tipo_producto (
    id_tipo     INTEGER NOT NULL,
    descripcion VARCHAR2(150) NOT NULL
);

ALTER TABLE tipo_producto ADD CONSTRAINT tipo_producto_pk PRIMARY KEY ( id_tipo );

CREATE TABLE tipo_tienda (
    id_tipo     INTEGER NOT NULL,
    descripcion VARCHAR2(150) NOT NULL
);

ALTER TABLE tipo_tienda ADD CONSTRAINT tipo_tienda_pk PRIMARY KEY ( id_tipo );

ALTER TABLE asignar_capa
    ADD CONSTRAINT asignar_capa_capacitacion_fk FOREIGN KEY ( capacitacion_id_capacitacion )
        REFERENCES capacitacion ( id_capacitacion );

ALTER TABLE asignar_capa
    ADD CONSTRAINT asignar_capa_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE asignar_maqui
    ADD CONSTRAINT asignar_maqui_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE asignar_maqui
    ADD CONSTRAINT asignar_maqui_maquinaria_fk FOREIGN KEY ( maquinaria_id_maquinaria )
        REFERENCES maquinaria ( id_maquinaria );

ALTER TABLE asignar_maqui
    ADD CONSTRAINT asignar_maqui_tienda_fk FOREIGN KEY ( tienda_id_tienda )
        REFERENCES tienda ( id_tienda );

ALTER TABLE asignar_tienda
    ADD CONSTRAINT asignar_tienda_inventario_fk FOREIGN KEY ( inventario_id_inventario )
        REFERENCES inventario ( id_inventario );

ALTER TABLE asignar_tienda
    ADD CONSTRAINT asignar_tienda_tienda_fk FOREIGN KEY ( tienda_id_tienda )
        REFERENCES tienda ( id_tienda );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_area_fk FOREIGN KEY ( area_id_area )
        REFERENCES area ( id_area );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_rol_fk FOREIGN KEY ( rol_id_rol )
        REFERENCES rol ( id_rol );

ALTER TABLE falta
    ADD CONSTRAINT falta_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE falta
    ADD CONSTRAINT falta_tipo_falta_fk FOREIGN KEY ( tipo_falta_id_falta )
        REFERENCES tipo_falta ( id_falta );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_tienda_fk FOREIGN KEY ( tienda_id_tienda )
        REFERENCES tienda ( id_tienda );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_tipo_pedido_fk FOREIGN KEY ( tipo_pedido_id_tipo )
        REFERENCES tipo_pedido ( id_tipo );

ALTER TABLE producto
    ADD CONSTRAINT producto_inventario_fk FOREIGN KEY ( inventario_id_inventario )
        REFERENCES inventario ( id_inventario );

ALTER TABLE producto
    ADD CONSTRAINT producto_proveedor_fk FOREIGN KEY ( proveedor_id_proveedor )
        REFERENCES proveedor ( id_proveedor );

ALTER TABLE producto
    ADD CONSTRAINT producto_tipo_producto_fk FOREIGN KEY ( tipo_producto_id_tipo )
        REFERENCES tipo_producto ( id_tipo );

ALTER TABLE ruta
    ADD CONSTRAINT ruta_tienda_fk FOREIGN KEY ( tienda_id_tienda )
        REFERENCES tienda ( id_tienda );

ALTER TABLE tienda
    ADD CONSTRAINT tienda_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE tienda
    ADD CONSTRAINT tienda_tipo_tienda_fk FOREIGN KEY ( tipo_tienda_id_tipo )
        REFERENCES tipo_tienda ( id_tipo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             0
-- ALTER TABLE                             38
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
