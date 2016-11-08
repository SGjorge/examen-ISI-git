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

CREATE TABLE Ciudad
(nombre VARCHAR(50),
comunidad VARCHAR(50),
PRIMARY KEY (nombre, comunidad));

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

CREATE TABLE Empresa
(nombre VARCHAR (50),
cif VARCHAR(15),
PRIMARY KEY (cif));

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

CREATE TABLE Posicion
(id INTEGER PRIMARY KEY AUTOINCREMENT,
nombre VARCAHR(20),
inicio DATETIME,
fin DATETIME);

CREATE TABLE Jugo_partido
(partido INTEGER,
posicion INT,
jugador_nif VARCHAR(10),
peso FLOAT,
FOREIGN KEY (partido) REFERENCES Partido(partido_id),
FOREIGN KEY (posicion) REFERENCES Partido (id),
FOREIGN KEY (jugador_nif) REFERENCES Jugador(nif));

CREATE TABLE Jugada
(id INTEGER PRIMARY KEY AUTOINCREMENT,
inicio DATETIME,
fin DATETIME);

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
