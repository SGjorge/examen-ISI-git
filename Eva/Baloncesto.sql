CREATE TABLE Participante
(nif VARCHAR(10),
nombre VARCHAR(30),
primer_apell VARCHAR(30),
seg_apell VARCHAR(30),
fecha_nac DATETIME,
PRIMARY KEY (nif));

CREATE TABLE Entrenador 
(nif VARCHAR(10),
PRIMARY KEY (nif),
FOREIGN KEY (nif) REFERENCES Participante(nif));

CREATE TABLE Jugador 
(nif VARCHAR(10),
 estatura FLOAT,
 equipo VARCHAR(50) NOT NULL,
PRIMARY KEY (nif),
FOREIGN KEY (equipo) REFERENCES Equipo(nombre),
FOREIGN KEY (nif) REFERENCES Participante(nif));

INSERT INTO Participante (nif, nombre, primer_apell, seg_apell, fecha_nac)
VALUES('12345678L', 'Juan', 'Ramirez', 'Garcia', "1992-12-15 12:00:00");

INSERT INTO Participante (nif, nombre, primer_apell, fecha_nac)
VALUES('87654321S', 'Pedro', 'Gasol', "1980-03-02 12:00:00");

INSERT INTO Participante (nif, nombre, primer_apell, seg_apell, fecha_nac)
VALUES('87125476P', 'Jorge', 'Gordon', 'Llamo', "1992-02-28 01:00:00");

INSERT INTO Jugador (nif, estatura, equipo) VALUES ('12345678L', 1.85, 'Estudiantes');
INSERT INTO Jugador (nif, estatura, equipo) VALUES ('87125476P', 1.90, 'Real Madrid');

INSERT INTO Entrenador(nif) VALUES ('87654321S');

CREATE TABLE Ciudad
(nombre VARCHAR(50),
comunidad VARCHAR(50),
PRIMARY KEY (nombre, comunidad));

INSERT INTO Ciudad (nombre, comunidad)
VALUES ('Alcala', 'Madrid');

INSERT INTO Ciudad (nombre, comunidad)
VALUES ('Alcala', 'Granada');

INSERT INTO Ciudad (nombre, comunidad)
VALUES ('Madrid', 'Madrid');

INSERT INTO Ciudad (nombre, comunidad)
VALUES ('Navalcarnero', 'Madrid');

INSERT INTO Ciudad (nombre, comunidad)
VALUES ('Bilbao', 'Euskadi');

INSERT INTO Ciudad (nombre, comunidad)
VALUES ('Donosti', 'Euskadi');

INSERT INTO Ciudad (nombre, comunidad)
VALUES ('Vallecas', 'Madrid');

CREATE TABLE Equipo
(nombre VARCHAR (50),
nombre_ciudad VARCHAR(50),
CA_ciudad VARCHAR(50),
PRIMARY KEY (nombre, nombre_ciudad, CA_ciudad),
FOREIGN KEY (nombre_ciudad) REFERENCES Ciudad(nombre),
FOREIGN KEY (CA_ciudad) REFERENCES Ciudad(comunidad));

CREATE TABLE Cancha
(nombre VARCHAR(20),
direccion VARCHAR (60),
nombre_ciudad VARCHAR(50),
CA_ciudad VARCHAR(50),
PRIMARY KEY (nombre, nombre_ciudad, CA_ciudad),
FOREIGN KEY (nombre_ciudad) REFERENCES Ciudad(nombre),
FOREIGN KEY (CA_ciudad) REFERENCES Ciudad(comunidad));

INSERT INTO Cancha (nombre, direccion, nombre_ciudad, CA_ciudad)
VALUES ('A', 'Askatasuna Etorb, 13', 'Bilbao', 'Euskadi');

INSERT INTO Cancha (nombre, direccion, nombre_ciudad, CA_ciudad)
VALUES ('B', 'C/ Hortaleza, 1', 'Madrid', 'Madrid');

INSERT INTO Cancha (nombre, direccion, nombre_ciudad, CA_ciudad)
VALUES ('C', 'Camino Sintra, s/n' , 'Madrid', 'Madrid');

INSERT INTO Cancha (nombre, direccion, nombre_ciudad, CA_ciudad)
VALUES ('D', 'Paseo de la Virgen del puerto, 67', 'Madrid', 'Madrid');

INSERT INTO Cancha (nombre, direccion, nombre_ciudad, CA_ciudad)
VALUES ('E', 'C/ Felipe Alvarez, 3', 'Vallecas', 'Madrid');

INSERT INTO Cancha (nombre, direccion, nombre_ciudad, CA_ciudad)
VALUES ('F', 'Paseo de Anoeta, 22', 'Donosti', 'Euskadi');

CREATE TABLE Entrena_en
(nif_entrenador VARCHAR(10),
cancha VARCHAR(20),
equipo VARCHAR(50),
inicio DATETIME,
fin DATETIME,
PRIMARY KEY (nif_entrenador, cancha, equipo)
FOREIGN KEY (nif_entrenador) REFERENCES Entrenador (nif),
FOREIGN KEY (cancha) REFERENCES Cancha(nombre),
FOREIGN KEY (equipo) REFERENCES Equipo (nombre));

INSERT INTO Participante (nif, nombre, primer_apell, seg_apell, fecha_nac)
VALUES('34566688S', 'Sergio', 'Valdeolmillos', 'Moreno', "1967-04-04 12:00:00");

INSERT INTO Participante (nif, nombre, primer_apell, fecha_nac)
VALUES('34293589K', 'Pablo', 'Laso', "1967-10-13 12:00:00");

INSERT INTO Participante (nif, nombre, primer_apell, fecha_nac)
VALUES('14312129P', 'Jesus', 'Gil', "1933-03-12 12:00:00");

INSERT INTO Participante (nif, nombre, primer_apell, fecha_nac)
VALUES('87125000P', 'Alexander', 'Theriault', "0000-00-00 01:00:00");

INSERT INTO Participante (nif, nombre, primer_apell, fecha_nac)
VALUES('76129834J', 'Carles', 'Duran', "1976-01-15 01:00:00");

INSERT INTO Participante (nif, nombre, primer_apell, fecha_nac)
VALUES('77125000P', 'Sergio', 'Beristain', "0000-00-00 01:00:00");

INSERT INTO Entrenador(nif) VALUES ('34566688S');
INSERT INTO Entrenador(nif) VALUES ('34293589K');
INSERT INTO Entrenador(nif) VALUES ('14312129P');
INSERT INTO Entrenador(nif) VALUES ('87125000P');
INSERT INTO Entrenador(nif) VALUES ('76129834J');
INSERT INTO Entrenador(nif) VALUES ('77125000P');

INSERT INTO Entrena_en (nif_entrenador, cancha, equipo, inicio)
VALUES ('34566688S', 'B', 'Estudiantes', '2016-09-01 00:00:00');

INSERT INTO Entrena_en (nif_entrenador, cancha, equipo, inicio)
VALUES ('34293589K', 'C', 'Real Madrid', '2016-09-01 00:00:00');

INSERT INTO Entrena_en (nif_entrenador, cancha, equipo, inicio)
VALUES ('14312129P', 'D', 'Aletico de Madrid', '2016-09-01 00:00:00');

INSERT INTO Entrena_en (nif_entrenador, cancha, equipo, inicio)
VALUES ('87125000P', 'E', 'Ensanche de Vallecas', '2016-09-01 00:00:00');

INSERT INTO Entrena_en (nif_entrenador, cancha, equipo, inicio)
VALUES ('76129834J', 'A', 'Bilbao Basket', '2016-09-01 00:00:00');

INSERT INTO Entrena_en (nif_entrenador, cancha, equipo, inicio)
VALUES ('77125000P', 'F', 'Donosti Basket', '2016-09-01 00:00:00');

CREATE TABLE Empresa
(nombre VARCHAR (50),
cif VARCHAR(15),
PRIMARY KEY (cif));

INSERT INTO Empresa (nombre, cif)
VALUES ('DOMINION', 'A58818501');

INSERT INTO Empresa (nombre, cif)
VALUES ('IDK Elektronika', 'A58534501');

INSERT INTO Empresa (nombre, cif)
VALUES ('Adidas', 'A12393351');

INSERT INTO Empresa (nombre, cif)
VALUES ('DOMINION', 'A58818501');

INSERT INTO Empresa (nombre, cif)
VALUES ('IDK Elektronika', 'A58534501');

INSERT INTO Empresa (nombre, cif)
VALUES ('Adidas', 'A12393351');

CREATE TABLE Patrocina_eq
(cif VARCHAR(15),
equipo VARCHAR(50),
nombre_ciudad VARCHAR(50),
CA_ciudad VARCHAR(50),
PRIMARY KEY (cif, equipo, nombre_ciudad, CA_ciudad),
FOREIGN KEY (nombre_ciudad) REFERENCES Ciudad(nombre),
FOREIGN KEY (CA_ciudad) REFERENCES Ciudad(comunidad),
FOREIGN KEY (cif) REFERENCES Empresa(cif),
FOREIGN KEY (equipo) REFERENCES Equipo(nombre));

INSERT INTO Patrocina_eq (cif, equipo, nombre_ciudad, CA_ciudad)
VALUES ('A58818501', 'Bilbao Basket', 'Bilbao', 'Euskadi');

INSERT INTO Patrocina_eq (cif, equipo, nombre_ciudad, CA_ciudad)
VALUES ('A58534501', 'Donosti Basket', 'Donosti', 'Euskadi');

INSERT INTO Patrocina_eq (cif, equipo, nombre_ciudad, CA_ciudad)
VALUES ('A12393351', 'Real Madrid', 'Madrid', 'Madrid');

CREATE TABLE Partido
(id INTEGER PRIMARY KEY AUTOINCREMENT,
inicio DATETIME,
fin DATETIME,
primer_tiempo INT,
seg_tiempo INT,
tercer_tiempo INT,
cuarto_tiempo INT,
FOREIGN KEY (primer_tiempo) REFERENCES Tiempo(id),
FOREIGN KEY (seg_tiempo) REFERENCES Tiempo(id),
FOREIGN KEY (tercer_tiempo) REFERENCES Tiempo(id),
FOREIGN KEY (cuarto_tiempo) REFERENCES Tiempo(id));

INSERT INTO Partido (inicio, fin, primer_tiempo, seg_tiempo, tercer_tiempo, cuarto_tiempo)
VALUES ('2016-09-01 20:00:00', '2016-09-01 21:45:30',1, 2, 3, 4);

INSERT INTO Partido (inicio, fin, primer_tiempo, seg_tiempo, tercer_tiempo, cuarto_tiempo)
VALUES ('2016-09-01 20:00:00', '2016-09-01 21:43:00', 5, 6, 7, 8);

INSERT INTO Partido (inicio, fin, primer_tiempo, seg_tiempo, tercer_tiempo, cuarto_tiempo)
VALUES ('2016-09-08 19:30:00', '2016-09-01 21:16:10', 9, 10, 11, 12);

CREATE TABLE Juega
(equipo1 VARCHAR(50) NOT NULL,
equipo2 VARCHAR(50) NOT NULL,
partido_id INTEGER NOT NULL,
cancha VARCHAR(30),
PRIMARY KEY (equipo1, equipo2, partido_id),
FOREIGN KEY (equipo1) REFERENCES Equipo(nombre),
FOREIGN KEY (equipo2) REFERENCES Equipo(nombre),
FOREIGN KEY (partido_id) REFERENCES Partido(id),
FOREIGN KEY (cancha) REFERENCES Cancha(nombre));

INSERT INTO Juega(equipo1, equipo2, partido_id, cancha)
VALUES ('Real Madrid', 'Estudiantes', 1, 'C');

INSERT INTO Juega(equipo1, equipo2, partido_id, cancha)
VALUES ('Donosti Basket', 'Bilbao Basket', 2, 'F');

INSERT INTO Juega(equipo1, equipo2, partido_id, cancha)
VALUES ('Real Madrid', 'Bilbao Basket', 3, 'A');

CREATE TABLE Posicion
(id INTEGER PRIMARY KEY AUTOINCREMENT,
nombre VARCAHR(20),
inicio DATETIME,
fin DATETIME);

INSERT INTO Posicion (nombre, inicio, fin)
VALUES ('pivot', '2016-09-01 20:00:00', '2016-09-01 20:15:10');

INSERT INTO Posicion (nombre, inicio, fin)
VALUES ('base', '2016-09-01 20:35:00', '2016-09-01 20:50:10');

INSERT INTO Posicion (nombre, inicio, fin)
VALUES ('alero', '2016-09-08 20:10:00', '2016-09-08 20:25:35');

CREATE TABLE Jugo_partido 
(partido INTEGER,
posicion INT,
jugador_nif VARCHAR(10),
peso FLOAT,
FOREIGN KEY (partido) REFERENCES Partido(partido_id),
FOREIGN KEY (posicion) REFERENCES Partido (id),
FOREIGN KEY (jugador_nif) REFERENCES Jugador(nif));

INSERT INTO Jugo_partido (partido, posicion, jugador_nif, peso)
VALUES (1, 1, '12345678L', 90.0);

INSERT INTO Jugo_partido (partido, posicion, jugador_nif, peso)
VALUES (1, 2, '12345678L', 90.0);

INSERT INTO Jugo_partido (partido, posicion, jugador_nif, peso)
VALUES (2, 3, '87125476P', 85.2);

CREATE TABLE Jugada
(id INTEGER PRIMARY KEY AUTOINCREMENT,
inicio DATETIME,
fin DATETIME);

INSERT INTO Jugada (inicio, fin)
VALUES ('2016-09-01 20:10:03', '2016-09-01 20:10:50');

INSERT INTO Jugada (inicio, fin)
VALUES ('2016-09-01 21:04:13', '2016-09-01 21:05:50');

INSERT INTO Jugada (inicio, fin)
VALUES ('2016-09-08 20:10:03', '2016-09-01 20:10:50');

INSERT INTO Jugada (inicio, fin)
VALUES ('2016-09-01 21:40:03', '2016-09-01 20:41:50');

CREATE TABLE Jug_cambio_posicion
(id INTEGER,
jugador_nif VARCHAR(10),
coor_x FLOAT,
coor_y FLOAT,
PRIMARY KEY (id),
FOREIGN KEY (id) REFERENCES Jugada(id),
FOREIGN KEY (jugador_nif) REFERENCES Jugador(nif));

CREATE TABLE Jug_defensiva
(id INTEGER,
jug_defensor VARCHAR(10),
jug_defendido VARCHAR(10),
PRIMARY KEY (id),
FOREIGN KEY (id) REFERENCES Jugada(id),
FOREIGN KEY (jug_defensor) REFERENCES Jugador(nif),
FOREIGN KEY (jug_defendido) REFERENCES Jugador(nif));

CREATE TABLE Sucede_en
(jugada INT,
partido INT,
PRIMARY KEY (jugada, partido));

CREATE TABLE Record
(jugador_nif VARCHAR(10),
partido INT,
jugada INT,
tipo VARCHAR(50),
PRIMARY KEY (jugador_nif, partido, jugada),
FOREIGN KEY (jugador_nif) REFERENCES Jugador(nif),
FOREIGN KEY (partido) REFERENCES Partido(id),
FOREIGN KEY (jugada) REFERENCES Jugada(id));

CREATE TABLE Tiempo 
(id INTEGER PRIMARY KEY AUTOINCREMENT,
inicio DATETIME,
fin DATETIME,
puntuacion VARCHAR(10));


