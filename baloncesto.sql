

create table ciudades(id_ciudad int not null, ca varchar(20) not null,
                             ciudad varchar(20) not null, unique(ca,ciudad), 
                             primary key(id_ciudad)
                             );

insert into ciudades values (5,'ANDALUCIA','GRANADA');

SELECT * FROM CIUDADES;

create table campeonatos(id_campeonato int not null,
                              fecha_inicio datetime not null,
                              fecha_fin datetime not null, 
                               primary key(id_campeonato));
insert into campeonatos (id_campeonato,fecha_inicio,fecha_fin) values (3,"2011-08-31 10:00:00","2012-06-30 22:00:00");

select * from campeonatos;

 create table empresas (cif varchar(20) not null,
                            nombre varchar(20) not null,
                            primary key(cif));

insert into empresas (cif,nombre) values ('987654321A','TELEFONICA');
select * from empresas;


create table entrenadores(nif varchar(20) not null, 
                               nombre varchar(50) not null,
                               apellidos varchar(50) not null,
                               fecha_nacimiento datetime not null,
                               primary key(nif));

insert into entrenadores (nif,nombre,apellidos,fecha_nacimiento) values ('55R','FRANCIS','SANCHEZ', "1980-07-15 10:00:00");

select * from entrenadores;

 create table jugadores (nif varchar(20) not null, 
                               nombre varchar(50) not null,
                               apellidos varchar(50) not null,
                               fecha_nacimiento datetime not null,
                               primary key(nif));
 insert into jugadores (nif,nombre,apellidos,fecha_nacimiento) values ('50F','FERNANDO','CALVO', "1995-07-15 10:00:00");

select * from jugadores;

create table direcciones_canchas (id_direccion int not null,
                                       calle varchar(50) not null,
                                       numero int not null,
                                       id_ciudad int not null,
                                       foreign key (id_ciudad)references 											ciudades(id_ciudad),
                                       primary key(id_direccion));

insert into direcciones_canchas (id_direccion,calle,numero,id_ciudad) values (4,'C/ LEGANITOS',75,1);

select * from direcciones_canchas;

create table canchas (id_cancha int not null,
                           nombre varchar(20) not null,
                           direccion int not null,
                           foreign key (direccion) references direcciones_canchas(id_direccion),
                           primary key (id_cancha));


select * from empresas;


