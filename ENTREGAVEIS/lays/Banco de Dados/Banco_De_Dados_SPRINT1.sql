CREATE DATABASE projeto_integrado;
USE projeto_integrado;

CREATE TABLE cad_empresa(
id_empresa INT PRIMARY KEY auto_increment,
nome_empresa VARCHAR (60),
cnpj CHAR (14), -- tratar como CPF
responsavel VARCHAR(50),
email VARCHAR (60), 
senha VARCHAR (90),
qtd_maquinas INT,
tipo_cerveja VARCHAR (10),
CONSTRAINT chk_cerveja CHECK(tipo_cerveja in ('Pilsen', 'IPA'))
);
 
 SELECT * FROM cad_empresa;
 INSERT INTO cad_empresa VALUES
 (DEFAULT, 'Albanos', '16757535000141', 'Marcia Paula', 'marcia.paula@albanos.com.br', '0987645387', 10, 'Pilsen'),
 (DEFAULT, 'Traum ','20755475000103', 'Paula Fernada', 'paula.fernanda@traum.com.br', '7654114241', 6, 'Pilsen'),
 (DEFAULT, 'Doutor Duranz','29639335000306', 'Anderson André', 'anderson.andre@doutorduranz.com.br', '567890093', 17, 'Pilsen'),
 (DEFAULT, 'Cervejaria Backbone','31330391000136', 'Souza Martinz', 'souza.martins@backbone.com.br', '124365789', 20, 'IPA'),
 (DEFAULT, 'Dádiva ','19225535000199', 'Joana Maria', 'joana.maria@dadiva.com.br', '4563728192', 12, 'IPA');
 
 CREATE TABLE Sensor(
 id_sensor INT PRIMARY KEY auto_increment,
 nome_sensor VARCHAR (4),
 maquina_sensor VARCHAR (20),
 status_sensor VARCHAR (20),
 CONSTRAINT  chk_status CHECK (status_sensor in ('Ativo', 'Inativo', 'Em manutenção'))
 );
 ALTER TABLE Sensor MODIFY COLUMN status_sensor VARCHAR (30);
 
 INSERT INTO Sensor VALUES 
 (DEFAULT, 'LM35', '01', 'Ativo'),
 (DEFAULT, 'LM35', '00', 'Em manutenção'),
 (DEFAULT, 'LM35', '08', 'Ativo'),
 (DEFAULT, 'LM35', '03', 'Inativo'),
 (DEFAULT, 'LM35', '04', 'Ativo');
 
 CREATE TABLE fermentadora (
 id_fermentadora INT PRIMARY KEY auto_increment,
 Nome VARCHAR (40),
 temp_maximo DECIMAL (4,2),
 temp_minimo DECIMAL (4,2),
 etapa CHAR (1), 
 nome_cerveja VARCHAR (6)
 );
 
ALTER TABLE fermentadora DROP COLUMN nome; 
 
 INSERT INTO fermentadora VALUES
 (DEFAULT, '10','12', 'A', 'Pilsen'),
 (DEFAULT, '10','12', 'B', 'Pilsen'),
 (DEFAULT, '10','12', 'D', 'Pilsen'),
 (DEFAULT, '18', '20', 'B', 'IPA'),
 (DEFAULT, '18', '20', 'A', 'IPA'),
 (DEFAULT, '18', '20', 'C', 'IPA');
 
 CREATE TABLE usuario (
 id_usuario INT PRIMARY KEY auto_increment,
 nome VARCHAR (50),
 email VARCHAR (60),
 cpf CHAR (14),
 departamento VARCHAR (30),
 tipo_usuario VARCHAR (20)
 CONSTRAINT chk_usuario CHECK(tipo_usuario in('Administrador', 'padrão'))
 );
 
 INSERT INTO usuario VALUES 
 (DEFAULT, 'Leandra Soares', 'leandra.soares@traum.com.br', '12467893476', 'Diretoria', 'Administrador'),
 (DEFAULT, 'Juliana Mendonça', 'juliana.mendonca@traum.com.br', '23456789009', 'Operações', 'Padrão'),
 (DEFAULT, 'Claudinei Miranda', 'claudinei.miranda@traum.com.br', '51436789018', 'Operações', 'Padrão');
 
 
 
 
 
 
 
 
 
 
 