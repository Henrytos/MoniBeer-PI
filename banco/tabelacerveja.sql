CREATE DATABASE DUFF;
USE DUFF;

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY auto_increment,
NomeEmpresa VARCHAR(50) NOT NULL,
CNPJ CHAR(14) NOT NULL,
Representante VARCHAR (45) NOT NULL,
Telefone VARCHAR(20) NOT NULL,
EmailCliente VARCHAR (250) NOT NULL,
Senhaincriptada VARCHAR (255) NOT NULL
);

INSERT INTO Usuario VALUES
(default, 'ClubeDoMalte', '11605819000107', 'Marco Polo', '11978235787','marco.polo@clubedomalte.com.br', '976654237'),
(default, 'Colorado', '01366303000195', 'Anderson Silva', '11958432510', 'anderson.silva@colorado.com.br','876543354'),
(default, 'Eisenbahn', '04176513000109', 'Wellington José', '1191153902', 'wellington.jose@eisenbahn.com.br', '345678826'),
(default, 'Ledmont', '33846612000159', 'Richard Montes', '11986654321', 'richard.montes@ledmont.com.br', '229635294'),
(default, 'Barestia', '56426771000108', 'Giovanni Eduardo', '11954739213', 'giovanni.eduardo@barestia.com.br', '123456789');

CREATE TABLE Sensor(
idSensor INT PRIMARY KEY auto_increment,
Nome VARCHAR (10),
statusSensor varchar(20),
MaquinaAtribuida VARCHAR(30),
constraint chkStatus check (statusSensor in ('ativo', 'inativo', 'manutenção'))
);

INSERT INTO Sensor VALUES
(default, 'DH11', 'ativo', 'maquina1'),
(default, 'DH11', 'ativo', 'maquina2'),
(default, 'DH11', 'manutencao', 'maquina3'),
(default, 'DH11', 'ativo', 'maquina4'),
(default, 'DH11', 'ativo', 'maquina5');

CREATE TABLE Tanque(
idTanque INT PRIMARY KEY auto_increment,
Nome Varchar (40),
TipoCerveja VARCHAR (20),
Temperaturamax decimal(4,2),
Temperaturamin decimal (4,2),
EstagioFermentacao CHAR (1),
constraint chkferm check (estagiofermentacao in ('A', 'B', 'C')),
constraint chkTipo check (tipoCerveja in ('IPA', 'Pilsen'))
);
INSERT INTO Tanque VALUES
(default, 'maquina1', '01', '01','IPA', '24.0', '18.0', 'B'),
(default, 'maquina2', '02', '05', 'IPA', '24.0', '18.0', 'A'),
(default, 'maquina3', '04', '03','Pilsen', '10.0', '12.0', 'B'),
(default, 'maquina4','03', '04', 'IPA', '24.0', '18.0', 'C'),
(default, 'maquina5', '05', '02','Pilsen', '10.0', '12.0', 'A');

SELECT * FROM TANQUE;
