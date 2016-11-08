CREATE TABLE Jugador(nif varchar(10)  NOT NULL,nombre varchar(50), apellidos varchar(50), fecha_y_hora DATETIME, puesto varchar(50), record int, equipo varchar(50) ,PRIMARY KEY(nif),FOREIGN KEY(equipo) REFERENCES Equipo(nombre));
INSERT INTO Jugador(nif,nombre,apellidos, fecha_y_Hora,puesto,record,equipo)
VALUES ('015478A','Jorge','Romero Ruiz',"2016-09-31 10:05:00", "defensa", 50, "Real Madrid");
INSERT INTO Jugador(nif,nombre,apellidos, fecha_y_Hora,puesto,record,equipo)
VALUES ('000001P','Pablo','Quintana Mora',"2016-09-30 20:05:00", "defensa", 35, "Toledo");
INSERT INTO Jugador(nif,nombre,apellidos, fecha_y_Hora,puesto,record,equipo)
VALUES ('055555U','Fernando','Rioja Prado',"2016-01-31 16:05:00", "del", 60, "Toledo");
INSERT INTO Jugador(nif,nombre,apellidos, fecha_y_Hora,puesto,record,equipo)
VALUES ('088888','Javier','Morata Ruiz',"2016-08-04 19:00:00", "defensa", 30, "Barcelona");
INSERT INTO Jugador(nif,nombre,apellidos, fecha_y_Hora,puesto,record,equipo)
VALUES ('077777L','Jose','Pardo Nieto',"2016-08-31 12:05:00", "del", 22, "Valladolid");
INSERT INTO Jugador(nif,nombre,apellidos, fecha_y_Hora,puesto,record,equipo)
VALUES ('066666','Javier','Sanchez Letamendia',"2016-03-04 15:00:00", "del", 30, "Barcelona");
CREATE TABLE Entrenador(nif varchar(10)  NOT NULL, nombre varchar(50), apellidos varchar(50), fecha_y_hora DATETIME, equipo varchar(50),PRIMARY KEY(nif),FOREIGN KEY(equipo) REFERENCES Equipo(nombre));
INSERT INTO Entrenador(nif,nombre,apellidos, fecha_y_Hora,equipo)
VALUES ('11111Y','Carlos','Menchero De la Fuente',"2016-01-30 17:05:00","Toledo");
INSERT INTO Entrenador(nif,nombre,apellidos, fecha_y_Hora,equipo)
VALUES ('22222M','Roberto','Gallardo Maestre',"2016-08-04 19:00:00", "Real Madrid");
INSERT INTO Entrenador(nif,nombre,apellidos, fecha_y_Hora,equipo)
VALUES ('055555U','Diego','Diaz Mateo',"2016-04-31 16:05:00", "Barcelona");
INSERT INTO Entrenador(nif,nombre,apellidos, fecha_y_Hora,equipo)
VALUES ('0777754','Cesar','Diaz Pulido',"2016-01-25 16:05:00", "Valladolid");
CREATE TABLE Equipo(nombre varchar(50), nombre_ciudad varchar(50), PRIMARY KEY(nombre),FOREIGN KEY(nombre_ciudad) REFERENCES Ciudad(nombre));
INSERT INTO Equipo(nombre,nombre_ciudad)
VALUES ('Real Madrid', 'Madrid');
INSERT INTO Equipo(nombre, nombre_ciudad)
VALUES ('Barcelona','Barcelona');
INSERT INTO Equipo(nombre, nombre_ciudad)
VALUES ('Toledo','Toledo');
INSERT INTO Equipo(nombre, nombre_ciudad)
VALUES ('Valladolid','Valladolid');
CREATE TABLE Ciudad(nombre varchar(50), PRIMARY KEY(nombre));
INSERT INTO Ciudad(nombre)
VALUES ('Barcelona');
INSERT INTO Ciudad(nombre)
VALUES ('Toledo');
INSERT INTO Ciudad(nombre)
VALUES ('Valladolid');
INSERT INTO Ciudad(nombre)
VALUES ('Madrid');
CREATE TABLE ESituadoEnC(nombre_equipo varchar(50),nombre_ciudad varchar(50), PRIMARY KEY(nombre_equipo,nombre_ciudad), UNIQUE(nombre_equipo,nombre_ciudad), FOREIGN KEY(nombre_equipo) REFERENCES Equipo(nombre), FOREIGN KEY(nombre_ciudad) REFERENCES Ciudad(nombre));
CREATE TABLE ComunidadAutonoma(nombre varchar(50), numero_ciudades int, PRIMARY KEY(nombre));
INSERT INTO ComunidadAutonoma(nombre,numero_ciudades)
VALUES ('Cataluna',4);
INSERT INTO ComunidadAutonoma(nombre,numero_ciudades)
VALUES ('Castilla La Mancha',5);
INSERT INTO ComunidadAutonoma(nombre,numero_ciudades)
VALUES ('Castilla y León',7);
INSERT INTO ComunidadAutonoma(nombre,numero_ciudades)
VALUES ('Madrid',1);
CREATE TABLE CiudadSitadaEnCA(nombre_ciudad varchar(50),nombre_comunidad varchar(50), PRIMARY KEY(nombre_ciudad,nombre_comunidad), UNIQUE(nombre_ciudad,nombre_comunidad), FOREIGN KEY(nombre_ciudad) REFERENCES Ciudad(nombre), FOREIGN KEY(nombre_comunidad) REFERENCES ComunidadAutonoma(nombre));
CREATE TABLE Partido(id int,nombre_cancha varchar(50),tiempo int, UNIQUE(id), PRIMARY KEY(id),FOREIGN KEY (tiempo) REFERENCES tiempo(id), FOREIGN KEY (nombre_cancha) REFERENCES Cancha(nombre));
CREATE TABLE tiempo(id int,puntuacion int, id_partido int, hora_in datetime, hora_fin datetime, PRIMARY KEY(id,id_partido),FOREIGN KEY (id_partido) REFERENCES Partido(id));
CREATE TABLE Equipo1_contra_Equipo2(nombre_equipo1 varchar(50), nombre_equipo2 varchar(50), id_partido int, UNIQUE(nombre_equipo1,nombre_equipo2), PRIMARY KEY(nombre_equipo1,nombre_equipo2),FOREIGN KEY (id_partido) REFERENCES Partido(id));
INSERT INTO Equipo1_contra_Equipo2(nombre_equipo1,nombre_equipo2,id_partido)
VALUES ('Barcelona','Toledo',1);
INSERT INTO Equipo1_contra_Equipo2(nombre_equipo1,nombre_equipo2,id_partido)
VALUES ('Barcelona', 'Real Madrid',2);
INSERT INTO Equipo1_contra_Equipo2(nombre_equipo1,nombre_equipo2,id_partido)
VALUES ('Barcelona', 'Valladolid',3);
INSERT INTO Equipo1_contra_Equipo2(nombre_equipo1,nombre_equipo2,id_partido)
VALUES ('Toledo', 'Valladolid',4);
INSERT INTO Equipo1_contra_Equipo2(nombre_equipo1,nombre_equipo2,id_partido)
VALUES ('Toledo', 'Real Madrid',5);
INSERT INTO Equipo1_contra_Equipo2(nombre_equipo1,nombre_equipo2,id_partido)
VALUES ('Real Madrid', 'Valladolid',6);
CREATE TABLE Cancha(nombre varchar(50), nombre_equipo varchar(50), nombre_ciudad varchar(50),PRIMARY KEY(nombre),FOREIGN KEY (nombre_equipo) REFERENCES Equipo(nombre),FOREIGN KEY (nombre_ciudad) REFERENCES Ciudad(nombre));
CREATE TABLE Direccion(calle varchar(50),numero int, ciudad varchar(50), comunidad_autonoma varchar(50),PRIMARY KEY(calle,numero,ciudad,comunidad_autonoma), UNIQUE(calle,numero,ciudad,comunidad_autonoma), FOREIGN KEY (ciudad) REFERENCES Ciudad(nombre),FOREIGN KEY (comunidad_autonoma) REFERENCES ComunidadAutonoma(nombre));
CREATE TABLE Empresa(cif varchar(10)  NOT NULL,nombre varchar(50), equipo_patrocinado varchar(50),PRIMARY KEY(cif),FOREIGN KEY (equipo_patrocinado) REFERENCES Equipo(nombre));
INSERT INTO Empresa(cif,nombre,equipo_patrocinado)
VALUES ('0000001', 'BBVA','Toledo');
INSERT INTO Empresa(cif,nombre,equipo_patrocinado)
VALUES ('0000002', 'Amazon','Real Madrid');
INSERT INTO Empresa(cif,nombre,equipo_patrocinado)
VALUES ('0000022', 'Apple','Barcelona');
INSERT INTO Empresa(cif,nombre,equipo_patrocinado)
VALUES ('0000003', 'BQ','Valladolid');
CREATE TABLE JugadasEnPartido(hora_in datetime, hora_fin datetime, nombre_jugador varchar(50), coordenada_x int, coordenada_y int, PRIMARY KEY(hora_in,hora_fin,nombre_jugador),FOREIGN KEY (nombre_jugador) REFERENCES Jugador(nombre) );
CREATE TABLE JugadasDefensa(hora_in datetime, hora_fin datetime, nombre_jugador varchar(50),jugador_defendido varchar(50), PRIMARY KEY(hora_in,hora_fin,nombre_jugador),FOREIGN KEY (hora_in,hora_fin,nombre_jugador) REFERENCES JugadasEnPartido(hora_in,hora_fin,nombre_jugador) );
