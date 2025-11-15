CREATE DATABASE Facturacion1; 

USE Facturacion1;

CREATE TABLE t_ciudad(
    id_ciudad       int(11)     AUTO_INCREMENT NOT NULL,
    ciudad          varchar(100),
    CONSTRAINT      pk_ciudad PRIMARY KEY(id_ciudad)
)ENGINE=InnoDb;

INSERT INTO t_ciudad(id_ciudad,ciudad) VALUES (NULL, "Bucaramanga");
INSERT INTO t_ciudad(id_ciudad,ciudad) VALUES (NULL, "Medellin");
INSERT INTO t_ciudad(id_ciudad,ciudad) VALUES (NULL, "Cali");

CREATE TABLE t_unidad(
    id_unidad       int(11)     AUTO_INCREMENT NOT NULL,
    unidad        varchar(50),
    CONSTRAINT      pk_unidad   PRIMARY KEY(id_unidad)
)ENGINE=InnoDb;

INSERT INTO t_unidad(id_unidad,unidad) VALUES(NULL,"UNIDAD");
INSERT INTO t_unidad(id_unidad,unidad) VALUES(NULL,"KILO");
INSERT INTO t_unidad(id_unidad,unidad) VALUES(NULL,"RESMA");

CREATE TABLE t_cliente(
    id_cliente      int(11)     AUTO_INCREMENT NOT NULL,
    nombre_cliente  varchar(100),
    direcccion      varchar(100),
    id_ciudad       int(11),
    CONSTRAINT      pk_cliente  PRIMARY KEY(id_cliente),
    CONSTRAINT      fr_ciudad   FOREIGN  KEY(id_ciudad) REFERENCES t_ciudad(id_ciudad)

)ENGINE=InnoDb;

CREATE TABLE t_producto(
    id_producto     int(11)       AUTO_INCREMENT NOT NULL,
    t_producto      varchar(100),
    id_unidad       int(11),
    valor_unitario  float(10,2),
    CONSTRAINT      pk_producto  PRIMARY KEY(id_producto),
    CONSTRAINT      fr_unidad   FOREIGN  KEY(id_unidad) REFERENCES t_unidad(id_unidad)

)ENGINE=InnoDb; 

CREATE TABLE t_factura(
    id_factura      int(11)        AUTO_INCREMENT NOT NULL,
    fecha           date,
    id_cliente      int(11),
    id_producto     int(11),
    cantidad        int(11),
    valor_unitario     float(10,2),
    CONSTRAINT      pk_factura  PRIMARY KEY(id_factura),
    CONSTRAINT      fr_cliente   FOREIGN KEY(id_cliente) REFERENCES t_cliente(id_cliente),
    CONSTRAINT      fr_producto   FOREIGN KEY(id_producto) REFERENCES t_producto(id_producto)


)ENGINE=InnoDb;