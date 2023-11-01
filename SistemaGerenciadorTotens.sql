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
-- Table `gerenciamento_acesso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciamento_acesso` (
  `login_cliente_id_login_cliente` INT(7) NOT NULL,
  `login_cliente_clientes_id_clientes` INT(7) NOT NULL,
  PRIMARY KEY (`login_cliente_id_login_cliente`, `login_cliente_clientes_id_clientes`));


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
  `id_limpeza_espacos` INT NOT NULL AUTO_INCREMENT,
  `dia` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_final` TIME NOT NULL,
  `tipo_manutencao` CHAR(1) NOT NULL,
  `id_espacos` INT(11) NOT NULL,
  PRIMARY KEY (`id_limpeza_espacos`, `id_espacos`),
  FOREIGN KEY (`id_espacos`) REFERENCES `espacos_hotel` (`id_espacos`));
    
    
    /*/Inserts tabela reserva de espacos/*/
    /*/20 (vinte) inserts por tabela/*/
    /*/ids foram criados automaticos mas vão ser trocados para o numero dos quartos /*/
    

-- INSERTS CLIENTES ---
USE SGT;
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


-- INSERTS RESERVAS_ESPACOS ---


-- INSERTS HOSPEDAGENS -- 
USE SGT;
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

-- INSERTS USUARIO ---
USE `SGT` ;
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


-- SELECTS
USE SGT;
SELECT * FROM usuarios;
SELECT * FROM clientes;
SELECT * FROM hospedagens;