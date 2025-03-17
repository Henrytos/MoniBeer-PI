CREATE DATABASE MoniBeer;
USE MoniBeer;

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY auto_increment,
Nome_Empresa VARCHAR(50) NOT NULL,
CNPJ CHAR(14) NOT NULL UNIQUE,
Representante VARCHAR (45) NOT NULL,
Telefone VARCHAR(20) NOT NULL,
Email_Cliente VARCHAR (250) NOT NULL,
Senha_Incriptada VARCHAR (255) NOT NULL,
Qtd_Maquinas INT NOT NULL
);

INSERT INTO Usuario VALUES
(default, 'ClubeDoMalte', '11605819000107', 'Marco Polo', '11978235787','marco.polo@clubedomalte.com.br', '976654237', 7),
(default, 'Colorado', '01366303000195', 'Anderson Silva', '11958432510', 'anderson.silva@colorado.com.br','876543354', 4),
(default, 'Eisenbahn', '04176513000109', 'Wellington José', '1191153902', 'wellington.jose@eisenbahn.com.br', '345678826', 7),
(default, 'Ledmont', '33846612000159', 'Richard Montes', '11986654321', 'richard.montes@ledmont.com.br', '229635294', 17),
(default, 'Barestia', '56426771000108', 'Giovanni Eduardo', '11954739213', 'giovanni.eduardo@barestia.com.br', '123456789', 10);

CREATE TABLE Sensor(
idSensor INT PRIMARY KEY auto_increment,
Nome VARCHAR (10),
statusSensor varchar(20),
MaquinaAtribuida VARCHAR(30),
constraint chkStatus check (statusSensor in ('Ativo', 'Inativo', 'Manutenção'))
);



INSERT INTO Sensor VALUES
(default, 'LM35', 'Ativo', 'Maquina1'),
(default, 'LM35', 'Ativo', 'Maquina2'),
(default, 'LM35', 'Manutenção', 'Maquina3'),
(default, 'LM35', 'Ativo', 'Maquina4'),
(default, 'LM35', 'Ativo', 'Maquina5'),
(DEFAULT,'LM35', 'Manutenção', '');


CREATE TABLE Tanque(
idTanque INT PRIMARY KEY auto_increment,
Nome Varchar (40),
Tipo_Cerveja VARCHAR (20),
Temperaturamax decimal(4,2),
Temperaturamin decimal (4,2),
Estagio_Fermentacao CHAR (1),
constraint chkferm check (Estagio_Fermentacao in ('A', 'B', 'C')),
constraint chkTipo check (Tipo_Cerveja in ('IPA', 'Pilsen'))
);

INSERT INTO Tanque VALUES
(default, 'Maquina1', 'IPA', '24.0', '18.0', 'B'),
(default, 'Maquina2', 'IPA', '24.0', '18.0', 'A'),
(default, 'Maquina3', 'Pilsen', '10.0', '12.0', 'B'),
(default, 'Maquina4','IPA','24.0', '18.0', 'C'),
(default, 'Maquina5', 'Pilsen', '10.0', '12.0', 'A');

SELECT * FROM TANQUE;
SELECT * FROM Usuario;

-- Selecionando a tabela Tanque com o id sendo igual a 01
SELECT * FROM TANQUE WHERE idTanque = 1;

-- Selecionando a tabela tanque com o nome tendo como a segunda letra A
SELECT * FROM TANQUE WHERE nome LIKE '_A%';

-- Inserindo mais um valor a tabela tanque 
INSERT INTO TANQUE VALUES 
(DEFAULT, 'Maquina6', 'Pilsen','10.0', '12.0', 'B');

-- Adicionando a tabela USUARIO a coluna confirmação de e-mail, sendo um VARCHAR de até 250, não podendo receber valores nulos 
ALTER TABLE Usuario ADD COLUMN ConfirmacaoEmail VARCHAR (250);

-- Selecionando a tabela usuario completa, para fazer updatesde confirmação de e-mail, do que já tem de dados na tabela, pelo id.
SELECT * FROM Usuario;
UPDATE USUARIO set ConfirmacaoEmail = 'marco.polo@clubedomalte.com.br' WHERE idUsuario = 1;
UPDATE USUARIO SET ConfirmacaoEmail = 'anderson.silva@colorado.com.br' WHERE idUsuario = 2;
UPDATE USUARIO SET ConfirmacaoEmail = 'welington.jose@eisenbahn.com.br' WHERE idUsuario = 3;
UPDATE USUARIO SET ConfirmacaoEmail = 'richard.montes@ledmont.com.br' WHERE idUsuario = 4;
UPDATE USUARIO SET ConfirmacaoEmail ='giovanni.eduardo@barestia.com.br' WHERE idUsuario = 5;

-- Selecionamos a coluna Senhaincriptada e apelidamos de Senha tabela usuario.
SELECT Senha_Incriptada AS Senha FROM Usuario;

-- Selecionando a tabela usuarios, a quantidade de maquinas que não estão preenchidas como 'A definir' na tabela Usuario
SELECT IFNULL(Qtd_maquinas, '0') AS quantidade_maquinas FROM Usuario;

-- Selecionando o tipo de cerveja da tabela tanque em que caso o estagio de fermentacao for A aparecer 1 senão 0.
SELECT Tipo_Cerveja, CASE WHEN Estagio_Fermentacao = 'A' THEN 1 ELSE 0 END AS EtapaFermentacao FROM Tanque;







