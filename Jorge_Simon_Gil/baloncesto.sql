CREATE TABLE jugadores(nif VARCHAR(20) NOT NULL,
                       nombre VARCHAR(10) NOT NULL,
                       apellidos VARCHAR(20) NOT NULL,
                       estatura FLOAT,
                       peso FLOAT,
                       nacido DATETIME,
                       equipo VARCHAR(20),
                       comunidad VARCHAR(20),
                       PRIMARY KEY(nif),
                       FOREIGN KEY(equipo) REFERENCES equipos(nombre),
                       FOREIGN KEY (comunidad) REFERENCES comunidades(nombre),
                       UNIQUE(nif,equipo,comunidad)
                      );
CREATE TABLE temporadas(inicio DATETIME NOT NULL,
                      fin DATETIME NOT NULL,
                      PRIMARY KEY (inicio,fin)
                      );

CREATE TABLE entrenadores(nif VARCHAR(20) NOT NULL,
                      nombre VARCHAR(10) NOT NULL,
                      apellidos VARCHAR(20) NOT NULL,
                      nacido DATETIME,
                      equipo VARCHAR(20),
                      comunidad VARCHAR(20),
                      PRIMARY KEY(nif,equipo,comunidad),
                      FOREIGN KEY(equipo) REFERENCES equipos(nombre),
                      FOREIGN KEY (comunidad) REFERENCES comunidades(nombre)
                     );

 CREATE TABLE empresas( cif INT NOT NULL,
                       nombre VARCHAR(20) NOT NULL,
                       PRIMARY KEY (cif)
                      );

CREATE TABLE comunidades(nombre VARCHAR(20) NOT NULL,
                      PRIMARY KEY (nombre)
                      );

CREATE TABLE canchas(nombre VARCHAR(20) NOT NULL,
  calle VARCHAR(20) NOT NULL,
  numero INT NOT NULL,
  comunidad VARCHAR(20) NOT NULL,
  PRIMARY KEY (calle,numero,comunidad),
  FOREIGN KEY (comunidad) REFERENCES comunidades(nombre)
  );

  CREATE TABLE equipos(nombre VARCHAR(20) NOT NULL,
                     nif_entrenador VARCHAR(20) NOT NULL,
                     cif_empresa INT NOT NULL,
                     comunidad VARCHAR(20) NOT NULL,
                     temporada_inicio DATETIME DEFAULT '0000-00-00 00:00:00',
                     temporada_fin DATETIEM DEFAULT '0000-00-00 00:00:00',
                     PRIMARY KEY(nombre,comunidad,temporada_inicio,temporada_fin),
                     FOREIGN KEY (nif_entrenador) REFERENCES entrenadores(nif),
                     FOREIGN KEY (cif_empresa) REFERENCES empresas(cif),
                     FOREIGN KEY (comunidad) REFERENCES comunidades(nombre),
                     FOREIGN KEY (temporada_inicio) REFERENCES temporadas(inicio),
                     FOREIGN KEY (temporada_fin) REFERENCES temporadas(fin)
                    );

CREATE TABLE libro_jugadas(jugada VARCHAR(20),
                           campo_en_relacion VARCHAR(20),
                          PRIMARY KEY(jugada,campo_en_relacion)
                          );

CREATE TABLE tipos_jugada(tipo VARCHAR(20),
                         campo_en_relacion VARCHAR(20),
                         PRIMARY KEY(tipo,campo_en_relacion)
                         );

 CREATE TABLE jugadas(inicio DATETIME,
                     fin DATETIME,
                     jugador_principal VARCHAR(20),
                     jugada VARCHAR(20),
                     resolucion_jugada VARCHAR(20),
                     tipo VARCHAR(20),
                     relacion VARCHAR(20),
                     inicio_partido DATETIME,
                     fin_partido DATETIME,
                     equipo_1 VARCHAR(20) NOT NULL,
                     equipo_2 VARCHAR(20) NOT NULL,
                     comunidad_1 VARCHAR(20) NOT NULL,
                     comunidad_2 VARCHAR(20) NOT NULL,
                     inicio_temporada DATETIME,
                     fin_temporada DATETIME,
                     PRIMARY KEY(inicio,fin,inicio_partido,fin_partido,equipo_1,equipo_2,comunidad_1,comunidad_2,inicio_temporada,fin_temporada)
                     );


 CREATE TABLE partidos(inicio DATETIME,
                      fin DATETIME,
                      equipo_1 VARCHAR(20) NOT NULL,
                      equipo_2 VARCHAR(20) NOT NULL,
                      comunidad_1 VARCHAR(20) NOT NULL,
                      comunidad_2 VARCHAR(20) NOT NULL,
                      inicio_temporada DATETIME,
                      fin_temporada DATETIME,
                      comunidad_juego VARCHAR(20),
                      calle_cancha VARCHAR(20),
                      numero_cancha VARCHAR(20),
                      PRIMARY KEY(inicio,fin,equipo_1,equipo_2,comunidad_1,comunidad_2,inicio_temporada,fin_temporada),
                      UNIQUE(inicio,fin,inicio_temporada,fin_temporada,comunidad_juego,calle_cancha,numero_cancha)
                      );


CREATE TABLE posiciones(posicion VARCHAR(20),
                     PRIMARY KEY(posicion));


CREATE TABLE alineaciones(jugador VARCHAR(20),
   posicion VARCHAR(20),
   inicio DATETIME,
   fin DATETIME,
   inicio_partido DATETIME,
   fin_partido DATETIME,
   inicio_temporada DATETIME,
   fin_temporada DATETIME,
   PRIMARY KEY(jugador,inicio,fin,inicio_partido,fin_partido,inicio_temporada,fin_temporada)
   );


   CREATE TABLE records(jugador VARCHAR(20),
                    record VARCHAR(20),
                    inicio_partido DATETIME,
                    fin_partido DATETIME,
                    equipo_1 VARCHAR(20) NOT NULL,
                    equipo_2 VARCHAR(20) NOT NULL,
                    comunidad_1 VARCHAR(20) NOT NULL,
                    comunidad_2 VARCHAR(20) NOT NULL,
                    PRIMARY KEY(jugador,record)
                    );

  CREATE TABLE cuartos(inicio DATETIME,
    fin DATETIME,
    puntuacion_equipo_1 INT,
    puntuacion_equipo_2 INT,
    equipo_1 VARCHAR(20) NOT NULL,
    equipo_2 VARCHAR(20) NOT NULL,
    comunidad_1 VARCHAR(20) NOT NULL,
    comunidad_2 VARCHAR(20) NOT NULL,
    inicio_partido DATETIME,
    fin_partido DATETIME,
    inicio_temporada DATETIME,
    fin_temporada DATETIME,
    PRIMARY KEY(inicio,fin,equipo_1,equipo_2,comunidad_1,comunidad_2,inicio_partido,fin_partido,inicio_temporada,fin_temporada)
    );

DROP TABLE jugadas;
    CREATE TABLE jugadas(inicio DATETIME,
                    fin DATETIME,
                    jugador_principal VARCHAR(20),
                    jugada VARCHAR(20),
                    resolucion_jugada VARCHAR(20),
                    tipo VARCHAR(20),
                    relacion VARCHAR(20),
                    inicio_partido DATETIME,
                    fin_partido DATETIME,
                    equipo_1 VARCHAR(20) NOT NULL,
                    equipo_2 VARCHAR(20) NOT NULL,
                    comunidad_1 VARCHAR(20) NOT NULL,
                    comunidad_2 VARCHAR(20) NOT NULL,
                    inicio_temporada DATETIME,
                    fin_temporada DATETIME,
                    PRIMARY KEY(inicio,fin,inicio_partido,fin_partido,equipo_1,equipo_2,comunidad_1,comunidad_2,inicio_temporada,fin_temporada),
                    FOREIGN KEY(tipo) REFERENCES tipos_jugada(tipo),
                    FOREIGN KEY(resolucion_jugada) REFERENCES libro_jugadas(campo_en_relacion),
                    FOREIGN KEY(relacion) REFERENCES tipos_jugada(campo_en_relacion),
                    FOREIGN KEY(jugador_principal) REFERENCES jugadores(nif),
                    FOREIGN KEY(jugada) REFERENCES libro_jugadas(jugada),
                    FOREIGN KEY(equipo_1) REFERENCES equipos(nombre),
                    FOREIGN KEY(equipo_2) REFERENCES equipos(nombre),
                    FOREIGN KEY(comunidad_1) REFERENCES comunidades(nombre),
                    FOREIGN KEY(comunidad_2) REFERENCES comunidades(nombre),
                    FOREIGN KEY(inicio_partido) REFERENCES partidos(inicio),
                    FOREIGN KEY(fin_partido) REFERENCES partidos(fin)
                    );

DROP TABLE partidos;

CREATE TABLE partidos(inicio DATETIME,
 fin DATETIME,
 equipo_1 VARCHAR(20) NOT NULL,
 equipo_2 VARCHAR(20) NOT NULL,
 comunidad_1 VARCHAR(20) NOT NULL,
 comunidad_2 VARCHAR(20) NOT NULL,
 inicio_temporada DATETIME,
 fin_temporada DATETIME,
 comunidad_juego VARCHAR(20),
 calle_cancha VARCHAR(20),
 numero_cancha VARCHAR(20),
 PRIMARY KEY (inicio,fin,equipo_1,equipo_2,comunidad_1,comunidad_2,inicio_temporada,fin_temporada),
 UNIQUE(inicio,fin,inicio_temporada,fin_temporada,comunidad_juego,calle_cancha,numero_cancha),
 FOREIGN KEY(equipo_1) REFERENCES equipos(nombre),
 FOREIGN KEY(equipo_2) REFERENCES equipos(nombre),
 FOREIGN KEY(comunidad_1) REFERENCES comunidades(nombre),
 FOREIGN KEY(comunidad_2) REFERENCES comunidades(nombre),
 FOREIGN KEY(comunidad_juego) REFERENCES comunidades(nombre),
 FOREIGN KEY(calle_cancha) REFERENCES canchas(calle),
 FOREIGN KEY(numero_cancha) REFERENCES canchas(numero)
 );

 DROP TABLE records;
CREATE TABLE records(jugador VARCHAR(20),
                    record VARCHAR(20),
                    inicio_partido DATETIME,
                    fin_partido DATETIME,
                    equipo_1 VARCHAR(20) NOT NULL,
                    equipo_2 VARCHAR(20) NOT NULL,
                    comunidad_1 VARCHAR(20) NOT NULL,
                    comunidad_2 VARCHAR(20) NOT NULL,
                    PRIMARY KEY(jugador,record),
                    FOREIGN KEY(jugador) REFERENCES jugadores(nif),
                    FOREIGN KEY(record) REFERENCES libro_jugadas(jugada),
                    FOREIGN KEY(equipo_1) REFERENCES equipos(nombre),
                    FOREIGN KEY(equipo_2) REFERENCES equipos(nombre),
                    FOREIGN KEY(comunidad_1) REFERENCES comunidades(nombre),
                    FOREIGN KEY(comunidad_2) REFERENCES comunidades(nombre),
                    FOREIGN KEY(inicio_partido) REFERENCES partidos(inicio),
                    FOREIGN KEY(fin_partido) REFERENCES partidos(fin)
                    );

DROP TABLE cuartos;
CREATE TABLE cuartos(inicio DATETIME,
              fin DATETIME,
              puntuacion_equipo_1 INT,
              puntuacion_equipo_2 INT,
              equipo_1 VARCHAR(20) NOT NULL,
              equipo_2 VARCHAR(20) NOT NULL,
              comunidad_1 VARCHAR(20) NOT NULL,
              comunidad_2 VARCHAR(20) NOT NULL,
              inicio_partido DATETIME,
              fin_partido DATETIME,
              inicio_temporada DATETIME,
              fin_temporada DATETIME,
              PRIMARY KEY(inicio,fin,equipo_1,equipo_2,comunidad_1,comunidad_2,inicio_partido,fin_partido,inicio_temporada,fin_temporada),
              FOREIGN KEY(equipo_1) REFERENCES equipos(nombre),
              FOREIGN KEY(equipo_2) REFERENCES equipos(nombre),
              FOREIGN KEY(comunidad_2) REFERENCES comunidades(nombre),
              FOREIGN KEY(comunidad_1) REFERENCES comunidades(nombre),
              FOREIGN KEY(inicio_partido) REFERENCES partidos(inicio),
              FOREIGN KEY(fin_partido) REFERENCES partidos(fin),
              FOREIGN KEY(inicio_temporada) REFERENCES temporadas(inicio),
              FOREIGN KEY(fin_temporada) REFERENCES temporadas(fin)
              );


INSERT INTO jugadores (nif,nombre,apellidos,estatura,peso,nacido,equipo,comunidad)
    VALUES ('11112','pepe','leches',1.7,80,'madrid','madrid','madrid');


INSERT INTO entrenadores (nif,nombre,apellidos,nacido,equipo,comunidad)
    VALUES ('22222','mou','riño','madagascar','madrid','madrid');


INSERT INTO empresas(cif,nombre)
    VALUES ('4545EMP','URJC');

INSERT INTO comunidades(nombre)
    VALUES ('madrid');

INSERT INTO canchas(nombre,calle,numero,comunidad)
    VALUES ('palacio','gran via',5,'madrid');

INSERT INTO equipos(nombre,nif_entrenador,cif_empresa,comunidad)
    VALUES('madrid','22222','4545EMP','madrid');

INSERT INTO temporadas(inicio,fin)
    VALUES(datetime(),"2016-12-31 10:05:00");

INSERT INTO libro_jugadas(jugada,campo_en_relacion)
    VALUES('tiro a canasta','rebote');
INSERT INTO libro_jugadas(jugada,campo_en_relacion)
    VALUES('tiro a canasta','3');

INSERT INTO tipos_jugada(tipo,campo_en_relacion)
    VALUES('ataque','(3,5)');
