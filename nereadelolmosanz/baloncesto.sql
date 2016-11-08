sqlite:///examen1_baloncesto_sql.db
PRAGMA foreign_keys = ON;
CREATE TABLE Comunidades(
    comunidad VARCHAR(30),
    PRIMARY KEY (comunidad));
INSERT INTO Comunidades(comunidad) VALUES ('madrid');
INSERT INTO Comunidades(comunidad) VALUES ('galicia');
INSERT INTO Comunidades(comunidad) VALUES ('cantabria');
SELECT * FROM Comunidades;
CREATE TABLE Ciudades(
    ciudad VARCHAR(30),
    comunidad VARCHAR(30) NOT NULL,
    PRIMARY KEY (ciudad, comunidad),
    FOREIGN KEY (comunidad) REFERENCES Comunidades(comunidad) ON DELETE CASCADE);
INSERT INTO Ciudades(ciudad, comunidad) VALUES ('alcobendas','madrid');
INSERT INTO Ciudades(ciudad, comunidad) VALUES ('lugo','galicia');
INSERT INTO Ciudades(ciudad, comunidad) VALUES ('pontevedra','galicia');
INSERT INTO Ciudades(ciudad, comunidad) VALUES ('alcobendas','cantabria');
SELECT * FROM Ciudades;
CREATE TABLE Equipos(
    equipo VARCHAR(30),
    ciudad VARCHAR(30) NOT NULL,
    comunidad VARCHAR(30) NOT NULL,
    PRIMARY KEY (equipo, ciudad, comunidad),
    FOREIGN KEY (ciudad,comunidad) REFERENCES Ciudades(ciudad,comunidad) ON DELETE CASCADE);
INSERT INTO Equipos(equipo, ciudad, comunidad)
VALUES ('atletico', 'lugo', 'galicia');
INSERT INTO Equipos(equipo, ciudad, comunidad)
VALUES ('atletico', 'alcobendas', 'madrid');
INSERT INTO Equipos(equipo, ciudad, comunidad)
VALUES ('real', 'alcobendas', 'madrid');
INSERT INTO Equipos(equipo, ciudad, comunidad)
VALUES ('deportivo', 'pontevedra', 'galicia');
INSERT INTO Equipos(equipo, ciudad, comunidad)
VALUES ('betis', 'alcobendas', 'cantabria');
SELECT * FROM Equipos;
CREATE TABLE Canchas(
    cancha VARCHAR(30),
    PRIMARY KEY (cancha));
INSERT INTO Canchas(cancha) VALUES ('cancha1');
INSERT INTO Canchas(cancha) VALUES ('cancha2');
INSERT INTO Canchas(cancha) VALUES ('cancha3');
SELECT * FROM Canchas;
CREATE TABLE Direcciones_de_canchas(
    cancha VARCHAR(30) NOT NULL,
    calle VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    comunidad VARCHAR(30) NOT NULL,
    PRIMARY KEY (cancha, calle, numero, ciudad, comunidad),
    FOREIGN KEY (cancha) REFERENCES Canchas(cancha) ON DELETE CASCADE,
    FOREIGN KEY (ciudad,comunidad) REFERENCES Ciudades(ciudad,comunidad) ON DELETE CASCADE);
INSERT INTO Direcciones_de_canchas(cancha, calle, numero, ciudad, comunidad)
VALUES ('cancha1', 'cervantes', 22 , 'lugo', 'galicia');
INSERT INTO Direcciones_de_canchas(cancha, calle, numero, ciudad, comunidad)
VALUES ('cancha2', 'felicidad', 156 , 'alcobendas', 'cantabria');
INSERT INTO Direcciones_de_canchas(cancha, calle, numero, ciudad, comunidad)
VALUES ('cancha3', 'naranjos', 35 , 'pontevedra', 'galicia');
SELECT * FROM Direcciones_de_canchas;
CREATE TABLE Entrenan_en(
    equipo VARCHAR(30),
    ciudad VARCHAR(30),
    comunidad VARCHAR(30),
    cancha VARCHAR(30),
    PRIMARY KEY (equipo, ciudad, comunidad, cancha),
    FOREIGN KEY (equipo, ciudad, comunidad) REFERENCES Equipos(equipo,ciudad,comunidad) ON DELETE CASCADE);
INSERT INTO Entrenan_en(equipo, ciudad, comunidad, cancha)
VALUES ('atletico', 'lugo', 'galicia', 'cancha1');
INSERT INTO Entrenan_en(equipo, ciudad, comunidad, cancha)
VALUES ('atletico', 'alcobendas', 'madrid','cancha2');
INSERT INTO Entrenan_en(equipo, ciudad, comunidad, cancha)
VALUES ('real', 'alcobendas', 'madrid','cancha2');
INSERT INTO Entrenan_en(equipo, ciudad, comunidad, cancha)
VALUES ('deportivo', 'pontevedra', 'galicia', 'cancha1');
INSERT INTO Entrenan_en(equipo, ciudad, comunidad, cancha)
VALUES ('betis', 'alcobendas', 'cantabria','cancha3');
INSERT INTO Entrenan_en(equipo, ciudad, comunidad, cancha)
VALUES ('betis', 'alcobendas', 'cantabria', 'cancha2');
SELECT * FROM Entrenan_en;
CREATE TABLE Empresas(
    empresa VARCHAR(30),
    cif VARCHAR(30),
    PRIMARY KEY (cif));
INSERT INTO Empresas(empresa, cif)
VALUES ('indra','A11111111');
INSERT INTO Empresas(empresa, cif)
VALUES ('telefonica','B22222222');
INSERT INTO Empresas(empresa, cif)
VALUES ('inditex','B33333333');
SELECT * FROM Empresas;
CREATE TABLE Temporadas(
    f_inicio DATETIME,
    f_fin DATETIME,
    cif VARCHAR(30) NOT NULL,
    PRIMARY KEY (f_inicio),
    FOREIGN KEY (cif) REFERENCES Empresas(cif) ON DELETE CASCADE);
INSERT INTO Temporadas(f_inicio, f_fin, cif)
VALUES ('2007-01-1 00:00:00', '2007-12-31 00:00:00','A11111111');
INSERT INTO Temporadas(f_inicio, f_fin, cif)
VALUES ('2008-01-1 00:00:00', '2008-12-31 00:00:00','B22222222');
INSERT INTO Temporadas(f_inicio, f_fin, cif)
VALUES ('2009-01-1 00:00:00', '2009-12-31 00:00:00','B33333333');
SELECT * FROM Temporadas;
CREATE TABLE Financian(
    equipo VARCHAR(30),
    ciudad VARCHAR(30),
    comunidad VARCHAR(30),
    cif VARCHAR(30),
    PRIMARY KEY (equipo, ciudad, comunidad, cif),
    FOREIGN KEY (equipo, ciudad, comunidad) REFERENCES Equipos(equipo, ciudad, comunidad) ON DELETE CASCADE,
    FOREIGN KEY (ciudad, comunidad) REFERENCES Ciudades(ciudad, comunidad) ON DELETE CASCADE,
    FOREIGN KEY (cif) REFERENCES Empresas(cif) ON DELETE CASCADE);
INSERT INTO Financian(equipo, ciudad, comunidad, cif)
VALUES ('betis', 'alcobendas', 'cantabria','A11111111');
INSERT INTO Financian(equipo, ciudad, comunidad, cif)
VALUES ('atletico', 'lugo', 'galicia','B22222222');
INSERT INTO Financian(equipo, ciudad, comunidad, cif)
VALUES ('atletico', 'alcobendas', 'madrid','B33333333');
INSERT INTO Financian(equipo, ciudad, comunidad, cif)
VALUES ('deportivo', 'pontevedra', 'galicia','B33333333');
SELECT * FROM Financian;
CREATE TABLE Personas (
    nif VARCHAR(30),
    nombre VARCHAR(30),
    apellidos VARCHAR(30),
    f_nacimiento DATETIME,
    PRIMARY KEY (nif));
INSERT INTO Personas(nif, nombre, apellidos, f_nacimiento)
VALUES ('11111111A', 'juan', 'perez martinez', '1980-12-26 00:00:00');
INSERT INTO Personas(nif, nombre, apellidos, f_nacimiento)
VALUES ('22222222B', 'juan', 'perez martinez', '1975-02-17 00:00:00');
INSERT INTO Personas(nif, nombre, apellidos, f_nacimiento)
VALUES ('33333333C', 'pepe', 'perez martinez', '1984-10-15 00:00:00');
INSERT INTO Personas(nif, nombre, apellidos, f_nacimiento)
VALUES ('44444444D', 'paco', 'rodriguez', '1980-04-16 00:00:00');
INSERT INTO Personas(nif, nombre, apellidos, f_nacimiento)
VALUES ('55555555E', 'elena', 'garcia sanz', '1996-03-28 00:00:00');
INSERT INTO Personas(nif, nombre, apellidos, f_nacimiento)
VALUES ('66666666F', 'rosa', 'sanz hernandez', '1981-11-06 00:00:00');
INSERT INTO Personas(nif, nombre, apellidos, f_nacimiento)
VALUES ('77777777G', 'jose', 'sanchez', '1981-12-24 00:00:00');
SELECT * FROM Personas;
CREATE TABLE Jugadores (
    jugador VARCHAR(30),
    PRIMARY KEY (jugador),
    FOREIGN KEY (jugador) REFERENCES Personas(nif) ON DELETE CASCADE);
ALTER TABLE Jugadores ADD COLUMN estatura_cm INT;
INSERT INTO Jugadores(jugador, estatura_cm)
VALUES ('11111111A',190);
INSERT INTO Jugadores(jugador, estatura_cm)
VALUES ('22222222B', 192);
INSERT INTO Jugadores(jugador, estatura_cm)
VALUES ('33333333C', 205);
INSERT INTO Jugadores(jugador, estatura_cm)
VALUES ('44444444D', 203);
INSERT INTO Jugadores(jugador, estatura_cm)
VALUES ('55555555E', 204);
SELECT * FROM Jugadores;
CREATE TABLE Entrenadores (
    entrenador VARCHAR(30),
    PRIMARY KEY (entrenador),
    FOREIGN KEY (entrenador) REFERENCES Personas(nif) ON DELETE CASCADE);
INSERT INTO Entrenadores(entrenador)
VALUES ('66666666F');
INSERT INTO Entrenadores(entrenador)
VALUES ('77777777G');
SELECT * FROM Entrenadores;
CREATE TABLE Entrenan(
    f_inicio DATETIME,
    f_fin DATETIME,
    entrenador VARCHAR(30),
    equipo VARCHAR(30),
    ciudad VARCHAR(30),
    comunidad VARCHAR(30),
    cancha VARCHAR(30),
    f_temporada DATETIME,
    PRIMARY KEY (f_inicio, entrenador, equipo, ciudad, comunidad, cancha, f_temporada),
    FOREIGN KEY (entrenador) REFERENCES Entrenadores(entrenador) ON DELETE CASCADE,
    FOREIGN KEY (equipo,ciudad,comunidad) REFERENCES Equipos(equipo,ciudad,comunidad) ON DELETE CASCADE,

    FOREIGN KEY (cancha) REFERENCES Canchas(cancha) ON DELETE CASCADE,
    FOREIGN KEY (f_temporada) REFERENCES Temporadas(f_inicio) ON DELETE CASCADE);
SELECT * FROM Entrenan;
INSERT INTO Entrenan(f_inicio, f_fin, entrenador, equipo, ciudad, comunidad, cancha, f_temporada)
VALUES ('2007-01-1 00:00:00','2007-12-31 00:00:00','66666666F','atletico','lugo', 'galicia', 'cancha1', '2007-01-1 00:00:00');
INSERT INTO Entrenan(f_inicio, f_fin, entrenador, equipo, ciudad, comunidad, cancha, f_temporada)
VALUES ('2008-01-1 00:00:00','2008-12-31 00:00:00','66666666F', 'real', 'alcobendas', 'madrid','cancha2','2008-01-1 00:00:00');
INSERT INTO Entrenan(f_inicio, f_fin, entrenador, equipo, ciudad, comunidad, cancha, f_temporada)
VALUES ('2007-01-1 00:00:00','2007-04-25 00:00:00','77777777G', 'real', 'alcobendas', 'madrid','cancha2','2007-01-1 00:00:00');
INSERT INTO Entrenan(f_inicio, f_fin, entrenador, equipo, ciudad, comunidad, cancha, f_temporada)
VALUES ('2008-01-1 00:00:00','2008-12-31 00:00:00','77777777G', 'deportivo', 'pontevedra', 'galicia','cancha1','2008-01-1 00:00:00');
SELECT * FROM Entrenan;
CREATE TABLE Partidos(
    f_inicio DATETIME,
    f_fin DATETIME,

    equipo1 VARCHAR(30),
    ciudad1 VARCHAR(30),
    comunidad1 VARCHAR(30),

    equipo2 VARCHAR(30),
    ciudad2 VARCHAR(30),
    comunidad2 VARCHAR(30),

    cancha VARCHAR(30),

    f_temporada DATETIME,

    PRIMARY KEY (f_inicio,
                 equipo1, ciudad1, comunidad1,
                 equipo2, ciudad2, comunidad2,
                 f_temporada),
    FOREIGN KEY (equipo1,ciudad1,comunidad1) REFERENCES Equipos(equipo,ciudad,comunidad) ON DELETE CASCADE,
    FOREIGN KEY (equipo2,ciudad2,comunidad2) REFERENCES Equipos(equipo,ciudad,comunidad) ON DELETE CASCADE,
    FOREIGN KEY (cancha) REFERENCES Canchas(cancha) ON DELETE CASCADE,
    FOREIGN KEY (f_temporada) REFERENCES Temporadas(f_inicio) ON DELETE CASCADE);
SELECT * FROM canchas;
INSERT INTO PARTIDOS (f_inicio, f_fin, equipo1, ciudad1, comunidad1, equipo2, ciudad2, comunidad2, cancha, f_temporada)
VALUES ('2007-01-10 16:00:00','2007-01-10 18:30:00','atletico','lugo', 'galicia', 'atletico','alcobendas', 'madrid','cancha1','2007-01-01 00:00:00' );
INSERT INTO PARTIDOS (f_inicio, f_fin, equipo1, ciudad1, comunidad1, equipo2, ciudad2, comunidad2, f_temporada)
VALUES ('2007-01-10 19:00:00', '2007-01-10 21:10:00','atletico','lugo', 'galicia', 'real','alcobendas', 'madrid','cancha2','2007-01-01 00:00:00' );
INSERT INTO PARTIDOS (f_inicio,f_fin, equipo1, ciudad1, comunidad1, equipo2, ciudad2, comunidad2, f_temporada)
VALUES ('2007-05-20 19:00:00', '2007-05-20 21:40:00','deportivo','pontevedra', 'galicia', 'real','alcobendas','madrid', 'cancha2','2007-01-01 00:00:00' );
INSERT INTO PARTIDOS (f_inicio, f_fin,equipo1, ciudad1, comunidad1, equipo2, ciudad2, comunidad2, f_temporada)
VALUES ('2008-05-23 15:00:00', '2008-05-23 17:20:00','deportivo','pontevedra', 'galicia', 'real','alcobendas', 'madrid', 'cancha3','2008-01-01 00:00:00' );
SELECT * FROM Partidos;
CREATE TABLE Plantilla(
    jugador VARCHAR(30),
    equipo VARCHAR(30),
    ciudad VARCHAR(30),
    comunidad VARCHAR(30),
    f_temporada DATETIME,
    PRIMARY KEY (jugador, equipo, ciudad, comunidad, f_temporada),
    FOREIGN KEY (jugador) REFERENCES Personas(nif) ON DELETE CASCADE,
    FOREIGN KEY (equipo) REFERENCES Equipos(equipo) ON DELETE CASCADE,
    FOREIGN KEY (ciudad) REFERENCES Ciudades(ciudad) ON DELETE CASCADE,
    FOREIGN KEY (comunidad) REFERENCES Comunidades(comunidad) ON DELETE CASCADE,
    FOREIGN KEY (f_temporada) REFERENCES Temporadas(f_inicio) ON DELETE CASCADE);
SELECT * FROM Plantilla;
SELECT * FROM Plantilla;
SELECT * FROM Partidos;
SELECT Partidos.cancha
    FROM Plantilla
    JOIN Partidos
    ON Plantilla.equipo = Partidos.equipo1 AND
        Plantilla.ciudad = Partidos.ciudad1 AND
        Plantilla.comunidad = Partidos.comunidad1
    OR Plantilla.equipo = Partidos.equipo2 AND
        Plantilla.ciudad = Partidos.ciudad2 AND
        Plantilla.comunidad = Partidos.comunidad2
    WHERE Jugador.jugador='11111111A' AND Entrenan.f_temporada='2007-01-1 00:00:00';
CREATE VIEW Canchas_jugador_1_temp1 AS
    SELECT Partidos.cancha
    FROM Plantilla
    JOIN Partidos
    ON Plantilla.equipo = Partidos.equipo1 AND
        Plantilla.ciudad = Partidos.ciudad1 AND
        Plantilla.comunidad = Partidos.comunidad1
    OR Plantilla.equipo = Partidos.equipo2 AND
        Plantilla.ciudad = Partidos.ciudad2 AND
        Plantilla.comunidad = Partidos.comunidad2
    WHERE Jugador.jugador='11111111A' AND Entrenan.f_temporada='2007-01-1 00:00:00');
SELECT Direcciones_de_canchas.ciudad
    FROM Direcciones_de_canchas
    JOIN Canchas_jugador_1_temp1
    ON Direcciones_de_canchas.cancha = Canchas_jugador_1_temp1.cancha
    WHERE Direcciones_de_canchas.cancha = Canchas_jugador_1_temp1.cancha;

SELECT equipo FROM financian WHERE cif = 'B33333333'
