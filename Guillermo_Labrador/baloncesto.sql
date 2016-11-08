CREATE TABLE Comunidades_Autonomas
(nombre VARCHAR(30),
 PRIMARY KEY (nombre)
);
CREATE TABLE Ciudades(nombre VARCHAR(30), 
                      comunidad_autonoma VARCHAR(30) NOT NULL, 
                      PRIMARY KEY(nombre, comunidad_autonoma),
                      FOREIGN KEY(comunidad_autonoma) REFERENCES Comunidades_Autonomas(nombre) ON DELETE CASCADE);
CREATE TABLE Equipos(nombre VARCHAR(30),
                     ciudad VARCHAR(30) NOT NULL,
                     comunidad_autonoma VARCHAR(30) NOT NULL,
                     PRIMARY KEY (nombre, ciudad, comunidad_autonoma),
                     FOREIGN KEY(ciudad) REFERENCES Ciudades(nombre), 
                     FOREIGN KEY(comunidad_autonoma) REFERENCES Comunidades_Autonomas(nombre));
INSERT INTO "Equipos" VALUES('Estudiantes','Madrid','Comunidad de Madrid');
INSERT INTO "Equipos" VALUES('Estudiantes','Pontevedra','Galicia');
INSERT INTO "Equipos" VALUES('DKV','Badalona','Cataluña');
INSERT INTO "Equipos" VALUES('Bilbao Basquet','Bilbao','Pais Vasco');
CREATE TABLE Empresas(nombre VARCHAR(30),
                     cif VARCHAR(10),
                     PRIMARY KEY (cif));
CREATE TABLE Jugadores(nif VARCHAR(10),
                       nombre VARCHAR(30),
                       apellidos VARCHAR(30),
                       fecha_nacimiento VARCHAR(30),
                       nombre_equipo VARCHAR(30),
                       PRIMARY KEY (nif),
                       FOREIGN KEY (nombre_equipo) REFERENCES Equipos(nombre));
INSERT INTO "Jugadores" VALUES('03456779X','Alberto','Estevez','1991-04-03','Estudiantes');
CREATE TABLE Partidos(nombre VARCHAR(30),
                      fecha_comienzo VARCHAR(30),
                      fecha_fin VARCHAR(30),
                      nombre_jugador VARCHAR(30),
                      posicion VARCHAR(30),                      
                      PRIMARY KEY (nombre)
                      FOREIGN KEY (nombre_jugador) REFERENCES Jugadores(nombre));

