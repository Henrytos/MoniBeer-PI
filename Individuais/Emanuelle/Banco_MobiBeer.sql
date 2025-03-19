CREATE DATABASE projetoSprint1;
USE projetoSprint1;

CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY auto_increment,
    nomeEmpresa VARCHAR(50) NOT NULL, 
    email VARCHAR(50) NOT NULL,
	cnpj CHAR(18) NOT NULL
);

CREATE TABLE Administrador(
	idAdm INT PRIMARY KEY auto_increment,
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(30) NOT NULL
);

CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY auto_increment,
    nomeSensor VARCHAR(10) NOT NULL
);

CREATE TABLE Maquina(
	idMaquina INT PRIMARY KEY,
    nomeMaquina VARCHAR(30) NOT NULL,
    etapaMaquina VARCHAR(100) NOT NULL,
    CONSTRAINT chkEtapa CHECK (etapaMaquina IN ('Alta fermentação','Baixa fermentação'))
); 

CREATE TABLE cerveja_IPA(
	idIPA INT PRIMARY KEY auto_increment,
	nomeCerveja VARCHAR(30) NOT NULL ,
    teorAlcolico DECIMAL(2,1) NOT NULL
);


CREATE TABLE cerveja_Pilsen(
	idPilsen INT PRIMARY KEY auto_increment,
	nomeCerveja VARCHAR(30) NOT NULL,
    teorAlcolico DECIMAL(2,1) NOT NULL
);

SELECT * FROM Empresa;

INSERT INTO Empresa(nomeEmpresa, email, cnpj) VALUES
	('Cidade Imperial','admin@cervejariacidadeimperial.com.br', '67.161.477/0001-20'),
	('Cervejaria Campinas','lojavirtual@cervejariacampinas.com.br', '89.531.558/0001-07'),
	('Plzenky Prazdroj','info@prazdroj.cz', '71.535.463/0001-04');

SELECT * FROM administrador;

INSERT INTO administrador VALUES
	(default, 'Emanuelle','12344');

SELECT * FROM sensor;

INSERT INTO Sensor VALUES
	(default, 'DS18B20'),
	(default, 'TMP36'),
    (default, 'LM35');
    
SELECT * FROM maquina;

INSERT INTO Maquina VALUES
	(1 ,'EZbrew', 'Alta fermentação'),
	(2, 'YoLong Brewtech', 'Baixa fermentação');

SELECT * FROM cerveja_IPA;

INSERT INTO cerveja_IPA VALUES
	('American IPA', '7,0'),
    ('English IPA', '6,5'),
	('Imperial IPA', '8,2'),
    ('Bandida', '4,5');


SELECT * FROM cerveja_Pilsen;

INSERT INTO cerveja_IPA VALUES
	('Skol', '4,7'),
    ('Antarctica', '4,9'),
	('Itaipava', '4,5'),
    ('Stella Artois', '5,0');
    
SHOW TABLES;
