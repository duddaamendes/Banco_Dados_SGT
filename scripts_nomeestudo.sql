DROP DATABASE IF EXISTS SGT;

CREATE DATABASE IF NOT EXISTS SGT;
USE `SGT` ;

-- -----------------------------------------------------
-- Table `usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuarios` INT(7) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuarios`));


-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` INT(7) NOT NULL auto_increment,
  `num_identificacao` VARCHAR(20) NOT NULL,
  `primeiro_nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` INT(8) NOT NULL,
  `num_casa` INT(4) NOT NULL,
  `id_usuarios` INT(7) NOT NULL,
  PRIMARY KEY ( `id_cliente`,`id_usuarios`),
  FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
  ON DELETE CASCADE
  ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `espacos_hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `espacos_hotel` (
  `id_espacos` INT(7) NOT NULL AUTO_INCREMENT,
  `nome_espaco` VARCHAR(100) NOT NULL,
  `dia_semana_abertura` DATE NOT NULL,
  `dia_semana_fechamento` DATE NOT NULL,
  `horario_abertura` TIME NOT NULL,
  `horario_fechamento` TIME NOT NULL,
  `capacidade` INT(3) NOT NULL,
  PRIMARY KEY (`id_espacos`));


-- -----------------------------------------------------
-- Table `funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id_funcionario` INT(20) NOT NULL AUTO_INCREMENT,
  `num_identificacao` VARCHAR(20) NOT NULL,
  `primeiro_nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` INT(8) NOT NULL,
  `num_casa` INT(4) NOT NULL,
  `id_usuarios` INT(7) NOT NULL,
  PRIMARY KEY (`id_funcionario`, `id_usuarios`),
  FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`)
  ON DELETE CASCADE
  ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Table `reservas_espacos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservas_espacos` (
  `id_reservas` INT(7) NOT NULL AUTO_INCREMENT,
  `dia_horario` DATETIME NOT NULL,
  `id_cliente` INT(7) NOT NULL,
  `id_espacos` INT(11) NOT NULL,
  PRIMARY KEY (`id_reservas`, `id_cliente`, `id_espacos`),
  FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  FOREIGN KEY (`id_espacos`) REFERENCES `espacos_hotel` (`id_espacos`)
  ON DELETE CASCADE
  ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `hospedagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospedagens` (
  `num_quarto` INT(7) NOT NULL,
  `checkin` DATETIME NOT NULL,
  `checkout` DATETIME NOT NULL,
  `id_cliente` INT(7) NOT NULL,
  PRIMARY KEY (`num_quarto`, `id_cliente`),
  FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
  ON DELETE CASCADE
  ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `manutencao_espaco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manutencao_espaco` (
  `id_manutencao_espaco` INT NOT NULL AUTO_INCREMENT,
  `dia` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_final` TIME NOT NULL,
  `tipo_manutencao` CHAR(50) NOT NULL,
  `id_espacos` INT(11) NOT NULL,
  PRIMARY KEY (`id_manutencao_espaco`, `id_espacos`),
  FOREIGN KEY (`id_espacos`) REFERENCES `espacos_hotel` (`id_espacos`)
  ON DELETE CASCADE
  ON UPDATE CASCADE);
    
    
    /*/Inserts tabela reserva de espacos/*/
    /*/20 (vinte) inserts por tabela/*/
    /*/ids foram criados automaticos mas vão ser trocados para o numero dos quartos /*/

-- Descs
DESC usuarios;
DESC clientes;
DESC espacos_hotel;
DESC funcionarios;
DESC reservas_espacos;
DESC hospedagens;
DESC manutencao_espaco;

-- INSERTS USUARIO ---
insert into usuarios (login, senha) values ( 'gbydaway0', 's5lRGZg');
insert into usuarios (login, senha) values ('gmacpaike1', 'a3aAJ2p');
insert into usuarios (login, senha) values ('lormond2', 'g1AWE6R');
insert into usuarios (login, senha) values ('dschruyers3', 'g3SLNdt');
insert into usuarios (login, senha) values ('fswansborough4', 'l3KFzgf');
insert into usuarios (login, senha) values ('asimmank5', 'h8TuF4E');
insert into usuarios (login, senha) values ('taviss6', 'c9EvM9a');
insert into usuarios (login, senha) values ('sklossmann7', 'u9j3j52');
insert into usuarios (login, senha) values ('jhutcheon8', 's9O2sj7');
insert into usuarios (login, senha) values ('imonger9', 'k3b343w');
insert into usuarios (login, senha) values ('cedmondsona', 'l0eMDE1');
insert into usuarios (login, senha) values ('gcrickettb', 'k0RKzG0');
insert into usuarios (login, senha) values ('thayhurstc', 'w3VeaHh');
insert into usuarios (login, senha) values ('tnasebyd', 'k8ZqBd0');
insert into usuarios (login, senha) values ('mbeazeye', 'u5Na6ul');
insert into usuarios (login, senha) values ('mglaisnerf', 's90Ii9F');
insert into usuarios (login, senha) values ('nlafflingg', 'f76jHyA');
insert into usuarios (login, senha) values ('gconrathh', 'f70xt6l');
insert into usuarios (login, senha) values ('mferdinandi', 'g9Ocf7K');
insert into usuarios (login, senha) values ('uelementj', 'c8zZ05a');

-- INSERTS CLIENTES ---
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('78080932445', 'Putnam', 'Nowland', '2013-08-01', 'pnowland0@tripadvisor.com', '(36) 72424-5142', 55652930, 15, 1);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('45345437765', 'Annalise', 'Mableson', '2009-05-30', 'amableson1@e-recht24.de', '(51) 29504-5076', 72353783, 558, 2);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('99859850445', 'Winnie', 'Baribal', '2016-05-26', 'wbaribal2@marketwatch.com', '(20) 16574-5955', 47773696, 915, 3);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('30912441445', 'Letti', 'Siemons', '1988-09-20', 'lsiemons3@imageshack.us', '(50) 51614-5525', 21571803, 364, 4);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('76191405765', 'Leo', 'Skace', '1987-12-31', 'lskace4@twitpic.com', '(34) 27474-5070', 28694511, 532, 5);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('51132384765', 'Granthem', 'Twelftree', '1988-10-03', 'gtwelftree5@plala.or.jp', '(14) 42754-5477', 33873245, 745, 6);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('31609613445', 'Huberto', 'Barsby', '2018-05-08', 'hbarsby6@google.de', '(78) 709724-559', 24872489, 555, 7);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('20268951765', 'Arnuad', 'Breem', '2001-04-13', 'abreem7@istockphoto.com', '(43) 56984-5760', 80108971, 289, 8);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('70766435987', 'Abigail', 'Sellor', '1988-09-27', 'asellor8@fc2.com', '(52) 84834-5532', 60273725, 706, 9);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('75712362234', 'Candy', 'Mathieu', '2005-08-15', 'cmathieu9@china.com.cn', '(91) 91754-5375', 43558081, 165, 10);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('86266709234', 'Tonye', 'Linning', '2004-11-25', 'tlinninga@opera.com', '(60) 99574-5204', 21316799, 703, 11);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('94503978987', 'Leann', 'Dobrovolny', '2002-05-03', 'ldobrovolnyb@businessinsider.com', '(73) 57904-5743', 29983973, 688, 12);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('26336038234', 'Fowler', 'Gopsall', '2022-07-08', 'fgopsallc@google.com', '(47) 10044-5270', 27032866, 563, 13);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('62164822765', 'Mort', 'Mart', '1987-09-09', 'mmartd@a8.net', '(35) 48744-5277', 15787123, 421, 14);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('85035307765', 'Ingamar', 'Tutchener', '2017-02-19', 'itutchenere@columbia.edu', '(14) 32934-5260', 62397774, 945, 15);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('93440157987', 'Hasty', 'Musto', '1996-02-10', 'hmustof@nhs.uk', '(57) 42904-5417', 33021232, 929, 16);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('29886144987', 'Nickolaus', 'Roll', '1993-01-31', 'nrollg@google.com', '(87) 45074-5689', 98917155, 399, 17);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('95968706765', 'Claudetta', 'Wight', '2014-06-13', 'cwighth@nyu.edu', '(32) 69934-5532', 56427709, 352, 18);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('12035834987', 'Domeniga', 'Nappin', '2020-12-10', 'dnappini@wisc.edu', '(38) 84794-5310', 64257832, 948, 19);
insert into clientes (num_identificacao, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, num_casa, id_usuarios) values ('42491338234', 'Nichole', 'Stranio', '1999-02-08', 'nstranioj@oakley.com', '(32) 78174-5968', 65661346, 828, 20);


-- INSERTS ESPACOS ---
use SGT;
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Academia', '2023-01-03', '2023-07-23', '13:27', '2:09', 1);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Psicina', '2023-10-29', '2023-02-21', '0:33', '0:07', 2);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Sala de recreação', '2023-07-09', '2023-12-28', '19:09', '18:13', 3);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Sauna', '2023-09-06', '2023-08-02', '9:59', '9:34', 4);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'SPA', '2023-10-08', '2023-04-22', '13:58', '1:19', 5);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Sala de jogos', '2023-06-13', '2023-02-04', '15:25', '7:39', 6);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Quadra de tênis', '2023-11-28', '2023-12-03', '16:00', '22:56', 7);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Quadra de vôlei', '2023-01-20', '2023-09-05', '9:48', '17:59', 8);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Quadra de futebol', '2023-09-04', '2023-10-30', '16:30', '22:08', 9);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Sala de pintura', '2023-03-07', '2023-04-16', '11:56', '12:34', 10);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Salão de Dança', '2023-04-24', '2023-05-04', '9:42', '0:52', 11);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Salão de festa', '2023-07-20', '2023-03-24', '23:37', '9:44', 12);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Quiosque', '2023-02-06', '2023-06-10', '2:30', '10:50', 13);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Mirante', '2023-07-14', '2023-12-11', '5:48', '16:47', 14);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Restaurante', '2023-06-10', '2023-06-27', '9:03', '14:41', 15);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Bar', '2023-01-13', '2023-10-15', '4:48', '7:09', 16);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Jardim', '2023-09-09', '2023-01-28', '13:37', '5:33', 17);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Banho de Lama', '2023-08-31', '2023-09-19', '11:43', '21:04', 18);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Massagem', '2023-10-27', '2023-08-26', '14:15', '17:17', 19);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Aromoterapia', '2023-07-25', '2023-07-24', '12:27', '19:05', 20);



-- INSERTS RESERVAS_ESPACOS ---
use SGT;
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (1, '2023-05-12 09:00', 1, 1);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (2, '2022-11-13 12:00', 2, 2);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (3, '2022-11-01 13:00', 3, 3);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (4, '2023-07-21 07:00', 4, 4);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (5, '2023-06-16 14:00', 5, 5);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (6, '2023-12-21 06:00', 6, 6);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (7, '2022-09-24 17:00', 7, 7);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (8, '2023-10-20 10:00', 8, 8);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (9, '2023-07-17 17:00', 9, 9);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (10, '2022-07-17 12:00', 10, 10);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (11, '2023-04-30 22:00', 11, 11);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (12, '2023-05-23 00:00', 12, 12);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (13, '2023-11-08 06:00', 13, 13);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (14, '2022-10-11 10:00', 14, 14);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (15, '2022-05-16 11:00', 15, 15);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (16, '2023-03-11 06:00', 16, 16);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (17, '2023-04-04 16:00', 17, 17);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (18, '2022-11-20 14:00', 18, 18);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (19, '2023-06-21 15:00', 19, 19);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (20, '2023-06-06 12:00', 20, 20);


-- INSERTS HOSPEDAGENS -- 
use SGT;
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (1, '2023-11-16', '2023-12-14', 1);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (2, '2023-05-10', '2024-01-05', 2);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (3, '2023-07-21', '2023-12-26', 3);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (4, '2023-06-04', '2023-12-22', 4);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (5, '2023-11-02', '2023-11-14', 5);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (6, '2023-10-06', '2024-02-21', 6);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (7, '2023-09-10', '2023-11-22', 7);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (8, '2023-08-26', '2024-02-21', 8);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (9, '2023-10-20', '2024-01-24', 9);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (10, '2023-04-20', '2023-11-10', 10);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (11, '2023-11-23', '2024-03-17', 11);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (12, '2023-10-30', '2023-12-12', 12);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (13, '2023-12-18', '2024-03-24', 13);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (14, '2023-09-30', '2024-02-17', 14);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (15, '2023-12-21', '2024-01-21', 15);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (16, '2023-12-12', '2024-01-31', 16);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (17, '2023-04-04', '2023-12-30', 17);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (18, '2023-05-28', '2023-12-17', 18);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (19, '2023-05-03', '2024-03-24', 19);
insert into hospedagens (num_quarto, checkin, checkout, id_cliente) values (20, '2023-11-09', '2023-12-05', 20);


-- INSERT FUNCIONARIOS --
use SGT;
-- INSERT FUNCIONARIOS --
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (80279558948,'Winni','Fust','2002-11-09' ,'(55) 30545-12246', '12345678','181', 1);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (51798654383,'Addy','Beeby','2003-12-06','(20) 56746-78607', '23456789','30', 2);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (36600142945,'Nate','Dary','2003-07-17' ,'(41) 30913-40051', '34567890','32', 3);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (59820786099,'Lorinda','Wyllie','2003-05-14','(98) 18282-95072', '45678901','48', 4);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (6829376211, 'Luciana','Berthomier','2003-07-17' ,'(36) 21570-09441', '56789012','44', 5);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (98784461294,'Martguerita','Klimkov','2002-11-09','(50) 92911-67508', '67890123','207', 6);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (22476559827,'Clement','Tatershall', '2003-02-17' ,'(72) 43169-23646', '78901234','27', 7);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (11840432748,'Fern','Blaw','2003-02-04','(48) 40285-23713', '89012345','282',  8);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (34484601536,'Thorstein','Railton','2003-03-04','(35) 29851-67897', '90123456','13', 9);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (34788143156,'Kynthia','Fortman',    '2003-02-13','(67) 62556-88487', '01234567','170', 10);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (62011924574,'Libbi','Gallahue','2003-08-31','(87) 60131-27438', '13579246','252', 11);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (16842105315,'Lenette','Sallier','2003-01-06','(91) 68715-51266', '24681357','227', 12);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (18645205830,'Charlton','Corrison','2003-07-06','(32) 44598-44507', '35792468','115',13 );
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (78290779822,'Nickie', 'Manderson','2003-01-14' ,'(47) 60111-64991', '46813579','218', 14);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (14050244497,'Lesly','Whiterod','2003-02-26','(50) 30329-22362', '57924680','49', 15);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (48452886351,'Augustine','Levison','2002-11-15','(74) 33643-42140', '68035791', '812', 16);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (54858538614,'Kally','Lintin','2003-05-26','(22) 66238-29756', '80257913','162', 17);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (91615917098,'Gil','Daykin','2002-11-01','(36) 45036-43148', '91368024','56', 18);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (21602762177,'Benny','Gabbitis','2003-07-10','(50) 62540-51373', '79146802','59', 19);
insert into funcionarios (num_identificacao, primeiro_nome, sobrenome, data_nascimento, telefone , cep, num_casa, id_usuarios) values (52867785212,'Fidelity','Matisse','2002-07-12','(52) 69169-40001', '02479135','498', 20);

-- INSERT MANUTENCAO -- falta espacos_hotel_id_espacos
use SGT;
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-08-24', '12:53', '18:51', 'concerto piso', 1);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2023-02-15', '14:30', '17:18', 'concerto lampada',2);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2023-09-07', '10:03', '15:47', 'concerto piso',3);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-08-25', '15:12', '17:34', 'concerto supino', 4);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-06-16', '12:56', '14:29', 'concerto ar condicionado', 5);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2023-07-13', '9:24', '11:42', 'concerto piso',6);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-12-07', '7:48', '11:53', 'concerto lampada', 7);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2023-07-01', '11:43', '19:10', 'concerto piso', 8);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2023-04-01', '11:11', '11:39', 'concerto janela', 9);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-09-15', '10:22', '11:08', 'concerto piso', 10);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-04-27', '6:19', '10:16', 'concerto piso', 11);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-04-29', '8:50', '15:27', 'concerto janela', 12);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-01-24', '13:51', '14:31', 'concerto piso', 13);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-05-22', '5:52', '12:57', 'concerto piso', 14);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-10-04', '11:30', '16:45', 'concerto lampada', 15);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2023-06-03', '11:55', '13:28', 'concerto janela', 16);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2023-06-09', '9:55', '12:01', 'concerto piso', 17);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-10-08', '12:04', '13:48', 'concerto supino', 18);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-10-02', '9:26', '16:06', 'concerto piso', 19);
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao, id_espacos) values ('2024-08-11', '6:14', '14:09', 'concerto ar condicionado', 20);


-- UPDATE clientes
use SGT;
UPDATE clientes SET primeiro_nome="Paula", data_nascimento="2003-08-20" WHERE id_cliente=1;
UPDATE clientes SET sobrenome="Mendes", telefone="(47)98810-8919" WHERE id_cliente=2;
UPDATE clientes SET primeiro_nome="Maria", num_casa=23 WHERE id_cliente=3;
UPDATE clientes SET cep=09856743, num_casa=345 WHERE id_cliente=4;
UPDATE clientes SET primeiro_nome="Duda", sobrenome = "Mendes" WHERE id_cliente=5;
UPDATE clientes SET telefone="(78) 98831-7346", email="mariamendes@gmail.com" WHERE id_cliente=6;
UPDATE clientes SET primeiro_nome="Eusira", data_nascimento="1997-01-27" WHERE id_cliente=7;
UPDATE clientes SET num_identificacao="CS265436", primeiro_nome="Carlos" WHERE id_cliente=8;
UPDATE clientes SET sobrenome="Silva", num_casa=78 WHERE id_cliente=9;
UPDATE clientes SET num_identificacao="09156798787", data_nascimento="2003-08-20" WHERE id_cliente=10;

-- UPDATE hospedagens
use SGT;
UPDATE hospedagens SET checkin="2023-08-20", checkout="2023-12-20", id_cliente=12 WHERE num_quarto=11;
UPDATE hospedagens SET id_cliente=3 WHERE num_quarto=12;
UPDATE hospedagens SET checkout="2023-11-02" WHERE num_quarto=13;
UPDATE hospedagens SET checkin="2024-10-20" WHERE num_quarto=14;
UPDATE hospedagens SET checkin="2022-11-22" WHERE num_quarto=15;
UPDATE hospedagens SET id_cliente=17 WHERE num_quarto=16;
UPDATE hospedagens SET checkout="2023-08-20" WHERE num_quarto=17;
UPDATE hospedagens SET checkin="2023-09-12", checkout="2024-12-24", id_cliente=10 WHERE num_quarto=18;
UPDATE hospedagens SET id_cliente=16 WHERE num_quarto=19;
UPDATE hospedagens SET checkin="2024-02-21" WHERE num_quarto=20;

-- UPDATE ESPAÇOS--

UPDATE espacos_hotel SET horario_fechamento = '23:00' WHERE ID_ESPACOS = 1 ;
UPDATE espacos_hotel SET horario_fechamento = '23:00' WHERE ID_ESPACOS = 1 ;

-- UPDATE FUNCIONARIOS --
use SGT;
UPDATE funcionarios SET primeiro_nome = "Marcy", data_nascimento = "2009-06-07" WHERE id_funcionario = 1;
UPDATE funcionarios SET telefone = '3898-1512' WHERE id_funcionario = 5;
UPDATE funcionarios SET cep = '45133' WHERE id_funcionario = 12;
UPDATE funcionarios SET num_casa = '210', data_nascimento = "1909-08-15" WHERE id_funcionario = 9;
UPDATE funcionarios SET primeiro_nome = "Mindy", sobrenome = "Brand" WHERE id_funcionario = 4;
UPDATE funcionarios SET data_nascimento = "1956-12-06" WHERE id_funcionario = 6;
UPDATE funcionarios SET primeiro_nome = "Franki", num_casa = '614' WHERE id_funcionario = 15;
UPDATE funcionarios SET num_identificacao = '165-489-1256', sobrenome = "Kenneth" WHERE id_funcionario = 2;
UPDATE funcionarios SET data_nascimento= '1997-05-14', num_identificacao = '126-495-8530' WHERE id_funcionario = 20;
UPDATE funcionarios SET primeiro_nome = "Jimin", data_nascimento = "2001-09-11" WHERE id_funcionario = 7;


-- UPDATE USUARIOS --
UPDATE usuarios set login = 'Ota-vi0', senha = 'Claiton4956' WHERE id_usuarios = 1;
UPDATE usuarios set login = 'Ant.oni.o', senha = 'Dori57val' WHERE id_usuarios = 19;
UPDATE usuarios set login = 'JonAs', senha = '48679123' WHERE id_usuarios = 20;
UPDATE usuarios set login = 'VIntePed', senha = 'Yamaj46' WHERE id_usuarios = 6;
UPDATE usuarios set login = 'oKelly', senha = 'KellyKey48' WHERE id_usuarios = 9;
UPDATE usuarios set login = 'Helfn', senha = 'Midagardd' WHERE id_usuarios = 16;
UPDATE usuarios set login = 'UCara', senha = '1661351684' WHERE id_usuarios = 3;
UPDATE usuarios set login = 'Jorg3Leve4135', senha = 'L3v4fe' WHERE id_usuarios = 11;
UPDATE usuarios set login = 'KanD69', senha = 'KD791635' WHERE id_usuarios = 10;
UPDATE usuarios set login = 'Pedr0K', senha = 'Krod461' WHERE id_usuarios = 4;

-- DELETE Espaços --
use SGT;
DELETE FROM espacos_hotel WHERE ID_ESPACOS = 10;
DELETE FROM espacos_hotel WHERE ID_ESPACOS = 20;
DELETE FROM espacos_hotel WHERE ID_ESPACOS = 12;
DELETE FROM espacos_hotel WHERE ID_ESPACOS = 13;
DELETE FROM espacos_hotel WHERE ID_ESPACOS = 18;


-- DELETE Reservas espaços --
use SGT;
DELETE FROM RESERVAS_ESPACOS WHERE ID_RESERVAS = 1;
DELETE FROM RESERVAS_ESPACOS WHERE ID_RESERVAS = 5;
DELETE FROM RESERVAS_ESPACOS WHERE ID_RESERVAS = 12;
DELETE FROM RESERVAS_ESPACOS WHERE ID_RESERVAS = 19;
DELETE FROM RESERVAS_ESPACOS WHERE ID_RESERVAS = 15;


-- DELETE FUNCIONARIOS --
use SGT;
DELETE FROM funcionarios WHERE id_funcionario = 5;
DELETE FROM funcionarios WHERE id_funcionario = 16 ;
DELETE FROM funcionarios WHERE id_funcionario = 2;
DELETE FROM funcionarios WHERE id_funcionario = 9;
DELETE FROM funcionarios WHERE id_funcionario = 19;

-- DELETE clientes

-- DELETE hospedagens
DELETE FROM hospedagens WHERE num_quarto=12;
DELETE FROM hospedagens WHERE num_quarto=20;
DELETE FROM hospedagens WHERE num_quarto=1;
DELETE FROM hospedagens WHERE num_quarto=16;
DELETE FROM hospedagens WHERE num_quarto=11;

-- SELECTS
USE SGT;
SELECT * FROM usuarios;
SELECT * FROM clientes;
SELECT * FROM espacos_hotel;
SELECT * FROM funcionarios;
SELECT * FROM reservas_espacos;
SELECT * FROM hospedagens;
SELECT * FROM manutencao_espaco;

-- SELECT COUNT
SELECT COUNT(login) FROM usuarios;
SELECT COUNT(email) FROM clientes;
SELECT COUNT(nome_espaco) FROM espacos_hotel;
SELECT COUNT(cep) FROM funcionarios;
SELECT COUNT(dia_horario) FROM reservas_espacos;
SELECT COUNT(num_quarto) FROM hospedagens;
SELECT COUNT(dia) FROM manutencao_espaco;

-- SELECT com JOIN (INNER, LEFT ou RIGHT) 
SELECT clientes.primeiro_nome, hospedagens.num_quarto FROM clientes INNER JOIN hospedagens ON clientes.id_cliente = hospedagens.num_quarto;
SELECT clientes.primeiro_nome, usuarios.login FROM clientes INNER JOIN usuarios ON clientes.id_cliente = usuarios.id_usuarios;
SELECT funcionarios.primeiro_nome, usuarios.login FROM funcionarios INNER JOIN usuarios ON funcionarios.id_funcionario = usuarios.id_usuarios;
SELECT manutencao_espaco.dia, espacos_hotel.nome_espaco FROM manutencao_espaco INNER JOIN espacos_hotel ON manutencao_espaco.id_manutencao_espaco = espacos_hotel.id_espacos;
SELECT reservas_espacos.dia_horario, espacos_hotel.nome_espaco FROM reservas_espacos INNER JOIN espacos_hotel ON reservas_espacos.id_reservas = espacos_hotel.id_espacos;
