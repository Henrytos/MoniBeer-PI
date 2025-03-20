CREATE DATABASE MoniBeer;
USE MoniBeer;


CREATE TABLE Empresa(
idEmpresa INT PRIMARY KEY auto_increment,
NomeEmpresa VARCHAR(50) NOT NULL,
CNPJ CHAR(14) NOT NULL UNIQUE,
RepresentanteEmpresa VARCHAR (45) NOT NULL,
Telefone VARCHAR(20) NOT NULL,
EmailRepresentante VARCHAR (250) NOT NULL,
SenhaRepresentante VARCHAR(255) NOT NULL,
QtdMaquinas INT NOT NULL
);

INSERT INTO Empresa VALUES
(DEFAULT, 'ClubeDoMalte', '11605819000107', 'Marco Polo', '11978235787','marco.polo@clubedomalte.com.br', '976654237', 7),
(DEFAULT, 'Colorado', '01366303000195', 'Anderson Silva', '11958432510', 'anderson.silva@colorado.com.br','876543354', 4),
(DEFAULT, 'Eisenbahn', '04176513000109', 'Wellington José', '1191153902', 'wellington.jose@eisenbahn.com.br', '345678826', 7),
(DEFAULT, 'Ledmont', '33846612000159', 'Richard Montes', '11986654321', 'richard.montes@ledmont.com.br', '229635294', 17),
(DEFAULT, 'Barestia', '56426771000108', 'Giovanni Eduardo', '11954739213', 'giovanni.eduardo@barestia.com.br', '123456789', 10);

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY auto_increment,
EmailUsuario VARCHAR (250) NOT NULL,
SenhaIncriptada VARCHAR (255) NOT NULL,
TipoUsuario VARCHAR (40) DEFAULT 'Funcionario',
CONSTRAINT chk_tipo CHECK (TipoUsuario in ('Administrador', 'Funcionario'))
);

INSERT INTO USUARIO VALUES 
(DEFAULT, 'silvana.batista@clubedomalte.com.br', '124567983', 'Administrador'),
(DEFAULT, 'edward.sobrado@clubedomalte.com.br', '987654329', 'Funcionario'),
(DEFAULT, 'anderson.soares@colorado.com.br', '345267183', 'Administrador'),
(DEFAULT, 'joana.vilma@colorado.com.br', '123678908', 'Funcionario'),
(DEFAULT, 'dilma.abelardo@eisenbahn.com.br','345789072', 'Funcionario'),
(DEFAULT, 'vitorino.milchen@eisebahn.com.br', '56789087654', 'Administrador'),
(DEFAULT, 'juan.bento@ledmont.com.br', '3678902361', 'Administrador'),
(DEFAULT, 'jobson.alves@ledmont.com.br', '4563728012', 'Funcionario'),
(DEFAULT, 'icaro.educardo@barestia.com.br', '5678907654', 'Administrador'),
(DEFAULT, 'andre.richardo@barestia.com.br', '123678904', 'Funcionario');


CREATE TABLE Sensor(
idSensor INT PRIMARY KEY auto_increment,
Nome VARCHAR (10),
StatusSensor varchar(20),
MaquinaAtribuida VARCHAR(30),
CONSTRAINT chkStatus CHECK (statusSensor in ('Ativo', 'Inativo', 'Manutenção'))
);

INSERT INTO Sensor VALUES
(DEFAULT, 'LM35', 'Ativo', 'Maquina1'),
(DEFAULT, 'LM35', 'Ativo', 'Maquina2'),
(DEFAULT, 'LM35', 'Manutenção', 'Maquina3'),
(DEFAULT, 'LM35', 'Ativo', 'Maquina4'),
(DEFAULT, 'LM35', 'Ativo', 'Maquina5'),
(DEFAULT, 'LM35', 'Manutenção', '');

CREATE TABLE Fermentadora(
idFermentadora INT PRIMARY KEY auto_increment,
Nome VARCHAR (40),
TipoCerveja VARCHAR (20),
EmpresaAssociada VARCHAR(45),
Temperaturamax DECIMAL(4,2),
Temperaturamin DECIMAL (4,2),
EstagioFermentacao CHAR (1),
CONSTRAINT chkferm CHECK (EstagioFermentacao in ('A', 'B', 'C')),
CONSTRAINT chkTipo CHECK (TipoCerveja in ('IPA', 'Pilsen'))
);

INSERT INTO Fermentadora VALUES
(DEFAULT, 'Maquina 2', 'IPA', 'Clube do Malte','24.0', '18.0', 'A'),
(DEFAULT, 'Maquina 1', 'IPA', 'Clube do Malte', '24.0', '18.0', 'B'),
(DEFAULT, 'Maquina 4', 'IPA','Clube do Malte','24.0', '18.0', 'C'),
(DEFAULT, 'Maquina 3', 'Pilsen', 'Clube do Malte', '10.0', '12.0', 'B'),
(DEFAULT, 'Maquina 2', 'IPA', 'Colorado','24.0', '18.0', 'A'),
(DEFAULT, 'Maquina 1', 'IPA', 'Colorado', '24.0', '18.0', 'B'),
(DEFAULT, 'Maquina 3', 'Pilsen', 'Colorado', '10.0', '12.0', 'B'),
(DEFAULT, 'Maquina 4', 'Pilsen', 'Colorado','10.0', '12.0', 'A');


SELECT * FROM FERMENTADORA;
SELECT * FROM USUARIO;
SELECT * FROM SENSOR;
SELECT * FROM EMPRESA;

-- Selecionando a tabela Fermentadora com o id sendo igual a 01
SELECT * FROM FERMENTADORA WHERE idFermentadora = 1;

-- Selecionando a tabela Empresa com o representante tendo como a segunda letra A
SELECT * FROM EMPRESA WHERE  RepresentanteEmpresa LIKE '%_A';

-- Atualizamos os dados da tabela sensor em que a máquina atribuida 2 do id 2 para máquina 6
UPDATE SENSOR SET MaquinaAtribuida = 'Maquina 6' WHERE idSensor = 2;

-- Selecionando o tipo de cerveja da tabela fermentadora em que caso o estagio de fermentacao for A aparecer 1 senão Fermentação Inicial.
SELECT TipoCerveja, CASE WHEN EstagioFermentacao = 'A' THEN 'Fermentação Inicial' ELSE 'Em outras Etapas' END AS EtapaFermentacao FROM Fermentadora;

-- DELETE DE UMA EMPRESA 
DELETE FROM EMPRESA WHERE idEmpresa = 6; 
SELECT * FROM EMPRESA;

-- Apelidando os campos empresa e representante para melhor visualização 
SELECT Empresa.nomeEmpresa AS nomeDaEmpresa, Empresa.RepresentanteEmpresa AS Representante FROM Empresa;

-- Alterando a tabela sensor, modificando a coluna MaquinaAtribuida para VARCHAR(40).
ALTER TABLE SENSOR MODIFY COLUMN MaquinaAtribuida VARCHAR(40);









