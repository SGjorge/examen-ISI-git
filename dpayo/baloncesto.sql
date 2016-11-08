create table ciudad (nombre varchar(20),com_auton varchar(20), primary key (nombre,com_auton));
insert into ciudad values ('Fuenlabrada','Madrid');
insert into ciudad values ('Avila','Castilla y Leon');
insert into ciudad values ('Mostoles','Madrid');
insert into ciudad values ('Valencia','Com. Valenciana');
select * from ciudad;
create table equipo ( nombre varchar(20),primary key(nombre));
insert into equipo values ('Estudiantes');
insert into equipo values ('Real Madrid CB');
insert into equipo values ('Baskonia');
insert into equipo values ('Unicaja de Malaga ');
create table cancha (nombre varchar(20), dir varchar(20), primary key(nombre));
insert into cancha values ('cancha01','C/ Pi 3');
insert into cancha values ('cancha02','C/ La avenida 2');
insert into cancha values ('cancha03','C/ Madrid 23' );
insert into cancha values ('cancha04','C/ Real 2');
create table entrena_cancha (nom_equipo varchar(20),nom_cancha varchar(20), primary key
                     (nom_cancha), foreign key(nom_cancha) references cancha(nombre));
insert into entrena_cancha values('Real Madrid CB','cancha01');
insert into entrena_cancha values('Estudiantes','cancha02');
insert into entrena_cancha values('Unicaja de Malaga','cancha03');
insert into entrena_cancha values('Baskonia','cancha04');
create table equipo_pertenece (nom_eq varchar(20),nom_ciu varchar(20),nom_com varchar(20), primary key(nom_ciu,nom_com), foreign key(nom_ciu,nom_com) references ciudad(nombre,com_auton));
insert into equipo_pertenece values ('Real Madrid CB','Fuenlabrada','Madrid');
insert into equipo_pertenece values ('Unicaja de Malaga','Avila','Castilla y Leon');
insert into equipo_pertenece values ('Estudiantes','Mostoles','Madrid');
insert into equipo_pertenece values ('Baskonia','Valencia','Com. Valenciana');
create table campeonato(id_c int, fecha_in datetime, fecha_fin datetime, primary key (id_c));
insert into campeonato values (1110,"2013-07-30","2014-05-12");
insert into campeonato values (1111,"2014-07-30","2015-05-23");
insert into campeonato values (1112,"2015-07-25","2016-05-21");
insert into campeonato values (1113,"2016-06-30","2017-05-25");
create table entrenadores ( nif varchar(20),nombre varchar(20), fecha_nac datetime,primary key(nif));
insert into entrenadores values ('1234','Edu Fernandez',"1980-9-12");
insert into entrenadores values ('12345','Mumbru ',"1977-7-2");
insert into entrenadores values ('12346','Chapu Fernandez',"1989-5-7");
create table entrena_eq( nif_entr varchar(20), idc int , nombre_cancha varchar(20), fecha_in datetime, fecha_fin datetime, primary key(
nif_entr,nombre_cancha), foreign key (nif_entr) references entrenadores(nif), foreign key(idc) references campeonato (id_c),foreign key(nombre_cancha) references cancha(nombre));
insert into entrena_eq values ('12346','1113','cancha04',"2015-11-02","2016-01-16");
create table empresa_patr(nombre varchar(20), cif int, primary key(nombre));
insert into empresa_patr values('Endesa',1);
insert into empresa_patr values('Iberdrola',2);
insert into empresa_patr values('Repsol',3);
insert into empresa_patr values('Nike',4);
create table patrocina( id_c int , nomb_camp varchar(20), primary key(id_c),foreign key(id_c) references campeonato(id_c),foreign key(nomb_camp) references empresa_patr(nombre));
insert into patrocina values(1110,'Endesa');
insert into patrocina values(1111,'Repsol');
insert into patrocina values(1112,'Nike');
insert into patrocina values(1113,'Iberdrola');
create table jugadores (nif varchar(20), nombre varchar(20), fecha_nac datetime, estatura int, primary key(nif));
insert into jugadores values ('12345','Mumbru ',"1977-7-2",180);
insert into jugadores values ('12346','Olesson ',"1989-5-7",183);
select * from jugadores;
create table jugadores_pertenece ( nif varchar(20), idc int , nombre_eq varchar(20),
 primary key(nif,idc,nombre_eq), foreign key(nif) references jugadores(nif), foreign key(idc) references campeonato(id_c));
insert into jugadores_pertenece values ('12346',1113,'Unicaja de Malaga');
create table juega_contra(id_p int,idc int , equipo_casa varchar(20), equipo_fuera varchar(20),nombre_cancha varchar(20),hora_in datetime, hora_fin datetime, primary key(id_p,equipo_casa,equipo_fuera), 
                         foreign key(nombre_cancha) references cancha(nombre), foreign key(idc) references campeonato(id_c));
insert into juega_contra values (3,1110,'Real Madrid CB','Unicaja de Malaga',"cancha01","19:00:00","21:00:00");
insert into juega_contra values (2,1110,'Baskonia','Estudiantes',"cancha02","18:00:00","21:00:00");
insert into juega_contra values (1,1111,'Baskonia','Unicaja de Malaga',"cancha03","18:00:00","21:00:00");
create table juega_pos (idp int, nif varchar(20), pos varchar(20),tpo_banquillo int, tpo_jugando int, peso int , primary key(nif,pos,idp), 
                       foreign key(nif) references jugadores(nif));
insert into juega_pos values (1,'123','base','15','34',89);
insert into juega_pos values (2,'1234','base','20','23',90);
insert into juega_pos values (3,'12345','escolta','2','39',91);
insert into juega_pos values (2,'12346','alero','15','34',76);
insert into juega_pos values (4,'123','alero','49','3',98);
create table info_partido (idp int, numcuarto int, puntuacion_casa int, puntuacion_fuera int, hora_com datetime, hora_fin datetime , primary key(idp,numcuarto,puntuacion_casa,puntuacion_fuera));
insert into info_partido values (1,2,67,65,"13:40","14:00");
insert into info_partido values (2,2,67,65,"13:40","14:00");
insert into info_partido values (3,4,87,65,"13:40","14:00");
insert into info_partido values (4,4,97,85,"13:40","14:00");
insert into info_partido values (2,4,107,65,"13:40","14:00");





select * from cancha;

