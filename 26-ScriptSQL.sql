-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-08 16:38:20.85

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    IDCLI int  NOT NULL IDENTITY,
    NOMCLI varchar(50)  NOT NULL,
    APECLI varchar(50)  NOT NULL,
    CELCLI char(9)  NOT NULL,
    CORCLI varchar(50)  NOT NULL,
    IDUBI char(4)  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY  (IDCLI)
);

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    IDEMP int  NOT NULL IDENTITY,
    NOMEMP varchar(50)  NOT NULL,
    APEEMP varchar(50)  NOT NULL,
    DNIEMP char(8)  NOT NULL,
    CELEMP char(9)  NOT NULL,
    COREMP varchar(50)  NOT NULL,
    ESTEMP char(1)  NOT NULL,
    TIPEMP char(1)  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (IDEMP)
);

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int  NOT NULL IDENTITY,
    NOMPRO varchar(50)  NOT NULL,
    CANTPRO int  NOT NULL,
    PREPRO decimal(4,2)  NOT NULL,
    DESPRO varchar(80)  NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY  (IDPRO)
);

-- Table: SUCURSAL
CREATE TABLE SUCURSAL (
    IDSUC int  NOT NULL IDENTITY,
    NOMSUC varchar(50)  NOT NULL,
    IDEMP int  NOT NULL,
    IDUBI char(4)  NOT NULL,
    CONSTRAINT SUCURSAL_pk PRIMARY KEY  (IDSUC)
);

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    IDUBI char(4)  NOT NULL,
    DISUBI varchar(50)  NOT NULL,
    PROUBI varchar(50)  NOT NULL,
    DEPUBI varchar(50)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY  (IDUBI)
);

-- Table: VENTA
CREATE TABLE VENTA (
    IDVEN int  NOT NULL IDENTITY,
    FECVEN datetime  NOT NULL,
    IDEMP int  NOT NULL,
    IDCLI int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY  (IDVEN)
);

-- Table: VENTADETALLE
CREATE TABLE VENTADETALLE (
    IDVENDET int  NOT NULL IDENTITY,
    CANVENDET Char(3)  NOT NULL,
    IDPRO int  NOT NULL,
    IDVEN int  NOT NULL,
    CONSTRAINT VENTADETALLE_pk PRIMARY KEY  (IDVENDET)
);

-- foreign keys
-- Reference: CLIENTE_UBIGEO (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO
    FOREIGN KEY (IDUBI)
    REFERENCES UBIGEO (IDUBI);

-- Reference: SUCURSAL_EMPLEADO (table: SUCURSAL)
ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_EMPLEADO
    FOREIGN KEY (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Reference: SUCURSAL_UBIGEO (table: SUCURSAL)
ALTER TABLE SUCURSAL ADD CONSTRAINT SUCURSAL_UBIGEO
    FOREIGN KEY (IDUBI)
    REFERENCES UBIGEO (IDUBI);

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
(IDUBI,DISUBI,PROUBI,DEPUBI)
VALUES
('S001','San Vicente','Cañete','Lima'),
('S002','Imperial','Cañete','Lima'),
('S003','Nuevo Imperial','Cañete','Lima'),
('S004','San Luis','Cañete','Lima'),
('S005','Cerro Azul','Cañete','Lima'),
('S006','Pacaran','Cañete','Lima'),
('S007','Chilca','Cañete','Lima'),
('S008','Santa Cruz de Flores','Cañete','Lima'),
('S009','Mala','Cañete','Lima'),
('S010','Zuñiga','Cañete','Lima')

select * from UBIGEO 

INSERT INTO CLIENTE
(NOMCLI, APECLI, CELCLI, CORCLI,IDUBI)
VALUES
('Sebastian', 'Samaniego', '987456321', 'sebastian122330@gmail.com','S001'),
('Pedro', 'Cartagena', '985203697', 'Pedro15@gmail.com','S002'),
('Juan', 'Lopes', '901254789', 'JuanLopes@gmail.com','S003'),
('Eduardo', 'Rodriguez', '974103695', 'Eduardo@gmail.com','S001'),
('Julio', 'Campos', '974105996', 'JulioC@gmail.com','S002'),
('Victor', 'Sandoval', '933201596', 'Victor123@gmail.com','S003'),
('Jose', 'Vargas', '901254006', 'JoseV@gmail.com','S002'),
('Maria', 'Porras', '985476300', 'MariaP@gmail.com','S001'),
('Carmen', 'Portuguez', '999632014', 'CarmenP@gmail.com','S003'),
('Esperanza', 'Salazar', '955214632', 'Esperanza1@gmail.com','S002')

SELECT * FROM CLIENTE

/* Insertar registros tabla EMPLEADO/ EN EL TIPEMP SON LOS TIPOS DE EMPLEADOS (ADMINISTRADOR,VENDEDOR Y DESPACHADOR,JEFE(SUCURSAL)) */
INSERT INTO EMPLEADO
(NOMEMP,APEEMP,DNIEMP,CELEMP,COREMP,ESTEMP,TIPEMP)
VALUES
('Lucas','Amador','15478236', '987456320', 'Lucas@gmail.com','A','A'),
('Fabrizio','Calderón', '14785203', '974158996', 'Fabrizio@gmail.com','A','V'),
('Anderson','Cortez', '14785223', '902356489', 'AndersonC@gmail.com','A','J'),
('Sandra','Sanchez', '74102366', '912365409', 'SandraT@gmail.com','A','D'),
('Kyara','Hurtado', '75842103', '987410236', 'KyaraH@gmail.com','A','V'),
('Lucia', 'Tapia','78965412', '900147852', 'LuciaP@gmail.com','A','V'),
('Estrella','Byller', '12364789', '978456932', 'EstrellaA@gmail.com','I','J'),
('Alberto', 'Campos','14023655', '941203256', 'Alberto@gmail.com','A','J'),
('Jesus', 'Cartavio','74521556', '974120358', 'JesusC@gmail.com','I','V'),
('Carlos', 'Salazar','12530469', '989520365', 'Carlos@gmail.com','A','D')


SELECT * FROM EMPLEADO


INSERT INTO PRODUCTO
(NOMPRO,CANTPRO,PREPRO)
VALUES
('Pizza Americana', '5','25.00'),
('Pizza Hawaiana', '4','45.00'),
('Pizza Artesanal', '3','30.00'),
('Pizza Vegetariana', '2','20.00'),
('Pizza Continental', '7','50.00'),
('Pizza Mozzarella', '8','47.00'),
('Pizza Pepperoni', '9','12.00'),
('Pizza Suprema', '6','36.00'),
('Pizza Meat Lovers', '7','40.00'),
('Pizza Chili Hut', '4','54.00')

select * from producto

INSERT INTO SUCURSAL
(NOMSUC,IDEMP,IDUBI)
VALUES
('Imperial',1,'S003'),
('Nuevo Imperial',4,'S002'),
('San vicente',3,'S001')

SELECT * FROM SUCURSAL


/* Store Procedures */