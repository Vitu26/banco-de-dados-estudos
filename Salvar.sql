CREATE DATABASE ADSM1;
USE ADSM1;
CREATE TABLE medico	( 
	id int primary key auto_increment,
    cpf int not null unique,
    nome varchar(35) NOT NULL,
    especialidade varchar(45) default 'Clínico Geral',
    check (especialidade in ('Clínico Geral', 'Oftalmo', 'Cardiologista', 'Otorrino'))
);