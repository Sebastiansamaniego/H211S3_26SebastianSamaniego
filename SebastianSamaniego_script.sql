-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-18 17:36:37.276

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    IDCLI int  NOT NULL IDENTITY(1, 1),
    NOMCLI varchar(50)  NOT NULL,
    APECLI varchar(50)  NOT NULL,
    CELCLI char(9)  NOT NULL,
    CORCLI varchar(50)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (IDCLI)
);

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    IDEMP int  NOT NULL IDENTITY(1, 1),
    NOMEMP varchar(50)  NOT NULL,
    APEEMP varchar(50)  NOT NULL,
    DNIEMP char(8)  NOT NULL,
    CELEMP char(9)  NOT NULL,
    COREMP varchar(50)  NOT NULL,
    ESTEMP char(1)  NOT NULL,
    TIPEMP char(1)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    IDSUC int  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (IDEMP)
);

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int  NOT NULL IDENTITY(1, 1),
    NOMPRO varchar(50)  NOT NULL,
    PREPRO decimal(4,2)  NOT NULL,
    STOCPRO int  NOT NULL,
    ESTPRO char(1)  NOT NULL,
    DESPRO varchar(100)  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY  (IDPRO)
);

-- Table: SUCURSAL
CREATE TABLE SUCURSAL (
    IDSUC int  NOT NULL IDENTITY(1, 1),
    NOMSUC varchar(50)  NOT NULL,
    DIRSUC varchar(50)  NOT NULL,
    CODUBI char(6)  NOT NULL,
    CONSTRAINT SUCURSAL_pk PRIMARY KEY  (IDSUC)
);

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6)  NOT NULL,
    DISUBI varchar(50)  NOT NULL,
    PROUBI varchar(50)  NOT NULL,
    DEPUBI varchar(50)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (CODUBI)
);

-- Table: VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL IDENTITY(1, 1),
    FECVEN date  NOT NULL,
    IDCLI int  NOT NULL,
    IDEMP int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVEN)
);

-- Table: VENTADETALLE
CREATE TABLE VENTADETALLE (
    IDVENDET int  NOT NULL IDENTITY(1, 1),
    CANVENDET Char(3)  NOT NULL,
    IDPRO int  NOT NULL,
    IDVEN int  NOT NULL,
    CONSTRAINT VENTADETALLE_pk PRIMARY KEY  (IDVENDET)
);

-- foreign keys
-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: EMPLEADO_SUCURSAL (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_SUCURSAL
    FOREIGN KEY (IDSUC)
    REFERENCES SUCURSAL (IDSUC);

-- Reference: EMPLEADO_UBIGEO (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: SUCURSAL_UBIGEO (table: SUCURSAL)
ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_UBIGEO
    FOREIGN KEY (CODUBI)
    REFERENCES UBIGEO (CODUBI);

-- Reference: VENTADETALLE_PRODUCTO (table: VENTADETALLE)
ALTER TABLE VENTADETALLE ADD CONSTRAINT VENTADETALLE_PRODUCTO
    FOREIGN KEY (IDPRO)
    REFERENCES PRODUCTO (IDPRO);

-- Reference: VENTADETALLE_VENTA (table: VENTADETALLE)
ALTER TABLE VENTADETALLE ADD CONSTRAINT VENTADETALLE_VENTA
    FOREIGN KEY (IDVEN)
    REFERENCES VENTA (IDVEN);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (IDCLI)
    REFERENCES CLIENTE (IDCLI);

-- Reference: VENTA_EMPLEADO (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- End of file.

INSERT INTO UBIGEO
(CODUBI,DISUBI,PROUBI,DEPUBI)
VALUES
('P00001','San Vicente','Cañete','Lima'),
('P00002','Imperial','Cañete','Lima'),
('P00003','Nuevo Imperial','Cañete','Lima'),
('P00004','San Luis','Cañete','Lima'),
('P00005','Cerro Azul','Cañete','Lima'),
('P00006','Pacaran','Cañete','Lima'),
('P00007','Chilca','Cañete','Lima'),
('P00008','Santa Cruz de Flores','Cañete','Lima'),
('P00009','Mala','Cañete','Lima'),
('P00010','Zuñiga','Cañete','Lima')

select * from UBIGEO 

INSERT INTO CLIENTE
(NOMCLI, APECLI, CELCLI, CORCLI,CODUBI)
VALUES
('Sebastian', 'Samaniego', '987456321', 'sebastian122330@gmail.com','P00001'),
('Pedro', 'Cartagena', '985203697', 'Pedro15@gmail.com','P00002'),
('Juan', 'Lopes', '901254789', 'JuanLopes@gmail.com','P00003'),
('Eduardo', 'Rodriguez', '974103695', 'Eduardo@gmail.com','P00001'),
('Julio', 'Campos', '974105996', 'JulioC@gmail.com','P00002'),
('Victor', 'Sandoval', '933201596', 'Victor123@gmail.com','P00003'),
('Jose', 'Vargas', '901254006', 'JoseV@gmail.com','P00002'),
('Maria', 'Porras', '985476300', 'MariaP@gmail.com','P00001'),
('Carmen', 'Portuguez', '999632014', 'CarmenP@gmail.com','P00003'),
('Esperanza', 'Salazar', '955214632', 'Esperanza1@gmail.com','P00002')

SELECT * FROM CLIENTE

INSERT INTO SUCURSAL
(NOMSUC,DIRSUC,CODUBI)
VALUES
('Pizza Hut-Tadeo','Imperial','P00003'),
('Pizza Hut-Marcio','Nuevo Imperial','P00002'),
('Pizza Hut-SV','San Vicente','P00001')

SELECT * FROM SUCURSAL

/* Insertar registros tabla EMPLEADO/ EN EL TIPEMP SON LOS TIPOS DE EMPLEADOS (ADMINISTRADOR,VENDEDOR Y DESPACHADOR,JEFE(SUCURSAL)) */
INSERT INTO EMPLEADO
(NOMEMP,APEEMP,DNIEMP,CELEMP,COREMP,ESTEMP,TIPEMP,CODUBI,IDSUC)
VALUES
('Lucas','Amador','15478236', '987456320', 'Lucas@gmail.com','A','A','P00002','2'),
('Fabrizio','Calderón', '14785203', '974158996', 'Fabrizio@gmail.com','A','V','P00001','1'),
('Anderson','Cortez', '14785223', '902356489', 'AndersonC@gmail.com','A','J','P00003','3'),
('Sandra','Sanchez', '74102366', '912365409', 'SandraT@gmail.com','A','D','P00001','1'),
('Kyara','Hurtado', '75842103', '987410236', 'KyaraH@gmail.com','A','V','P00002','2'),
('Lucia', 'Tapia','78965412', '900147852', 'LuciaP@gmail.com','A','V','P00003','3'),
('Estrella','Byller', '12364789', '978456932', 'EstrellaA@gmail.com','I','J','P00002','2'),
('Alberto', 'Campos','14023655', '941203256', 'Alberto@gmail.com','A','J','P00003','3'),
('Jesus', 'Cartavio','74521556', '974120358', 'JesusC@gmail.com','I','V','P00001','1'),
('Carlos', 'Salazar','12530469', '989520365', 'Carlos@gmail.com','A','D','P00002','2')


SELECT * FROM EMPLEADO


INSERT INTO PRODUCTO
(NOMPRO,PREPRO,STOCPRO,ESTPRO,DESPRO)
VALUES
('Pizza Americana','25.00',3,'A','¨Pizza Americana con Queso'),
('Pizza Hawaiana','45.00',4,'A','Pizza que contiene piña y peperroni'),
('Pizza Artesanal','30.00',5,'A','¡El paraiso en la mesa! Se completa con jamón, jugosa piña y queso mozzarella'),
('Pizza Vegetariana','20.00',10,'A','Exquisita combinación de champiñones, aceitunas verdes, pimientos verdes'),
('Pizza Continental','50.00',0,'I','Deliciosa mixtura de Jamón, champiñones, cebolla roja y queso mozzarella'),
('Pizza Mozzarella','47.00',13,'A','Para los amantes del queso una deliciosa pizza con nuestro queso mozzarella gratinado'),
('Pizza Pepperoni','12.00',14,'A','Sabor incomparable de pepperoni americano y queso mozzarella'),
('Pizza Suprema','36.00',0,'I','combinación de pepperoni americano, carne de res, carne de cerdo,champiñones,pimientos verdes'),
('Pizza Meat Lovers','40.00',30,'A','¡Un festín de carnes! Pepperoni americano, salchicha italiana, carne de res, carne decerdo'),
('Pizza Chili Hut','54.00',40,'A','Deliciosa combinación de trozos de pollo, piña, tocino y salsa Chili thai')

select * from producto

-- Insertamos datos en las tablas VENTASELECT * FROM VENTA;SET DATEFORMAT dmy;INSERT INTO VENTA(FECVEN, IDCLI, IDEMP) VALUES('06/04/2021', '1', '1'),('08/10/2020', '2', '2'),('09/09/2021', '3', '3'),('10/03/2021', '5', '4'),('15/04/2022', '6', '5');
select * from VENTA

/*FILTROS*/
select * from CLIENTE
select * from CLIENTE where NOMCLI ='Sebastian';

select * from PRODUCTO
select * from producto where NOMPRO = 'Pizza Americana';
