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
);


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
  `num_identificacao` INT(20) NOT NULL,
  `primeiro_nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` INT(8) NOT NULL,
  `num_casa` INT(4) NOT NULL,
  `id_usuarios` INT(7) NOT NULL,
  PRIMARY KEY (`id_funcionario`, `id_usuarios`),
  FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`));

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
  FOREIGN KEY (`id_espacos`) REFERENCES `espacos_hotel` (`id_espacos`));


-- -----------------------------------------------------
-- Table `hospedagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospedagens` (
  `num_quarto` INT(7) NOT NULL,
  `checkin` DATETIME NOT NULL,
  `checkout` DATETIME NOT NULL,
  `id_cliente` INT(7) NOT NULL,
  PRIMARY KEY (`num_quarto`, `id_cliente`),
  FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`));


-- -----------------------------------------------------
-- Table `manutencao_espaco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manutencao_espaco` (
  `id_manutencao_espaco` INT NOT NULL AUTO_INCREMENT,
  `dia` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_final` TIME NOT NULL,
  `tipo_manutencao` CHAR(1) NOT NULL,
  `id_espacos` INT(11) NOT NULL,
  PRIMARY KEY (`id_manutencao_espaco`, `id_espacos`),
  FOREIGN KEY (`id_espacos`) REFERENCES `espacos_hotel` (`id_espacos`));
    
    
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
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Sala de pintura', '2023-03-07', '2023-04-16', '11:56', '11:34', 10);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Salão de Dança', '2023-04-24', '2023-05-04', '9:42', '0:52', 11);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Salão de festa', '2023-07-20', '2023-03-24', '23:37', '9:44', 12);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Quiosque', '2023-02-06', '2023-06-10', '2:30', '10:50', 13);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Mirante', '2023-07-14', '2023-12-11', '5:48', '16:47', 14);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Restaurante', '2023-06-10', '2023-06-27', '9:03', '4:41', 15);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Bar', '2023-01-13', '2023-10-15', '4:48', '7:09', 16);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Jardim', '2023-09-09', '2023-01-28', '13:37', '5:33', 17);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Banho de Lama', '2023-08-31', '2023-09-19', '21:43', '11:04', 18);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Massagem', '2023-10-27', '2023-08-26', '14:15', '17:17', 19);
insert into espacos_hotel ( nome_espaco, dia_semana_abertura, dia_semana_fechamento, horario_abertura, horario_fechamento, capacidade) values ( 'Aromoterapia', '2023-07-25', '2023-07-24', '22:27', '9:05', 20);



-- INSERTS RESERVAS_ESPACOS ---
use SGT;
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (1, '2023-05-12', 1, 1);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (2, '2022-11-13', 2, 2);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (3, '2022-11-01', 3, 3);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (4, '2023-07-21', 4, 4);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (5, '2023-06-16', 5, 5);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (6, '2023-12-21', 6, 6);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (7, '2022-09-24', 7, 7);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (8, '2023-10-20', 8, 8);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (9, '2023-07-17', 9, 9);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (10, '2022-07-17', 10, 10);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (11, '2023-04-30', 11, 11);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (12, '2023-05-23', 12, 12);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (13, '2023-11-08', 13, 13);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (14, '2022-10-11', 14, 14);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (15, '2022-05-16', 15, 15);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (16, '2023-03-11', 16, 16);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (17, '2023-04-04', 17, 17);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (18, '2022-11-20', 18, 18);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (19, '2023-06-21', 19, 19);
insert into reservas_espacos (id_reservas, dia_horario, id_cliente, id_espacos) values (20, '2023-06-06', 20, 20);


-- INSERTS HOSPEDAGENS -- 
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
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Winni', 'Fust', 80279558948, '11/9/2022', '305-451-2246', null, '181.170.150.54', 1);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Addy', 'Beeby', 51798654383, '6/12/2023', '567-467-8607', null, '30.195.196.17', 2);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ( 'Nate', 'Dary', 36600142945, '7/17/2023', '309-134-0051', '34-143', '32.66.113.209', 3);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Lorinda', 'Wyllie', 59820786099, '5/14/2023', '182-829-5072', null, '48.232.193.122', 4);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Luciana', 'Berthomier', 6829376211, '7/17/2023', '215-700-9441', null, '44.124.65.105', 5);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Martguerita', 'Klimkov', 98784461294, '11/9/2022', '929-116-7508', null, '207.133.233.158', 6);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Clement', 'Tatershall', 22476559827, '2/17/2023', '431-692-3646', '38-213', '207.27.79.19', 7);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Fern', 'Blaw', 11840432748, '2/4/2023', '402-852-3713', 'G6K', '55.219.198.52', 8);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Thorstein', 'Railton', 34484601536, '4/3/2023', '298-516-7897', '700-0046', '13.194.160.103', 9);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Kynthia', 'Fortman', 34788143156, '2/13/2023', '625-568-8487', '45930-000', '170.240.209.227', 10);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Libbi', 'Gallahue', 62011924574, '8/31/2023', '601-312-7438', '66605 CEDEX', '252.98.123.181', 11);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Lenette', 'Sallier', 16842105315, '6/1/2023', '687-155-1266', '242456', '227.224.81.179', 12);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casam, usuarios_id_ususarios) values ('Charlton', 'Corrison', 18645205830, '6/7/2023', '445-984-4507', '64240-000', '115.130.169.164',13 );
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Nickie', 'Manderson', 78290779822, '1/14/2023', '601-116-4991', null, '218.58.170.102', 14);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Lesly', 'Whiterod', 14050244497, '2/26/2023', '303-292-2362', null, '49.172.242.56', 15);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Augustine', 'Levison', 48452886351, '11/15/2022', '336-434-2140', '4810-571', '8.122.242.198', 16);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Kally', 'Lintin', 54858538614, '5/26/2023', '662-382-9756', '216210', '162.51.37.244', 17);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Gil', 'Daykin', 91615917098, '11/1/2022', '450-364-3148', null, '56.177.81.250', 18);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Benny', 'Gabbitis', 21602762177, '10/7/2023', '625-405-1373', null, '59.10.52.101', 19);
insert into funcionarios (primeiro_nome, sobrenome, cpf, data_nascimento, telefone , cep, numero_casa, usuarios_id_ususarios) values ('Fidelity', 'Matisse', 52867785212, '12/7/2022', '691-694-0001', null, '49.89.116.71', 20);

-- INSERT MANUTENCAO -- falta espacos_hotel_id_espacos
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('24/08/2024', '12:53 PM', '8:51 AM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('15/02/2023', '4:30 AM', '7:18 AM', 'concerto lampada');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('07/09/2023', '10:03 PM', '5:47 AM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('25/08/2024', '5:12 AM', '7:34 PM', 'concerto supino');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('18/06/2024', '12:56 PM', '4:29 PM', 'concerto ar condicionado');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('13/07/2023', '9:24 PM', '11:42 AM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('07/12/2024', '7:48 PM', '11:53 AM', 'concerto lampada');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('01/07/2023', '1:43 PM', '9:10 PM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('04/01/2023', '1:11 PM', '1:39 AM', 'concerto janela');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('15/09/2024', '10:22 PM', '10:08 PM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('27/04/2024', '5:19 PM', '10:16 PM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('29/04/2024', '8:50 PM', '5:27 PM', 'concerto janela');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('20/01/2024', '4:51 AM', '4:31 PM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('22/05/2024', '5:52 PM', '2:57 PM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('10/04/2024', '1:30 PM', '6:45 PM', 'concerto lampada');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('26/03/2023', '1:55 AM', '3:28 PM', 'concerto janela');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('06/09/2023', '9:55 PM', '2:01 PM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('10/08/2024', '12:04 PM', '9:48 AM', 'concerto supino');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('10/02/2024', '9:26 AM', '6:06 PM', 'concerto piso');
insert into manutencao_espaco (dia, hora_inicio, hora_final, tipo_manutencao) values ('18/11/2024', '5:14 PM', '4:09 PM', 'concerto ar condicionado');

-- UPDATE clientes
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

-- UPDATE FUNCIONARIOS --
UPDATE funcionarios SET primeiro_nome = "Marcy", data_nascimento = "7/06/2009" WHERE id_funcionarios = 1;
UPDATE funcionarios SET telefone = '3898-1512' WHERE id_funcionarios = 5;
UPDATE funcionarios SET  cep = '45-133' WHERE id_funcionarios = 12;
UPDATE funcionarios SET numero_casa = '210', data_nascimento = "15/08/1909" WHERE id_funcionarios = 9;
UPDATE funcionarios SET primeiro_nome = "Mindy", sobrenome = "Brand" WHERE id_funcionarios = 4;
UPDATE funcionarios SET id_funcionarios = 23, data_nascimento = "06/12/1956" WHERE id_funcionarios = 6;
UPDATE funcionarios SET primeiro_nome = "Franki", numero_casa = '614' WHERE id_funcionarios = 15;
UPDATE funcionarios SET cpf = '165-489-1256', sobrenome = "Kenneth" WHERE id_funcionarios = 2;
UPDATE funcionarios SET data_nascimento= '14/05/1997', cpf = '126-495-8530' WHERE id_funcionarios = 20;
UPDATE funcionarios SET primeiro_nome = "Jimin", data_nascimento = "11/09/2001" WHERE id_funcionarios = 7;

-- UPDATE USUARIOS --
UPDATE usuarios set login = 'Ota-vi0', senha = 'Claiton4956' WHERE id_clientes = 1;
UPDATE usuarios set login = 'Ant.oni.o', senha = 'Dori57val' WHERE id_clientes = 19;
UPDATE usuarios set login = 'JonAs', senha = '48679123' WHERE id_clientes = 20;
UPDATE usuarios set login = 'VIntePed', senha = 'Yamaj46' WHERE id_clientes = 6;
UPDATE usuarios set login = 'oKelly', senha = 'KellyKey48' WHERE id_clientes = 9;
UPDATE usuarios set login = 'Helfn', senha = 'Midagardd' WHERE id_clientes = 16;
UPDATE usuarios set login = 'UCara', senha = '1661351684' WHERE id_clientes = 3;
UPDATE usuarios set login = 'Jorg3Leve4135', senha = 'L3v4fe' WHERE id_clientes = 11;
UPDATE usuarios set login = 'KanD69', senha = 'KD791635' WHERE id_clientes = 10;
UPDATE usuarios set login = 'Pedr0K', senha = 'Krod461' WHERE id_clientes = 4;

-- DELETE FUNCIONARIOS --
DELETE FROM funcionarios WHERE id_funcionarios = 5;
DELETE FROM funcionarios WHERE id_funcionarios = 16 ;
DELETE FROM funcionarios WHERE id_funcionarios = 2;
DELETE FROM funcionarios WHERE id_funcionarios = 9;
DELETE FROM funcionarios WHERE id_funcionarios = 19;

-- DELETE clientes
DELETE FROM clientes WHERE id_cliente=2;
DELETE FROM clientes WHERE id_cliente=13;
DELETE FROM clientes WHERE id_cliente=18;
DELETE FROM clientes WHERE id_cliente=9;
DELETE FROM clientes WHERE id_cliente=5;
-- Não deleta por ser FK em outras tabelas

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
SELECT COUNT(login) FROM clientes;
SELECT COUNT(login) FROM espacos_hotel;
SELECT COUNT(login) FROM funcionarios;
SELECT COUNT(login) FROM reservas_espacos;
SELECT COUNT(login) FROM hospedagens;
SELECT COUNT(login) FROM manutencao_espaco;
