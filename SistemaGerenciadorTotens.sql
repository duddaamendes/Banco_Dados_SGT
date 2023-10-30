-- MySQL Script generated by MySQL Workbench
-- Mon Oct 23 09:49:54 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

CREATE DATABASE SGT;
USE `SGT` ;

-- -----------------------------------------------------
-- Table `usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuarios` INT(7) NOT NULL,
  `tipo_usuario` CHAR(1) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuarios`));


-- -----------------------------------------------------
-- Table `clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes` (
  `cpf_clientes` INT(11) NOT NULL,
  `primeiro_nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `data_de_nascimento` DATE NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `numero_casa` VARCHAR(7) NOT NULL,
  `usuarios_id_usuarios` INT(7) NOT NULL,
  PRIMARY KEY (`cpf_clientes`, `usuarios_id_usuarios`),
  INDEX `fk_clientes_usuarios1_idx` (`usuarios_id_usuarios` ASC),
  CONSTRAINT `fk_clientes_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `usuarios` (`id_usuarios`));


-- -----------------------------------------------------
-- Table `espacos_hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `espacos_hotel` (
  `id_espacos` INT(7) NOT NULL,
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
  `id_funcionarios` INT(7) NOT NULL,
  `primeiro_nome` VARCHAR(100) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `numero_casa` VARCHAR(7) NOT NULL,
  `usuarios_id_usuarios` INT(7) NOT NULL,
  PRIMARY KEY (`id_funcionarios`, `usuarios_id_usuarios`),
  INDEX `fk_funcionarios_usuarios1_idx` (`usuarios_id_usuarios` ASC),
  CONSTRAINT `fk_funcionarios_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `usuarios` (`id_usuarios`));


-- -----------------------------------------------------
-- Table `reservas_espacos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservas_espacos` (
  `id_reservas` INT(7) NOT NULL,
  `dia_horario` DATETIME NOT NULL,
  `clientes_cpf_clientes` INT(11) NOT NULL,
  `espacos_hotel_id_espacos` INT(11) NOT NULL,
  PRIMARY KEY (`id_reservas`, `clientes_cpf_clientes`, `espacos_hotel_id_espacos`),
  INDEX `fk_reservas_espacos_clientes1_idx` (`clientes_cpf_clientes` ASC),
  INDEX `fk_reservas_espacos_espacos_hotel1_idx` (`espacos_hotel_id_espacos` ASC),
  CONSTRAINT `fk_reservas_espacos_clientes1`
    FOREIGN KEY (`clientes_cpf_clientes`)
    REFERENCES `clientes` (`cpf_clientes`),
  CONSTRAINT `fk_reservas_espacos_espacos_hotel1`
    FOREIGN KEY (`espacos_hotel_id_espacos`)
    REFERENCES `espacos_hotel` (`id_espacos`));


-- -----------------------------------------------------
-- Table `hospedagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospedagens` (
  `id_hospedagem` INT(7) NOT NULL,
  `checkin` DATETIME NOT NULL,
  `checkout` DATETIME NOT NULL,
  `clientes_cpf_clientes` INT(11) NOT NULL,
  PRIMARY KEY (`id_hospedagem`, `clientes_cpf_clientes`),
  INDEX `fk_reservas_clientes1_idx` (`clientes_cpf_clientes` ASC),
  CONSTRAINT `fk_reservas_clientes1`
    FOREIGN KEY (`clientes_cpf_clientes`)
    REFERENCES `clientes` (`cpf_clientes`));


-- -----------------------------------------------------
-- Table `manutencao_espaco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manutencao_espaco` (
  `idlimpeza_espacos` INT NOT NULL,
  `dia` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_final` TIME NOT NULL,
  `tipo_manutencao` CHAR(1) NOT NULL,
  `espacos_hotel_id_espacos` INT(11) NOT NULL,
  PRIMARY KEY (`idlimpeza_espacos`, `espacos_hotel_id_espacos`),
  INDEX `fk_limpeza_espacos_espacos_hotel1_idx` (`espacos_hotel_id_espacos` ASC),
  CONSTRAINT `fk_limpeza_espacos_espacos_hotel1`
    FOREIGN KEY (`espacos_hotel_id_espacos`)
    REFERENCES `espacos_hotel` (`id_espacos`));
    
    
    /*/Inserts tabela reserva de espacos/*/
    /*/20 (vinte) inserts por tabela/*/
    /*/ids foram criados automaticos mas vão ser trocados para o numero dos quartos /*/
    
-- INSERTS CLIENTES ---
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (1, 'Patty', 'Semark', '10/27/2005', 'psemark0@mayoclinic.com', '654-128-7280', '307-17-5713', 26, 1);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (2, 'Jeni', 'Rodder', '10/27/2005', 'jrodder1@drupal.org', '945-825-7281', '192-52-3176', 26, 2);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (3, 'Laurianne', 'Burchell', '10/27/2005', 'lburchell2@hostgator.com', '910-458-7044', '333-89-3143', 26, 3);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (4, 'Yank', 'Ibbitson', '10/27/2005', 'yibbitson3@gnu.org', '932-462-0578', '559-77-8585', 26, 4);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (5, 'Hugh', 'Pashby', '10/27/2005', 'hpashby4@ifeng.com', '383-636-5368', '229-10-7354', 26, 5);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (6, 'Isis', 'Quimby', '10/27/2005', 'iquimby5@ihg.com', '349-728-0378', '651-16-9187', 26, 6);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (7, 'Gavan', 'Powton', '10/27/2005', 'gpowton6@g.co', '462-709-1201', '379-96-7845', 26, 7);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (8, 'Laney', 'Woodland', '10/27/2005', 'lwoodland7@ustream.tv', '857-145-7307', '556-09-4429', 26, 8);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (9, 'Maud', 'Hartfleet', '10/27/2005', 'mhartfleet8@shutterfly.com', '459-438-9323', '392-63-0663', 26, 9);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (10, 'Henriette', 'Leaburn', '10/27/2005', 'hleaburn9@free.fr', '641-305-8877', '803-81-1049', 26, 10);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (11, 'Trixy', 'Pane', '10/27/2005', 'tpanea@slashdot.org', '386-210-2225', '332-46-9640', 26, 11);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (12, 'Brian', 'Janoch', '10/27/2005', 'bjanochb@woothemes.com', '587-906-2481', '461-70-2941', 26, 12);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (13, 'Kettie', 'Doddridge', '10/27/2005', 'kdoddridgec@dion.ne.jp', '834-458-6292', '549-37-4995', 26, 13);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (14, 'Marla', 'Joplin', '10/27/2005', 'mjoplind@mapy.cz', '605-890-3608', '567-19-5240', 26, 14);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (15, 'Nikolaus', 'Marchant', '10/27/2005', 'nmarchante@paypal.com', '449-974-1598', '882-41-4051', 26, 15);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (16, 'Finn', 'Lanceter', '10/27/2005', 'flanceterf@ucsd.edu', '140-667-3121', '302-47-5340', 26, 16);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (17, 'Dion', 'Dederick', '10/27/2005', 'ddederickg@skyrock.com', '891-198-1475', '845-13-5908', 26, 17);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (18, 'Alika', 'Nower', '10/27/2005', 'anowerh@howstuffworks.com', '407-409-2856', '238-71-2688', 26, 18);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (19, 'Evelyn', 'Sidry', '10/27/2005', 'esidryi@free.fr', '779-173-0160', '546-29-6313', 26, 19);
insert into clientes (cpf_clientes, primeiro_nome, sobrenome, data_nascimento, email, telefone, cep, numero_casa, usuarios_id_usuarios) values (20, 'Farlay', 'Yellop', '10/27/2005', 'fyellopj@addtoany.com', '675-273-9475', '659-24-4662', 26, 20);

-- INSERTS RESERVAS_ESPACOS ---
insert into reservas_espacos (id, first_name, last_name, email) values (1, 'Aksel', 'Casburn', 'acasburn0@slideshare.net');
insert into reservas_espacos (id, first_name, last_name, email) values (2, 'Harlene', 'Elmhurst', 'helmhurst1@nyu.edu');
insert into reservas_espacos (id, first_name, last_name, email) values (3, 'Wrennie', 'Lidgate', 'wlidgate2@stumbleupon.com');
insert into reservas_espacos (id, first_name, last_name, email) values (4, 'Mariana', 'Tomes', 'mtomes3@storify.com');
insert into reservas_espacos (id, first_name, last_name, email) values (5, 'Bennie', 'Boakes', 'bboakes4@opensource.org');
insert into reservas_espacos (id, first_name, last_name, email) values (6, 'Kevyn', 'Hayton', 'khayton5@umn.edu');
insert into reservas_espacos (id, first_name, last_name, email) values (7, 'Ricca', 'Thoday', 'rthoday6@feedburner.com');
insert into reservas_espacos (id, first_name, last_name, email) values (8, 'Rochette', 'Pavlenkov', 'rpavlenkov7@abc.net.au');
insert into reservas_espacos (id, first_name, last_name, email) values (9, 'Madel', 'Dunmuir', 'mdunmuir8@sourceforge.net');
insert into reservas_espacos (id, first_name, last_name, email) values (10, 'Vaughn', 'Kibby', 'vkibby9@taobao.com');
insert into reservas_espacos (id, first_name, last_name, email) values (11, 'Corrine', 'Janczyk', 'cjanczyka@linkedin.com');
insert into reservas_espacos (id, first_name, last_name, email) values (12, 'Jaine', 'Mainland', 'jmainlandb@163.com');
insert into reservas_espacos (id, first_name, last_name, email) values (13, 'Sasha', 'Tivolier', 'stivolierc@reverbnation.com');
insert into reservas_espacos (id, first_name, last_name, email) values (14, 'Celisse', 'Sparks', 'csparksd@pcworld.com');
insert into reservas_espacos (id, first_name, last_name, email) values (15, 'Vittorio', 'Jirick', 'vjiricke@is.gd');
insert into reservas_espacos (id, first_name, last_name, email) values (16, 'Kara', 'Chatto', 'kchattof@mysql.com');
insert into reservas_espacos (id, first_name, last_name, email) values (17, 'Timmy', 'Sorley', 'tsorleyg@pcworld.com');
insert into reservas_espacos (id, first_name, last_name, email) values (18, 'Anissa', 'Woodier', 'awoodierh@edublogs.org');
insert into reservas_espacos (id, first_name, last_name, email) values (19, 'Gayle', 'Nystrom', 'gnystromi@tumblr.com');
insert into reservas_espacos (id, first_name, last_name, email) values (20, 'Anett', 'Sitwell', 'asitwellj@youtu.be');

-- INSERTS HOSPEDAGENS -- 
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (1, '2023/04/09', '2023-04-01', 1);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (2, '2023/01/13', '2022-11-14', 2);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (3, '2023/10/21', '2023-07-12', 3);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (4, '2023/02/18', '2023-06-06', 4);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (5, '2023/05/12', '2023-03-30', 5);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (6, '2023/03/30', '2023-09-07', 6);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (7, '2023/02/25', '2023-09-06', 7);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (8, '2023/03/24', '2023-06-22', 8);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (9, '2023/02/25', '2023-10-13', 9);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (10, '2022/12/14', '2023-05-06', 10);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (11, '2023/01/13', '2023-06-15', 11);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (12, '2022/11/07', '2023-05-22', 12);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (13, '2023/03/26', '2023-05-18', 13);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (14, '2023/04/23', '2023-04-26', 14);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (15, '2023/07/16', '2023-10-08', 15);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (16, '2023/03/10', '2023-04-07', 16);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (17, '2023/09/08', '2023-02-11', 17);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (18, '2023/07/20', '2023-02-10', 18);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (19, '2023/02/20', '2022-12-14', 19);
insert into hospedagens (id_hospedagens, checkin, checkout, clientes_cpf_clientes) values (20, '2023/04/25', '2023-07-23', 20);