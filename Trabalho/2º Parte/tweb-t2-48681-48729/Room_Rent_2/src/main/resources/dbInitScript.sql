
DROP TABLE IF EXISTS my_user_role;
DROP TABLE IF EXISTS my_user;
DROP TABLE IF EXISTS anuncio;
DROP TABLE IF EXISTS mensagem;

CREATE TABLE my_user (
  user_name varchar(30) NOT NULL,
  user_pass varchar(255) NOT NULL,
  user_email varchar(40) NOT NULL,
  enable smallint NOT NULL DEFAULT 1,
  PRIMARY KEY (user_name)
);

insert  into my_user (user_name,user_pass,user_email,enable) values ('admin','$2a$10$dl8TemMlPH7Z/mpBurCX8O4lu0FoWbXnhsHTYXVsmgXyzagn..8rK','123@gmail.com',1);
-- user2 / teste123
insert  into my_user (user_name,user_pass,user_email,enable) values ('user2','$2a$10$bKWhb9hIUD3xxxtzfhvodugWIK3Gbw4vRySYOnBqy2O4gtqZ78jUK','user@gmail.com',1);


CREATE TABLE my_user_role (
  user_name varchar(30) NOT NULL,
  user_role varchar(15) NOT NULL,
  FOREIGN KEY (user_name) REFERENCES my_user (user_name)
);

insert  into my_user_role (user_name,user_role) values ('admin','ROLE_ADMIN');
insert  into my_user_role (user_name,user_role) values ('user2','ROLE_2');


CREATE TABLE anuncio (
    aid int NOT NULL,
    localizacao varchar(40) NOT NULL,
    preco int NOT NULL,
    data varchar(40) NOT NULL,
    genero varchar(20) NOT NULL,
    anunciante varchar(40) NOT NULL,
    tipo_alojamento varchar(10) NOT NULL,
    tipoanuncio varchar(20) NOT NULL,
    contacto varchar(15) NOT NULL,
    detalhes varchar(100) NOT NULL,
    estado varchar(10) NOT NULL,
    PRIMARY KEY (aid)
);

insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('101','Lisboa','202','16/01/2023','masculino','Diogo','t0','oferta','987654321','lindo','ativo');
insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('102','Evora','246','16/01/2023','masculino','Manel','t2','oferta','987654321','lindo','ativo');
insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('103','Porto','470','16/01/2023','masculino','Tiago','t1','oferta','987654321','lindo','ativo');

insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('104','Aveiro','192','16/01/2023','masculino','Andre','t0','procura','987654321','traquilidade','ativo');
insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('105','Faro','286','16/01/2023','feminino','Sara','t2','procura','987654321','top','ativo');
insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('106','Braga','370','16/01/2023','masculino','Rodrigo','quarto','procura','987654321','espetaculo','ativo');
insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('107','Beja','256','16/01/2023','feminino','Sara','t2','procura','987654321','top','ativo');
insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('108','Leiria','170','16/01/2023','masculino','Ricardo','quarto','procura','987654321','espetaculo','inativo');
insert  into anuncio (aid,localizacao,preco,data,genero,anunciante,tipo_alojamento,tipoanuncio,contacto,detalhes,estado) values('109','Lisboa','280','16/01/2023','feminino','Sofia','quarto','procura','987654321','top','inativo');


CREATE TABLE mensagem (
    aid_m int NOT NULL,
    message varchar(100) NOT NULL,
    emissor varchar(40) NOT NULL,
    aid_a int NOT NULL,
    PRIMARY KEY (aid_m)
);

insert into mensagem (aid_m,message,emissor,aid_a) values('1','ola','Rodrigo','101');