CREATE DATABASE sprtit1;

USE sprtit1;

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(20) NOT NULL,
  statusSensor VARCHAR(10) NOT NULL,
  
	CONSTRAINT chkTipo CHECK(tipo IN('lm35', 'dth11')),
	CONSTRAINT chkStatusSensor CHECK(statusSensor IN('ativo', 'inativo', 'manutenção'))
);

INSERT INTO sensor VALUES(DEFAULT, 'lm35', 'ativo');
INSERT INTO sensor VALUES(DEFAULT, 'lm35', 'inativo');
INSERT INTO sensor VALUES(DEFAULT, 'dth11', 'ativo');
INSERT INTO sensor VALUES(DEFAULT, 'dth11', 'inativo');

SELECT * FROM sensor;
SELECT idSensor AS 'identificador de sensor', tipo AS 'tipo de sensor', statusSensor AS 'status do sensor' FROM sensor WHERE statusSensor = 'inativo';
SELECT idSensor AS 'identificador de sensor', tipo AS 'tipo de sensor', statusSensor AS 'status do sensor' FROM sensor WHERE statusSensor = 'ativo';
SELECT tipo, statusSensor FROM sensor WHERE statusSensor = 'ativo';
SELECT tipo, statusSensor FROM sensor WHERE statusSensor = 'inativo';

CREATE TABLE empressa(
	idEmpressa INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  logoUrl TEXT NOT NULL 
);

INSERT INTO empressa VALUES(DEFAULT, 'Cervejaria Artesanal Lupulus', '12345678000195', 'http://www.lupulus.com.br/logo.png');
INSERT INTO empressa VALUES(DEFAULT, 'Cervejaria Pilsen', '98765432000160', 'http://www.beiramar.com.br/logo.png');
INSERT INTO empressa VALUES(DEFAULT, 'Cervejaria IPA', '55566677000192', 'http://www.cascatadourada.com.br/logo.png');

SELECT * FROM empressa;
SELECT nome AS 'Nome da Empressa',logoUrl AS 'URL da logo da empressa', cnpj AS 'CNPJ da empressa' FROM empressa;
SELECT * FROM empressa WHERE nome LIKE '% _i%';


CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE,
  senhaHash VARCHAR(100) NOT NULL,
  
  CONSTRAINT chkEMail CHECK(email LIKE '%@%')
);

INSERT INTO usuario VALUES(DEFAULT, 'henry', 'henry.arcaya@sptech.school', '8eh293rvd23dtbw79dfqv8yedw97eq');
INSERT INTO usuario VALUES(DEFAULT, 'matheus', 'matheus.mamani@sptech.school', '1834ubh1934gb1973431413');
INSERT INTO usuario VALUES(DEFAULT, 'maria', 'maria.eduarda@sptech.school', 'dh03qh083eh808201834ubh1');

SELECT * FROM usuario;
SELECT nome, email FROM usuario WHERE nome LIKE 'h%';
SELECT nome, email FROM usuario WHERE nome LIKE '_e%';
SELECT nome, email FROM usuario WHERE nome LIKE '%i_';
SELECT nome, email FROM usuario WHERE nome LIKE '%a%';


CREATE TABLE fermentadora(
	idFermentadora INT PRIMARY KEY AUTO_INCREMENT,
  codigoFermentadora INT NOT NULL,
  temperaturaMaxima DECIMAL(4,1) NOT NULL, 
  temperaturaMinima DECIMAL(4,1) NOT NULL,
  faseDeFermentacao INT NOT NULL,
  statusDaFermentadora VARCHAR(10),
  CONSTRAINT chkFaseDeFermentacao CHECK(faseDeFermentacao IN(1, 2, 3)), 
  CONSTRAINT chkStatusDaFermentadora CHECK(statusDaFermentadora IN('ativo', 'inativo', 'manutenção')),
  CONSTRAINT chkTemperaturaMaxima CHECK(-15 <= temperaturaMaxima AND temperaturaMaxima =< 30),
  CONSTRAINT chkTemperaturaMinima CHECK(-15 <= temperaturaMinima AND temperaturaMinima =< 30),
  CONSTRAINT chkTemperaturas CHECK(temperaturaMinima < temperaturaMaxima)
);

INSERT INTO fermentadora VALUES(DEFAULT, 101, 25.0, 18.5, 1, 'ativo');
INSERT INTO fermentadora VALUES(DEFAULT, 102, 28.0, 20.0, 2, 'inativo');
INSERT INTO fermentadora VALUES(DEFAULT, 103, 22.5, 15.0, 3, 'manutenção');
INSERT INTO fermentadora VALUES(DEFAULT, 104, 30.0, 23.5, 1, 'ativo');

SELECT * FROM fermentadora;
SELECT codigoFermentadora AS 'Código da fermentadora',CASE 
	WHEN faseDeFermentacao = 1 THEN 'Primeira fase de fermentação'
  WHEN faseDeFermentacao = 2 THEN 'Segunda fase de fermentação'
  WHEN faseDeFermentacao = 3 THEN 'TErceira fase de fermentação'
  ELSE  'Não estamos em nenhuma fase de fermentação'
END AS 'Fase de fermentação', CONCAT('A temperatura maxima de fermentação é ', temperaturaMaxima, ' e a minima é de ', temperaturaMinima) AS 'Descrição da temperatua'  FROM fermentadora;
SELECT * FROM fermentadora WHERE faseDeFermentacao = 1;
SELECT * FROM fermentadora WHERE statusDaFermentadora = 'ativo';

CREATE TABLE notificacao(
	idNotificacao INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(30) NOT NULL,
  statusDaNotificacao VARCHAR(20) NOT NULL,
  menssagem VARCHAR(255) NOT NULL,
  dataDeCriacao DATETIME NOT NULL,
  CONSTRAINT chkStatusDaNotificacao CHECK(statusDaNotificacao IN('verde' ,'amarelo' ,'vermelho'))
);

INSERT INTO notificacao VALUES (DEFAULT, 'Temperatura Estebilizada', 'verde', 'A fermentadora XPTO estabilizou com sucesso sua temperatura', '2025-03-10:14:24:00');
INSERT INTO notificacao VALUES (DEFAULT, 'Temperatura Em Observação', 'amarelo', 'A fermentadora XYZ está em observação por conta de sua elevação de temperatura para 20 graus celsius', '2025-02-10:14:24:00');
INSERT INTO notificacao VALUES (DEFAULT, 'Temperatura Elevada', 'vermelho', 'A fermentadora ABC está com temperatura acima do recomendado , está em 40 graus celsius', '2025-01-10:14:24:00');

SELECT * FROM notificacao;
SELECT * FROM notificacao WHERE statusDaNotificacao = 'verde';
SELECT * FROM notificacao WHERE statusDaNotificacao = 'amarelo';
SELECT * FROM notificacao WHERE statusDaNotificacao = 'vermelho';
SELECT titulo AS 'Título', statusDaNotificacao AS 'status', menssagem, dataDeCriacao AS 'Data de criação' FROM notificacao;
SELECT titulo AS 'Título', statusDaNotificacao AS 'status', menssagem, dataDeCriacao AS 'Data de criação' FROM notificacao ORDER BY dataDeCriacao DESC;



# RELACIONAMENTO DE TABELAS , IMPLEMENTAÇÂO FUTURA

# EMPRESSA E FUNCIONARIO 1:N
# uma EMPRESSA tem varios FUNCIONARIOS(usuarios)
# um FUNCIONARIO(usuario) pertence somente a uma EMPRESSA

# FERMENTADORA E SENSOR 1:1
# uma FERMENTADORA pertece a um sensor
# um SENSOR pertence a uma FERMENTADORA

# FERMENTADORA E NOTIFICAÇÃO 1:N
# uma FERMENTADORA tem muitas NOTIFICAÇÕES(notificacao)
# uma NOTIFICAÇÕES(notificacao) pertence a uma FERMENTADORA