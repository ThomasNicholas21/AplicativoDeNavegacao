CREATE DATABASE aplicativo_de_navegação;

USE aplicativo_de_navegação;

/*DDL*/
CREATE TABLE Percurso (
  id_percurso INT PRIMARY KEY AUTO_INCREMENT,
  origem VARCHAR(255) NOT NULL,
  destino VARCHAR(255) NOT NULL,
  distancia FLOAT NOT NULL,
  tempo_estimado TIME NOT NULL,
  caminho_percorrido TEXT NOT NULL
);

CREATE TABLE Multas (
  id_multas INT PRIMARY KEY AUTO_INCREMENT,
  tipo_infracao VARCHAR(255) NOT NULL,
  data_multa DATE NOT NULL,
  valor_multa FLOAT NOT NULL,
  veiculo_envolvido VARCHAR(255) NOT NULL,
  local_infracao TEXT NOT NULL,
  id_cliente INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_clientes)
);

CREATE TABLE Localizacao (
  id_localizacao INT PRIMARY KEY AUTO_INCREMENT,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  data_hora DATETIME NOT NULL,
  id_percurso INT NOT NULL,
  FOREIGN KEY (id_percurso) REFERENCES Percurso(id_percurso)
);

CREATE TABLE Obras (
  id_obras INT PRIMARY KEY AUTO_INCREMENT,
  localizacao TEXT NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE NOT NULL,
  tipo_obra VARCHAR(255) NOT NULL,
  id_percurso INT NOT NULL,
  FOREIGN KEY (id_percurso) REFERENCES Percurso(id_percurso)
);

CREATE TABLE Cliente (
  id_clientes INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  sobrenome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  cpf_cnpj VARCHAR(255) NOT NULL
);

CREATE TABLE Acidentes (
  id_acidentes INT PRIMARY KEY AUTO_INCREMENT,
  localizacao TEXT NOT NULL,
  data_hora DATETIME NOT NULL,
  veiculos_envolvidos TEXT NOT NULL,
  gravidade VARCHAR(255) NOT NULL,
  id_percurso INT NOT NULL,
  FOREIGN KEY (id_percurso) REFERENCES Percurso(id_percurso)
);

CREATE TABLE Buraco (
  id_buraco INT PRIMARY KEY AUTO_INCREMENT,
  localizacao TEXT NOT NULL,
  tamanho FLOAT NOT NULL,
  data_registro DATE NOT NULL,
  id_percurso INT NOT NULL,
  FOREIGN KEY (id_percurso) REFERENCES Percurso(id_percurso)
);

CREATE TABLE Congestionamento (
  id_congestionamento INT PRIMARY KEY AUTO_INCREMENT,
  localizacao TEXT NOT NULL,
  tamanho FLOAT NOT NULL,
  tempo_estimado TIME NOT NULL,
  id_percurso INT NOT NULL,
  FOREIGN KEY (id_percurso) REFERENCES Percurso(id_percurso)
);

CREATE TABLE Personalizacao (
  id_personalizacao INT PRIMARY KEY AUTO_INCREMENT,
  cor_fundo VARCHAR(255) NOT NULL,
  cor_rota VARCHAR(255) NOT NULL,
  fonte TEXT NOT NULL,
  tamanho_fonte INT NOT NULL,
  id_cliente INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_clientes)
);

CREATE TABLE TransportePublico (
  id_transportepublico INT PRIMARY KEY AUTO_INCREMENT,
  nome_linha VARCHAR(255) NOT NULL,
  tipo_linha VARCHAR(255) NOT NULL,
  ponto_partida TEXT NOT NULL,
  ponto_chegada TEXT NOT NULL,
  horarios_funcionamento TEXT NOT NULL,
  frequencia_minutos INT NOT NULL,
  id_cliente INT NOT NULL,
  id_percurso INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_clientes),
  FOREIGN KEY (id_percurso) REFERENCES Percurso(id_percurso)
);

/*DML*/
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Haenam', 'Tanjungbalai', 96, 14, 'Apt 845');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Mallow', 'Moppo', 77, 25, 'Suite 46');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Runan', 'La Trinidad', 47, 21, '16th Floor');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Río Segundo', 'Kandete', 6, 30, 'Apt 1371');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Voskhod', 'Macapá', 24, 43, 'Suite 28');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Jovellar', 'Ujungpangkah', 13, 25, '18th Floor');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Mariel', 'Santiago de Chuco', 37, 2, 'Room 891');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Nizhnyaya Tavda', 'Acherítou', 89, 34, 'Suite 68');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Shanhou', 'Nianba', 61, 20, 'Suite 17');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Vale das Mós', 'Valdice', 59, 53, 'Apt 1151');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Huangshi', 'Jandayan', 20, 8, '11th Floor');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Raduzhnyy', 'Laotai', 78, 26, 'Suite 81');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Paledang', 'Pokachi', 69, 40, 'Suite 18');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Moutas', 'Guantouzui', 96, 26, 'Apt 1576');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Paico', 'Gaphatshwe', 23, 45, '8th Floor');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Starotitarovskaya', 'Studená', 25, 14, 'Apt 1898');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Karanganyar', 'Kongolo', 86, 40, 'Suite 63');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Kościerzyna', 'London', 37, 52, 'Room 1188');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Shihudang', 'Muesanaik', 23, 44, 'Apt 603');
insert into Percurso (local_atual, local_destino, distancia, tempo_estimado, caminho_percorrido) values ('Zolotyy Potik', 'Ore', 59, 11, 'Room 869');


insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('52125-222', '2022-10-06', 1920, 'JN8AS5MT8CW313495', '20th Floor', 1);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('13537-027', '2021-05-06', 1268, '3VW1K7AJ6DM987251', 'Apt 1834', 2);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('49348-543', '2022-06-24', 1542, 'WDDHF8JB5DA990357', 'Suite 9', 3);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('33261-374', '2021-06-27', 1238, '19UUB3F77FA568431', 'Room 1901', 4);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('0409-1038', '2018-07-16', 620, 'WAUGL78EX5A679627', 'Room 1378', 5);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('42291-840', '2019-01-11', 858, 'WBA3G7C51EK348648', 'Suite 32', 6);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('10768-7733', '2021-01-29', 1787, 'JN8AZ2KR2BT271732', 'Apt 353', 7);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('59779-017', '2019-11-24', 627, 'KNADH4A38B6422377', 'PO Box 41602', 8);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('55714-4449', '2020-03-14', 778, '1GYEC63T24R360744', 'Apt 1277', 9);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('59316-107', '2021-09-08', 1414, 'KL4CJASB6DB532761', 'PO Box 62802', 10);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('64942-1151', '2021-10-02', 1321, '1FA6P0H72F5432372', 'Apt 968', 11);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('54298-515', '2021-01-23', 1286, '1GYEE23A390718138', 'Suite 15', 12);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('55154-5397', '2019-10-04', 1361, 'WBAKF5C59DJ217720', 'Apt 1293', 13);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('53009-1001', '2018-07-11', 1126, 'JTHBE1BL6FA001114', 'Room 1756', 14);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('21695-357', '2018-08-06', 691, 'WVWED7AJ6CW812561', 'Suite 76', 15);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('0904-1315', '2022-06-30', 1749, 'JN8AF5MRXCT812681', '15th Floor', 16);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('49349-222', '2022-09-12', 836, 'WBAYF8C52ED358480', 'Room 568', 17);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('17478-404', '2021-12-04', 1888, '2C3CCAEG2DH727114', 'PO Box 47532', 18);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('10725-0001', '2019-08-06', 554, '4T1BF1FK8DU881921', 'Apt 10', 19);
insert into Multas (tipo_infracao, data_multa, valor_multa, veiculo_envolvido, local_infracao, id_cliente) values ('0113-0590', '2018-08-22', 375, '1G6AE5SX0F0133477', 'Room 1367', 20);

insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Christoffer', 'Suerz', 'csuerz0@bizjournals.com', '8007148198', '148.253.141.250/6');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Wandis', 'Frowd', 'wfrowd1@4shared.com', '1959853673', '51.165.51.49/24');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Perrine', 'Anderton', 'panderton2@bravesites.com', '9414882386', '121.45.61.53/18');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Winfred', 'Dicey', 'wdicey3@vistaprint.com', '4017350633', '36.71.232.79/8');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Hammad', 'Josefs', 'hjosefs4@economist.com', '7377531316', '190.75.9.147/29');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Gerianna', 'Ormston', 'gormston5@meetup.com', '3875033483', '250.151.61.228/25');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Lorrayne', 'Huban', 'lhuban6@dion.ne.jp', '5007019501', '251.145.89.66/9');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Retha', 'Norway', 'rnorway7@msn.com', '1673809839', '112.111.255.101/8');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Augustine', 'Quade', 'aquade8@oaic.gov.au', '3974866483', '104.21.203.148/13');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Adora', 'MacGrath', 'amacgrath9@themeforest.net', '8485172133', '56.245.21.55/1');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Loralee', 'Sheron', 'lsherona@ca.gov', '8667192792', '203.65.193.16/16');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Otto', 'Bullimore', 'obullimoreb@usgs.gov', '8455761821', '147.214.68.113/5');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Kirstyn', 'Haslegrave', 'khaslegravec@bigcartel.com', '1786013710', '218.52.232.192/9');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Carina', 'Elmhirst', 'celmhirstd@msu.edu', '1432387782', '206.10.95.137/13');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Denyse', 'Deschlein', 'ddeschleine@foxnews.com', '3817102608', '195.143.0.66/15');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Remy', 'Stickins', 'rstickinsf@vkontakte.ru', '6088796296', '27.87.127.249/10');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Lacey', 'Alpin', 'lalping@liveinternet.ru', '8763410521', '202.161.221.87/28');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Jasmina', 'McGeachey', 'jmcgeacheyh@de.vu', '1116073458', '35.60.193.251/14');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Kacey', 'Neate', 'kneatei@webnode.com', '3513141402', '31.144.160.175/19');
insert into Cliente (nome, sobrenome , email, telefone, cpf_cnpj) values ('Merna', 'Thunnerclef', 'mthunnerclefj@github.com', '6274358215', '37.145.113.41/2');

insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (34.3963158, 35.8958444, '2022-09-01', 1);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (28.1236316, -15.4287738, '2020-11-12', 2);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (57.0973349, 12.2573683, '2023-02-11', 3);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (8.7178672, -11.951925, '2021-09-26', 4);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (49.5730119, 22.0608204, '2020-05-23', 5);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (33.6328198, 35.7819158, '2020-11-11', 6);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (42.0288112, 20.9969544, '2019-01-24', 7);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (38.322854, 114.245006, '2020-08-25', 8);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (-13.02483, -74.448357, '2020-03-18', 9);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (7.5932558, 122.7995493, '2021-05-31', 10);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (-8.4942298, 118.5360226, '2019-03-11', 11);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (27.719827, 106.929757, '2021-03-27', 12);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (27.33186, 118.995179, '2018-12-17', 13);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (34.718968, 110.693663, '2023-02-25', 14);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (-6.1226719, 106.8902366, '2022-07-08', 15);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (18.0735299, -15.9582372, '2023-01-26', 16);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (-21.1877747, -41.8799408, '2020-07-15', 17);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (9.338682, 123.291063, '2019-03-27', 18);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (28.901462, 118.511235, '2020-06-29', 19);
insert into Localizacao (latitude , longitude, data_hora, id_percurso) values (58.284686, 12.3260336, '2020-11-05', 20);

insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('185', '2022-08-07', '2020-09-23', 'Glass', 1);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('4', '2020-11-28', '2021-07-10', 'Plastic', 2);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('1', '2022-05-19', '2022-11-21', 'Brass', 3);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('1', '2022-05-23', '2022-12-15', 'Rubber', 4);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('45', '2021-04-26', '2021-07-12', 'Aluminum', 5);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('9', '2023-03-06', '2018-08-12', 'Granite', 6);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('82', '2022-07-07', '2018-11-05', 'Glass', 7);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('3024', '2021-11-09', '2021-09-24', 'Granite', 8);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('942', '2020-12-13', '2021-12-26', 'Vinyl', 9);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('01189', '2020-02-01', '2019-02-01', 'Plexiglass', 10);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('40', '2018-10-31', '2019-06-26', 'Brass', 11);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('88', '2019-12-27', '2020-08-10', 'Plastic', 12);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('72450', '2021-11-03', '2020-09-13', 'Aluminum', 13);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('7386', '2018-11-11', '2022-01-22', 'Plastic', 14);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('9', '2018-03-23', '2021-11-29', 'Aluminum', 15);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('9', '2018-12-26', '2018-09-02', 'Brass', 16);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('12782', '2020-07-29', '2019-07-01', 'Vinyl', 17);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('06', '2020-05-12', '2019-10-21', 'Aluminum', 18);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('1', '2019-08-30', '2020-05-04', 'Stone', 19);
insert into Obras (localizacao, data_inicio, data_fim, tipo_obra, id_percurso ) values ('7', '2019-02-11', '2021-07-22', 'Plexiglass', 20);

insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('2', '2022-11-21', 2, 'Papa November Lima Uniform Charlie Juliett X-ray Mike Hotel Bravo Kilo Romeo India Golf Echo Alfa Yankee Quebec Victor Zulu', 1);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('37', '2019-01-19', 2, 'November Mike Yankee Lima Romeo Papa Uniform Sierra Whiskey Bravo Hotel Juliett India Victor', 2);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('98', '2020-09-28', 3, 'Golf Foxtrot Quebec Papa Mike Oscar X-ray Victor Hotel Charlie Bravo Yankee Juliett Romeo Echo', 3);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('46604', '2019-09-16', 6, 'Romeo Sierra Hotel November Yankee Victor X-ray Papa Tango Uniform Juliett Kilo Charlie Delta Zulu Lima Mike', 4);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('3', '2020-05-04', 2, 'Whiskey Delta Quebec Oscar Sierra Yankee India X-ray Lima Tango Bravo Golf', 5);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('69763', '2022-06-18', 3, 'Juliett Bravo Oscar Uniform Lima Romeo November Foxtrot Alfa Yankee X-ray Hotel Golf Victor Delta Papa Mike', 6);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('30803', '2020-09-05', 6, 'Oscar X-ray Hotel Kilo Mike Uniform Tango Victor Romeo Charlie Alfa Juliett Whiskey Bravo November Echo Quebec Papa', 7);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('0304', '2023-02-24', 2, 'Alfa November X-ray Tango Bravo Kilo Mike Delta Zulu Uniform Sierra Hotel Charlie Romeo Papa Juliett', 8);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('8969', '2022-01-04', 6, 'Foxtrot Delta Lima Tango Quebec X-ray Charlie Uniform Romeo Yankee November', 9);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('0656', '2023-01-24', 3, 'Golf November Charlie Bravo Hotel Zulu Romeo Kilo Whiskey Mike', 10);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('175', '2022-02-18', 5, 'Tango Zulu Lima Uniform Foxtrot Mike November Quebec India X-ray Yankee Echo Hotel Romeo Sierra Bravo Papa Victor Juliett Delta', 11);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('07', '2019-12-08', 2, 'Echo Charlie Victor India Oscar Papa Sierra Juliett Golf Alfa Mike Kilo Foxtrot Uniform Delta', 12);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('48624', '2021-04-03', 5, 'Uniform Delta Lima Sierra Golf Foxtrot Yankee Hotel Tango Alfa Kilo Mike Romeo Charlie', 13);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('0', '2018-11-30', 5, 'Romeo Whiskey India Quebec Uniform Foxtrot X-ray Tango Victor Papa Yankee Sierra Mike', 14);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('0', '2018-10-16', 2, 'Juliett Papa Uniform Bravo India Golf Sierra Zulu Alfa Foxtrot X-ray Hotel Lima Charlie Yankee Kilo Echo November', 15);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('54', '2021-01-21', 3, 'Bravo Oscar Kilo Lima Juliett Golf Foxtrot Tango Charlie Mike Yankee November Romeo Uniform Whiskey Zulu Sierra Echo X-ray', 16);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('02', '2023-02-02', 3, 'Yankee Zulu X-ray Sierra Tango Kilo Uniform Foxtrot Golf India Papa Mike Bravo', 17);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('0', '2020-06-25', 2, 'Foxtrot Zulu Charlie Hotel Bravo Uniform India Lima Yankee Oscar Golf Mike Romeo Whiskey Delta Quebec Victor Papa Kilo', 18);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('4', '2021-07-07', 3, 'Whiskey Zulu Alfa Delta Golf Victor Juliett X-ray India Uniform Quebec Lima Sierra Kilo Echo', 19);
insert into Acidentes (localizacao, data_hora, veiculos_envolvidos, gravidade, id_percurso ) values ('24', '2018-07-21', 6, 'Yankee Lima Charlie Mike Whiskey X-ray Papa Foxtrot Hotel Juliett Golf November Kilo Romeo Alfa Victor', 20);

insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('1319', 1.2, '2021-05-18', 1);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('29', 0.3, '2018-05-18', 2);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('432', 0.7, '2020-04-09', 3);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('4963', 2.1, '2019-03-14', 4);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('4', 1.0, '2018-06-03', 5);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('283', 2.9, '2021-01-26', 6);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('53232', 2.2, '2022-05-07', 7);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('4', 1.0, '2019-08-27', 8);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('613', 1.2, '2020-10-23', 9);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('06', 2.2, '2020-03-13', 10);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('81', 1.9, '2021-06-23', 11);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('170', 0.5, '2021-05-29', 12);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('9381', 1.0, '2022-10-09', 13);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('290', 2.5, '2019-04-25', 14);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('1', 1.4, '2018-12-07', 15);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('8382', 0.9, '2019-12-01', 16);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('389', 1.4, '2021-08-14', 17);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('2', 2.9, '2018-12-03', 18);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('01', 1.5, '2020-07-19', 19);
insert into Buraco  (localizacao, tamanho, data_registro, id_percurso ) values ('59', 1.7, '2018-12-16', 20);

insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('5279', 1, '16:13:54', 1);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('98', 1, '11:28:39', 2);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('63', 2, '18:02:22', 3);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('003', 1, '12:16:18', 4);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('3', 3, '7:13:49', 5);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('5', 0, '19:22:22', 6);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('5', 3, '22:14:41', 7);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('927', 3, '7:27:30', 8);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('3', 1, '9:49:25', 9);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('08', 0, '7:23:54', 10);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('80', 3, '4:47:06', 11);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('19588', 1, '6:14:17', 12);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('0', 1, '1:38:07', 13);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('20775', 2, '1:15:12', 14);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('0734', 0, '16:35:03', 15);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('946', 0, '13:01:59', 16);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('6', 2, '16:25:15', 17);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('9', 0, '10:22:21', 18);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('6167', 0, '6:04:56', 19);
insert into Congestionamento (localizacao, tamanho, tempo_estimado, id_percurso ) values ('4', 3, '9:50:38', 20);

insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#b36ad1', '#6bfc70', 'quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac', 11, 1);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#8e8240', '#ef9824', 'nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget', 8, 2);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#db94d2', '#e354cb', 'neque aenean auctor gravida sem praesent id massa id nisl venenatis', 1, 3);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#22e36a', '#5437a1', 'sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien', 2, 4);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#163465', '#ef7c47', 'feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce', 4, 5);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#21f9dc', '#f42956', 'malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum', 12, 6);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#dc0da3', '#034363', 'nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus', 16, 7);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#5dc80a', '#37c175', 'vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat', 10, 8);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#463a3c', '#b3a550', 'morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', 1, 9);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#3de2b0', '#ddf4c6', 'nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', 0, 10);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#b99b66', '#1fc07a', 'sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 3, 11);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#283d39', '#192e3a', 'sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet', 14, 12);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#a0d014', '#bdc705', 'vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', 6, 13);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#8e7094', '#5403ca', 'metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 4, 14);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#b5444f', '#7560bf', 'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at', 6, 15);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#83c697', '#705aad', 'tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at', 6, 16);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#0638d7', '#71e454', 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh', 3, 17);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#178f93', '#f6c719', 'ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras', 5, 18);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#8cdf6c', '#20db6f', 'penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor', 13, 19);
insert into Personalizacao (cor_fundo, cor_rota, fonte, tamanho_fonte, id_cliente) values ('#026f55', '#52a859', 'eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque', 4, 20);

insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('November X-ray Quebec Foxtrot Golf Victor Tango Delta India Hotel Lima Romeo Mike Zulu Whiskey Echo', 'suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla', '40 Hagan Parkway', '9049 Northview Avenue', '17:38:12', 55, 1, 1);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Victor Bravo Golf Delta Whiskey Quebec Lima Tango Mike November X-ray Oscar Juliett', 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus', '687 Melrose Plaza', '62064 Moose Center', '18:12:05', 16, 2, 2);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('X-ray Golf Alfa Sierra Juliett Papa Echo Whiskey Bravo Tango Delta Victor Romeo November Foxtrot Charlie Mike Oscar', 'a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus', '3151 Shasta Court', '2 Annamark Alley', '5:06:46', 54, 3, 3);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Hotel Yankee Romeo Delta Tango Echo Foxtrot X-ray Kilo Zulu Alfa India Uniform Oscar November Bravo Juliett Lima Golf', 'nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', '50008 Mandrake Court', '486 Mandrake Drive', '20:17:05', 18, 4, 4);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Delta November Charlie Mike Hotel Foxtrot Echo Victor Alfa Juliett Zulu India Whiskey Kilo Quebec Golf Oscar Bravo Sierra', 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend', '7 Talmadge Terrace', '07 Charing Cross Street', '5:13:02', 27, 5, 5);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Papa Bravo Uniform Juliett Charlie Victor Alfa Quebec Delta India Lima Kilo Oscar Sierra Romeo Golf Mike Tango', 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit', '93511 Rieder Street', '28281 Westport Point', '3:10:31', 52, 6, 6);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Whiskey Hotel Echo Lima Charlie Sierra Juliett Tango Foxtrot Romeo Mike India Quebec Victor November Delta', 'nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris', '16103 Cordelia Trail', '44 Oriole Avenue', '13:53:03', 48, 7, 7);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('X-ray Papa Oscar Bravo Quebec Zulu Whiskey India Hotel Foxtrot Golf Kilo November Echo Tango Sierra Delta Juliett Charlie', 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu', '258 Kensington Plaza', '61 5th Way', '9:29:42', 38, 8, 8);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Echo India Golf Papa November Kilo Mike Hotel Oscar Foxtrot Bravo', 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', '2788 Laurel Trail', '364 Oriole Plaza', '19:08:12', 24, 9, 9);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Foxtrot Kilo Delta Uniform Tango Lima India Quebec Zulu Charlie Echo', 'quis odio consequat varius integer ac leo pellentesque ultrices mattis', '8892 Havey Court', '6623 Hoffman Plaza', '11:47:14', 59, 10, 10);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Lima Delta November Quebec Papa Sierra Echo Zulu Romeo Bravo Whiskey Yankee India Alfa', 'ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed', '49981 Bonner Avenue', '2623 Dennis Parkway', '5:59:01', 54, 11, 11);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Charlie Yankee Alfa Bravo Juliett Kilo X-ray Delta Golf Oscar Zulu November Lima Romeo Victor Tango Echo', 'eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio', '22766 Pond Place', '99 Bashford Street', '11:46:10', 17, 12, 12);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('November Whiskey Kilo Victor Hotel Mike Golf Bravo Zulu Romeo India Sierra Tango Foxtrot Oscar Alfa', 'sapien arcu sed augue aliquam erat volutpat in congue etiam', '6 Dunning Junction', '198 Dawn Pass', '0:10:57', 14, 13, 13);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Alfa Yankee Kilo X-ray Charlie Whiskey Zulu Oscar Quebec Delta Lima Golf Romeo Foxtrot Juliett Mike Sierra Tango', 'fusce lacus purus aliquet at feugiat non pretium quis lectus', '4 Anderson Place', '7 Fair Oaks Court', '14:56:22', 38, 14, 14);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Mike India Hotel Uniform Kilo Quebec Sierra Whiskey Tango Romeo Victor Yankee Charlie X-ray Zulu Delta', 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum', '25 Shoshone Way', '241 Superior Junction', '14:47:46', 54, 15, 15);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Romeo Oscar Quebec Bravo Whiskey Yankee Golf Papa Foxtrot Uniform India November Charlie Tango', 'dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat', '667 Bluestem Circle', '762 Bobwhite Lane', '4:05:23', 39, 16, 16);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Alfa Papa Charlie Whiskey Victor Kilo Tango Quebec Golf India Hotel Lima Yankee', 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices', '11 Bartillon Lane', '914 Forest Run Center', '14:27:29', 26, 17, 17);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Whiskey Golf Tango Echo Delta Quebec Yankee Hotel Sierra Mike Lima Oscar November X-ray Papa Romeo', 'nunc nisl duis bibendum felis sed interdum venenatis turpis enim', '332 Lawn Drive', '156 Redwing Street', '18:33:40', 45, 18, 18);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Kilo Echo Zulu Victor X-ray Juliett Mike Tango Golf Charlie India Oscar Foxtrot Hotel', 'a suscipit nulla elit ac nulla sed vel enim sit amet', '84 Mariners Cove Center', '24034 Fordem Road', '3:42:05', 24, 19, 19);
insert into TransportePublico (nome_linha, tipo_linha, ponto_partida, ponto_chegada, horarios_funcionamento , frequencia_minutos, id_cliente, id_percurso) values ('Mike Lima Papa Delta Alfa Zulu Quebec Uniform Whiskey Bravo Golf X-ray November Hotel Tango Charlie Oscar Sierra', 'congue diam id ornare imperdiet sapien urna pretium nisl ut', '4023 Eagle Crest Plaza', '8113 Pond Lane', '7:24:09', 35, 20, 20);

/*DDL*/
ALTER TABLE Percurso
RENAME COLUMN origem TO local_atual,
RENAME COLUMN destino TO local_destino;
DROP TABLE clientes;

/*DML*/
UPDATE clientes
SET nome = 'Christoffer'
WHERE id = 1;
DELETE FROM clientes
WHERE id = 1;

/*DQLnomenome*/
/*Operadores de comparação:*/
SELECT * FROM Percurso WHERE distancia > 10;
SELECT * FROM Cliente WHERE email = 'csuerz0@bizjournals.com';

/*Operadores lógicos:*/
SELECT * FROM Percurso WHERE distancia > 10 AND local_atual = 'Néa Flogitá';
SELECT * FROM Cliente WHERE telefone = '8007148198' OR telefone = '3875033483';
SELECT * FROM Cliente WHERE NOT cpf_cnpj = '148.253.141.250/6';

/*Operadores de intervalo:*/
SELECT * FROM Percurso WHERE tempo_estimado BETWEEN '00:30:00' AND '01:30:00';
SELECT * FROM Cliente WHERE nome IN ('Christoffer', 'Hammad', 'Lorrayne');
SELECT * FROM Percurso WHERE local_atual LIKE 'Mallow';
SELECT * FROM Cliente WHERE telefone IS NULL;
SELECT * FROM Cliente WHERE telefone IS NOT NULL;

/*Operadores de padrão:*/
SELECT * FROM Cliente WHERE nome LIKE 'Merna';
SELECT * FROM Cliente WHERE telefone LIKE '3513141402';

/*Operações de conjuntos:*/
SELECT * FROM Percurso WHERE local_atual = 'Paledang'
UNION
SELECT * FROM Percurso WHERE destino = 'Zolotyy Potik';

/*Operadores de agregação:*/
SELECT COUNT(*) FROM Multas;
SELECT AVG(distancia) FROM Percurso WHERE origem = 'Paledang';
SELECT MAX(valor_multa) FROM Multas;

/*JOINS:*/
SELECT *
FROM Percurso
INNER JOIN Multas ON Percurso.id_percurso = Multas.id_cliente;
SELECT *
FROM Percurso
LEFT JOIN Obras ON Percurso.id_percurso = Obras.id_percurso;
SELECT *
FROM Cliente
RIGHT JOIN Personalizacao ON Cliente.id_clientes = Personalizacao.id_cliente;


