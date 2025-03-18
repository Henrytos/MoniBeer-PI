CREATE DATABASE Projeto_PI;
USE Projeto_PI;

CREATE TABLE register(
id_cliente INT PRIMARY KEY auto_increment,
razao_social VARCHAR(35),
cnpj VARCHAR(50) not null,
responsavel VARCHAR(30) not null,
telefone VARCHAR(14),
email VARCHAR(50) not null,
site VARCHAR(56),
cep CHAR(7),
numero VARCHAR(5),
complemento VARCHAR(20));

INSERT INTO register VALUES
(default,'Cervejaria Artesanal do Vale', '12.345.678/0001-90', 'Ana Clara', '(11) 9876-5432', 'contato@cervejariadovale.com', 'www.cervejariadovale.com', '1234567', '101', 'Próximo ao rio');

INSERT INTO register VALUES 
(default,'Cervejaria Pioneira', '98.765.432/0001-01', 'Lucas Martins', '(21) 9123-4567', 'lucas@cervejariapioneira.com', 'www.cervejariapioneira.com', '7654321', '202', 'Ao lado da praça');

INSERT INTO register VALUES
(default,'Cervejaria do Sul', '11.222.333/0001-11', 'Fernanda Souza', '(31) 3456-7890', 'fernanda@cervejariadosul.com', 'www.cervejariadosul.com', '4567890', '303', 'Em frente ao parque');

SELECT * FROM register;

CREATE TABLE `user`(
`id_user` INT PRIMARY KEY auto_increment,
`user_name` VARCHAR(100),
`email` VARCHAR(100),
`password` VARCHAR(100));

INSERT INTO `user` VALUES
(default,'Carlos Silva', 'carlos.silva@example.com', 'senha123'),
(default,'Mariana Oliveira', 'mariana.oliveira@example.com', 'senha456'),
(default,'João Pereira', 'joao.pereira@example.com', 'senha789');

SELECT * FROM `user`;

CREATE TABLE beer(
id_beer INT PRIMARY KEY auto_increment,
nome_beer VARCHAR(30) not null,
temp_adequada INT(3) not null,
fase_fermentacao INT(1),
tanque VARCHAR(10));

INSERT INTO beer VALUES
(default,'Cerveja Pilsen Clássica', 4, 1, 'Tanque B'),
(default,'Cerveja IPA Exemplar', 7, 2, 'Tanque A');

SELECT * FROM beer;

CREATE TABLE sensor (
id_sensor INT PRIMARY KEY auto_increment,
tempo DATETIME,
temperatura_celsius DECIMAL(5,2),
temperatura_porcentagem INT(3));

INSERT INTO sensor VALUES
(default,'2025-03-01', 7.00, 70);

SELECT * FROM sensor;
