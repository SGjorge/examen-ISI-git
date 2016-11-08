CREATE TABLE CCAA(
nombre varchar(100),
PRIMARY KEY(nombre));
INSERT INTO CCAA(Nombre)
Values('C.A Madrid');
INSERT INTO CCAA(Nombre)
Values('Barcelona');
INSERT INTO CCAA(Nombre)
Values('C.A Valenciana');
CREATE TABLE Ciudades(
cid int,
nombre varchar(100),
ccaa varchar(100) NOT NULL,
PRIMARY KEY(cid),
UNIQUE(nombre,ccaa),
FOREIGN KEY(ccaa) REFERENCES CCAA(nombre)
);
INSERT INTO Ciudades(cid,Nombre,ccaa)
Values(1,'Madrid', 'C.A Madrid');

INSERT INTO Ciudades(cid,Nombre,ccaa)
Values(2,'Fuenlabrada', 'C.A Madrid');

INSERT INTO Ciudades(cid,Nombre,ccaa)
Values(3,'Barcelona', 'Barcelona');

INSERT INTO Ciudades(cid,Nombre,ccaa)
Values(4,'Alicante', 'C.A Valenciana');
CREATE TABLE Equipos(
eid INT,
nombre VARCHAR(100),
cid INT NOT NULL,
PRIMARY KEY(eid),
FOREIGN KEY(cid) REFERENCES Ciudades(cid)
);
INSERT INTO Equipos(eid,nombre,cid)
Values(1, 'Real Madrid', 1);

INSERT INTO Equipos(eid,nombre,cid)
Values(2, 'Fuenlabrada', 2);

INSERT INTO Equipos(eid,nombre,cid)
Values(3, 'F.C Barcelona', 3);

INSERT INTO Equipos(eid,nombre,cid)
Values(4, 'Valencia Basket', 4);

INSERT INTO Equipos(eid,nombre,cid)
Values(5, 'DKV Joventud', 3);
CREATE TABLE Temporadas(
cid INT,
cif_empresa VARCHAR(20),
f_ini DATETIME,
f_fin DATETIME,
PRIMARY KEY(cid),
FOREIGN KEY(cif_empresa) REFERENCES Empresas(cif)
);

INSERT INTO Temporadas(cid, f_ini,f_fin,cif_empresa)
Values(1, '2015-09-15', '2016-04-16', '5555E');

INSERT INTO Temporadas(cid, f_ini,f_fin,cif_empresa)
Values(2, '2016-09-22', '2016-05-2', '5555E');


CREATE TABLE Empresas(
cif VARCHAR(20),
nombre VARCHAR(100),
PRIMARY KEY(cif)
);

INSERT INTO Empresas(cif,nombre)
Values('1111E', 'BBVA');

INSERT INTO Empresas(cif,nombre)
Values('2222E', 'MMT');

INSERT INTO Empresas(cif,nombre)
Values('3333E', 'DKV');

INSERT INTO Empresas(cif,nombre)
Values('4444E', 'LASSA');

INSERT INTO Empresas(cif,nombre)
Values('5555E', 'Endesa');


INSERT INTO Empresas(cif,nombre)
Values('6666E', 'TATA MOTORS');

INSERT INTO Empresas(cif,nombre)
Values('7777E', 'Inditex');


CREATE TABLE Empresa_Equipo(
cif VARCHAR(20),
eid INT,
PRIMARY KEY(cif,eid),
FOREIGN KEY(cif) REFERENCES Empresas(cif),
FOREIGN KEY(eid) REFERENCES Equipos(eid)
);

INSERT INTO Empresa_Equipo(cif,eid)
Values('2222E', 1);

INSERT INTO Empresa_Equipo(cif,eid)
Values('4444E', 3);

INSERT INTO Empresa_Equipo(cif,eid)
Values('3333E', 5);

CREATE TABLE Personas(
nif varchar(20),
nombre varchar(20),
apellidos varchar(50),
fecha_nac DATETIME,
PRIMARY KEY(nif));

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('1111E', 'adrian', 'oter', '1994-03-21');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('2222E', 'cris', 'nieto', '1994-02-04');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('3333E', 'fer', 'rioja', '1994-06-14');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('1111J', 'fran', 'vazquez', '1980-03-21');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('2222J', 'juan carlos', 'navarro', '1978-02-04');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('3333J', 'roberto', 'dueñas', '1975-06-14');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('4444J', 'victor', 'claver', '1985-06-14');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('5555J', 'alex', 'abrines', '1993-05-18');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('6666J', 'sergio', 'llull', '1984-07-01');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('7777J', 'rudy', 'fernandez', '1982-06-17');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('8888J', 'louis', 'bullock', '1973-01-24');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('9999J', 'felipe', 'reyes', '1979-01-11');

INSERT INTO Personas(nif,nombre,apellidos,fecha_nac)
Values('0000J', 'gustavo', 'ayon', '1972-02-03');

CREATE TABLE Entrenadores(
nif VARCHAR(20),
PRIMARY KEY(nif),
FOREIGN KEY(nif) REFERENCES Personas(nif)
                        ON DELETE CASCADE);
INSERT INTO Entrenadores(nif)
Values('1111E');

INSERT INTO Entrenadores(nif)
Values('2222E');

INSERT INTO Entrenadores(nif)
Values('3333E');

CREATE TABLE Jugadores(
nif VARCHAR(20),
estatura int,
PRIMARY KEY(nif),
FOREIGN KEY(nif) REFERENCES Personas(nif)
                        ON DELETE CASCADE);
INSERT INTO Jugadores(nif,estatura)
Values('1111J', 2.08);

INSERT INTO Jugadores(nif,estatura)
Values('2222J', 1.90);

INSERT INTO Jugadores(nif,estatura)
Values('3333J', 2.12);

INSERT INTO Jugadores(nif,estatura)
Values('4444J', 2.02);

INSERT INTO Jugadores(nif,estatura)
Values('5555J', 1.89);

INSERT INTO Jugadores(nif,estatura)
Values('6666J', 1.93);

INSERT INTO Jugadores(nif,estatura)
Values('7777J', 1.97);

INSERT INTO Jugadores(nif,estatura)
Values('8888J', 1.88);

INSERT INTO Jugadores(nif,estatura)
Values('9999J', 2.07);

INSERT INTO Jugadores(nif,estatura)
Values('0000J', 2.10);
CREATE TABLE Canchas(
nombre VARCHAR(100),
PRIMARY KEY(nombre)
);
INSERT INTO Canchas(nombre)
Values('Caja Mágica');

INSERT INTO Canchas(nombre)
Values('Palacio de Vistalegre');

INSERT INTO Canchas(nombre)
Values('Palau Blaugrana');

INSERT INTO Canchas(nombre)
Values('Pabellón Olímpico de Badalona');

INSERT INTO Canchas(nombre)
Values('La Fonteta');
CREATE TABLE Direcciones(
nombre VARCHAR(100),
calle VARCHAR(50),
numero INT,
ciudad VARCHAR(50),
ccaa VARCHAR(50),
PRIMARY KEY(nombre),
FOREIGN KEY(nombre) REFERENCES Canchas(nombre),
FOREIGN KEY(ccaa) REFERENCES CCAA(nombre)
);
INSERT INTO Direcciones(nombre,calle,numero,ciudad,ccaa)
Values('Caja Mágica', 'Perales', '7', 'Madrid', 'C.A Madrid');

INSERT INTO Direcciones(nombre,calle,numero,ciudad,ccaa)
Values('Palacio de Vistalegre', 'Goya', '4', 'Madrid', 'C.A Madrid');

INSERT INTO Direcciones(nombre,calle,numero,ciudad,ccaa)
Values('Palau Blaugrana', 'Canaletas', '8', 'Barcelona', 'Barcelona');

INSERT INTO Direcciones(nombre,calle,numero,ciudad,ccaa)
Values('Pabellón Olímpico de Badalona', 'Barceloneta', '1', 'Badalona', 'Barcelona');

INSERT INTO Direcciones(nombre,calle,numero,ciudad,ccaa)
Values('La Fonteta', 'Garay', '11', 'Elche', 'C.A Valenciana');
CREATE TABLE Periodos_Entreno(
f_ini DATETIME,
f_fin DATETIME,
PRIMARY KEY(f_ini,f_fin)
);
INSERT INTO Periodos_Entreno(f_ini,f_fin)
Values('2015-09-15','2016-04-16');

INSERT INTO Periodos_Entreno(f_ini,f_fin)
Values('2015-09-15','2015-12-25');
CREATE TABLE Entrenamientos(
eid INT,
entrenador_nif VARCHAR(20),
cancha VARCHAR(20),
temporada_id INT,
f_ini DATETIME,
f_fin DATETIME,
PRIMARY KEY(entrenador_nif,temporada_id),
FOREIGN KEY(eid) REFERENCES Equipos(eid),
FOREIGN KEY(entrenador_nif) REFERENCES Entrenadores(nif),
FOREIGN KEY(cancha) REFERENCES Canchas(nombre),
FOREIGN KEY(temporada_id) REFERENCES Temporadas(cid),
FOREIGN KEY(f_ini,f_fin) REFERENCES Periodos_Entreno(f_ini,f_fin)
);


INSERT INTO Entrenamientos(eid,entrenador_nif,cancha,temporada_id,f_ini,f_fin)
Values(2, '3333E', 'Caja Mágica', 2, '2015-09-15','2016-04-16');

INSERT INTO Entrenamientos(eid,entrenador_nif,cancha,temporada_id,f_ini,f_fin)
Values(1, '1111E', 'Caja Mágica', 1, '2015-09-15','2016-04-16');INSERT INTO Entrenamientos(eid,entrenador_nif,cancha,temporada_id,f_ini,f_fin)
Values(2, '2222E', 'La Fonteta', 1, '2015-09-15','2016-04-16');
INSERT INTO Entrenamientos(eid,entrenador_nif,cancha,temporada_id,f_ini,f_fin)
Values(3, '3333E', 'Caja Mágica', 1, '2015-09-15','2016-04-16');

CREATE TABLE Jugador_Equipo(
eid INT,
nif VARCHAR(20),
tid INT,
PRIMARY KEY(nif,tid),
FOREIGN KEY(eid) REFERENCES Equipos(eid),
FOREIGN KEY(nif) REFERENCES Jugadores(nif),
FOREIGN KEY(tid) REFERENCES Temporadas(cid)
);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(3, '1111J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(3, '2222J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(3, '3333J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(3, '4444J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(3, '5555J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(1, '6666J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(1, '7777J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(1, '8888J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(1, '9999J', 1);

INSERT INTO Jugador_Equipo(eid,nif,tid)
Values(1, '0000J', 1);


CREATE TABLE Partidos(
pid INT,
eid1 INT,
result_eq1 INT,
eid2 INT,
result_eq2 INT,
cancha VARCHAR(20),
f_ini DATETIME,
f_fin DATETIME,
PRIMARY KEY(pid)
FOREIGN KEY(eid1) REFERENCES Equipos(eid),
FOREIGN KEY(eid2) REFERENCES Equipos(eid),
FOREIGN KEY(cancha) REFERENCES Canchas(nombre)
);

INSERT INTO Partidos(pid, eid1, result_eq1, eid2, result_eq2, cancha, f_ini,f_fin)
Values(1, 1, 90, 3, 85, 'Caja Mágica', '20:00:00', '21:45:00');

INSERT INTO Partidos(pid, eid1, result_eq1, eid2, result_eq2, cancha, f_ini,f_fin)
Values(2, 2, 94, 4, 102, "Pabellón Olímpico de Badalona", '20:00:00', '21:45:00');


INSERT INTO Partidos(pid, eid1, result_eq1, eid2, result_eq2, cancha, f_ini,f_fin)
Values(3, 4, 97, 1, 110, "Palacio de Vistalegre", '20:00:00', '21:45:00');


INSERT INTO Partidos(pid, eid1, result_eq1, eid2, result_eq2, cancha, f_ini,f_fin)
Values(4, 1, 90, 2, 87, 'Caja Mágica', '20:00:00', '21:45:00');

CREATE TABLE Cuarto1(
cid INT,
result_eq1 INT,
result_eq2 INT,
f_ini DATETIME,
f_fin DATETIME,
PRIMARY KEY(cid),
FOREIGN KEY(cid) REFERENCES Partidos(pid)
);

INSERT INTO Cuarto1(cid,result_eq1,result_eq2,f_ini,f_fin)
Values(1, 20, 22, '20:00:00', '20:15:00');

INSERT INTO Cuarto1(cid,result_eq1,result_eq2,f_ini,f_fin)
Values(2, 24, 30, '20:00:00', '20:15:00');

CREATE TABLE Cuarto2(
cid INT,
result_eq1 INT,
result_eq2 INT,
f_ini DATETIME,
f_fin DATETIME,
PRIMARY KEY(cid),
FOREIGN KEY(cid) REFERENCES Partidos(pid)
);

CREATE TABLE Cuarto3(
cid INT,
result_eq1 INT,
result_eq2 INT,
f_ini DATETIME,
f_fin DATETIME,
PRIMARY KEY(cid),
FOREIGN KEY(cid) REFERENCES Partidos(pid)
);

CREATE TABLE Cuarto4(
cid INT,
result_eq1 INT,
result_eq2 INT,
f_ini DATETIME,
f_fin DATETIME,
PRIMARY KEY(cid),
FOREIGN KEY(cid) REFERENCES Partidos(pid)
);

CREATE TABLE Periodos_Jug(
hora_sal DATETIME,
hora_ent DATETIME,
hora_banq DATETIME,
PRIMARY KEY(hora_sal, hora_ent, hora_banq)
);

INSERT INTO Periodos_jug(hora_sal,hora_ent,hora_banq)
Values('20:00:00', '20:08:00', '20:10:00');

CREATE TABLE Partidos_Jug(
pid INT,
nif VARCHAR(20),
posicion VARCHAR(20),
hora_sal DATETIME,
hora_ent DATETIME,
hora_banq DATETIME,
PRIMARY KEY(pid, nif, posicion, hora_sal, hora_ent, hora_banq),
FOREIGN KEY(nif) REFERENCES Jugadores(nif),
FOREIGN KEY(hora_sal, hora_ent, hora_banq) REFERENCES Periodos_jug(hora_sal, hora_ent, hora_banq)
);
INSERT INTO Partidos_Jug(pid,nif,posicion,hora_sal,hora_ent,hora_banq)
Values(1, '1111J', 'Pivot', '20:00:00', '20:08:00', '20:10:00');

INSERT INTO Partidos_Jug(pid,nif,posicion,hora_sal,hora_ent,hora_banq)
Values(1, '2222J', 'Base', '20:00:00', '20:08:00', '20:10:00');

CREATE TABLE Peso(
nif VARCHAR(20),
pid INT,
peso FLOAT,
PRIMARY KEY(nif,pid),
FOREIGN KEY(nif) REFERENCES Jugadores(nif),
FOREIGN KEY(pid) REFERENCES Partidos(pid)
);

INSERT INTO PESO(nif,pid,peso)
Values('1111J',1,90);

INSERT INTO PESO(nif,pid,peso)
Values('2222J',1,100);

CREATE TABLE Jugadas(
jid INT,
hora_ini DATETIME,
hora_fin DATETIME,
PRIMARY KEY(jid)
);

CREATE TABLE Jugadas_Part(
pid INT,
jid INT,
PRIMARY KEY(pid,jid),
FOREIGN KEY(pid) REFERENCES Partidos(pid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid)
);

CREATE TABLE Records(
nif VARCHAR(20),
pid INT,
jid INT,
PRIMARY KEY(nif,pid,jid),
FOREIGN KEY(nif) REFERENCES Jugadores(nif),
FOREIGN KEY(pid) REFERENCES Partidos(pid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid)
);

CREATE TABLE Defensas(
jid INT,
nif_defendido VARCHAR(20),
nif_defendiendo VARCHAR(20),
PRIMARY KEY(jid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid),
FOREIGN KEY(nif_defendido) REFERENCES Jugadores(nif),
FOREIGN KEY(nif_defendiendo) REFERENCES Jugadores(nif)
);

CREATE TABLE Posesion(
jid INT,
nif_ini VARCHAR(20),
posicion FLOAT,
PRIMARY KEY(jid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid),
FOREIGN KEY(nif_ini) REFERENCES Jugadores(nif)
);

CREATE TABLE Tiro(
jid INT,
pto INT,
fuera INT,
rebote INT,
PRIMARY KEY(jid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid)
);

CREATE TABLE Pase(
jid INT,
fuera INT,
nif_comp VARCHAR(20),
nif_rival VARCHAR(20),
PRIMARY KEY(jid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid)
);

CREATE TABLE Robo(
jid INT,
nif_aquien VARCHAR(20),
PRIMARY KEY(jid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid)
);

CREATE TABLE Rebote(
jid INT,
PRIMARY KEY(jid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid)
);

CREATE TABLE Intercepcion(
jid INT,
PRIMARY KEY(jid),
FOREIGN KEY(jid) REFERENCES Jugadas(jid)
);



























