CREATE DATABASE Monibeer;
USE Monibeer;

CREATE TABLE Cliente(
	id int primary key auto_increment,
	nomeFantasia varchar(50),
    cnpj char(14),
    email varchar(70),
    telefone varchar(60),
    responsavel varchar(100),
	numFermentadoras int,
    senha varchar(30)
);

CREATE TABLE Fermentadora(
	idFermentadora int primary key auto_increment,
    maquina varchar(20),
    TipoCerveja char(7),
    EstagioFermentacao char(1),
	temperaturaMinima decimal(4,2),
    temepraturaMaxima decimal(4,2),
    constraint ChkEstagio check (EstagioFermentacao  in ('A','B','C','D')),
    constraint ChkTipo check (tipoCerveja in ('IPA', 'Pilsen'))
);

CREATE TABLE Sensor (
	idSensor int primary key auto_increment,
	nomeSensor varchar(30),
    tipoSensor char(20),
    maquinaAtribuida int,
	statusSensor varchar(10),
    constraint chkStatus check (statusSensor in ('Ativo', 'Inaitvo', 'manutencao'))
);

INSERT INTO cliente (nomeFantasia, cnpj, responsavel, telefone, email, numFermentadoras) VALUES
('ClubeDoMalte', '11605819000107', 'Marco Polo', '11978235787', 'marco.polo@clubedomalte.com.br', '10'),
('Colorado', '01366303000195', 'Anderson Silva', '11958432510', 'anderson.silva@colorado.com.br', '7'),
('Eisenbahn', '04176513000109', 'Wellington José', '1191153902', 'wellington.jose@eisenbahn.com.br', '5'),
('Ledmont', '33846612000159', 'Richard Montes', '11986654321', 'richard.montes@ledmont.com.br', '11'),
('Barestia', '56426771000108', 'Giovanni Eduardo', '11954739213', 'giovanni.eduardo@barestia.com.br', '12');

INSERT INTO Fermentadora (maquina, TipoCerveja, EstagioFermentacao, temperaturaMinima, temepraturaMaxima) VALUES
('maquina1', 'IPA', 'B', 18.0, 24.0),
('maquina2', 'IPA', 'A', 18.0, 24.0),
('maquina3', 'Pilsen', 'B', 10.0, 12.0),
('maquina4', 'IPA', 'C', 18.0, 24.0),
('maquina5', 'Pilsen', 'A', 10.0, 12.0);

INSERT INTO Sensor (nomeSensor, tipoSensor, statusSensor, maquinaAtribuida) VALUES
('DH11', 'Temperatura', 'Ativo', 1),
('DH11', 'Temperatura', 'Ativo', 2),
('DH11', 'Temperatura', 'Manutencao', 3),
('DH11', 'Temperatura', 'Ativo', 4),
('DH11', 'Temperatura', 'Ativo', 5);

SELECT * FROM sensor;
SELECT * FROM fermentadora;
SELECT * FROM cliente;

SELECT nomeFantasia as 'nome da empresa' FROM cliente;
SELECT concat('O nome da empresa é: ' , nomeFantasia) as 'Empresas' FROM Cliente;
SELECT nomeFantasia ,CASE WHEN nomeFantasia  LIKE 'C%' THEN 'Taxa Maior' ELSE 'Taxa menor' END FROM cliente;
