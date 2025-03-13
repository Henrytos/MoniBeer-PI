CREATE DATABASE duff;
use duff;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    senha VARCHAR(30) NOT NULL,
    cpnj CHAR(14) NOT NULL
);

INSERT INTO Usuario VALUES
(default, 'ClubeDoMalte', 'Marco Polo','marco.polo@clubedomalte.com.br','abc1234sda', '11605819000107'),
(default, 'Colorado', 'Anderson Silva', 'anderson.silva@colorado.com.br','cdgf43322', '01366303000195'),
(default, 'Eisenbahn', 'Wellington José', 'wellington.jose@eisenbahn.com.br', 'vbc4sv32','04176513000109'),
(default, 'Ledmont', 'Richard Montes', 'richard.montes@ledmont.com.br', 'KFmcd23', '33846612000159'),
(default, 'Barestia', 'Giovanni Eduardo', 'giovanni.eduardo@barestia.com.br','CME32', '56426771000108');


CREATE TABLE Sensor(
idSensor INT PRIMARY KEY auto_increment,
Nome VARCHAR (10),
statusSensor varchar(20),
FermentadorAtribuido VARCHAR(30),
constraint chkStatus check (statusSensor in ('ativo', 'inativo', 'manutenção'))
);

INSERT INTO Sensor VALUES
(default, 'DH11', 'ativo', 'maquina1'),
(default, 'DH11', 'ativo', 'maquina2'),
(default, 'DH11', 'manutencao', 'maquina3'),
(default, 'DH11', 'ativo', 'maquina4'),
(default, 'DH11', 'ativo', 'maquina5');

CREATE TABLE configSensor(
	idConfig INT PRIMARY KEY AUTO_INCREMENT,
    tipoCerveja VARCHAR(20),
    CONSTRAINT chkTipoCerveja CHECK (tipoCerveja IN ('IPA', 'Pilsen')),
    etapas INT,
    temperaturaMin INT,
    temperaturaMax INT
);

INSERT INTO configSensor VALUES
(default, 'IPA', 3, 0, 4),
(default, 'IPA', 2, 3, 10),
(default, 'Pilsen', 2, -2, 5),
(default, 'IPA', 1, 0, 4);

CREATE TABLE fermentador(
	idFermentador INT PRIMARY KEY AUTO_INCREMENT,
    statusFermentador VARCHAR(40),
    CONSTRAINT chkStatus CHECK(statusFermentador IN('Estável', 'Instável')),
    decisao VARCHAR(100),
    CONSTRAINT chkDecisao CHECK(decisao IN ('Ligar camisas de resfriamento', 'Aumentar temperatura do fermentador', 'Desligar fermentador'))
);

INSERT INTO fermentador VALUES

(default, 'Estável', 'Desligar fermentador'),
(default, 'Instável', 'Ligar camisas de resfriamento'),
(default, 'Instável', 'Aumentar temperatura do fermentador'),
(default, 'Instável', 'Ligar camisas de resfriamento');

SELECT * FROM Usuario;