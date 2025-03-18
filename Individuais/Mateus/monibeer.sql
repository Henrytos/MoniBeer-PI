CREATE DATABASE MONIBEER;

USE MONIBEER;

CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(50),
    cnpj CHAR(14),
    email VARCHAR(50)
);

INSERT INTO empresa (nomeEmpresa, cnpj, email) VALUES
('Cervejaria Puro Malte', '12345678000190', 'contato@puromalte.com'),
('Lúpulo Forte Brew', '98765432000121', 'suporte@lupuloforte.com'),
('Fábrica de Cervejas Artesanais', '45678912000155', 'admin@fabricaartesanal.com'),
('Malte Dourado Ltda', '78912345000188', 'info@maltedourado.com'),
('Cerveja do Mestre', '32165498000177', 'contato@cervejadomestre.com');

SELECT * FROM empresa;
SELECT * FROM empresa WHERE nomeEmpresa LIKE 'C%';
SELECT idEmpresa AS 'ID da empresa' ,nomeEmpresa AS 'Nome da Empresa',cnpj AS 'CNPJ', email AS 'Email de contato' FROM empresa;
SELECT idEmpresa AS 'ID', email AS 'EMAIL DE CONTATO' FROM empresa WHERE email LIKE '%f%';

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    nomeSensor VARCHAR(20),
    statusSensor VARCHAR(10),
    CONSTRAINT chkStatusSensor CHECK(statusSensor IN('Ligado','Desligado','Manutenção'))
);

INSERT INTO sensor (nomeSensor,statusSensor)VALUES 
	('DTH11', 'Ligado'),
	('LM35',  'Ligado'),
	('DTH11',  'Desligado'),
	('LM35',  'Manutenção'),
    ('LM35',  'Desligado');
    
SELECT * FROM sensor;
SELECT IdSensor AS 'ID do sensor', nomeSensor AS 'Nome do Sensor', statusSensor AS 'Status do Sensor' FROM sensor WHERE statusSensor = 'Desligado';
SELECT idSensor AS 'ID do sensor', nomeSensor AS 'Nome do sensor', statusSensor AS 'Status do sensor' FROM sensor WHERE nomeSensor = 'DTH11';
SELECT nomeSensor AS 'Nome do sensor', statusSensor AS 'Status do sensor' FROM sensor WHERE nomeSensor = 'LM35' AND statusSensor = 'Desligado';
SELECT IdSensor AS 'ID do sensor', nomeSensor AS 'Nome do Sensor', statusSensor AS 'Status do Sensor' FROM sensor ORDER BY statusSensor DESC;

CREATE TABLE temperatura(
	idConfig INT PRIMARY KEY AUTO_INCREMENT,
    tempMax DECIMAL(3,1),
    tempMin DECIMAL(3,1)
);

INSERT INTO temperatura (tempMax, tempMin) VALUES
(22.0, 2.0),
(24.0, 2.0),
(12.0, 0.0),
(14.0, -1.0),
(20.0, 2.0); 

SELECT * FROM temperatura;
SELECT idConfig AS 'ID da configuração', tempMax AS 'Temperatura máxima(Cº)', tempMin AS 'Temperatura mínima(Cº)' FROM temperatura ORDER BY tempMax DESC; 
SELECT idConfig AS 'ID da configuração', tempMax AS 'Temperatura máxima(Cº)', tempMin AS 'Temperatura mínima(Cº)' FROM temperatura ORDER BY tempMin;
SELECT idConfig AS 'ID da configuração', tempMax AS 'Temperatura máxima(Cº)', tempMin AS 'Temperatura mínima(Cº)' FROM temperatura WHERE tempMax >= 20 ;
SELECT idConfig AS 'ID da configuração', tempMax AS 'Temperatura máxima(Cº)', tempMin AS 'Temperatura mínima(Cº)' FROM temperatura WHERE tempMin <= 0 ;
SELECT idConfig AS 'ID da configuração', tempMax AS 'Temperatura máxima(Cº)', tempMin AS 'Temperatura mínima(Cº)' FROM temperatura WHERE tempMax <= 14 AND tempMin <= 0 ;