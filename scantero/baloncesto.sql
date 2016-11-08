CREATE TABLE IF NOT EXISTS Comunidades_Autonomas
(nombre VARCHAR(30),
 PRIMARY KEY (nombre)
);

CREATE TABLE IF NOT EXISTS Ciudades
(nombre VARCHAR(30),
 com_autonoma VARCHAR(30) NOT NULL,
 PRIMARY KEY (nombre, com_autonoma),
 FOREIGN KEY (com_autonoma) REFERENCES Comunidades_Autonomas(nombre)
 ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Equipos
(nombre varchar(30),
 ciudad VARCHAR(30) NOT NULL,
 com_autonoma VARCHAR(30) NOT NULL,
 PRIMARY KEY (nombre, ciudad),
 FOREIGN KEY (ciudad) REFERENCES Ciudades(nombre)
 ON DELETE CASCADE,
 FOREIGN KEY (com_autonoma) REFERENCES Comunidades_Autonomas(nombre)
 ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Entrenadores
(nif VARCHAR(10),
 nombre VARCHAR(30),
 apellidos VARCHAR(30),
 fecha_nto DATETIME,
 PRIMARY KEY (nif)
);

CREATE TABLE IF NOT EXISTS Jugadores
(nif VARCHAR(10),
 nombre VARCHAR(30),
 apellidos VARCHAR(30),
 fecha_nto DATETIME,
 altura FLOAT,
 PRIMARY KEY (nif)
);

CREATE TABLE IF NOT EXISTS Temporadas
(numero INT,
 fecha_ini DATETIME,
 fecha_fin DATETIME,
 patrocinada_por VARCHAR(10),
 PRIMARY KEY (numero),
 FOREIGN KEY (patrocinada_por) REFERENCES Empresas(cif)
);

CREATE TABLE IF NOT EXISTS Participan_Entrenadores
(entrenador VARCHAR(10),
 equipo VARCHAR(30),
 ciudad VARCHAR(30),
 com_autonoma VARCHAR(30),
 temporada INT,
 fecha_ini DATETIME,
 fecha_fin DATETIME,
 PRIMARY KEY (entrenador, equipo, ciudad, com_autonoma, temporada),
 FOREIGN KEY (entrenador) REFERENCES Entrenadores(nif),
 FOREIGN KEY (equipo) REFERENCES Equipos(nombre),
 FOREIGN KEY (ciudad) REFERENCES Ciudades(nombre),
 FOREIGN KEY (com_autonoma) REFERENCES Comunidades_Autonomas(nombre),
 FOREIGN KEY (temporada) REFERENCES Temporadas(numero),
 UNIQUE(entrenador, temporada)
);

CREATE TABLE IF NOT EXISTS Participan_Jugadores
(jugador VARCHAR(10),
 equipo VARCHAR(30),
 ciudad VARCHAR(30),
 com_autonoma VARCHAR(30),
 temporada INT,
 PRIMARY KEY (jugador, equipo, ciudad, com_autonoma, temporada),
 FOREIGN KEY (jugador) REFERENCES Jugadores(nif),
 FOREIGN KEY (equipo) REFERENCES Equipos(nombre),
 FOREIGN KEY (ciudad) REFERENCES Ciudades(nombre),
 FOREIGN KEY (com_autonoma) REFERENCES Comunidades_Autonomas(nombre),
 FOREIGN KEY (temporada) REFERENCES Temporadas(numero),
 UNIQUE(jugador, temporada)
);

CREATE TABLE IF NOT EXISTS Direcciones
(calle VARCHAR(30),
 numero INT,
 ciudad VARCHAR(30),
 com_autonoma VARCHAR(30),
 PRIMARY KEY (calle, numero),
 FOREIGN KEY (ciudad) REFERENCES Ciudades(nombre),
 FOREIGN KEY (com_autonoma) REFERENCES Comunidades_Autonomas(nombre)
);

CREATE TABLE IF NOT EXISTS Canchas
(nombre VARCHAR(30),
 calle VARCHAR(30),
 numero INT,
 PRIMARY KEY (nombre)
 FOREIGN KEY (calle, numero) REFERENCES Direcciones(calle, numero)
);

CREATE TABLE IF NOT EXISTS Empresas
(cif VARCHAR(10),
 nombre VARCHAR (30),
 PRIMARY KEY (cif)
);

CREATE TABLE IF NOT EXISTS Patrocinados_Por
(equipo VARCHAR(30),
 ciudad VARCHAR(30),
 com_autonoma VARCHAR(30),
 empresa_patrocinadora VARCHAR(30),
 PRIMARY KEY (equipo, ciudad, com_autonoma, empresa_patrocinadora),
 FOREIGN KEY (equipo) REFERENCES Equipos(nombre),
 FOREIGN KEY (ciudad) REFERENCES Ciudades(nombre),
 FOREIGN KEY (com_autonoma) REFERENCES Comunidades_Autonomas(nombre),
 FOREIGN KEY (empresa_patrocinadora) REFERENCES Empresas(cif)
);

CREATE TABLE IF NOT EXISTS Entrenan
(entrenador VARCHAR(10),
 equipo VARCHAR(30),
 ciudad VARCHAR(30),
 com_autonoma VARCHAR(30),
 temporada INT,
 cancha VARCHAR(30),
 PRIMARY KEY (equipo, ciudad, com_autonoma, entrenador, temporada, cancha),
 FOREIGN KEY (equipo) REFERENCES Equipos(nombre),
 FOREIGN KEY (ciudad) REFERENCES Ciudades(nombre),
 FOREIGN KEY (com_autonoma) REFERENCES Comunidades_Autonomas(nombre),
 FOREIGN KEY (entrenador) REFERENCES Entrenadores(nif),
 FOREIGN KEY (temporada) REFERENCES Temporadas(numero)
 FOREIGN KEY (cancha) REFERENCES Canchas(nombre)
);

CREATE TABLE IF NOT EXISTS Partidos
(ident VARCHAR(10),
 cancha VARCHAR(30),
 temporada INT,
 equipo1 VARCHAR(30),
 ciudad1 VARCHAR(30),
 com_autonoma1 VARCHAR(30),
 equipo2 VARCHAR(30),
 ciudad2 VARCHAR(30),
 com_autonoma2 VARCHAR(30),
 hora_ini DATETIME,
 hora_fin DATETIME,
 PRIMARY KEY (equipo1, ciudad1, com_autonoma1, equipo2, ciudad2, com_autonoma2, temporada, cancha, hora_ini),
 FOREIGN KEY (cancha) REFERENCES Canchas(nombre),
 FOREIGN KEY (equipo1) REFERENCES Equipos(nombre),
 FOREIGN KEY (ciudad1) REFERENCES Ciudades(nombre),
 FOREIGN KEY (com_autonoma1) REFERENCES Comunidades_Autonomas(nombre),
 FOREIGN KEY (equipo2) REFERENCES Equipos(nombre),
 FOREIGN KEY (ciudad2) REFERENCES Ciudades(nombre),
 FOREIGN KEY (com_autonoma2) REFERENCES Comunidades_Autonomas(nombre),
 FOREIGN KEY (temporada) REFERENCES Temporadas(numero),
 UNIQUE(equipo1, ciudad1, com_autonoma1, hora_ini),
 UNIQUE(equipo2, ciudad2, com_autonoma2, hora_ini)
 UNIQUE(ident)
);

CREATE TABLE IF NOT EXISTS Posiciones
(tipo VARCHAR(15),
 PRIMARY KEY (tipo)
);

CREATE TABLE IF NOT EXISTS Juegan_En_Pos
(jugador VARCHAR(10),
 posicion VARCHAR(15),
 partido VARCHAR(10),
 hora_ini DATETIME,
 hora_fin DATETIME,
 PRIMARY KEY (jugador, posicion, partido),
 FOREIGN KEY (jugador) REFERENCES Jugadores(nif),
 FOREIGN KEY (posicion) REFERENCES Posiciones(tipo),
 FOREIGN KEY (partido) REFERENCES Partidos(ident)
);

CREATE TABLE IF NOT EXISTS Tiempos
(numero INT,
 PRIMARY KEY (numero)
);

CREATE TABLE IF NOT EXISTS Se_Divide_En
(partido VARCHAR(15),
 tiempo INT,
 hora_ini DATETIME,
 hora_fin DATETIME,
 puntuacion VARCHAR(10),
 PRIMARY KEY (partido, tiempo),
 FOREIGN KEY (partido) REFERENCES Partidos(ident),
 FOREIGN KEY (tiempo) REFERENCES Tiempos(numero)
);
