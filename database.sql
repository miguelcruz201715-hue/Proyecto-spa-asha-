CREATE DATABASE Facturacion1; 

USE Facturacion1;

CREATE TABLE t_rol (
    id_rol      int(11)         AUTO_INCREMENT NOT NULL,
    rol         varchar(20)     NOT NULL,
    CONSTRAINT  pk_rol          PRIMARY KEY(id_rol) 
)ENGINE=InnoDB;

INSERT INTO t_rol (id_rol, rol) VALUES(NULL, "Administrador"),(NULL,"secretario"), (NULL,"BODEGA");

CREATE TABLE t_usuario (
    id_usuario      int(11)             AUTO_INCREMENT           NOT NULL,
    nombre          varchar(100)        NOT NULL,
    apellido        varchar(100)        NOT NULL,
    correo          varchar(100)        NOT NULL,
    password        varchar(100)        NOT NULL,
    id_rol          int(11)             NOT NULL,
    CONSTRAINT      pk_usuario          PRIMARY KEY(id_usuario),
    CONSTRAINT      fk_rol              FOREIGN KEY(id_rol) REFERENCES t_rol(id_rol)               

)ENGINE=InnoDB;



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





SELECT FAC.id_factura,
  FAC.fecha,
       FAC.id_usuario,
       USU.nombre,
       USU.apellido,
       FAC.id_cliente,
       CLI.nombre_cliente,
       CLI.direccion,
       FAC.id_producto,
       PRO.producto,
       PRO.valor_unitario,
       FAC.cantidad * PRO.valor_unitario AS total
     
FROM t_factura FAC
INNER JOIN  t_usuario USU on USU.id_usuario =  FAC.id_usuario
INNER JOIN  t_cliente CLI on CLI.id_cliente =  FAC.id_cliente
INNER JOIN  t_producto PRO on PRO.id_producto = FAC.id_producto
